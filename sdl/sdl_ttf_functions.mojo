from ffi import OwnedDLHandle, c_char, CStringSlice
from sys import CompilationTarget
from os import PathLike
from pathlib import Path
from .misc import *
from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *
from .sdl3_functions import Sdl3Functions


comptime Ptr = UnsafePointer


struct SdlTtfFunctions(Movable):
    var _dynamic_library_handle: OwnedDLHandle
    var _get_error: fn() -> CStringSlice[ImmutExternalOrigin]
    var _version: fn() -> Int32
    var _get_free_type_version: fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> NoneType
    var _get_harf_buzz_version: fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> NoneType
    var _init: fn() -> Bool
    var _open_font: fn(Ptr[c_char, ImmutExternalOrigin], Float32) -> Ptr[TTF_Font, MutExternalOrigin]
    var _open_font_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Float32) -> Ptr[TTF_Font, MutExternalOrigin]
    var _open_font_with_properties: fn(PropertiesID) -> Ptr[TTF_Font, MutExternalOrigin]
    var _copy_font: fn(Ptr[TTF_Font, MutExternalOrigin]) -> Ptr[TTF_Font, MutExternalOrigin]
    var _get_font_properties: fn(Ptr[TTF_Font, MutExternalOrigin]) -> PropertiesID
    var _get_font_generation: fn(Ptr[TTF_Font, MutExternalOrigin]) -> UInt32
    var _add_fallback_font: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> Bool
    var _remove_fallback_font: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> NoneType
    var _clear_fallback_fonts: fn(Ptr[TTF_Font, MutExternalOrigin]) -> NoneType
    var _set_font_size: fn(Ptr[TTF_Font, MutExternalOrigin], Float32) -> Bool
    var _set_font_size_dpi: fn(Ptr[TTF_Font, MutExternalOrigin], Float32, Int32, Int32) -> Bool
    var _get_font_size: fn(Ptr[TTF_Font, MutExternalOrigin]) -> Float32
    var _get_font_dpi: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _set_font_style: fn(Ptr[TTF_Font, MutExternalOrigin], TTF_FontStyleFlags) -> NoneType
    var _get_font_style: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_FontStyleFlags
    var _set_font_outline: fn(Ptr[TTF_Font, MutExternalOrigin], Int32) -> Bool
    var _get_font_outline: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var _set_font_hinting: fn(Ptr[TTF_Font, MutExternalOrigin], TTF_HintingFlags) -> NoneType
    var _get_num_font_faces: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var _get_font_hinting: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_HintingFlags
    var _set_font_sdf: fn(Ptr[TTF_Font, MutExternalOrigin], Bool) -> Bool
    var _get_font_sdf: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool
    var _get_font_weight: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var _set_font_wrap_alignment: fn(Ptr[TTF_Font, MutExternalOrigin], TTF_HorizontalAlignment) -> NoneType
    var _get_font_wrap_alignment: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_HorizontalAlignment
    var _get_font_height: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var _get_font_ascent: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var _get_font_descent: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var _set_font_line_skip: fn(Ptr[TTF_Font, MutExternalOrigin], Int32) -> NoneType
    var _get_font_line_skip: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var _set_font_kerning: fn(Ptr[TTF_Font, MutExternalOrigin], Bool) -> NoneType
    var _get_font_kerning: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool
    var _font_is_fixed_width: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool
    var _font_is_scalable: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool
    var _get_font_family_name: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_font_style_name: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _set_font_direction: fn(Ptr[TTF_Font, MutExternalOrigin], TTF_Direction) -> Bool
    var _get_font_direction: fn(Ptr[TTF_Font, MutExternalOrigin]) -> TTF_Direction
    var _string_to_tag: fn(Ptr[c_char, ImmutExternalOrigin]) -> UInt32
    var _tag_to_string: fn(UInt32, Ptr[c_char, MutExternalOrigin], Int32) -> NoneType
    var _set_font_script: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32) -> Bool
    var _get_font_script: fn(Ptr[TTF_Font, MutExternalOrigin]) -> UInt32
    var _get_glyph_script: fn(UInt32) -> UInt32
    var _set_font_language: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _font_has_glyph: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32) -> Bool
    var _get_glyph_image: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[TTF_ImageType, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _get_glyph_image_for_index: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[TTF_ImageType, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _get_glyph_metrics: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_glyph_kerning: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, UInt32, Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_string_size: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_string_size_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _measure_string: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _render_text_solid: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color) -> Ptr[Surface, MutExternalOrigin]
    var _render_text_solid_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Int32) -> Ptr[Surface, MutExternalOrigin]
    var _render_glyph_solid: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color) -> Ptr[Surface, MutExternalOrigin]
    var _render_text_shaded: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color) -> Ptr[Surface, MutExternalOrigin]
    var _render_text_shaded_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color, Int32) -> Ptr[Surface, MutExternalOrigin]
    var _render_glyph_shaded: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color, Color) -> Ptr[Surface, MutExternalOrigin]
    var _render_text_blended: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color) -> Ptr[Surface, MutExternalOrigin]
    var _render_text_blended_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Int32) -> Ptr[Surface, MutExternalOrigin]
    var _render_glyph_blended: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color) -> Ptr[Surface, MutExternalOrigin]
    var _render_text_lcd: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color) -> Ptr[Surface, MutExternalOrigin]
    var _render_text_lcd_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color, Int32) -> Ptr[Surface, MutExternalOrigin]
    var _render_glyph_lcd: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color, Color) -> Ptr[Surface, MutExternalOrigin]
    var _create_surface_text_engine: fn() -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var _draw_surface_text: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[Surface, MutExternalOrigin]) -> Bool
    var _destroy_surface_text_engine: fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType
    var _create_renderer_text_engine: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var _create_renderer_text_engine_with_properties: fn(PropertiesID) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var _draw_renderer_text: fn(Ptr[TTF_Text, MutExternalOrigin], Float32, Float32) -> Bool
    var _destroy_renderer_text_engine: fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType
    var _create_gpu_text_engine: fn(Ptr[GPUDevice, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var _create_gpu_text_engine_with_properties: fn(PropertiesID) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var _get_gpu_text_draw_data: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_GPUAtlasDrawSequence, MutExternalOrigin]
    var _destroy_gpu_text_engine: fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType
    var _set_gpu_text_engine_winding: fn(Ptr[TTF_TextEngine, MutExternalOrigin], TTF_GPUTextEngineWinding) -> NoneType
    var _get_gpu_text_engine_winding: fn(Ptr[TTF_TextEngine, ImmutExternalOrigin]) -> TTF_GPUTextEngineWinding
    var _create_text: fn(Ptr[TTF_TextEngine, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Ptr[TTF_Text, MutExternalOrigin]
    var _get_text_properties: fn(Ptr[TTF_Text, MutExternalOrigin]) -> PropertiesID
    var _set_text_engine: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_TextEngine, MutExternalOrigin]) -> Bool
    var _get_text_engine: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var _set_text_font: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> Bool
    var _get_text_font: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_Font, MutExternalOrigin]
    var _set_text_direction: fn(Ptr[TTF_Text, MutExternalOrigin], TTF_Direction) -> Bool
    var _get_text_direction: fn(Ptr[TTF_Text, MutExternalOrigin]) -> TTF_Direction
    var _set_text_script: fn(Ptr[TTF_Text, MutExternalOrigin], UInt32) -> Bool
    var _get_text_script: fn(Ptr[TTF_Text, MutExternalOrigin]) -> UInt32
    var _set_text_color: fn(Ptr[TTF_Text, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> Bool
    var _set_text_color_float: fn(Ptr[TTF_Text, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool
    var _get_text_color: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var _get_text_color_float: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _set_text_position: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32) -> Bool
    var _get_text_position: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _set_text_wrap_width: fn(Ptr[TTF_Text, MutExternalOrigin], Int32) -> Bool
    var _get_text_wrap_width: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _set_text_wrap_whitespace_visible: fn(Ptr[TTF_Text, MutExternalOrigin], Bool) -> Bool
    var _text_wrap_whitespace_visible: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Bool
    var _set_text_string: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var _insert_text_string: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var _append_text_string: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var _delete_text_string: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32) -> Bool
    var _get_text_size: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_text_sub_string: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var _get_text_sub_string_for_line: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var _get_text_sub_strings_for_range: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[TTF_SubString, MutExternalOrigin], MutExternalOrigin]
    var _get_text_sub_string_for_point: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var _get_previous_text_sub_string: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_SubString, ImmutExternalOrigin], Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var _get_next_text_sub_string: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_SubString, ImmutExternalOrigin], Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var _update_text: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Bool
    var _destroy_text: fn(Ptr[TTF_Text, MutExternalOrigin]) -> NoneType
    var _close_font: fn(Ptr[TTF_Font, MutExternalOrigin]) -> NoneType
    var _quit: fn() -> NoneType
    var _was_init: fn() -> Int32

    fn __init__(out self, sdl3_functions: Sdl3Functions) raises:
        var library_path: Path
        @parameter
        if CompilationTarget.is_linux():
            library_path = Path("libSDL3_ttf.so")
        elif CompilationTarget.is_macos():
            library_path = Path("libSDL3_ttf.dylib")
        else:
            constrained[False, "Target operating system is not supported."]()
            library_path = Path()
        self = Self(sdl3_functions, library_path)

    fn __init__(out self, sdl3_functions: Sdl3Functions, library_path: Path) raises:
        self._dynamic_library_handle = OwnedDLHandle(library_path)
        self._get_error = sdl3_functions._get_error
        self._version = self._dynamic_library_handle.get_function[fn() -> Int32]("TTF_Version")
        self._get_free_type_version = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> NoneType]("TTF_GetFreeTypeVersion")
        self._get_harf_buzz_version = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> NoneType]("TTF_GetHarfBuzzVersion")
        self._init = self._dynamic_library_handle.get_function[fn() -> Bool]("TTF_Init")
        self._open_font = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Float32) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_OpenFont")
        self._open_font_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Float32) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_OpenFontIO")
        self._open_font_with_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_OpenFontWithProperties")
        self._copy_font = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_CopyFont")
        self._get_font_properties = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> PropertiesID]("TTF_GetFontProperties")
        self._get_font_generation = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> UInt32]("TTF_GetFontGeneration")
        self._add_fallback_font = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> Bool]("TTF_AddFallbackFont")
        self._remove_fallback_font = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> NoneType]("TTF_RemoveFallbackFont")
        self._clear_fallback_fonts = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> NoneType]("TTF_ClearFallbackFonts")
        self._set_font_size = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Float32) -> Bool]("TTF_SetFontSize")
        self._set_font_size_dpi = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Float32, Int32, Int32) -> Bool]("TTF_SetFontSizeDPI")
        self._get_font_size = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> Float32]("TTF_GetFontSize")
        self._get_font_dpi = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetFontDPI")
        self._set_font_style = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], TTF_FontStyleFlags) -> NoneType]("TTF_SetFontStyle")
        self._get_font_style = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_FontStyleFlags]("TTF_GetFontStyle")
        self._set_font_outline = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Int32) -> Bool]("TTF_SetFontOutline")
        self._get_font_outline = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontOutline")
        self._set_font_hinting = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], TTF_HintingFlags) -> NoneType]("TTF_SetFontHinting")
        self._get_num_font_faces = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetNumFontFaces")
        self._get_font_hinting = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_HintingFlags]("TTF_GetFontHinting")
        self._set_font_sdf = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Bool) -> Bool]("TTF_SetFontSDF")
        self._get_font_sdf = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool]("TTF_GetFontSDF")
        self._get_font_weight = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontWeight")
        self._set_font_wrap_alignment = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], TTF_HorizontalAlignment) -> NoneType]("TTF_SetFontWrapAlignment")
        self._get_font_wrap_alignment = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_HorizontalAlignment]("TTF_GetFontWrapAlignment")
        self._get_font_height = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontHeight")
        self._get_font_ascent = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontAscent")
        self._get_font_descent = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontDescent")
        self._set_font_line_skip = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Int32) -> NoneType]("TTF_SetFontLineSkip")
        self._get_font_line_skip = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontLineSkip")
        self._set_font_kerning = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Bool) -> NoneType]("TTF_SetFontKerning")
        self._get_font_kerning = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool]("TTF_GetFontKerning")
        self._font_is_fixed_width = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool]("TTF_FontIsFixedWidth")
        self._font_is_scalable = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool]("TTF_FontIsScalable")
        self._get_font_family_name = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("TTF_GetFontFamilyName")
        self._get_font_style_name = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("TTF_GetFontStyleName")
        self._set_font_direction = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], TTF_Direction) -> Bool]("TTF_SetFontDirection")
        self._get_font_direction = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> TTF_Direction]("TTF_GetFontDirection")
        self._string_to_tag = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> UInt32]("TTF_StringToTag")
        self._tag_to_string = self._dynamic_library_handle.get_function[fn(UInt32, Ptr[c_char, MutExternalOrigin], Int32) -> NoneType]("TTF_TagToString")
        self._set_font_script = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32) -> Bool]("TTF_SetFontScript")
        self._get_font_script = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> UInt32]("TTF_GetFontScript")
        self._get_glyph_script = self._dynamic_library_handle.get_function[fn(UInt32) -> UInt32]("TTF_GetGlyphScript")
        self._set_font_language = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("TTF_SetFontLanguage")
        self._font_has_glyph = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32) -> Bool]("TTF_FontHasGlyph")
        self._get_glyph_image = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[TTF_ImageType, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("TTF_GetGlyphImage")
        self._get_glyph_image_for_index = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[TTF_ImageType, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("TTF_GetGlyphImageForIndex")
        self._get_glyph_metrics = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetGlyphMetrics")
        self._get_glyph_kerning = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, UInt32, Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetGlyphKerning")
        self._get_string_size = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetStringSize")
        self._get_string_size_wrapped = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetStringSizeWrapped")
        self._measure_string = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_MeasureString")
        self._render_text_solid = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Solid")
        self._render_text_solid_wrapped = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Int32) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Solid_Wrapped")
        self._render_glyph_solid = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderGlyph_Solid")
        self._render_text_shaded = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Shaded")
        self._render_text_shaded_wrapped = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color, Int32) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Shaded_Wrapped")
        self._render_glyph_shaded = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderGlyph_Shaded")
        self._render_text_blended = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Blended")
        self._render_text_blended_wrapped = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Int32) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Blended_Wrapped")
        self._render_glyph_blended = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderGlyph_Blended")
        self._render_text_lcd = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_LCD")
        self._render_text_lcd_wrapped = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color, Int32) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_LCD_Wrapped")
        self._render_glyph_lcd = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderGlyph_LCD")
        self._create_surface_text_engine = self._dynamic_library_handle.get_function[fn() -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateSurfaceTextEngine")
        self._draw_surface_text = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[Surface, MutExternalOrigin]) -> Bool]("TTF_DrawSurfaceText")
        self._destroy_surface_text_engine = self._dynamic_library_handle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType]("TTF_DestroySurfaceTextEngine")
        self._create_renderer_text_engine = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateRendererTextEngine")
        self._create_renderer_text_engine_with_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateRendererTextEngineWithProperties")
        self._draw_renderer_text = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Float32, Float32) -> Bool]("TTF_DrawRendererText")
        self._destroy_renderer_text_engine = self._dynamic_library_handle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType]("TTF_DestroyRendererTextEngine")
        self._create_gpu_text_engine = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateGPUTextEngine")
        self._create_gpu_text_engine_with_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateGPUTextEngineWithProperties")
        self._get_gpu_text_draw_data = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_GPUAtlasDrawSequence, MutExternalOrigin]]("TTF_GetGPUTextDrawData")
        self._destroy_gpu_text_engine = self._dynamic_library_handle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType]("TTF_DestroyGPUTextEngine")
        self._set_gpu_text_engine_winding = self._dynamic_library_handle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin], TTF_GPUTextEngineWinding) -> NoneType]("TTF_SetGPUTextEngineWinding")
        self._get_gpu_text_engine_winding = self._dynamic_library_handle.get_function[fn(Ptr[TTF_TextEngine, ImmutExternalOrigin]) -> TTF_GPUTextEngineWinding]("TTF_GetGPUTextEngineWinding")
        self._create_text = self._dynamic_library_handle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Ptr[TTF_Text, MutExternalOrigin]]("TTF_CreateText")
        self._get_text_properties = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> PropertiesID]("TTF_GetTextProperties")
        self._set_text_engine = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_TextEngine, MutExternalOrigin]) -> Bool]("TTF_SetTextEngine")
        self._get_text_engine = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_GetTextEngine")
        self._set_text_font = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> Bool]("TTF_SetTextFont")
        self._get_text_font = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_GetTextFont")
        self._set_text_direction = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], TTF_Direction) -> Bool]("TTF_SetTextDirection")
        self._get_text_direction = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> TTF_Direction]("TTF_GetTextDirection")
        self._set_text_script = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], UInt32) -> Bool]("TTF_SetTextScript")
        self._get_text_script = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> UInt32]("TTF_GetTextScript")
        self._set_text_color = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> Bool]("TTF_SetTextColor")
        self._set_text_color_float = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool]("TTF_SetTextColorFloat")
        self._get_text_color = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("TTF_GetTextColor")
        self._get_text_color_float = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("TTF_GetTextColorFloat")
        self._set_text_position = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32) -> Bool]("TTF_SetTextPosition")
        self._get_text_position = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetTextPosition")
        self._set_text_wrap_width = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32) -> Bool]("TTF_SetTextWrapWidth")
        self._get_text_wrap_width = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetTextWrapWidth")
        self._set_text_wrap_whitespace_visible = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Bool) -> Bool]("TTF_SetTextWrapWhitespaceVisible")
        self._text_wrap_whitespace_visible = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Bool]("TTF_TextWrapWhitespaceVisible")
        self._set_text_string = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("TTF_SetTextString")
        self._insert_text_string = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("TTF_InsertTextString")
        self._append_text_string = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("TTF_AppendTextString")
        self._delete_text_string = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32) -> Bool]("TTF_DeleteTextString")
        self._get_text_size = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetTextSize")
        self._get_text_sub_string = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetTextSubString")
        self._get_text_sub_string_for_line = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetTextSubStringForLine")
        self._get_text_sub_strings_for_range = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[TTF_SubString, MutExternalOrigin], MutExternalOrigin]]("TTF_GetTextSubStringsForRange")
        self._get_text_sub_string_for_point = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetTextSubStringForPoint")
        self._get_previous_text_sub_string = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_SubString, ImmutExternalOrigin], Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetPreviousTextSubString")
        self._get_next_text_sub_string = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_SubString, ImmutExternalOrigin], Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetNextTextSubString")
        self._update_text = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Bool]("TTF_UpdateText")
        self._destroy_text = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> NoneType]("TTF_DestroyText")
        self._close_font = self._dynamic_library_handle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> NoneType]("TTF_CloseFont")
        self._quit = self._dynamic_library_handle.get_function[fn() -> NoneType]("TTF_Quit")
        self._was_init = self._dynamic_library_handle.get_function[fn() -> Int32]("TTF_WasInit")

    fn get_error(self) -> CStringSlice[ImmutExternalOrigin]:
        return self._get_error()

    fn version(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_Version
        """
        return self._version()

    fn get_free_type_version(self, major: Ptr[Int32], minor: Ptr[Int32], patch: Ptr[Int32]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFreeTypeVersion
        """
        self._get_free_type_version(
            Ptr(to=major).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=minor).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=patch).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )

    fn get_harf_buzz_version(self, major: Ptr[Int32], minor: Ptr[Int32], patch: Ptr[Int32]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetHarfBuzzVersion
        """
        self._get_harf_buzz_version(
            Ptr(to=major).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=minor).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=patch).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )

    fn init(self) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_Init
        """
        var success_status = self._init()
        if not success_status:
            raise self._get_error()

    fn open_font(
        self, file: CStringSlice, ptsize: Float32
    ) raises -> Ptr[TTF_Font, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_OpenFont
        """
        var result_pointer = self._open_font(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=ptsize).bitcast[Float32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn open_font_io(
        self, src: Ptr[IOStream], closeio: Bool, ptsize: Float32
    ) raises -> Ptr[TTF_Font, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_OpenFontIO
        """
        var result_pointer = self._open_font_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=ptsize).bitcast[Float32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn open_font_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[TTF_Font, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_OpenFontWithProperties
        """
        var result_pointer = self._open_font_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn copy_font(self, existing_font: Ptr[TTF_Font]) raises -> Ptr[TTF_Font, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_CopyFont
        """
        var result_pointer = self._copy_font(
            Ptr(to=existing_font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_font_properties(self, font: Ptr[TTF_Font]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontProperties
        """
        return self._get_font_properties(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
        )

    fn get_font_generation(self, font: Ptr[TTF_Font]) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontGeneration
        """
        return self._get_font_generation(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
        )

    fn add_fallback_font(self, font: Ptr[TTF_Font], fallback: Ptr[TTF_Font]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_AddFallbackFont
        """
        var success_status = self._add_fallback_font(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=fallback).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn remove_fallback_font(self, font: Ptr[TTF_Font], fallback: Ptr[TTF_Font]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RemoveFallbackFont
        """
        self._remove_fallback_font(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=fallback).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        )

    fn clear_fallback_fonts(self, font: Ptr[TTF_Font]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_ClearFallbackFonts
        """
        self._clear_fallback_fonts(Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[])

    fn set_font_size(self, font: Ptr[TTF_Font], ptsize: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontSize
        """
        var success_status = self._set_font_size(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=ptsize).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_font_size_dpi(
        self, font: Ptr[TTF_Font], ptsize: Float32, hdpi: Int32, vdpi: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontSizeDPI
        """
        var success_status = self._set_font_size_dpi(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=ptsize).bitcast[Float32]()[],
            Ptr(to=hdpi).bitcast[Int32]()[],
            Ptr(to=vdpi).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_font_size(self, font: Ptr[TTF_Font]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontSize
        """
        return self._get_font_size(Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[])

    fn get_font_dpi(self, font: Ptr[TTF_Font], hdpi: Ptr[Int32], vdpi: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontDPI
        """
        var success_status = self._get_font_dpi(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=hdpi).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=vdpi).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_font_style(self, font: Ptr[TTF_Font], style: TTF_FontStyleFlags):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontStyle
        """
        self._set_font_style(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=style).bitcast[TTF_FontStyleFlags]()[],
        )

    fn get_font_style(self, font: Ptr[TTF_Font]) -> TTF_FontStyleFlags:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontStyle
        """
        return self._get_font_style(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn set_font_outline(self, font: Ptr[TTF_Font], outline: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontOutline
        """
        var success_status = self._set_font_outline(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=outline).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_font_outline(self, font: Ptr[TTF_Font]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontOutline
        """
        return self._get_font_outline(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn set_font_hinting(self, font: Ptr[TTF_Font], hinting: TTF_HintingFlags):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontHinting
        """
        self._set_font_hinting(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=hinting).bitcast[TTF_HintingFlags]()[],
        )

    fn get_num_font_faces(self, font: Ptr[TTF_Font]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetNumFontFaces
        """
        return self._get_num_font_faces(
            Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
        )

    fn get_font_hinting(self, font: Ptr[TTF_Font]) -> TTF_HintingFlags:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontHinting
        """
        return self._get_font_hinting(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn set_font_sdf(self, font: Ptr[TTF_Font], enabled: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontSDF
        """
        var success_status = self._set_font_sdf(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=enabled).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_font_sdf(self, font: Ptr[TTF_Font]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontSDF
        """
        return self._get_font_sdf(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn get_font_weight(self, font: Ptr[TTF_Font]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontWeight
        """
        return self._get_font_weight(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn set_font_wrap_alignment(self, font: Ptr[TTF_Font], align: TTF_HorizontalAlignment):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontWrapAlignment
        """
        self._set_font_wrap_alignment(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=align).bitcast[TTF_HorizontalAlignment]()[],
        )

    fn get_font_wrap_alignment(self, font: Ptr[TTF_Font]) -> TTF_HorizontalAlignment:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontWrapAlignment
        """
        return self._get_font_wrap_alignment(
            Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
        )

    fn get_font_height(self, font: Ptr[TTF_Font]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontHeight
        """
        return self._get_font_height(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn get_font_ascent(self, font: Ptr[TTF_Font]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontAscent
        """
        return self._get_font_ascent(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn get_font_descent(self, font: Ptr[TTF_Font]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontDescent
        """
        return self._get_font_descent(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn set_font_line_skip(self, font: Ptr[TTF_Font], lineskip: Int32):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontLineSkip
        """
        self._set_font_line_skip(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=lineskip).bitcast[Int32]()[],
        )

    fn get_font_line_skip(self, font: Ptr[TTF_Font]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontLineSkip
        """
        return self._get_font_line_skip(
            Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
        )

    fn set_font_kerning(self, font: Ptr[TTF_Font], enabled: Bool):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontKerning
        """
        self._set_font_kerning(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=enabled).bitcast[Bool]()[],
        )

    fn get_font_kerning(self, font: Ptr[TTF_Font]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontKerning
        """
        return self._get_font_kerning(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn font_is_fixed_width(self, font: Ptr[TTF_Font]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_FontIsFixedWidth
        """
        return self._font_is_fixed_width(
            Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
        )

    fn font_is_scalable(self, font: Ptr[TTF_Font]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_FontIsScalable
        """
        return self._font_is_scalable(Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[])

    fn get_font_family_name(self, font: Ptr[TTF_Font]) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontFamilyName
        """
        var c_string = self._get_font_family_name(
            Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
        )
        return c_string

    fn get_font_style_name(self, font: Ptr[TTF_Font]) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontStyleName
        """
        var c_string = self._get_font_style_name(
            Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
        )
        return c_string

    fn set_font_direction(self, font: Ptr[TTF_Font], direction: TTF_Direction) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontDirection
        """
        var success_status = self._set_font_direction(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=direction).bitcast[TTF_Direction]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_font_direction(self, font: Ptr[TTF_Font]) -> TTF_Direction:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontDirection
        """
        return self._get_font_direction(Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[])

    fn string_to_tag(self, string: CStringSlice) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_StringToTag
        """
        return self._string_to_tag(string.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]())

    fn tag_to_string(self, tag: UInt32, string: Ptr[c_char], size: Int32):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_TagToString
        """
        self._tag_to_string(
            Ptr(to=tag).bitcast[UInt32]()[],
            Ptr(to=string).bitcast[Ptr[c_char, MutExternalOrigin]]()[],
            Ptr(to=size).bitcast[Int32]()[],
        )

    fn set_font_script(self, font: Ptr[TTF_Font], script: UInt32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontScript
        """
        var success_status = self._set_font_script(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=script).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_font_script(self, font: Ptr[TTF_Font]) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetFontScript
        """
        return self._get_font_script(Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[])

    fn get_glyph_script(self, ch: UInt32) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphScript
        """
        return self._get_glyph_script(Ptr(to=ch).bitcast[UInt32]()[])

    fn set_font_language(self, font: Ptr[TTF_Font], language_bcp47: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetFontLanguage
        """
        var success_status = self._set_font_language(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            language_bcp47.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn font_has_glyph(self, font: Ptr[TTF_Font], ch: UInt32) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_FontHasGlyph
        """
        return self._font_has_glyph(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=ch).bitcast[UInt32]()[],
        )

    fn get_glyph_image(
        self, font: Ptr[TTF_Font], ch: UInt32, image_type: Ptr[TTF_ImageType]
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphImage
        """
        var result_pointer = self._get_glyph_image(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=ch).bitcast[UInt32]()[],
            Ptr(to=image_type).bitcast[Ptr[TTF_ImageType, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_glyph_image_for_index(
        self, font: Ptr[TTF_Font], glyph_index: UInt32, image_type: Ptr[TTF_ImageType]
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphImageForIndex
        """
        var result_pointer = self._get_glyph_image_for_index(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=glyph_index).bitcast[UInt32]()[],
            Ptr(to=image_type).bitcast[Ptr[TTF_ImageType, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_glyph_metrics(
        self,
        font: Ptr[TTF_Font],
        ch: UInt32,
        minx: Ptr[Int32],
        maxx: Ptr[Int32],
        miny: Ptr[Int32],
        maxy: Ptr[Int32],
        advance: Ptr[Int32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphMetrics
        """
        var success_status = self._get_glyph_metrics(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=ch).bitcast[UInt32]()[],
            Ptr(to=minx).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=maxx).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=miny).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=maxy).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=advance).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_glyph_kerning(
        self, font: Ptr[TTF_Font], previous_ch: UInt32, ch: UInt32, kerning: Ptr[Int32]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphKerning
        """
        var success_status = self._get_glyph_kerning(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=previous_ch).bitcast[UInt32]()[],
            Ptr(to=ch).bitcast[UInt32]()[],
            Ptr(to=kerning).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_string_size(
        self, font: Ptr[TTF_Font], text: CStringSlice, length: Int32, w: Ptr[Int32], h: Ptr[Int32]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetStringSize
        """
        var success_status = self._get_string_size(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_string_size_wrapped(
        self,
        font: Ptr[TTF_Font],
        text: CStringSlice,
        length: Int32,
        wrap_width: Int32,
        w: Ptr[Int32],
        h: Ptr[Int32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetStringSizeWrapped
        """
        var success_status = self._get_string_size_wrapped(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=wrap_width).bitcast[Int32]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn measure_string(
        self,
        font: Ptr[TTF_Font],
        text: CStringSlice,
        length: Int32,
        max_width: Int32,
        measured_width: Ptr[Int32],
        measured_length: Ptr[Int32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_MeasureString
        """
        var success_status = self._measure_string(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=max_width).bitcast[Int32]()[],
            Ptr(to=measured_width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=measured_length).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_text_solid(
        self, font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Solid
        """
        var result_pointer = self._render_text_solid(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=fg).bitcast[Color]()[],
        )
        if not result_pointer:
            raise "Error in render_text_solid call. See official documentation for details."
        return result_pointer

    fn render_text_solid_wrapped(
        self, font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, wrapLength: Int32
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Solid_Wrapped
        """
        var result_pointer = self._render_text_solid_wrapped(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=fg).bitcast[Color]()[],
            Ptr(to=wrapLength).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise "Error in render_text_solid_wrapped call. See official documentation for details."
        return result_pointer

    fn render_glyph_solid(
        self, font: Ptr[TTF_Font], ch: UInt32, fg: Color
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_Solid
        """
        var result_pointer = self._render_glyph_solid(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=ch).bitcast[UInt32]()[],
            Ptr(to=fg).bitcast[Color]()[],
        )
        if not result_pointer:
            raise "Error in render_glyph_solid call. See official documentation for details."
        return result_pointer

    fn render_text_shaded(
        self, font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, bg: Color
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Shaded
        """
        var result_pointer = self._render_text_shaded(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=fg).bitcast[Color]()[],
            Ptr(to=bg).bitcast[Color]()[],
        )
        if not result_pointer:
            raise "Error in render_text_shaded call. See official documentation for details."
        return result_pointer

    fn render_text_shaded_wrapped(
        self,
        font: Ptr[TTF_Font],
        text: CStringSlice,
        length: Int32,
        fg: Color,
        bg: Color,
        wrap_width: Int32,
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Shaded_Wrapped
        """
        var result_pointer = self._render_text_shaded_wrapped(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=fg).bitcast[Color]()[],
            Ptr(to=bg).bitcast[Color]()[],
            Ptr(to=wrap_width).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise "Error in render_text_shaded_wrapped call. See official documentation for details."
        return result_pointer

    fn render_glyph_shaded(
        self, font: Ptr[TTF_Font], ch: UInt32, fg: Color, bg: Color
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_Shaded
        """
        var result_pointer = self._render_glyph_shaded(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=ch).bitcast[UInt32]()[],
            Ptr(to=fg).bitcast[Color]()[],
            Ptr(to=bg).bitcast[Color]()[],
        )
        if not result_pointer:
            raise "Error in render_glyph_shaded call. See official documentation for details."
        return result_pointer

    fn render_text_blended(
        self, font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Blended
        """
        var result_pointer = self._render_text_blended(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=fg).bitcast[Color]()[],
        )
        if not result_pointer:
            raise "Error in render_text_blended call. See official documentation for details."
        return result_pointer

    fn render_text_blended_wrapped(
        self, font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, wrap_width: Int32
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Blended_Wrapped
        """
        var result_pointer = self._render_text_blended_wrapped(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=fg).bitcast[Color]()[],
            Ptr(to=wrap_width).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise "Error in render_text_blended_wrapped call. See official documentation for details."
        return result_pointer

    fn render_glyph_blended(
        self, font: Ptr[TTF_Font], ch: UInt32, fg: Color
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_Blended
        """
        var result_pointer = self._render_glyph_blended(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=ch).bitcast[UInt32]()[],
            Ptr(to=fg).bitcast[Color]()[],
        )
        if not result_pointer:
            raise "Error in render_glyph_blended call. See official documentation for details."
        return result_pointer

    fn render_text_lcd(
        self, font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, bg: Color
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_LCD
        """
        var result_pointer = self._render_text_lcd(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=fg).bitcast[Color]()[],
            Ptr(to=bg).bitcast[Color]()[],
        )
        if not result_pointer:
            raise "Error in render_text_lcd call. See official documentation for details."
        return result_pointer

    fn render_text_lcd_wrapped(
        self,
        font: Ptr[TTF_Font],
        text: CStringSlice,
        length: Int32,
        fg: Color,
        bg: Color,
        wrap_width: Int32,
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_LCD_Wrapped
        """
        var result_pointer = self._render_text_lcd_wrapped(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=fg).bitcast[Color]()[],
            Ptr(to=bg).bitcast[Color]()[],
            Ptr(to=wrap_width).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise "Error in render_text_lcd_wrapped call. See official documentation for details."
        return result_pointer

    fn render_glyph_lcd(
        self, font: Ptr[TTF_Font], ch: UInt32, fg: Color, bg: Color
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_LCD
        """
        var result_pointer = self._render_glyph_lcd(
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            Ptr(to=ch).bitcast[UInt32]()[],
            Ptr(to=fg).bitcast[Color]()[],
            Ptr(to=bg).bitcast[Color]()[],
        )
        if not result_pointer:
            raise "Error in render_glyph_lcd call. See official documentation for details."
        return result_pointer

    fn create_surface_text_engine(self) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_CreateSurfaceTextEngine
        """
        var result_pointer = self._create_surface_text_engine()
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn draw_surface_text(
        self, text: Ptr[TTF_Text], x: Int32, y: Int32, surface: Ptr[Surface]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_DrawSurfaceText
        """
        var success_status = self._draw_surface_text(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Int32]()[],
            Ptr(to=y).bitcast[Int32]()[],
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn destroy_surface_text_engine(self, engine: Ptr[TTF_TextEngine]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_DestroySurfaceTextEngine
        """
        self._destroy_surface_text_engine(
            Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[]
        )

    fn create_renderer_text_engine(
        self, renderer: Ptr[Renderer]
    ) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_CreateRendererTextEngine
        """
        var result_pointer = self._create_renderer_text_engine(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_renderer_text_engine_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_CreateRendererTextEngineWithProperties
        """
        var result_pointer = self._create_renderer_text_engine_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn draw_renderer_text(self, text: Ptr[TTF_Text], x: Float32, y: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_DrawRendererText
        """
        var success_status = self._draw_renderer_text(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Float32]()[],
            Ptr(to=y).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn destroy_renderer_text_engine(self, engine: Ptr[TTF_TextEngine]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_DestroyRendererTextEngine
        """
        self._destroy_renderer_text_engine(
            Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[]
        )

    fn create_gpu_text_engine(
        self, device: Ptr[GPUDevice]
    ) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_CreateGPUTextEngine
        """
        var result_pointer = self._create_gpu_text_engine(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_gpu_text_engine_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_CreateGPUTextEngineWithProperties
        """
        var result_pointer = self._create_gpu_text_engine_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_gpu_text_draw_data(
        self, text: Ptr[TTF_Text]
    ) raises -> Ptr[TTF_GPUAtlasDrawSequence, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetGPUTextDrawData
        """
        var result_pointer = self._get_gpu_text_draw_data(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn destroy_gpu_text_engine(self, engine: Ptr[TTF_TextEngine]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_DestroyGPUTextEngine
        """
        self._destroy_gpu_text_engine(
            Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[]
        )

    fn set_gpu_text_engine_winding(
        self, engine: Ptr[TTF_TextEngine], winding: TTF_GPUTextEngineWinding
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetGPUTextEngineWinding
        """
        self._set_gpu_text_engine_winding(
            Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[],
            Ptr(to=winding).bitcast[TTF_GPUTextEngineWinding]()[],
        )

    fn get_gpu_text_engine_winding(self, engine: Ptr[TTF_TextEngine]) -> TTF_GPUTextEngineWinding:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetGPUTextEngineWinding
        """
        return self._get_gpu_text_engine_winding(
            Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, ImmutExternalOrigin]]()[]
        )

    fn create_text(
        self, engine: Ptr[TTF_TextEngine], font: Ptr[TTF_Font], text: CStringSlice, length: Int32
    ) raises -> Ptr[TTF_Text, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_CreateText
        """
        var result_pointer = self._create_text(
            Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[],
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_text_properties(self, text: Ptr[TTF_Text]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextProperties
        """
        return self._get_text_properties(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
        )

    fn set_text_engine(self, text: Ptr[TTF_Text], engine: Ptr[TTF_TextEngine]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextEngine
        """
        var success_status = self._set_text_engine(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_engine(self, text: Ptr[TTF_Text]) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextEngine
        """
        var result_pointer = self._get_text_engine(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_text_font(self, text: Ptr[TTF_Text], font: Ptr[TTF_Font]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextFont
        """
        return self._set_text_font(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        )

    fn get_text_font(self, text: Ptr[TTF_Text]) raises -> Ptr[TTF_Font, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextFont
        """
        var result_pointer = self._get_text_font(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_text_direction(self, text: Ptr[TTF_Text], direction: TTF_Direction) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextDirection
        """
        var success_status = self._set_text_direction(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=direction).bitcast[TTF_Direction]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_direction(self, text: Ptr[TTF_Text]) -> TTF_Direction:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextDirection
        """
        return self._get_text_direction(Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[])

    fn set_text_script(self, text: Ptr[TTF_Text], script: UInt32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextScript
        """
        var success_status = self._set_text_script(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=script).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_script(self, text: Ptr[TTF_Text]) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextScript
        """
        return self._get_text_script(Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[])

    fn set_text_color(self, text: Ptr[TTF_Text], r: UInt8, g: UInt8, b: UInt8, a: UInt8) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextColor
        """
        var success_status = self._set_text_color(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[UInt8]()[],
            Ptr(to=g).bitcast[UInt8]()[],
            Ptr(to=b).bitcast[UInt8]()[],
            Ptr(to=a).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_text_color_float(
        self, text: Ptr[TTF_Text], r: Float32, g: Float32, b: Float32, a: Float32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextColorFloat
        """
        var success_status = self._set_text_color_float(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Float32]()[],
            Ptr(to=g).bitcast[Float32]()[],
            Ptr(to=b).bitcast[Float32]()[],
            Ptr(to=a).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_color(
        self, text: Ptr[TTF_Text], r: Ptr[UInt8], g: Ptr[UInt8], b: Ptr[UInt8], a: Ptr[UInt8]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextColor
        """
        var success_status = self._get_text_color(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=a).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_color_float(
        self,
        text: Ptr[TTF_Text],
        r: Ptr[Float32],
        g: Ptr[Float32],
        b: Ptr[Float32],
        a: Ptr[Float32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextColorFloat
        """
        var success_status = self._get_text_color_float(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=a).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_text_position(self, text: Ptr[TTF_Text], x: Int32, y: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextPosition
        """
        var success_status = self._set_text_position(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Int32]()[],
            Ptr(to=y).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_position(self, text: Ptr[TTF_Text], x: Ptr[Int32], y: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextPosition
        """
        var success_status = self._get_text_position(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=y).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_text_wrap_width(self, text: Ptr[TTF_Text], wrap_width: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextWrapWidth
        """
        var success_status = self._set_text_wrap_width(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=wrap_width).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_wrap_width(self, text: Ptr[TTF_Text], wrap_width: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextWrapWidth
        """
        var success_status = self._get_text_wrap_width(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=wrap_width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_text_wrap_whitespace_visible(self, text: Ptr[TTF_Text], visible: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextWrapWhitespaceVisible
        """
        var success_status = self._set_text_wrap_whitespace_visible(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=visible).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn text_wrap_whitespace_visible(self, text: Ptr[TTF_Text]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_TextWrapWhitespaceVisible
        """
        return self._text_wrap_whitespace_visible(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
        )

    fn set_text_string(self, text: Ptr[TTF_Text], string: CStringSlice, length: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_SetTextString
        """
        var success_status = self._set_text_string(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            string.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn insert_text_string(
        self, text: Ptr[TTF_Text], offset: Int32, string: CStringSlice, length: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_InsertTextString
        """
        var success_status = self._insert_text_string(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=offset).bitcast[Int32]()[],
            string.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn append_text_string(self, text: Ptr[TTF_Text], string: CStringSlice, length: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_AppendTextString
        """
        var success_status = self._append_text_string(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            string.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn delete_text_string(self, text: Ptr[TTF_Text], offset: Int32, length: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_DeleteTextString
        """
        var success_status = self._delete_text_string(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=offset).bitcast[Int32]()[],
            Ptr(to=length).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_size(self, text: Ptr[TTF_Text], w: Ptr[Int32], h: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSize
        """
        var success_status = self._get_text_size(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_sub_string(
        self, text: Ptr[TTF_Text], offset: Int32, substring: Ptr[TTF_SubString]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubString
        """
        var success_status = self._get_text_sub_string(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=offset).bitcast[Int32]()[],
            Ptr(to=substring).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_sub_string_for_line(
        self, text: Ptr[TTF_Text], line: Int32, substring: Ptr[TTF_SubString]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubStringForLine
        """
        var success_status = self._get_text_sub_string_for_line(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=line).bitcast[Int32]()[],
            Ptr(to=substring).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_sub_strings_for_range(
        self, text: Ptr[TTF_Text], offset: Int32, length: Int32, count: Ptr[Int32]
    ) raises -> Ptr[Ptr[TTF_SubString, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubStringsForRange
        """
        var result_pointer = self._get_text_sub_strings_for_range(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=offset).bitcast[Int32]()[],
            Ptr(to=length).bitcast[Int32]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_text_sub_string_for_point(
        self, text: Ptr[TTF_Text], x: Int32, y: Int32, substring: Ptr[TTF_SubString]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubStringForPoint
        """
        var success_status = self._get_text_sub_string_for_point(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Int32]()[],
            Ptr(to=y).bitcast[Int32]()[],
            Ptr(to=substring).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_previous_text_sub_string(
        self, text: Ptr[TTF_Text], substring: Ptr[TTF_SubString], previous: Ptr[TTF_SubString]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetPreviousTextSubString
        """
        var success_status = self._get_previous_text_sub_string(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=substring).bitcast[Ptr[TTF_SubString, ImmutExternalOrigin]]()[],
            Ptr(to=previous).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_next_text_sub_string(
        self, text: Ptr[TTF_Text], substring: Ptr[TTF_SubString], next: Ptr[TTF_SubString]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_GetNextTextSubString
        """
        var success_status = self._get_next_text_sub_string(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
            Ptr(to=substring).bitcast[Ptr[TTF_SubString, ImmutExternalOrigin]]()[],
            Ptr(to=next).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn update_text(self, text: Ptr[TTF_Text]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_UpdateText
        """
        var success_status = self._update_text(
            Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn destroy_text(self, text: Ptr[TTF_Text]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_DestroyText
        """
        self._destroy_text(Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[])

    fn close_font(self, font: Ptr[TTF_Font]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_CloseFont
        """
        self._close_font(Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[])

    fn quit(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_Quit
        """
        self._quit()

    fn was_init(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_ttf/TTF_WasInit
        """
        return self._was_init()
