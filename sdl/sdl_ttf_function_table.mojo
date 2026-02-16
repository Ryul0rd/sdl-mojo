from sys.ffi import OwnedDLHandle, _Global, _get_global, c_char
from sys import CompilationTarget
from os import PathLike
from pathlib import Path
from .misc import *
from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *


comptime Ptr = UnsafePointer


comptime sdl_ttf_function_table = _Global["sdl_ttf_function_table", zero_init[SdlTtfFunctionTable]]()


fn zero_init_sdl_ttf_function_table() -> OpaquePointer[MutExternalOrigin]:
    var fn_table = alloc[SdlTtfFunctionTable](1)
    memset_zero(fn_table, 1)
    return fn_table.bitcast[NoneType]()


fn destroy_sdl_ttf_function_table(fn_table: OpaquePointer[MutExternalOrigin]):
    fn_table.bitcast[SdlTtfFunctionTable]().destroy_pointee()


fn get_sdl_ttf_function_table() -> ref [MutExternalOrigin] SdlTtfFunctionTable:
    return _get_global[
        "sdl_ttf_function_table", zero_init_sdl_ttf_function_table, destroy_sdl_ttf_function_table,
    ]().bitcast[SdlTtfFunctionTable]()[]


fn load_ttf_dl() raises:
    var path: Path
    @parameter
    if CompilationTarget.is_linux():
        path = Path("libSDL3_ttf.so")
    elif CompilationTarget.is_macos():
        path = Path("libSDL3_ttf.dylib")
    else:
        constrained[False, "Target OS is not supported."]()
        path = Path()
    var fn_table = Ptr(to=get_sdl_ttf_function_table())
    fn_table.init_pointee_move(SdlTtfFunctionTable(path))


fn load_ttf_dl(path: Some[PathLike]) raises:
    var fn_table = Ptr(to=get_sdl_ttf_function_table())
    fn_table.init_pointee_move(SdlTtfFunctionTable(path))


struct SdlTtfFunctionTable(Movable):
    var dlhandle: OwnedDLHandle
    var ttf_version: fn() -> Int32
    var ttf_get_free_type_version: fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> NoneType
    var ttf_get_harf_buzz_version: fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> NoneType
    var ttf_init: fn() -> Bool
    var ttf_open_font: fn(Ptr[c_char, ImmutExternalOrigin], Float32) -> Ptr[TTF_Font, MutExternalOrigin]
    var ttf_open_font_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Float32) -> Ptr[TTF_Font, MutExternalOrigin]
    var ttf_open_font_with_properties: fn(PropertiesID) -> Ptr[TTF_Font, MutExternalOrigin]
    var ttf_copy_font: fn(Ptr[TTF_Font, MutExternalOrigin]) -> Ptr[TTF_Font, MutExternalOrigin]
    var ttf_get_font_properties: fn(Ptr[TTF_Font, MutExternalOrigin]) -> PropertiesID
    var ttf_get_font_generation: fn(Ptr[TTF_Font, MutExternalOrigin]) -> UInt32
    var ttf_add_fallback_font: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> Bool
    var ttf_remove_fallback_font: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> NoneType
    var ttf_clear_fallback_fonts: fn(Ptr[TTF_Font, MutExternalOrigin]) -> NoneType
    var ttf_set_font_size: fn(Ptr[TTF_Font, MutExternalOrigin], Float32) -> Bool
    var ttf_set_font_size_dpi: fn(Ptr[TTF_Font, MutExternalOrigin], Float32, Int32, Int32) -> Bool
    var ttf_get_font_size: fn(Ptr[TTF_Font, MutExternalOrigin]) -> Float32
    var ttf_get_font_dpi: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var ttf_set_font_style: fn(Ptr[TTF_Font, MutExternalOrigin], TTF_FontStyleFlags) -> NoneType
    var ttf_get_font_style: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_FontStyleFlags
    var ttf_set_font_outline: fn(Ptr[TTF_Font, MutExternalOrigin], Int32) -> Bool
    var ttf_get_font_outline: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var ttf_set_font_hinting: fn(Ptr[TTF_Font, MutExternalOrigin], TTF_HintingFlags) -> NoneType
    var ttf_get_num_font_faces: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var ttf_get_font_hinting: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_HintingFlags
    var ttf_set_font_sdf: fn(Ptr[TTF_Font, MutExternalOrigin], Bool) -> Bool
    var ttf_get_font_sdf: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool
    var ttf_get_font_weight: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var ttf_set_font_wrap_alignment: fn(Ptr[TTF_Font, MutExternalOrigin], TTF_HorizontalAlignment) -> NoneType
    var ttf_get_font_wrap_alignment: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_HorizontalAlignment
    var ttf_get_font_height: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var ttf_get_font_ascent: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var ttf_get_font_descent: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var ttf_set_font_line_skip: fn(Ptr[TTF_Font, MutExternalOrigin], Int32) -> NoneType
    var ttf_get_font_line_skip: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32
    var ttf_set_font_kerning: fn(Ptr[TTF_Font, MutExternalOrigin], Bool) -> NoneType
    var ttf_get_font_kerning: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool
    var ttf_font_is_fixed_width: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool
    var ttf_font_is_scalable: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool
    var ttf_get_font_family_name: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var ttf_get_font_style_name: fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var ttf_set_font_direction: fn(Ptr[TTF_Font, MutExternalOrigin], TTF_Direction) -> Bool
    var ttf_get_font_direction: fn(Ptr[TTF_Font, MutExternalOrigin]) -> TTF_Direction
    var ttf_string_to_tag: fn(Ptr[c_char, ImmutExternalOrigin]) -> UInt32
    var ttf_tag_to_string: fn(UInt32, Ptr[c_char, MutExternalOrigin], Int32) -> NoneType
    var ttf_set_font_script: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32) -> Bool
    var ttf_get_font_script: fn(Ptr[TTF_Font, MutExternalOrigin]) -> UInt32
    var ttf_get_glyph_script: fn(UInt32) -> UInt32
    var ttf_set_font_language: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var ttf_font_has_glyph: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32) -> Bool
    var ttf_get_glyph_image: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[TTF_ImageType, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var ttf_get_glyph_image_for_index: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[TTF_ImageType, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var ttf_get_glyph_metrics: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var ttf_get_glyph_kerning: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, UInt32, Ptr[Int32, MutExternalOrigin]) -> Bool
    var ttf_get_string_size: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var ttf_get_string_size_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var ttf_measure_string: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var ttf_render_text_solid: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_text_solid_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Int32) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_glyph_solid: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_text_shaded: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_text_shaded_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color, Int32) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_glyph_shaded: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color, Color) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_text_blended: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_text_blended_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Int32) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_glyph_blended: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_text_lcd: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_text_lcd_wrapped: fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color, Int32) -> Ptr[Surface, MutExternalOrigin]
    var ttf_render_glyph_lcd: fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color, Color) -> Ptr[Surface, MutExternalOrigin]
    var ttf_create_surface_text_engine: fn() -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var ttf_draw_surface_text: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[Surface, MutExternalOrigin]) -> Bool
    var ttf_destroy_surface_text_engine: fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType
    var ttf_create_renderer_text_engine: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var ttf_create_renderer_text_engine_with_properties: fn(PropertiesID) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var ttf_draw_renderer_text: fn(Ptr[TTF_Text, MutExternalOrigin], Float32, Float32) -> Bool
    var ttf_destroy_renderer_text_engine: fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType
    var ttf_create_gpu_text_engine: fn(Ptr[GPUDevice, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var ttf_create_gpu_text_engine_with_properties: fn(PropertiesID) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var ttf_get_gpu_text_draw_data: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_GPUAtlasDrawSequence, MutExternalOrigin]
    var ttf_destroy_gpu_text_engine: fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType
    var ttf_set_gpu_text_engine_winding: fn(Ptr[TTF_TextEngine, MutExternalOrigin], TTF_GPUTextEngineWinding) -> NoneType
    var ttf_get_gpu_text_engine_winding: fn(Ptr[TTF_TextEngine, ImmutExternalOrigin]) -> TTF_GPUTextEngineWinding
    var ttf_create_text: fn(Ptr[TTF_TextEngine, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Ptr[TTF_Text, MutExternalOrigin]
    var ttf_get_text_properties: fn(Ptr[TTF_Text, MutExternalOrigin]) -> PropertiesID
    var ttf_set_text_engine: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_TextEngine, MutExternalOrigin]) -> Bool
    var ttf_get_text_engine: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]
    var ttf_set_text_font: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> Bool
    var ttf_get_text_font: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_Font, MutExternalOrigin]
    var ttf_set_text_direction: fn(Ptr[TTF_Text, MutExternalOrigin], TTF_Direction) -> Bool
    var ttf_get_text_direction: fn(Ptr[TTF_Text, MutExternalOrigin]) -> TTF_Direction
    var ttf_set_text_script: fn(Ptr[TTF_Text, MutExternalOrigin], UInt32) -> Bool
    var ttf_get_text_script: fn(Ptr[TTF_Text, MutExternalOrigin]) -> UInt32
    var ttf_set_text_color: fn(Ptr[TTF_Text, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> Bool
    var ttf_set_text_color_float: fn(Ptr[TTF_Text, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool
    var ttf_get_text_color: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var ttf_get_text_color_float: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var ttf_set_text_position: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32) -> Bool
    var ttf_get_text_position: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var ttf_set_text_wrap_width: fn(Ptr[TTF_Text, MutExternalOrigin], Int32) -> Bool
    var ttf_get_text_wrap_width: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var ttf_set_text_wrap_whitespace_visible: fn(Ptr[TTF_Text, MutExternalOrigin], Bool) -> Bool
    var ttf_text_wrap_whitespace_visible: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Bool
    var ttf_set_text_string: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var ttf_insert_text_string: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var ttf_append_text_string: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var ttf_delete_text_string: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32) -> Bool
    var ttf_get_text_size: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var ttf_get_text_sub_string: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var ttf_get_text_sub_string_for_line: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var ttf_get_text_sub_strings_for_range: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[TTF_SubString, MutExternalOrigin], MutExternalOrigin]
    var ttf_get_text_sub_string_for_point: fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var ttf_get_previous_text_sub_string: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_SubString, ImmutExternalOrigin], Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var ttf_get_next_text_sub_string: fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_SubString, ImmutExternalOrigin], Ptr[TTF_SubString, MutExternalOrigin]) -> Bool
    var ttf_update_text: fn(Ptr[TTF_Text, MutExternalOrigin]) -> Bool
    var ttf_destroy_text: fn(Ptr[TTF_Text, MutExternalOrigin]) -> NoneType
    var ttf_close_font: fn(Ptr[TTF_Font, MutExternalOrigin]) -> NoneType
    var ttf_quit: fn() -> NoneType
    var ttf_was_init: fn() -> Int32

    fn __init__(out self, path: Some[PathLike]) raises:
        self.dlhandle = OwnedDLHandle(path)
        self.ttf_version = self.dlhandle.get_function[fn() -> Int32]("TTF_Version")
        self.ttf_get_free_type_version = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> NoneType]("TTF_GetFreeTypeVersion")
        self.ttf_get_harf_buzz_version = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> NoneType]("TTF_GetHarfBuzzVersion")
        self.ttf_init = self.dlhandle.get_function[fn() -> Bool]("TTF_Init")
        self.ttf_open_font = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Float32) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_OpenFont")
        self.ttf_open_font_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Float32) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_OpenFontIO")
        self.ttf_open_font_with_properties = self.dlhandle.get_function[fn(PropertiesID) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_OpenFontWithProperties")
        self.ttf_copy_font = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_CopyFont")
        self.ttf_get_font_properties = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> PropertiesID]("TTF_GetFontProperties")
        self.ttf_get_font_generation = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> UInt32]("TTF_GetFontGeneration")
        self.ttf_add_fallback_font = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> Bool]("TTF_AddFallbackFont")
        self.ttf_remove_fallback_font = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> NoneType]("TTF_RemoveFallbackFont")
        self.ttf_clear_fallback_fonts = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> NoneType]("TTF_ClearFallbackFonts")
        self.ttf_set_font_size = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Float32) -> Bool]("TTF_SetFontSize")
        self.ttf_set_font_size_dpi = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Float32, Int32, Int32) -> Bool]("TTF_SetFontSizeDPI")
        self.ttf_get_font_size = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> Float32]("TTF_GetFontSize")
        self.ttf_get_font_dpi = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetFontDPI")
        self.ttf_set_font_style = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], TTF_FontStyleFlags) -> NoneType]("TTF_SetFontStyle")
        self.ttf_get_font_style = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_FontStyleFlags]("TTF_GetFontStyle")
        self.ttf_set_font_outline = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Int32) -> Bool]("TTF_SetFontOutline")
        self.ttf_get_font_outline = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontOutline")
        self.ttf_set_font_hinting = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], TTF_HintingFlags) -> NoneType]("TTF_SetFontHinting")
        self.ttf_get_num_font_faces = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetNumFontFaces")
        self.ttf_get_font_hinting = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_HintingFlags]("TTF_GetFontHinting")
        self.ttf_set_font_sdf = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Bool) -> Bool]("TTF_SetFontSDF")
        self.ttf_get_font_sdf = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool]("TTF_GetFontSDF")
        self.ttf_get_font_weight = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontWeight")
        self.ttf_set_font_wrap_alignment = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], TTF_HorizontalAlignment) -> NoneType]("TTF_SetFontWrapAlignment")
        self.ttf_get_font_wrap_alignment = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> TTF_HorizontalAlignment]("TTF_GetFontWrapAlignment")
        self.ttf_get_font_height = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontHeight")
        self.ttf_get_font_ascent = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontAscent")
        self.ttf_get_font_descent = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontDescent")
        self.ttf_set_font_line_skip = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Int32) -> NoneType]("TTF_SetFontLineSkip")
        self.ttf_get_font_line_skip = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Int32]("TTF_GetFontLineSkip")
        self.ttf_set_font_kerning = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Bool) -> NoneType]("TTF_SetFontKerning")
        self.ttf_get_font_kerning = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool]("TTF_GetFontKerning")
        self.ttf_font_is_fixed_width = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool]("TTF_FontIsFixedWidth")
        self.ttf_font_is_scalable = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> Bool]("TTF_FontIsScalable")
        self.ttf_get_font_family_name = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("TTF_GetFontFamilyName")
        self.ttf_get_font_style_name = self.dlhandle.get_function[fn(Ptr[TTF_Font, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("TTF_GetFontStyleName")
        self.ttf_set_font_direction = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], TTF_Direction) -> Bool]("TTF_SetFontDirection")
        self.ttf_get_font_direction = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> TTF_Direction]("TTF_GetFontDirection")
        self.ttf_string_to_tag = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> UInt32]("TTF_StringToTag")
        self.ttf_tag_to_string = self.dlhandle.get_function[fn(UInt32, Ptr[c_char, MutExternalOrigin], Int32) -> NoneType]("TTF_TagToString")
        self.ttf_set_font_script = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32) -> Bool]("TTF_SetFontScript")
        self.ttf_get_font_script = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> UInt32]("TTF_GetFontScript")
        self.ttf_get_glyph_script = self.dlhandle.get_function[fn(UInt32) -> UInt32]("TTF_GetGlyphScript")
        self.ttf_set_font_language = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("TTF_SetFontLanguage")
        self.ttf_font_has_glyph = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32) -> Bool]("TTF_FontHasGlyph")
        self.ttf_get_glyph_image = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[TTF_ImageType, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("TTF_GetGlyphImage")
        self.ttf_get_glyph_image_for_index = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[TTF_ImageType, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("TTF_GetGlyphImageForIndex")
        self.ttf_get_glyph_metrics = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetGlyphMetrics")
        self.ttf_get_glyph_kerning = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, UInt32, Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetGlyphKerning")
        self.ttf_get_string_size = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetStringSize")
        self.ttf_get_string_size_wrapped = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetStringSizeWrapped")
        self.ttf_measure_string = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_MeasureString")
        self.ttf_render_text_solid = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Solid")
        self.ttf_render_text_solid_wrapped = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Int32) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Solid_Wrapped")
        self.ttf_render_glyph_solid = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderGlyph_Solid")
        self.ttf_render_text_shaded = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Shaded")
        self.ttf_render_text_shaded_wrapped = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color, Int32) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Shaded_Wrapped")
        self.ttf_render_glyph_shaded = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderGlyph_Shaded")
        self.ttf_render_text_blended = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Blended")
        self.ttf_render_text_blended_wrapped = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Int32) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_Blended_Wrapped")
        self.ttf_render_glyph_blended = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderGlyph_Blended")
        self.ttf_render_text_lcd = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_LCD")
        self.ttf_render_text_lcd_wrapped = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32, Color, Color, Int32) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderText_LCD_Wrapped")
        self.ttf_render_glyph_lcd = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin], UInt32, Color, Color) -> Ptr[Surface, MutExternalOrigin]]("TTF_RenderGlyph_LCD")
        self.ttf_create_surface_text_engine = self.dlhandle.get_function[fn() -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateSurfaceTextEngine")
        self.ttf_draw_surface_text = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[Surface, MutExternalOrigin]) -> Bool]("TTF_DrawSurfaceText")
        self.ttf_destroy_surface_text_engine = self.dlhandle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType]("TTF_DestroySurfaceTextEngine")
        self.ttf_create_renderer_text_engine = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateRendererTextEngine")
        self.ttf_create_renderer_text_engine_with_properties = self.dlhandle.get_function[fn(PropertiesID) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateRendererTextEngineWithProperties")
        self.ttf_draw_renderer_text = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Float32, Float32) -> Bool]("TTF_DrawRendererText")
        self.ttf_destroy_renderer_text_engine = self.dlhandle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType]("TTF_DestroyRendererTextEngine")
        self.ttf_create_gpu_text_engine = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateGPUTextEngine")
        self.ttf_create_gpu_text_engine_with_properties = self.dlhandle.get_function[fn(PropertiesID) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_CreateGPUTextEngineWithProperties")
        self.ttf_get_gpu_text_draw_data = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_GPUAtlasDrawSequence, MutExternalOrigin]]("TTF_GetGPUTextDrawData")
        self.ttf_destroy_gpu_text_engine = self.dlhandle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin]) -> NoneType]("TTF_DestroyGPUTextEngine")
        self.ttf_set_gpu_text_engine_winding = self.dlhandle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin], TTF_GPUTextEngineWinding) -> NoneType]("TTF_SetGPUTextEngineWinding")
        self.ttf_get_gpu_text_engine_winding = self.dlhandle.get_function[fn(Ptr[TTF_TextEngine, ImmutExternalOrigin]) -> TTF_GPUTextEngineWinding]("TTF_GetGPUTextEngineWinding")
        self.ttf_create_text = self.dlhandle.get_function[fn(Ptr[TTF_TextEngine, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Ptr[TTF_Text, MutExternalOrigin]]("TTF_CreateText")
        self.ttf_get_text_properties = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> PropertiesID]("TTF_GetTextProperties")
        self.ttf_set_text_engine = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_TextEngine, MutExternalOrigin]) -> Bool]("TTF_SetTextEngine")
        self.ttf_get_text_engine = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_TextEngine, MutExternalOrigin]]("TTF_GetTextEngine")
        self.ttf_set_text_font = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_Font, MutExternalOrigin]) -> Bool]("TTF_SetTextFont")
        self.ttf_get_text_font = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Ptr[TTF_Font, MutExternalOrigin]]("TTF_GetTextFont")
        self.ttf_set_text_direction = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], TTF_Direction) -> Bool]("TTF_SetTextDirection")
        self.ttf_get_text_direction = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> TTF_Direction]("TTF_GetTextDirection")
        self.ttf_set_text_script = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], UInt32) -> Bool]("TTF_SetTextScript")
        self.ttf_get_text_script = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> UInt32]("TTF_GetTextScript")
        self.ttf_set_text_color = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> Bool]("TTF_SetTextColor")
        self.ttf_set_text_color_float = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool]("TTF_SetTextColorFloat")
        self.ttf_get_text_color = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("TTF_GetTextColor")
        self.ttf_get_text_color_float = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("TTF_GetTextColorFloat")
        self.ttf_set_text_position = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32) -> Bool]("TTF_SetTextPosition")
        self.ttf_get_text_position = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetTextPosition")
        self.ttf_set_text_wrap_width = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32) -> Bool]("TTF_SetTextWrapWidth")
        self.ttf_get_text_wrap_width = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetTextWrapWidth")
        self.ttf_set_text_wrap_whitespace_visible = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Bool) -> Bool]("TTF_SetTextWrapWhitespaceVisible")
        self.ttf_text_wrap_whitespace_visible = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Bool]("TTF_TextWrapWhitespaceVisible")
        self.ttf_set_text_string = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("TTF_SetTextString")
        self.ttf_insert_text_string = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("TTF_InsertTextString")
        self.ttf_append_text_string = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("TTF_AppendTextString")
        self.ttf_delete_text_string = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32) -> Bool]("TTF_DeleteTextString")
        self.ttf_get_text_size = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("TTF_GetTextSize")
        self.ttf_get_text_sub_string = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetTextSubString")
        self.ttf_get_text_sub_string_for_line = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetTextSubStringForLine")
        self.ttf_get_text_sub_strings_for_range = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[TTF_SubString, MutExternalOrigin], MutExternalOrigin]]("TTF_GetTextSubStringsForRange")
        self.ttf_get_text_sub_string_for_point = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Int32, Int32, Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetTextSubStringForPoint")
        self.ttf_get_previous_text_sub_string = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_SubString, ImmutExternalOrigin], Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetPreviousTextSubString")
        self.ttf_get_next_text_sub_string = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin], Ptr[TTF_SubString, ImmutExternalOrigin], Ptr[TTF_SubString, MutExternalOrigin]) -> Bool]("TTF_GetNextTextSubString")
        self.ttf_update_text = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> Bool]("TTF_UpdateText")
        self.ttf_destroy_text = self.dlhandle.get_function[fn(Ptr[TTF_Text, MutExternalOrigin]) -> NoneType]("TTF_DestroyText")
        self.ttf_close_font = self.dlhandle.get_function[fn(Ptr[TTF_Font, MutExternalOrigin]) -> NoneType]("TTF_CloseFont")
        self.ttf_quit = self.dlhandle.get_function[fn() -> NoneType]("TTF_Quit")
        self.ttf_was_init = self.dlhandle.get_function[fn() -> Int32]("TTF_WasInit")
