# pyright: reportMissingTypeStubs=false
# pyright: reportUnknownVariableType=false
# pyright: reportUnknownMemberType=false
# pyright: reportAttributeAccessIssue=false
from __future__ import annotations
from typing import Type, List, Dict, Any, TypeVar, Optional, Iterable, cast
from dataclasses import dataclass
import sys
import os
import re
import shutil
import requests
from tqdm import tqdm
from clang import cindex
from clang.cindex import Cursor, CursorKind, TypeKind, Token, TokenKind, SourceRange, SourceLocation, TranslationUnit


C_SRC_ROOT = "c_src"
OUT_DIR = "sdl"


def main():
    force_download = "--force-download" in sys.argv

    lib_specs = [
        SdlLibSpec(
            name = "SDL3",
            dlname = "libSDL3",
            repo_url = "https://api.github.com/repos/libsdl-org/SDL/contents/include/SDL3?ref=release-3.4.x",
            entrypoint_header = "SDL.h",
            include_headers = [
                # "SDL_stdinc.h",
                # "SDL_assert.h",
                # "SDL_asyncio.h",
                # "SDL_atomic.h",
                "SDL_audio.h",
                # "SDL_bits.h",
                "SDL_blendmode.h",
                "SDL_camera.h",
                "SDL_clipboard.h",
                # "SDL_cpuinfo.h",
                # "SDL_dialog.h",
                # "SDL_endian.h",
                "SDL_error.h",
                "SDL_events.h",
                "SDL_filesystem.h",
                "SDL_gamepad.h",
                "SDL_gpu.h",
                "SDL_guid.h",
                "SDL_haptic.h",
                # "SDL_hidapi.h",
                "SDL_hints.h",
                "SDL_init.h",
                "SDL_iostream.h",
                "SDL_joystick.h",
                "SDL_keyboard.h",
                "SDL_keycode.h",
                # "SDL_loadso.h",
                # "SDL_locale.h",
                "SDL_log.h",
                # "SDL_messagebox.h",
                # "SDL_metal.h",
                # "SDL_misc.h",
                "SDL_mouse.h",
                # "SDL_mutex.h",
                "SDL_pen.h",
                "SDL_pixels.h",
                # "SDL_platform.h",
                "SDL_power.h",
                # "SDL_process.h",
                "SDL_properties.h",
                "SDL_rect.h",
                "SDL_render.h",
                "SDL_scancode.h",
                "SDL_sensor.h",
                "SDL_storage.h",
                "SDL_surface.h",
                # "SDL_system.h",
                # "SDL_thread.h",
                "SDL_time.h",
                "SDL_timer.h",
                # "SDL_tray.h",
                "SDL_touch.h",
                "SDL_version.h",
                "SDL_video.h",
                # "SDL_oldnames.h",
            ],
        ),
        SdlLibSpec(
            name = "SDL_image",
            dlname = "libSDL3_image",
            repo_url = "https://api.github.com/repos/libsdl-org/SDL_image/contents/include/SDL3_image?ref=release-3.4.x",
            entrypoint_header = "SDL_image.h",
            include_headers = ["SDL_image.h"],
        ),
        SdlLibSpec(
            name = "SDL_ttf",
            dlname = "libSDL3_ttf",
            repo_url = "https://api.github.com/repos/libsdl-org/SDL_ttf/contents/include/SDL3_ttf?ref=release-3.2.x",
            entrypoint_header = "SDL_ttf.h",
            include_headers = ["SDL_ttf.h", "SDL_textengine.h"],
        ),
        SdlLibSpec(
            name = "SDL_mixer",
            dlname = "libSDL3_mixer",
            repo_url = "https://api.github.com/repos/libsdl-org/SDL_mixer/contents/include/SDL3_mixer?ref=prerelease-3.1.x",
            entrypoint_header = "SDL_mixer.h",
            include_headers = ["SDL_mixer.h"],
        ),
    ]

    files: Dict[str, str] = {}
    for lib_spec in lib_specs:
        # download necessary files
        lib_c_src_dir = os.path.join(C_SRC_ROOT, lib_spec.name)
        download_necessary = (
            force_download
            or not os.path.exists(lib_c_src_dir)
            or not any(os.scandir(lib_c_src_dir))
        )
        if download_necessary:
            shutil.rmtree(lib_c_src_dir, ignore_errors=True)
            os.makedirs(lib_c_src_dir, exist_ok=True)
            request = requests.get(lib_spec.repo_url, headers={"Accept": "application/vnd.github+json"})
            request.raise_for_status()
            items = [FileInfo(obj["name"], obj["type"], obj["download_url"]) for obj in request.json()]
            pbar_items = tqdm(items, desc=f"Downloading {lib_spec.name} Headers")
            for item in pbar_items:
                if item.type != "file" or not item.name.endswith(".h"):
                    continue
                pbar_items.set_description(f"Downloading {item.name}".ljust(32))
                url = item.download_url
                resp = requests.get(url)
                resp.raise_for_status()
                dest = os.path.join(lib_c_src_dir, item.name)
                with open(dest, "wb") as f:
                    f.write(resp.content)
        else:
            print(f"Skipping download for {lib_spec.name} (existing headers found).")
        
        # things to eventually emit
        macro_constants: List[SdlMacroConstant] = []
        typedefs: List[SdlTypedef] = []
        structs: List[SdlStruct] = []
        enums: List[SdlEnum] = []
        functions: List[SdlFunction] = []
        macro_functions: List[SdlMacroFunction] = []

        # create entrypoint tu
        index = cindex.Index.create()
        entrypoint_translation_unit = index.parse( # type: ignore
            os.path.join(lib_c_src_dir, lib_spec.entrypoint_header),
            args = [
                "-std=c99",
                "-I", C_SRC_ROOT,
                "-D", "bool=_Bool", # stdbool.h isn't being found for some reason so we do this
            ],
            options = TranslationUnit.PARSE_DETAILED_PROCESSING_RECORD,
        )

        # for each node in entrypoint tu, parse and bin
        pbar = tqdm(lib_spec.include_headers)
        for header_name in pbar:
            pbar.set_description(f"Parsing {header_name} from {lib_spec.name}".ljust(32))
            for cursor in assert_type(Cursor, entrypoint_translation_unit.cursor).get_children():
                cursor = assert_type(Cursor, cursor)
                location = assert_type(SourceLocation, cursor.location)
                if location.file is None:
                    continue
                if os.path.basename(assert_type(str, location.file.name)) != header_name:
                    continue
                sdl_node = parse_sdl_node(cursor)
                if isinstance(sdl_node, SdlMacroConstant):
                    macro_constants.append(sdl_node)
                elif isinstance(sdl_node, SdlTypedef):
                    typedefs.append(sdl_node)
                elif isinstance(sdl_node, SdlStruct):
                    structs.append(sdl_node)
                elif isinstance(sdl_node, SdlEnum):
                    enums.append(sdl_node)
                elif isinstance(sdl_node, SdlFunction):
                    functions.append(sdl_node)
                elif isinstance(sdl_node, SdlMacroFunction):
                    macro_functions.append(sdl_node)

        if lib_spec.name == "SDL3":
            vulkan_translation_unit = index.parse(  # type: ignore
                os.path.join(lib_c_src_dir, "SDL_vulkan.h"),
                args=[
                    "-std=c99",
                    "-I", C_SRC_ROOT,
                    "-D", "bool=_Bool",
                ],
                options=TranslationUnit.PARSE_DETAILED_PROCESSING_RECORD,
            )
            for cursor in assert_type(Cursor, vulkan_translation_unit.cursor).get_children():
                cursor = assert_type(Cursor, cursor)
                location = assert_type(SourceLocation, cursor.location)
                if location.file is None:
                    continue
                if os.path.basename(assert_type(str, location.file.name)) != "SDL_vulkan.h":
                    continue
                sdl_node = parse_sdl_node(cursor)
                if isinstance(sdl_node, SdlFunction):
                    functions.append(sdl_node)

        # for each category, generate and emit file of that category
        emit_sdl_macro_constants(files, macro_constants, lib_spec)
        emit_sdl_typedefs(files, typedefs, lib_spec)
        emit_sdl_structs(files, structs, lib_spec)
        emit_sdl_enums(files, enums, lib_spec)
        emit_sdl_functions(files, functions, lib_spec)

        # also check to make sure all necessary macros have been hand written
        # only SDL3 has macros
        if lib_spec.name == "SDL3":
            with open(f"{OUT_DIR}/macros.mojo", "r") as f:
                macro_file_content = f.read()
            implemented_macro_names: List[str] = re.findall(r"\bfn\s([A-Za-z_][A-Za-z0-9_]*)", macro_file_content)
            for macro_function in macro_functions:
                mojo_name = macro_function.name.removeprefix("SDL_").lower()
                if mojo_name not in implemented_macro_names:
                    print(f"WARNING: Still need to implement the macro fn: {mojo_name}")

    for rel_path, content in files.items():
        path = os.path.join(OUT_DIR, rel_path)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)


# ----------------
# Data Types
# ----------------


@dataclass
class SdlBaseType:
    name: str
    const: bool = False


@dataclass
class SdlFunctionType:
    return_type: SdlType
    arg_types: List[SdlType]


@dataclass
class SdlPointer:
    pointee_type: SdlType
    const: bool = False


@dataclass
class SdlArray:
    element_type: SdlType
    length: Optional[int]


SdlType = SdlBaseType | SdlFunctionType | SdlPointer | SdlArray


@dataclass
class SdlFunction:
    name: str
    return_type: SdlType
    args: List[SdlFunctionArg]
    docstring: str
    
    def as_fn_type(self) -> SdlFunctionType:
        return SdlFunctionType(self.return_type, [arg.type for arg in self.args])


@dataclass
class SdlFunctionArg:
    name: str
    type: SdlType


@dataclass
class SdlStruct:
    name: str
    fields: List[SdlField]
    docstring: str


@dataclass
class SdlField:
    name: str
    type: SdlType


@dataclass
class SdlEnum:
    name: str
    values: List[SdlEnumValue]
    docstring: str


@dataclass
class SdlEnumValue:
    name: str
    value: int


@dataclass
class SdlTypedef:
    name: str
    underlying_type: SdlType
    docstring: str


@dataclass
class SdlMacroConstant:
    name: str
    value_tokens: List[str]
    docstring: str


@dataclass
class SdlMacroFunction:
    name: str
    docstring: str


SdlNode = SdlFunction | SdlStruct | SdlEnum | SdlTypedef | SdlMacroConstant | SdlMacroFunction


# ----------------
# Parsing
# ----------------


def parse_sdl_node(node: Cursor) -> Optional[SdlNode]:
    LIB_PREFIXES = ("SDL_", "IMG_", "TTF_", "MIX_")
    name = assert_type(str, node.spelling)
    if not any(name.startswith(prefix) for prefix in LIB_PREFIXES) and not name.startswith("SDLK_"):
        return None
    
    if node.kind == CursorKind.FUNCTION_DECL:
        if node.is_definition():
            return None
        return_type = parse_sdl_type(assert_type(cindex.Type, node.result_type))
        docstring = parse_doc_block(node)
        fn_args: List[SdlFunctionArg] = []
        for arg in node.get_arguments():
            arg_name = assert_type(str, arg.spelling)
            arg_type = parse_sdl_type(assert_type(cindex.Type, arg.type))
            fn_args.append(SdlFunctionArg(name=arg_name, type=arg_type))
        return SdlFunction(name, return_type, fn_args, docstring)
    
    if node.kind == CursorKind.MACRO_DEFINITION:
        tokens = [assert_type(Token, t) for t in node.get_tokens()]
        name_index = None
        for i, t in enumerate(tokens):
            if t.spelling == name:
                name_index = i
                break
        if name_index is None:
            raise ValueError("Expected name in macro definition")
        is_stub = name_index + 1 >= len(tokens)
        if is_stub:
            return None
        name_token = tokens[name_index]
        token_after_name = tokens[name_index+1]
        name_location = assert_type(SourceLocation, name_token.location)
        token_after_name_location = assert_type(SourceLocation, token_after_name.location)
        is_function_like = (
            token_after_name.spelling == "("
            and name_location.line == token_after_name_location.line
            and name_location.column + len(assert_type(str, name_token.spelling)) == token_after_name_location.column
        )
        if is_function_like:
            return SdlMacroFunction(name, parse_doc_block(node))
        value = [assert_type(str, t.spelling) for t in tokens[name_index+1:]]
        docstring = parse_doc_block(node)
        return SdlMacroConstant(name, value, docstring)
    
    if node.kind == CursorKind.TYPEDEF_DECL:
        # Event is the only enum we need atm so we implement manually
        if name == "SDL_Event":
            return None
        clang_underlying_type: cindex.Type = assert_type(cindex.Type, node.underlying_typedef_type)
        decl = cast(Optional[Cursor], clang_underlying_type.get_declaration())
        if decl is not None and decl.kind in (CursorKind.STRUCT_DECL, CursorKind.ENUM_DECL):
            definition = cast(Optional[Cursor], decl.get_definition())
            if definition is not None:
                return None
        underlying_type = parse_sdl_type(clang_underlying_type)
        docstring = parse_doc_block(node)
        return SdlTypedef(name, underlying_type, docstring)
    
    if node.kind == CursorKind.STRUCT_DECL:
        if not node.is_definition():
            return None
        # GamepadBinding is the only struct to use anonymous unions so it's implemented manually.
        if name == "SDL_GamepadBinding":
            return None
        docstring = parse_doc_block(node)
        fields: List[SdlField] = []
        for child in node.get_children():
            if child.kind == CursorKind.FIELD_DECL:
                field_name = assert_type(str, child.spelling)
                field_type = parse_sdl_type(assert_type(cindex.Type, child.type))
                fields.append(SdlField(name=field_name, type=field_type))
        return SdlStruct(name, fields, docstring)
    
    if node.kind == CursorKind.ENUM_DECL:
        docstring = parse_doc_block(node)
        values: List[SdlEnumValue] = []
        for child in node.get_children():
            if child.kind == CursorKind.ENUM_CONSTANT_DECL:
                value_name = assert_type(str, child.spelling)
                value_val = int(assert_type(int, child.enum_value))
                values.append(SdlEnumValue(name=value_name, value=value_val))
        return SdlEnum(name, values, docstring)

    return None


def parse_sdl_type(type: cindex.Type) -> SdlType:
    if type.kind == TypeKind.POINTER:
        pointee = parse_sdl_type(assert_type(cindex.Type, type.get_pointee()))
        return SdlPointer(
            pointee_type = pointee,
            const = assert_type(bool, type.is_const_qualified()),
        )
    
    if type.kind in (TypeKind.CONSTANTARRAY, TypeKind.INCOMPLETEARRAY, TypeKind.VARIABLEARRAY):
        elem_type = parse_sdl_type(assert_type(cindex.Type, type.get_array_element_type()))
        if type.kind == TypeKind.CONSTANTARRAY:
            length = assert_type(int, type.get_array_size())
        else:
            length = None
        return SdlArray(
            element_type = elem_type,
            length = length,
        )
    
    if type.kind in (TypeKind.FUNCTIONPROTO, TypeKind.FUNCTIONNOPROTO):
        return_type = parse_sdl_type(assert_type(cindex.Type, type.get_result()))
        arg_types: List[SdlType] = []
        if type.kind == TypeKind.FUNCTIONPROTO:
            for arg_t in type.argument_types():
                arg_types.append(parse_sdl_type(assert_type(cindex.Type, arg_t)))
        return SdlFunctionType(
            return_type = return_type,
            arg_types = arg_types,
        )
    
    # SdlBaseType
    name = assert_type(str, type.spelling).strip()
    for prefix in ("const", "volatile", "restrict", "struct", "union", "enum"):
        if name.startswith(prefix):
            name = name[len(prefix):].lstrip()
    return SdlBaseType(
        name = name,
        const = assert_type(bool, type.is_const_qualified()),
    )


def parse_doc_block(node: Cursor) -> str:
    def parse_macro_doc_block(node: Cursor) -> str:
        """Clang doesn't capture doxygen comments on macros so we handle it manually"""
        macro_extent = assert_type(SourceRange, node.extent)
        macro_start = assert_type(SourceLocation, macro_extent.start)
        macro_file = assert_type(cindex.File, macro_start.file)
        macro_file_name = assert_type(str, macro_file.name)
        tu = assert_type(TranslationUnit, node.translation_unit)
        begin_location = assert_type(SourceLocation, tu.get_location(macro_file_name, (1, 1)))
        end_location = assert_type(SourceLocation, tu.get_location(macro_file_name, (macro_start.line, macro_start.column)))
        header_extent = assert_type(SourceRange, SourceRange.from_locations(begin_location, end_location))

        tokens = list(tu.get_tokens(extent=header_extent))
        for token in tokens:
            token = assert_type(cindex.Token, token)
            if token.kind != TokenKind.COMMENT:
                continue
            comment_extent = assert_type(SourceRange, token.extent)
            comment_end = assert_type(SourceLocation, comment_extent.end)
            if comment_end.line != macro_start.line - 1:
                continue
            comment = assert_type(str, token.spelling)
            return comment
        return ""

    raw = cast(Optional[str], node.raw_comment)
    if node.kind == CursorKind.MACRO_DEFINITION:
        raw = parse_macro_doc_block(node)
    if raw is None:
        return ""
    cleaned: List[str] = []
    for line in raw.splitlines():
        line = line.strip()
        line = line.removesuffix("*/")
        for prefix in ("///", "//!", "/**", "/*", "//", "*"):
            if line.startswith(prefix):
                line = line.removeprefix(prefix)
                break
        line = line.strip()
        cleaned.append(line)
    return "\n".join(cleaned).strip()


# ----------------
# Emission
# ----------------


def emit_sdl_macro_constants(files: Dict[str, str], macro_constants: List[SdlMacroConstant], lib_spec: SdlLibSpec):
    FILENAME = "constants.mojo"
    constants_file_parts: List[str] = []
    if FILENAME in files:
        constants_file_parts.append(files[FILENAME])
    else:
        constants_file_parts.append((
            "from .typedefs import *\n"
            "from .macros import *\n"
        ))
    for constant in macro_constants:
        constants_file_parts.append("\n\n")
        constants_file_parts.append(emit_sdl_macro_constant(constant, lib_spec))
    files[FILENAME] = "".join(constants_file_parts)


def emit_sdl_macro_constant(macro_constant: SdlMacroConstant, lib_spec: SdlLibSpec) -> str:
    if macro_constant.name.startswith("SDLK_"):
        name = macro_constant.name.replace("SDLK_", "KEY_")
    else:
        name = macro_constant.name.removeprefix("SDL_")
    tokens = macro_constant.value_tokens

    if tokens[0] == "(":
        depth = 0
        has_outer_parens = True
        for i, t in enumerate(tokens):
            if t == "(":
                depth += 1
            elif t == ")":
                depth -= 1
                if depth == 0 and i != len(tokens) - 1:
                    has_outer_parens = True
        if has_outer_parens:
            tokens = tokens[1:-1]

    is_fnlike_macro = len(tokens) >= 2 and tokens[0].startswith("SDL_") and tokens[1] == "("
    if is_fnlike_macro:
        new_token = tokens[0].removeprefix("SDL_").lower()
        if new_token == "uint64_c":
            new_token = "UInt64"
        tokens[0] = new_token

    is_cast = len(tokens) >= 3 and tokens[0] == "(" and tokens[1].startswith("SDL_") and tokens[2] == ")"
    if is_cast:
        target_type = tokens[1].removeprefix("SDL_")
        new_tokens = [target_type, "("]
        new_tokens.extend(tokens[3:])
        new_tokens.append(")")
        tokens = new_tokens

    for i in range(len(tokens)):
        if tokens[i] == ",":
            tokens[i] = ", "
        elif tokens[i] == "<<":
            tokens[i] = " << "
        elif tokens[i] == "|":
            tokens[i] = " | "
        elif tokens[i].startswith("SDL_"):
            tokens[i] = tokens[i].removeprefix("SDL_")
        tokens[i] = re.sub(r"(\b0[xX][0-9A-Fa-f]+)([uUlL]+)\b", r"\1", tokens[i])
        tokens[i] = re.sub(r"(\b\d+)([uUlL]+)\b", r"\1", tokens[i])
        tokens[i] = re.sub(
            r"""
            ((?:\d+\.\d*|\.\d+|\d+)(?:[eE][+-]?\d+)?)
            ([fFlL])\b
            """,
            r"\1", tokens[i], flags=re.VERBOSE,
        )

    expression = "".join(tokens)
    return (
        f"comptime {name} = {expression}\n"
        f"{emit_wiki_docstring(lib_spec.name, macro_constant.name, indent_level=0)}"
    )


def emit_sdl_typedefs(files: Dict[str, str], typedefs: List[SdlTypedef], lib_spec: SdlLibSpec):
    FILENAME = "typedefs.mojo"
    typedefs_file_parts: List[str] = []
    if FILENAME in files:
        typedefs_file_parts.append(files[FILENAME])
    else:
        typedefs_file_parts.append((
            "from .structs import *\n"
            "from .misc import *\n"
            "from ffi import c_char\n"
            "\n\n"
            "comptime Ptr = UnsafePointer\n"
        ))
    for typedef in typedefs:
        if typedef.name.startswith("SDL_compile_time_assert"):
            continue
        mojo_name = typedef.name.removeprefix("SDL_")
        underlying_mojo_type = emit_mojo_type(typedef.underlying_type)
        is_opaque_type = (
            isinstance(typedef.underlying_type, SdlBaseType) 
            and typedef.name == typedef.underlying_type.name
        )
        if is_opaque_type:
            typedefs_file_parts.append("".join((
                f"\n\n",
                f"struct {mojo_name}:\n",
                emit_wiki_docstring(lib_spec.name, typedef.name),
                f"    pass\n",
            )))
            continue
        is_fn_ptr_type = (
            isinstance(typedef.underlying_type, SdlPointer) 
            and isinstance(typedef.underlying_type.pointee_type, SdlFunctionType)
        )
        if is_fn_ptr_type:
            underlying_mojo_type = emit_mojo_type(assert_type(SdlPointer, typedef.underlying_type).pointee_type)
        elif isinstance(typedef.underlying_type, SdlPointer):
            underlying_mojo_type = emit_mojo_type(SdlPointer(SdlBaseType("void")))
        typedefs_file_parts.append("".join((
            f"\n\n",
            f"comptime {mojo_name} = {underlying_mojo_type}\n",
            emit_wiki_docstring(lib_spec.name, typedef.name, indent_level=0),
        )))
    files[FILENAME] = "".join(typedefs_file_parts)


def emit_sdl_structs(files: Dict[str, str], structs: List[SdlStruct], lib_spec: SdlLibSpec):
    FILENAME = "structs.mojo"
    structs_file_parts: List[str] = []
    if FILENAME in files:
        structs_file_parts.append(files[FILENAME])
    else:
        structs_file_parts.append((
            "from .typedefs import *\n"
            "from .enums import *\n"
            "from .misc import *\n"
            "\n\n"
            "comptime Ptr = UnsafePointer\n"
        ))
    for struct in structs:
        mojo_name = struct.name.removeprefix("SDL_")
        structs_file_parts.append((
            f"\n\n"
            f"@fieldwise_init\n"
            f"struct {mojo_name}(Copyable):\n"
        ))
        structs_file_parts.append(emit_wiki_docstring(lib_spec.name, struct.name))
        if len(struct.fields) == 0: 
            structs_file_parts.append("    pass\n")
        for field in struct.fields:
            field_name = field.name
            if field_name == "copy":
                field_name = "copy_"
            structs_file_parts.append(f"    var {field_name}: {emit_mojo_type(field.type)}\n")
    files[FILENAME] = "".join(structs_file_parts)


def emit_sdl_enums(files: Dict[str, str], enums: List[SdlEnum], lib_spec: SdlLibSpec):
    FILENAME = "enums.mojo"
    enums_file_parts: List[str] = []
    if FILENAME in files:
        enums_file_parts.append(files[FILENAME])
    for enum in enums:
        mojo_name = enum.name.removeprefix("SDL_")
        longest_common_prefix = enum.values[0].name
        for value in enum.values[1:]:
            while not value.name.startswith(longest_common_prefix):
                longest_common_prefix = longest_common_prefix[:-1]
        enums_file_parts.extend((
            "\n\n",
            f"struct {mojo_name}(TrivialRegisterPassable, Equatable, Intable, Indexer):\n",
            emit_wiki_docstring(lib_spec.name, enum.name),
            "    var value: Int32\n",
            "\n",
            "    fn __init__(out self, *, value: Int32):\n",
            "        self.value = value\n",
            "\n",
            "    fn __eq__(self, rhs: Self) -> Bool:\n",
            "        return self.value == rhs.value\n",
            "\n",
            "    fn __int__(self) -> Int:\n",
            "        return Int(self.value)\n",
            "\n",
            "    fn __mlir_index__(self) -> __mlir_type.index:\n",
            "        return self.__int__()._mlir_value\n",
            "\n",
        ))
        for value in enum.values:
            field_name = value.name.removeprefix(longest_common_prefix)
            if field_name[0].isdigit():
                field_name = f"N_{field_name}"
            enums_file_parts.append(f"    comptime {field_name} = {mojo_name}(value = {value.value})\n")
    files[FILENAME] = "".join(enums_file_parts)


def emit_sdl_functions(files: Dict[str, str], functions: List[SdlFunction], lib_spec: SdlLibSpec):
    if lib_spec.name == "SDL3":
        function_table_type_name = "Sdl3FunctionTable"
    else:
        function_table_type_name = f"Sdl{lib_spec.name.removeprefix('SDL_').capitalize()}FunctionTable"
    
    functions_table_file_parts: List[str] = [
        "from ffi import OwnedDLHandle, c_char, CStringSlice\n",
        "from sys import CompilationTarget\n",
        "from os import PathLike\n",
        "from pathlib import Path\n",
        "from .misc import *\n",
        "from .typedefs import *\n",
        "from .structs import *\n",
        "from .enums import *\n",
        "from .vulkan import *\n",
        "" if lib_spec.name == "SDL3" else "from .sdl3_functions import get_error\n",
        "\n\n",
        "comptime Ptr = UnsafePointer\n",
        "\n\n",
        f"struct {function_table_type_name}:\n",
        f"    var dynamic_library_handle: OwnedDLHandle\n",
    ]

    for function in functions:
        mojo_function_name = pascal_to_snake_case(function.name.removeprefix("SDL_"))
        functions_table_file_parts.append(f'    var pointer_{mojo_function_name}: {emit_mojo_type(function.as_fn_type(), use_cstringslice=False)}\n')

    functions_table_file_parts.extend((
        "\n",
        "    fn __init__(out self) raises:\n",
        "        var library_path: Path\n",
        "        @parameter\n",
        "        if CompilationTarget.is_linux():\n",
        f'            library_path = Path("{lib_spec.dlname}.so")\n',
        "        elif CompilationTarget.is_macos():\n",
        f'            library_path = Path("{lib_spec.dlname}.dylib")\n',
        "        else:\n",
        '            constrained[False, "Target operating system is not supported."]()\n',
        "            library_path = Path()\n",
        "        self = Self(library_path)\n",
        "\n",
        "    fn __init__(out self, library_path: Path) raises:\n",
        "        self.dynamic_library_handle = OwnedDLHandle(library_path)\n",
    ))

    for function in functions:
        mojo_function_name = pascal_to_snake_case(function.name.removeprefix("SDL_"))
        mojo_function_type = emit_mojo_type(function.as_fn_type(), use_cstringslice=False)
        functions_table_file_parts.append(
            f'        self.pointer_{mojo_function_name} = self.dynamic_library_handle.get_function[{mojo_function_type}]("{function.name}")\n'
        )

    for function in functions:
        functions_table_file_parts.append("\n")
        functions_table_file_parts.append(emit_sdl_function(function, lib_spec))

    function_table_filename = f"{lib_spec.name.lower()}_function_table.mojo"
    files[function_table_filename] = "".join(functions_table_file_parts)


def emit_sdl_function(function: SdlFunction, lib_spec: SdlLibSpec) -> str:
    mojo_function_name = pascal_to_snake_case(function.name.removeprefix("SDL_"))
    original_docstring = emit_original_docstring(function.docstring)
    return_type_mojo = emit_mojo_type(function.return_type)
    
    returns_bool_error = (
        return_type_mojo == "Bool"
        and re.search(
            r"Returns:\s*true.*?false\s*on\s*(?:error|failure)", 
            original_docstring, 
            flags=re.IGNORECASE | re.DOTALL
        ) is not None
    )
    returns_pointer_error = (
        isinstance(function.return_type, SdlPointer)
        and "NULL" in original_docstring
    )
    
    if "GetError" in original_docstring:
        error_message = "get_error()"
    else:
        error_message = f'"Error in {mojo_function_name} call. See official documentation for details."'

    if returns_bool_error:
        return_part = ") raises:\n"
        result_part = "var success_status = "
        post_call_part = (
            f"        if not success_status:\n"
            f"            raise {error_message}\n"
        )
    elif is_string(function.return_type) and returns_pointer_error:
        result_part = "var c_string = "
        return_part = f") raises -> {return_type_mojo}:\n"
        post_call_part = (
            f"        if not c_string.unsafe_ptr():\n"
            f"            raise {error_message}\n"
            f"        return c_string\n"
        )
    elif is_string(function.return_type):
        result_part = "var c_string = "
        return_part = f") -> {return_type_mojo}:\n"
        post_call_part = "        return c_string\n"
    elif returns_pointer_error:
        result_part = "var result_pointer = "
        return_part = f") raises -> {return_type_mojo}:\n"
        post_call_part = (
            f"        if not result_pointer:\n"
            f"            raise {error_message}\n"
            f"        return result_pointer\n"
        )
    elif return_type_mojo == "NoneType":
        result_part = ""
        return_part = f"):\n"
        post_call_part = ""
    else:
        result_part = "return "
        return_part = f") -> {return_type_mojo}:\n"
        post_call_part = ""

    arguments = ["self"]
    arguments.extend([
        f"{argument.name}: {emit_mojo_type(argument.type, omit_origin=True)}"
        for argument in function.args
    ])

    parts: List[str] = []
    parts.append(emit_fn_like(
        f"fn {mojo_function_name}(",
        arguments,
        return_part,
        base_indent_level = 1,
    ))
    parts.append(emit_wiki_docstring(lib_spec.name, function.name, indent_level=2))
    parts.append(emit_fn_like(
        f"{result_part}self.pointer_{mojo_function_name}(",
        [
            f"{argument.name}.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()"
            if is_string(argument.type) else
            f"Ptr(to={argument.name}).bitcast[{emit_mojo_type(argument.type)}]()[]"
            for argument in function.args
        ],
        f")\n",
        base_indent_level = 2,
    ))
    parts.append(post_call_part)
    return "".join(parts)


def emit_mojo_type(
    sdl_type: SdlType,
    use_cstringslice: bool=True,
    omit_origin: bool=False,
) -> str:
    if use_cstringslice and is_string(sdl_type):
        return "CStringSlice" if omit_origin else f"CStringSlice[ImmutExternalOrigin]"

    if isinstance(sdl_type, SdlFunctionType):
        return emit_fn_like(
            "fn(",
            [emit_mojo_type(arg_type, use_cstringslice=use_cstringslice) for arg_type in sdl_type.arg_types],
            f") -> {emit_mojo_type(sdl_type.return_type)}",
            max_line_len = None,
        )
    
    if isinstance(sdl_type, SdlPointer):
        is_mut = (
            (isinstance(sdl_type.pointee_type, SdlPointer) or isinstance(sdl_type.pointee_type, SdlBaseType))
            and not sdl_type.pointee_type.const
        )
        if omit_origin:
            return f"Ptr[{emit_mojo_type(sdl_type.pointee_type)}]"
        elif is_mut:
            return f"Ptr[{emit_mojo_type(sdl_type.pointee_type)}, MutExternalOrigin]"
        else:
            return f"Ptr[{emit_mojo_type(sdl_type.pointee_type)}, ImmutExternalOrigin]"
    
    if isinstance(sdl_type, SdlArray):
        if sdl_type.length is not None:
            return f"InlineArray[{emit_mojo_type(sdl_type.element_type)}, Int({sdl_type.length})]"
        else:
            return f"Ptr[{emit_mojo_type(sdl_type.element_type)}, MutExternalOrigin]"

    # SdlBaseType
    mapping = {
        "void": "NoneType",
        "char": "c_char",
        "float": "Float32",
        "double": "Float64",
        "_Bool": "Bool",
        "Uint8": "UInt8",
        "Uint16": "UInt16",
        "Uint32": "UInt32",
        "Uint64": "UInt64",
        "Sint8": "Int8",
        "Sint16": "Int16",
        "Sint32": "Int32",
        "Sint64": "Int64",
        "int": "Int32",
        "intptr_t": "Int",
        "unsigned char": "UInt8",
        "unsigned short": "UInt16",
        "unsigned int": "UInt32",
        "long": "c_long",
        "long long": "c_long_long",
        "unsigned long": "c_ulong",
        "unsigned long long": "c_ulong_long",
        "iconv_data_t": "IConvData",
    }
    if sdl_type.name in mapping:
        return mapping[sdl_type.name]
    return sdl_type.name.removeprefix("SDL_")


def is_string(sdl_type: SdlType) -> bool:
    return (
        isinstance(sdl_type, SdlPointer)
        and isinstance(sdl_type.pointee_type, SdlBaseType)
        and sdl_type.pointee_type.const
        and emit_mojo_type(sdl_type.pointee_type) == "c_char"
    )


def emit_original_docstring(text: str, indent_level: int = 1, spaces_per_indent: int = 4) -> str:
    if not text:
        return ""
    REPLACEMENTS = {
        r"\since": "Since:",
        r"\sa": "See also:",
        r"\param": "Argument:",
        r"\returns": "Returns:",
        r"\threadsafety": "Thread safety:",
        "\\": "\\\\",
    }
    for old, new in REPLACEMENTS.items():
        text = text.replace(old, new)
    indent = " " * (indent_level * spaces_per_indent)
    lines = [line.removeprefix("< ") for line in text.splitlines()]
    if len(lines) == 1:
        return f'{indent}"""{lines[0]}"""\n'
    out: list[str] = [f'{indent}"""\n']
    out.extend(f"{indent}{line}\n" for line in lines)
    out.append(f'{indent}"""\n')
    return "".join(out)


def emit_wiki_docstring(lib_name: str, c_name: str, indent_level: int = 1, spaces_per_indent: int = 4) -> str:
    indent = " " * (indent_level * spaces_per_indent)
    return (
        f'{indent}"""See official documentation for details.\n'
        f'{indent}\n'
        f'{indent}https://wiki.libsdl.org/{lib_name}/{c_name}\n'
        f'{indent}"""\n'
    )


def emit_fn_like(
    initial_line: str, arg_lines: Iterable[str], final_line: str,
    spaces_per_indent: int=4, base_indent_level: int=0, max_line_len: Optional[int]=100,
) -> str:
    base_indent = " " * spaces_per_indent * base_indent_level
    inner_indent = " " * spaces_per_indent * (base_indent_level + 1)
    one_line_args = ", ".join(arg_lines)
    one_liner = base_indent + initial_line + one_line_args + final_line
    if max_line_len is None or len(one_liner) <= max_line_len:
        return one_liner
    lines: List[str] = [
        base_indent + initial_line,
        inner_indent + one_line_args,
        base_indent + final_line,
    ]
    if all(len(line) <= max_line_len for line in lines):
        return "\n".join(lines)
    lines = [base_indent, initial_line, "\n"]
    for arg_line in arg_lines:
        lines.append(inner_indent + arg_line + ",\n")
    lines.append(base_indent + final_line)
    return "".join(lines)


def pascal_to_snake_case(name: str) -> str:
    """
    Convert PascalCase / CamelCase (optionally with underscores) to snake_case.
    Examples:
        PascalCase           -> pascal_case
        HTTPRequest          -> http_request
        SDL_AudioStream      -> sdl_audio_stream
    """
    parts = name.split("_")
    snake_parts: List[str] = []
    for part in parts:
        if not part:
            continue
        s1 = re.sub(r"(.)([A-Z][a-z0-9]+)", r"\1_\2", part)
        s2 = re.sub(r"([a-z0-9])([A-Z])", r"\1_\2", s1)
        snake_parts.append(s2.lower())
    return "_".join(snake_parts)


# ----------------
# Misc
# ----------------


@dataclass
class SdlLibSpec:
    name: str
    dlname: str
    repo_url: str
    entrypoint_header: str
    include_headers: List[str]


@dataclass
class FileInfo:
    name: str
    type: str
    download_url: str


T = TypeVar("T")


def assert_type(t: Type[T], value: Any) -> T:
    """Ensure that a value is of the expected type.

    Raises a TypeError if the value is not an instance of the given type.

    Args:
        t: The expected Python type.
        value: The object to validate.

    Returns:
        The value, typed as T, if validation succeeds.

    Raises:
        TypeError: If value is not an instance of t.
    """
    if not isinstance(value, t):
        raise TypeError(f"Expected {t.__name__}, got {type(value).__name__}")
    return value


if __name__ == "__main__":
    main()