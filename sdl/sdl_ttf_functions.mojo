from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *
from .sdl_ttf_function_table import get_sdl_ttf_function_table
from .sdl3_functions import get_error
from sys.ffi import CStringSlice, c_char


comptime Ptr = UnsafePointer


fn ttf_version() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_Version
    """
    return get_sdl_ttf_function_table().ttf_version()


fn ttf_get_free_type_version(
    major: Ptr[Int32, MutAnyOrigin],
    minor: Ptr[Int32, MutAnyOrigin],
    patch: Ptr[Int32, MutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFreeTypeVersion
    """
    get_sdl_ttf_function_table().ttf_get_free_type_version(major, minor, patch)


fn ttf_get_harf_buzz_version(
    major: Ptr[Int32, MutAnyOrigin],
    minor: Ptr[Int32, MutAnyOrigin],
    patch: Ptr[Int32, MutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetHarfBuzzVersion
    """
    get_sdl_ttf_function_table().ttf_get_harf_buzz_version(major, minor, patch)


fn ttf_init() raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_Init
    """
    var success = get_sdl_ttf_function_table().ttf_init()
    if not success:
        raise get_error()


fn ttf_open_font(
    file: CStringSlice[ImmutAnyOrigin], ptsize: Float32
) raises -> Ptr[TTF_Font, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_OpenFont
    """
    var result = get_sdl_ttf_function_table().ttf_open_font(file, ptsize)
    if not result:
        raise get_error()
    return result


fn ttf_open_font_io(
    src: Ptr[IOStream, MutAnyOrigin], closeio: Bool, ptsize: Float32
) raises -> Ptr[TTF_Font, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_OpenFontIO
    """
    var result = get_sdl_ttf_function_table().ttf_open_font_io(src, closeio, ptsize)
    if not result:
        raise get_error()
    return result


fn ttf_open_font_with_properties(props: PropertiesID) raises -> Ptr[TTF_Font, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_OpenFontWithProperties
    """
    var result = get_sdl_ttf_function_table().ttf_open_font_with_properties(props)
    if not result:
        raise get_error()
    return result


fn ttf_copy_font(
    existing_font: Ptr[TTF_Font, MutAnyOrigin]
) raises -> Ptr[TTF_Font, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CopyFont
    """
    var result = get_sdl_ttf_function_table().ttf_copy_font(existing_font)
    if not result:
        raise get_error()
    return result


fn ttf_get_font_properties(font: Ptr[TTF_Font, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontProperties
    """
    return get_sdl_ttf_function_table().ttf_get_font_properties(font)


fn ttf_get_font_generation(font: Ptr[TTF_Font, MutAnyOrigin]) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontGeneration
    """
    return get_sdl_ttf_function_table().ttf_get_font_generation(font)


fn ttf_add_fallback_font(
    font: Ptr[TTF_Font, MutAnyOrigin], fallback: Ptr[TTF_Font, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_AddFallbackFont
    """
    var success = get_sdl_ttf_function_table().ttf_add_fallback_font(font, fallback)
    if not success:
        raise get_error()


fn ttf_remove_fallback_font(
    font: Ptr[TTF_Font, MutAnyOrigin], fallback: Ptr[TTF_Font, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RemoveFallbackFont
    """
    get_sdl_ttf_function_table().ttf_remove_fallback_font(font, fallback)


fn ttf_clear_fallback_fonts(font: Ptr[TTF_Font, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_ClearFallbackFonts
    """
    get_sdl_ttf_function_table().ttf_clear_fallback_fonts(font)


fn ttf_set_font_size(font: Ptr[TTF_Font, MutAnyOrigin], ptsize: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontSize
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_size(font, ptsize)
    if not success:
        raise get_error()


fn ttf_set_font_size_dpi(
    font: Ptr[TTF_Font, MutAnyOrigin], ptsize: Float32, hdpi: Int32, vdpi: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontSizeDPI
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_size_dpi(font, ptsize, hdpi, vdpi)
    if not success:
        raise get_error()


fn ttf_get_font_size(font: Ptr[TTF_Font, MutAnyOrigin]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontSize
    """
    return get_sdl_ttf_function_table().ttf_get_font_size(font)


fn ttf_get_font_dpi(
    font: Ptr[TTF_Font, MutAnyOrigin],
    hdpi: Ptr[Int32, MutAnyOrigin],
    vdpi: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontDPI
    """
    var success = get_sdl_ttf_function_table().ttf_get_font_dpi(font, hdpi, vdpi)
    if not success:
        raise get_error()


fn ttf_set_font_style(font: Ptr[TTF_Font, MutAnyOrigin], style: TTF_FontStyleFlags):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontStyle
    """
    get_sdl_ttf_function_table().ttf_set_font_style(font, style)


fn ttf_get_font_style(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> TTF_FontStyleFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontStyle
    """
    return get_sdl_ttf_function_table().ttf_get_font_style(font)


fn ttf_set_font_outline(font: Ptr[TTF_Font, MutAnyOrigin], outline: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontOutline
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_outline(font, outline)
    if not success:
        raise get_error()


fn ttf_get_font_outline(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontOutline
    """
    return get_sdl_ttf_function_table().ttf_get_font_outline(font)


fn ttf_set_font_hinting(font: Ptr[TTF_Font, MutAnyOrigin], hinting: TTF_HintingFlags):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontHinting
    """
    get_sdl_ttf_function_table().ttf_set_font_hinting(font, hinting)


fn ttf_get_num_font_faces(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetNumFontFaces
    """
    return get_sdl_ttf_function_table().ttf_get_num_font_faces(font)


fn ttf_get_font_hinting(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> TTF_HintingFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontHinting
    """
    return get_sdl_ttf_function_table().ttf_get_font_hinting(font)


fn ttf_set_font_sdf(font: Ptr[TTF_Font, MutAnyOrigin], enabled: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontSDF
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_sdf(font, enabled)
    if not success:
        raise get_error()


fn ttf_get_font_sdf(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontSDF
    """
    return get_sdl_ttf_function_table().ttf_get_font_sdf(font)


fn ttf_get_font_weight(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontWeight
    """
    return get_sdl_ttf_function_table().ttf_get_font_weight(font)


fn ttf_set_font_wrap_alignment(font: Ptr[TTF_Font, MutAnyOrigin], align: TTF_HorizontalAlignment):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontWrapAlignment
    """
    get_sdl_ttf_function_table().ttf_set_font_wrap_alignment(font, align)


fn ttf_get_font_wrap_alignment(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> TTF_HorizontalAlignment:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontWrapAlignment
    """
    return get_sdl_ttf_function_table().ttf_get_font_wrap_alignment(font)


fn ttf_get_font_height(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontHeight
    """
    return get_sdl_ttf_function_table().ttf_get_font_height(font)


fn ttf_get_font_ascent(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontAscent
    """
    return get_sdl_ttf_function_table().ttf_get_font_ascent(font)


fn ttf_get_font_descent(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontDescent
    """
    return get_sdl_ttf_function_table().ttf_get_font_descent(font)


fn ttf_set_font_line_skip(font: Ptr[TTF_Font, MutAnyOrigin], lineskip: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontLineSkip
    """
    get_sdl_ttf_function_table().ttf_set_font_line_skip(font, lineskip)


fn ttf_get_font_line_skip(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontLineSkip
    """
    return get_sdl_ttf_function_table().ttf_get_font_line_skip(font)


fn ttf_set_font_kerning(font: Ptr[TTF_Font, MutAnyOrigin], enabled: Bool):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontKerning
    """
    get_sdl_ttf_function_table().ttf_set_font_kerning(font, enabled)


fn ttf_get_font_kerning(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontKerning
    """
    return get_sdl_ttf_function_table().ttf_get_font_kerning(font)


fn ttf_font_is_fixed_width(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_FontIsFixedWidth
    """
    return get_sdl_ttf_function_table().ttf_font_is_fixed_width(font)


fn ttf_font_is_scalable(font: Ptr[TTF_Font, ImmutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_FontIsScalable
    """
    return get_sdl_ttf_function_table().ttf_font_is_scalable(font)


fn ttf_get_font_family_name(
    font: Ptr[TTF_Font, ImmutAnyOrigin]
) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontFamilyName
    """
    var cstring = get_sdl_ttf_function_table().ttf_get_font_family_name(font)
    return cstring


fn ttf_get_font_style_name(
    font: Ptr[TTF_Font, ImmutAnyOrigin]
) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontStyleName
    """
    var cstring = get_sdl_ttf_function_table().ttf_get_font_style_name(font)
    return cstring


fn ttf_set_font_direction(font: Ptr[TTF_Font, MutAnyOrigin], direction: TTF_Direction) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontDirection
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_direction(font, direction)
    if not success:
        raise get_error()


fn ttf_get_font_direction(font: Ptr[TTF_Font, MutAnyOrigin]) -> TTF_Direction:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontDirection
    """
    return get_sdl_ttf_function_table().ttf_get_font_direction(font)


fn ttf_string_to_tag(string: CStringSlice[ImmutAnyOrigin]) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_StringToTag
    """
    return get_sdl_ttf_function_table().ttf_string_to_tag(string)


fn ttf_tag_to_string(tag: UInt32, string: Ptr[c_char, MutAnyOrigin], size: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_TagToString
    """
    get_sdl_ttf_function_table().ttf_tag_to_string(tag, string, size)


fn ttf_set_font_script(font: Ptr[TTF_Font, MutAnyOrigin], script: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontScript
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_script(font, script)
    if not success:
        raise get_error()


fn ttf_get_font_script(font: Ptr[TTF_Font, MutAnyOrigin]) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontScript
    """
    return get_sdl_ttf_function_table().ttf_get_font_script(font)


fn ttf_get_glyph_script(ch: UInt32) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphScript
    """
    return get_sdl_ttf_function_table().ttf_get_glyph_script(ch)


fn ttf_set_font_language(
    font: Ptr[TTF_Font, MutAnyOrigin], language_bcp47: CStringSlice[ImmutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontLanguage
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_language(font, language_bcp47)
    if not success:
        raise get_error()


fn ttf_font_has_glyph(font: Ptr[TTF_Font, MutAnyOrigin], ch: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_FontHasGlyph
    """
    return get_sdl_ttf_function_table().ttf_font_has_glyph(font, ch)


fn ttf_get_glyph_image(
    font: Ptr[TTF_Font, MutAnyOrigin], ch: UInt32, image_type: Ptr[TTF_ImageType, MutAnyOrigin]
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphImage
    """
    var result = get_sdl_ttf_function_table().ttf_get_glyph_image(font, ch, image_type)
    if not result:
        raise get_error()
    return result


fn ttf_get_glyph_image_for_index(
    font: Ptr[TTF_Font, MutAnyOrigin],
    glyph_index: UInt32,
    image_type: Ptr[TTF_ImageType, MutAnyOrigin],
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphImageForIndex
    """
    var result = get_sdl_ttf_function_table().ttf_get_glyph_image_for_index(
        font, glyph_index, image_type
    )
    if not result:
        raise get_error()
    return result


fn ttf_get_glyph_metrics(
    font: Ptr[TTF_Font, MutAnyOrigin],
    ch: UInt32,
    minx: Ptr[Int32, MutAnyOrigin],
    maxx: Ptr[Int32, MutAnyOrigin],
    miny: Ptr[Int32, MutAnyOrigin],
    maxy: Ptr[Int32, MutAnyOrigin],
    advance: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphMetrics
    """
    var success = get_sdl_ttf_function_table().ttf_get_glyph_metrics(
        font, ch, minx, maxx, miny, maxy, advance
    )
    if not success:
        raise get_error()


fn ttf_get_glyph_kerning(
    font: Ptr[TTF_Font, MutAnyOrigin],
    previous_ch: UInt32,
    ch: UInt32,
    kerning: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphKerning
    """
    var success = get_sdl_ttf_function_table().ttf_get_glyph_kerning(
        font, previous_ch, ch, kerning
    )
    if not success:
        raise get_error()


fn ttf_get_string_size(
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
    w: Ptr[Int32, MutAnyOrigin],
    h: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetStringSize
    """
    var success = get_sdl_ttf_function_table().ttf_get_string_size(font, text, length, w, h)
    if not success:
        raise get_error()


fn ttf_get_string_size_wrapped(
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
    wrap_width: Int32,
    w: Ptr[Int32, MutAnyOrigin],
    h: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetStringSizeWrapped
    """
    var success = get_sdl_ttf_function_table().ttf_get_string_size_wrapped(
        font, text, length, wrap_width, w, h
    )
    if not success:
        raise get_error()


fn ttf_measure_string(
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
    max_width: Int32,
    measured_width: Ptr[Int32, MutAnyOrigin],
    measured_length: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_MeasureString
    """
    var success = get_sdl_ttf_function_table().ttf_measure_string(
        font, text, length, max_width, measured_width, measured_length
    )
    if not success:
        raise get_error()


fn ttf_render_text_solid(
    font: Ptr[TTF_Font, MutAnyOrigin], text: CStringSlice[ImmutAnyOrigin], length: Int32, fg: Color
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Solid
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_solid(font, text, length, fg)
    if not result:
        raise "Error in ttf_render_text_solid call. See official documentation for details."
    return result


fn ttf_render_text_solid_wrapped(
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
    fg: Color,
    wrapLength: Int32,
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Solid_Wrapped
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_solid_wrapped(
        font, text, length, fg, wrapLength
    )
    if not result:
        raise "Error in ttf_render_text_solid_wrapped call. See official documentation for details."
    return result


fn ttf_render_glyph_solid(
    font: Ptr[TTF_Font, MutAnyOrigin], ch: UInt32, fg: Color
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_Solid
    """
    var result = get_sdl_ttf_function_table().ttf_render_glyph_solid(font, ch, fg)
    if not result:
        raise "Error in ttf_render_glyph_solid call. See official documentation for details."
    return result


fn ttf_render_text_shaded(
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
    fg: Color,
    bg: Color,
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Shaded
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_shaded(font, text, length, fg, bg)
    if not result:
        raise "Error in ttf_render_text_shaded call. See official documentation for details."
    return result


fn ttf_render_text_shaded_wrapped(
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
    fg: Color,
    bg: Color,
    wrap_width: Int32,
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Shaded_Wrapped
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_shaded_wrapped(
        font, text, length, fg, bg, wrap_width
    )
    if not result:
        raise "Error in ttf_render_text_shaded_wrapped call. See official documentation for details."
    return result


fn ttf_render_glyph_shaded(
    font: Ptr[TTF_Font, MutAnyOrigin], ch: UInt32, fg: Color, bg: Color
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_Shaded
    """
    var result = get_sdl_ttf_function_table().ttf_render_glyph_shaded(font, ch, fg, bg)
    if not result:
        raise "Error in ttf_render_glyph_shaded call. See official documentation for details."
    return result


fn ttf_render_text_blended(
    font: Ptr[TTF_Font, MutAnyOrigin], text: CStringSlice[ImmutAnyOrigin], length: Int32, fg: Color
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Blended
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_blended(font, text, length, fg)
    if not result:
        raise "Error in ttf_render_text_blended call. See official documentation for details."
    return result


fn ttf_render_text_blended_wrapped(
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
    fg: Color,
    wrap_width: Int32,
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Blended_Wrapped
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_blended_wrapped(
        font, text, length, fg, wrap_width
    )
    if not result:
        raise "Error in ttf_render_text_blended_wrapped call. See official documentation for details."
    return result


fn ttf_render_glyph_blended(
    font: Ptr[TTF_Font, MutAnyOrigin], ch: UInt32, fg: Color
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_Blended
    """
    var result = get_sdl_ttf_function_table().ttf_render_glyph_blended(font, ch, fg)
    if not result:
        raise "Error in ttf_render_glyph_blended call. See official documentation for details."
    return result


fn ttf_render_text_lcd(
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
    fg: Color,
    bg: Color,
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_LCD
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_lcd(font, text, length, fg, bg)
    if not result:
        raise "Error in ttf_render_text_lcd call. See official documentation for details."
    return result


fn ttf_render_text_lcd_wrapped(
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
    fg: Color,
    bg: Color,
    wrap_width: Int32,
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_LCD_Wrapped
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_lcd_wrapped(
        font, text, length, fg, bg, wrap_width
    )
    if not result:
        raise "Error in ttf_render_text_lcd_wrapped call. See official documentation for details."
    return result


fn ttf_render_glyph_lcd(
    font: Ptr[TTF_Font, MutAnyOrigin], ch: UInt32, fg: Color, bg: Color
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_LCD
    """
    var result = get_sdl_ttf_function_table().ttf_render_glyph_lcd(font, ch, fg, bg)
    if not result:
        raise "Error in ttf_render_glyph_lcd call. See official documentation for details."
    return result


fn ttf_create_surface_text_engine() raises -> Ptr[TTF_TextEngine, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateSurfaceTextEngine
    """
    var result = get_sdl_ttf_function_table().ttf_create_surface_text_engine()
    if not result:
        raise get_error()
    return result


fn ttf_draw_surface_text(
    text: Ptr[TTF_Text, MutAnyOrigin], x: Int32, y: Int32, surface: Ptr[Surface, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DrawSurfaceText
    """
    var success = get_sdl_ttf_function_table().ttf_draw_surface_text(text, x, y, surface)
    if not success:
        raise get_error()


fn ttf_destroy_surface_text_engine(engine: Ptr[TTF_TextEngine, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DestroySurfaceTextEngine
    """
    get_sdl_ttf_function_table().ttf_destroy_surface_text_engine(engine)


fn ttf_create_renderer_text_engine(
    renderer: Ptr[Renderer, MutAnyOrigin]
) raises -> Ptr[TTF_TextEngine, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateRendererTextEngine
    """
    var result = get_sdl_ttf_function_table().ttf_create_renderer_text_engine(renderer)
    if not result:
        raise get_error()
    return result


fn ttf_create_renderer_text_engine_with_properties(
    props: PropertiesID
) raises -> Ptr[TTF_TextEngine, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateRendererTextEngineWithProperties
    """
    var result = get_sdl_ttf_function_table().ttf_create_renderer_text_engine_with_properties(
        props
    )
    if not result:
        raise get_error()
    return result


fn ttf_draw_renderer_text(text: Ptr[TTF_Text, MutAnyOrigin], x: Float32, y: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DrawRendererText
    """
    var success = get_sdl_ttf_function_table().ttf_draw_renderer_text(text, x, y)
    if not success:
        raise get_error()


fn ttf_destroy_renderer_text_engine(engine: Ptr[TTF_TextEngine, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DestroyRendererTextEngine
    """
    get_sdl_ttf_function_table().ttf_destroy_renderer_text_engine(engine)


fn ttf_create_gpu_text_engine(
    device: Ptr[GPUDevice, MutAnyOrigin]
) raises -> Ptr[TTF_TextEngine, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateGPUTextEngine
    """
    var result = get_sdl_ttf_function_table().ttf_create_gpu_text_engine(device)
    if not result:
        raise get_error()
    return result


fn ttf_create_gpu_text_engine_with_properties(
    props: PropertiesID
) raises -> Ptr[TTF_TextEngine, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateGPUTextEngineWithProperties
    """
    var result = get_sdl_ttf_function_table().ttf_create_gpu_text_engine_with_properties(props)
    if not result:
        raise get_error()
    return result


fn ttf_get_gpu_text_draw_data(
    text: Ptr[TTF_Text, MutAnyOrigin]
) raises -> Ptr[TTF_GPUAtlasDrawSequence, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGPUTextDrawData
    """
    var result = get_sdl_ttf_function_table().ttf_get_gpu_text_draw_data(text)
    if not result:
        raise get_error()
    return result


fn ttf_destroy_gpu_text_engine(engine: Ptr[TTF_TextEngine, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DestroyGPUTextEngine
    """
    get_sdl_ttf_function_table().ttf_destroy_gpu_text_engine(engine)


fn ttf_set_gpu_text_engine_winding(
    engine: Ptr[TTF_TextEngine, MutAnyOrigin], winding: TTF_GPUTextEngineWinding
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetGPUTextEngineWinding
    """
    get_sdl_ttf_function_table().ttf_set_gpu_text_engine_winding(engine, winding)


fn ttf_get_gpu_text_engine_winding(
    engine: Ptr[TTF_TextEngine, ImmutAnyOrigin]
) -> TTF_GPUTextEngineWinding:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGPUTextEngineWinding
    """
    return get_sdl_ttf_function_table().ttf_get_gpu_text_engine_winding(engine)


fn ttf_create_text(
    engine: Ptr[TTF_TextEngine, MutAnyOrigin],
    font: Ptr[TTF_Font, MutAnyOrigin],
    text: CStringSlice[ImmutAnyOrigin],
    length: Int32,
) raises -> Ptr[TTF_Text, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateText
    """
    var result = get_sdl_ttf_function_table().ttf_create_text(engine, font, text, length)
    if not result:
        raise get_error()
    return result


fn ttf_get_text_properties(text: Ptr[TTF_Text, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextProperties
    """
    return get_sdl_ttf_function_table().ttf_get_text_properties(text)


fn ttf_set_text_engine(
    text: Ptr[TTF_Text, MutAnyOrigin], engine: Ptr[TTF_TextEngine, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextEngine
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_engine(text, engine)
    if not success:
        raise get_error()


fn ttf_get_text_engine(
    text: Ptr[TTF_Text, MutAnyOrigin]
) raises -> Ptr[TTF_TextEngine, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextEngine
    """
    var result = get_sdl_ttf_function_table().ttf_get_text_engine(text)
    if not result:
        raise get_error()
    return result


fn ttf_set_text_font(text: Ptr[TTF_Text, MutAnyOrigin], font: Ptr[TTF_Font, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextFont
    """
    return get_sdl_ttf_function_table().ttf_set_text_font(text, font)


fn ttf_get_text_font(
    text: Ptr[TTF_Text, MutAnyOrigin]
) raises -> Ptr[TTF_Font, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextFont
    """
    var result = get_sdl_ttf_function_table().ttf_get_text_font(text)
    if not result:
        raise get_error()
    return result


fn ttf_set_text_direction(text: Ptr[TTF_Text, MutAnyOrigin], direction: TTF_Direction) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextDirection
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_direction(text, direction)
    if not success:
        raise get_error()


fn ttf_get_text_direction(text: Ptr[TTF_Text, MutAnyOrigin]) -> TTF_Direction:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextDirection
    """
    return get_sdl_ttf_function_table().ttf_get_text_direction(text)


fn ttf_set_text_script(text: Ptr[TTF_Text, MutAnyOrigin], script: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextScript
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_script(text, script)
    if not success:
        raise get_error()


fn ttf_get_text_script(text: Ptr[TTF_Text, MutAnyOrigin]) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextScript
    """
    return get_sdl_ttf_function_table().ttf_get_text_script(text)


fn ttf_set_text_color(
    text: Ptr[TTF_Text, MutAnyOrigin], r: UInt8, g: UInt8, b: UInt8, a: UInt8
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextColor
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_color(text, r, g, b, a)
    if not success:
        raise get_error()


fn ttf_set_text_color_float(
    text: Ptr[TTF_Text, MutAnyOrigin], r: Float32, g: Float32, b: Float32, a: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextColorFloat
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_color_float(text, r, g, b, a)
    if not success:
        raise get_error()


fn ttf_get_text_color(
    text: Ptr[TTF_Text, MutAnyOrigin],
    r: Ptr[UInt8, MutAnyOrigin],
    g: Ptr[UInt8, MutAnyOrigin],
    b: Ptr[UInt8, MutAnyOrigin],
    a: Ptr[UInt8, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextColor
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_color(text, r, g, b, a)
    if not success:
        raise get_error()


fn ttf_get_text_color_float(
    text: Ptr[TTF_Text, MutAnyOrigin],
    r: Ptr[Float32, MutAnyOrigin],
    g: Ptr[Float32, MutAnyOrigin],
    b: Ptr[Float32, MutAnyOrigin],
    a: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextColorFloat
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_color_float(text, r, g, b, a)
    if not success:
        raise get_error()


fn ttf_set_text_position(text: Ptr[TTF_Text, MutAnyOrigin], x: Int32, y: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextPosition
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_position(text, x, y)
    if not success:
        raise get_error()


fn ttf_get_text_position(
    text: Ptr[TTF_Text, MutAnyOrigin], x: Ptr[Int32, MutAnyOrigin], y: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextPosition
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_position(text, x, y)
    if not success:
        raise get_error()


fn ttf_set_text_wrap_width(text: Ptr[TTF_Text, MutAnyOrigin], wrap_width: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextWrapWidth
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_wrap_width(text, wrap_width)
    if not success:
        raise get_error()


fn ttf_get_text_wrap_width(
    text: Ptr[TTF_Text, MutAnyOrigin], wrap_width: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextWrapWidth
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_wrap_width(text, wrap_width)
    if not success:
        raise get_error()


fn ttf_set_text_wrap_whitespace_visible(text: Ptr[TTF_Text, MutAnyOrigin], visible: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextWrapWhitespaceVisible
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_wrap_whitespace_visible(text, visible)
    if not success:
        raise get_error()


fn ttf_text_wrap_whitespace_visible(text: Ptr[TTF_Text, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_TextWrapWhitespaceVisible
    """
    return get_sdl_ttf_function_table().ttf_text_wrap_whitespace_visible(text)


fn ttf_set_text_string(
    text: Ptr[TTF_Text, MutAnyOrigin], string: CStringSlice[ImmutAnyOrigin], length: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextString
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_string(text, string, length)
    if not success:
        raise get_error()


fn ttf_insert_text_string(
    text: Ptr[TTF_Text, MutAnyOrigin],
    offset: Int32,
    string: CStringSlice[ImmutAnyOrigin],
    length: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_InsertTextString
    """
    var success = get_sdl_ttf_function_table().ttf_insert_text_string(text, offset, string, length)
    if not success:
        raise get_error()


fn ttf_append_text_string(
    text: Ptr[TTF_Text, MutAnyOrigin], string: CStringSlice[ImmutAnyOrigin], length: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_AppendTextString
    """
    var success = get_sdl_ttf_function_table().ttf_append_text_string(text, string, length)
    if not success:
        raise get_error()


fn ttf_delete_text_string(text: Ptr[TTF_Text, MutAnyOrigin], offset: Int32, length: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DeleteTextString
    """
    var success = get_sdl_ttf_function_table().ttf_delete_text_string(text, offset, length)
    if not success:
        raise get_error()


fn ttf_get_text_size(
    text: Ptr[TTF_Text, MutAnyOrigin], w: Ptr[Int32, MutAnyOrigin], h: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSize
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_size(text, w, h)
    if not success:
        raise get_error()


fn ttf_get_text_sub_string(
    text: Ptr[TTF_Text, MutAnyOrigin], offset: Int32, substring: Ptr[TTF_SubString, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubString
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_sub_string(text, offset, substring)
    if not success:
        raise get_error()


fn ttf_get_text_sub_string_for_line(
    text: Ptr[TTF_Text, MutAnyOrigin], line: Int32, substring: Ptr[TTF_SubString, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubStringForLine
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_sub_string_for_line(
        text, line, substring
    )
    if not success:
        raise get_error()


fn ttf_get_text_sub_strings_for_range(
    text: Ptr[TTF_Text, MutAnyOrigin], offset: Int32, length: Int32, count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[TTF_SubString, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubStringsForRange
    """
    var result = get_sdl_ttf_function_table().ttf_get_text_sub_strings_for_range(
        text, offset, length, count
    )
    if not result:
        raise get_error()
    return result


fn ttf_get_text_sub_string_for_point(
    text: Ptr[TTF_Text, MutAnyOrigin],
    x: Int32,
    y: Int32,
    substring: Ptr[TTF_SubString, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubStringForPoint
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_sub_string_for_point(
        text, x, y, substring
    )
    if not success:
        raise get_error()


fn ttf_get_previous_text_sub_string(
    text: Ptr[TTF_Text, MutAnyOrigin],
    substring: Ptr[TTF_SubString, ImmutAnyOrigin],
    previous: Ptr[TTF_SubString, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetPreviousTextSubString
    """
    var success = get_sdl_ttf_function_table().ttf_get_previous_text_sub_string(
        text, substring, previous
    )
    if not success:
        raise get_error()


fn ttf_get_next_text_sub_string(
    text: Ptr[TTF_Text, MutAnyOrigin],
    substring: Ptr[TTF_SubString, ImmutAnyOrigin],
    next: Ptr[TTF_SubString, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetNextTextSubString
    """
    var success = get_sdl_ttf_function_table().ttf_get_next_text_sub_string(text, substring, next)
    if not success:
        raise get_error()


fn ttf_update_text(text: Ptr[TTF_Text, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_UpdateText
    """
    var success = get_sdl_ttf_function_table().ttf_update_text(text)
    if not success:
        raise get_error()


fn ttf_destroy_text(text: Ptr[TTF_Text, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DestroyText
    """
    get_sdl_ttf_function_table().ttf_destroy_text(text)


fn ttf_close_font(font: Ptr[TTF_Font, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CloseFont
    """
    get_sdl_ttf_function_table().ttf_close_font(font)


fn ttf_quit():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_Quit
    """
    get_sdl_ttf_function_table().ttf_quit()


fn ttf_was_init() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_WasInit
    """
    return get_sdl_ttf_function_table().ttf_was_init()
