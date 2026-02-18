from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *
from .sdl_ttf_function_table import get_sdl_ttf_function_table
from .sdl3_functions import get_error
from ffi import CStringSlice, c_char


comptime Ptr = UnsafePointer


fn ttf_version() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_Version
    """
    return get_sdl_ttf_function_table().ttf_version()


fn ttf_get_free_type_version(major: Ptr[Int32], minor: Ptr[Int32], patch: Ptr[Int32]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFreeTypeVersion
    """
    get_sdl_ttf_function_table().ttf_get_free_type_version(
        Ptr(to=major).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=minor).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=patch).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )


fn ttf_get_harf_buzz_version(major: Ptr[Int32], minor: Ptr[Int32], patch: Ptr[Int32]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetHarfBuzzVersion
    """
    get_sdl_ttf_function_table().ttf_get_harf_buzz_version(
        Ptr(to=major).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=minor).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=patch).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )


fn ttf_init() raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_Init
    """
    var success = get_sdl_ttf_function_table().ttf_init()
    if not success:
        raise get_error()


fn ttf_open_font(file: CStringSlice, ptsize: Float32) raises -> Ptr[TTF_Font, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_OpenFont
    """
    var result = get_sdl_ttf_function_table().ttf_open_font(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=ptsize).bitcast[Float32]()[],
    )
    if not result:
        raise get_error()
    return result


fn ttf_open_font_io(
    src: Ptr[IOStream], closeio: Bool, ptsize: Float32
) raises -> Ptr[TTF_Font, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_OpenFontIO
    """
    var result = get_sdl_ttf_function_table().ttf_open_font_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        Ptr(to=ptsize).bitcast[Float32]()[],
    )
    if not result:
        raise get_error()
    return result


fn ttf_open_font_with_properties(props: PropertiesID) raises -> Ptr[TTF_Font, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_OpenFontWithProperties
    """
    var result = get_sdl_ttf_function_table().ttf_open_font_with_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not result:
        raise get_error()
    return result


fn ttf_copy_font(existing_font: Ptr[TTF_Font]) raises -> Ptr[TTF_Font, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CopyFont
    """
    var result = get_sdl_ttf_function_table().ttf_copy_font(
        Ptr(to=existing_font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn ttf_get_font_properties(font: Ptr[TTF_Font]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontProperties
    """
    return get_sdl_ttf_function_table().ttf_get_font_properties(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
    )


fn ttf_get_font_generation(font: Ptr[TTF_Font]) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontGeneration
    """
    return get_sdl_ttf_function_table().ttf_get_font_generation(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
    )


fn ttf_add_fallback_font(font: Ptr[TTF_Font], fallback: Ptr[TTF_Font]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_AddFallbackFont
    """
    var success = get_sdl_ttf_function_table().ttf_add_fallback_font(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=fallback).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_remove_fallback_font(font: Ptr[TTF_Font], fallback: Ptr[TTF_Font]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RemoveFallbackFont
    """
    get_sdl_ttf_function_table().ttf_remove_fallback_font(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=fallback).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
    )


fn ttf_clear_fallback_fonts(font: Ptr[TTF_Font]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_ClearFallbackFonts
    """
    get_sdl_ttf_function_table().ttf_clear_fallback_fonts(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
    )


fn ttf_set_font_size(font: Ptr[TTF_Font], ptsize: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontSize
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_size(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=ptsize).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn ttf_set_font_size_dpi(font: Ptr[TTF_Font], ptsize: Float32, hdpi: Int32, vdpi: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontSizeDPI
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_size_dpi(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=ptsize).bitcast[Float32]()[],
        Ptr(to=hdpi).bitcast[Int32]()[],
        Ptr(to=vdpi).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_font_size(font: Ptr[TTF_Font]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontSize
    """
    return get_sdl_ttf_function_table().ttf_get_font_size(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
    )


fn ttf_get_font_dpi(font: Ptr[TTF_Font], hdpi: Ptr[Int32], vdpi: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontDPI
    """
    var success = get_sdl_ttf_function_table().ttf_get_font_dpi(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=hdpi).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=vdpi).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_set_font_style(font: Ptr[TTF_Font], style: TTF_FontStyleFlags):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontStyle
    """
    get_sdl_ttf_function_table().ttf_set_font_style(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=style).bitcast[TTF_FontStyleFlags]()[],
    )


fn ttf_get_font_style(font: Ptr[TTF_Font]) -> TTF_FontStyleFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontStyle
    """
    return get_sdl_ttf_function_table().ttf_get_font_style(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_set_font_outline(font: Ptr[TTF_Font], outline: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontOutline
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_outline(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=outline).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_font_outline(font: Ptr[TTF_Font]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontOutline
    """
    return get_sdl_ttf_function_table().ttf_get_font_outline(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_set_font_hinting(font: Ptr[TTF_Font], hinting: TTF_HintingFlags):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontHinting
    """
    get_sdl_ttf_function_table().ttf_set_font_hinting(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=hinting).bitcast[TTF_HintingFlags]()[],
    )


fn ttf_get_num_font_faces(font: Ptr[TTF_Font]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetNumFontFaces
    """
    return get_sdl_ttf_function_table().ttf_get_num_font_faces(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_get_font_hinting(font: Ptr[TTF_Font]) -> TTF_HintingFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontHinting
    """
    return get_sdl_ttf_function_table().ttf_get_font_hinting(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_set_font_sdf(font: Ptr[TTF_Font], enabled: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontSDF
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_sdf(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=enabled).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_font_sdf(font: Ptr[TTF_Font]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontSDF
    """
    return get_sdl_ttf_function_table().ttf_get_font_sdf(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_get_font_weight(font: Ptr[TTF_Font]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontWeight
    """
    return get_sdl_ttf_function_table().ttf_get_font_weight(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_set_font_wrap_alignment(font: Ptr[TTF_Font], align: TTF_HorizontalAlignment):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontWrapAlignment
    """
    get_sdl_ttf_function_table().ttf_set_font_wrap_alignment(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=align).bitcast[TTF_HorizontalAlignment]()[],
    )


fn ttf_get_font_wrap_alignment(font: Ptr[TTF_Font]) -> TTF_HorizontalAlignment:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontWrapAlignment
    """
    return get_sdl_ttf_function_table().ttf_get_font_wrap_alignment(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_get_font_height(font: Ptr[TTF_Font]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontHeight
    """
    return get_sdl_ttf_function_table().ttf_get_font_height(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_get_font_ascent(font: Ptr[TTF_Font]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontAscent
    """
    return get_sdl_ttf_function_table().ttf_get_font_ascent(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_get_font_descent(font: Ptr[TTF_Font]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontDescent
    """
    return get_sdl_ttf_function_table().ttf_get_font_descent(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_set_font_line_skip(font: Ptr[TTF_Font], lineskip: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontLineSkip
    """
    get_sdl_ttf_function_table().ttf_set_font_line_skip(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=lineskip).bitcast[Int32]()[],
    )


fn ttf_get_font_line_skip(font: Ptr[TTF_Font]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontLineSkip
    """
    return get_sdl_ttf_function_table().ttf_get_font_line_skip(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_set_font_kerning(font: Ptr[TTF_Font], enabled: Bool):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontKerning
    """
    get_sdl_ttf_function_table().ttf_set_font_kerning(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=enabled).bitcast[Bool]()[],
    )


fn ttf_get_font_kerning(font: Ptr[TTF_Font]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontKerning
    """
    return get_sdl_ttf_function_table().ttf_get_font_kerning(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_font_is_fixed_width(font: Ptr[TTF_Font]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_FontIsFixedWidth
    """
    return get_sdl_ttf_function_table().ttf_font_is_fixed_width(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_font_is_scalable(font: Ptr[TTF_Font]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_FontIsScalable
    """
    return get_sdl_ttf_function_table().ttf_font_is_scalable(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )


fn ttf_get_font_family_name(font: Ptr[TTF_Font]) -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontFamilyName
    """
    var cstring = get_sdl_ttf_function_table().ttf_get_font_family_name(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )
    return cstring


fn ttf_get_font_style_name(font: Ptr[TTF_Font]) -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontStyleName
    """
    var cstring = get_sdl_ttf_function_table().ttf_get_font_style_name(
        Ptr(to=font).bitcast[Ptr[TTF_Font, ImmutExternalOrigin]]()[]
    )
    return cstring


fn ttf_set_font_direction(font: Ptr[TTF_Font], direction: TTF_Direction) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontDirection
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_direction(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=direction).bitcast[TTF_Direction]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_font_direction(font: Ptr[TTF_Font]) -> TTF_Direction:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontDirection
    """
    return get_sdl_ttf_function_table().ttf_get_font_direction(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
    )


fn ttf_string_to_tag(string: CStringSlice) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_StringToTag
    """
    return get_sdl_ttf_function_table().ttf_string_to_tag(
        string.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn ttf_tag_to_string(tag: UInt32, string: Ptr[c_char], size: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_TagToString
    """
    get_sdl_ttf_function_table().ttf_tag_to_string(
        Ptr(to=tag).bitcast[UInt32]()[],
        Ptr(to=string).bitcast[Ptr[c_char, MutExternalOrigin]]()[],
        Ptr(to=size).bitcast[Int32]()[],
    )


fn ttf_set_font_script(font: Ptr[TTF_Font], script: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontScript
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_script(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=script).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_font_script(font: Ptr[TTF_Font]) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetFontScript
    """
    return get_sdl_ttf_function_table().ttf_get_font_script(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
    )


fn ttf_get_glyph_script(ch: UInt32) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphScript
    """
    return get_sdl_ttf_function_table().ttf_get_glyph_script(Ptr(to=ch).bitcast[UInt32]()[])


fn ttf_set_font_language(font: Ptr[TTF_Font], language_bcp47: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetFontLanguage
    """
    var success = get_sdl_ttf_function_table().ttf_set_font_language(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        language_bcp47.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn ttf_font_has_glyph(font: Ptr[TTF_Font], ch: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_FontHasGlyph
    """
    return get_sdl_ttf_function_table().ttf_font_has_glyph(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[], Ptr(to=ch).bitcast[UInt32]()[]
    )


fn ttf_get_glyph_image(
    font: Ptr[TTF_Font], ch: UInt32, image_type: Ptr[TTF_ImageType]
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphImage
    """
    var result = get_sdl_ttf_function_table().ttf_get_glyph_image(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=ch).bitcast[UInt32]()[],
        Ptr(to=image_type).bitcast[Ptr[TTF_ImageType, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn ttf_get_glyph_image_for_index(
    font: Ptr[TTF_Font], glyph_index: UInt32, image_type: Ptr[TTF_ImageType]
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphImageForIndex
    """
    var result = get_sdl_ttf_function_table().ttf_get_glyph_image_for_index(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=glyph_index).bitcast[UInt32]()[],
        Ptr(to=image_type).bitcast[Ptr[TTF_ImageType, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn ttf_get_glyph_metrics(
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
    var success = get_sdl_ttf_function_table().ttf_get_glyph_metrics(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=ch).bitcast[UInt32]()[],
        Ptr(to=minx).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=maxx).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=miny).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=maxy).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=advance).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_glyph_kerning(
    font: Ptr[TTF_Font], previous_ch: UInt32, ch: UInt32, kerning: Ptr[Int32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGlyphKerning
    """
    var success = get_sdl_ttf_function_table().ttf_get_glyph_kerning(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=previous_ch).bitcast[UInt32]()[],
        Ptr(to=ch).bitcast[UInt32]()[],
        Ptr(to=kerning).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_string_size(
    font: Ptr[TTF_Font], text: CStringSlice, length: Int32, w: Ptr[Int32], h: Ptr[Int32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetStringSize
    """
    var success = get_sdl_ttf_function_table().ttf_get_string_size(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_string_size_wrapped(
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
    var success = get_sdl_ttf_function_table().ttf_get_string_size_wrapped(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=wrap_width).bitcast[Int32]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_measure_string(
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
    var success = get_sdl_ttf_function_table().ttf_measure_string(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=max_width).bitcast[Int32]()[],
        Ptr(to=measured_width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=measured_length).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_render_text_solid(
    font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Solid
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_solid(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=fg).bitcast[Color]()[],
    )
    if not result:
        raise "Error in ttf_render_text_solid call. See official documentation for details."
    return result


fn ttf_render_text_solid_wrapped(
    font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, wrapLength: Int32
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Solid_Wrapped
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_solid_wrapped(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=fg).bitcast[Color]()[],
        Ptr(to=wrapLength).bitcast[Int32]()[],
    )
    if not result:
        raise "Error in ttf_render_text_solid_wrapped call. See official documentation for details."
    return result


fn ttf_render_glyph_solid(
    font: Ptr[TTF_Font], ch: UInt32, fg: Color
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_Solid
    """
    var result = get_sdl_ttf_function_table().ttf_render_glyph_solid(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=ch).bitcast[UInt32]()[],
        Ptr(to=fg).bitcast[Color]()[],
    )
    if not result:
        raise "Error in ttf_render_glyph_solid call. See official documentation for details."
    return result


fn ttf_render_text_shaded(
    font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, bg: Color
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Shaded
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_shaded(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=fg).bitcast[Color]()[],
        Ptr(to=bg).bitcast[Color]()[],
    )
    if not result:
        raise "Error in ttf_render_text_shaded call. See official documentation for details."
    return result


fn ttf_render_text_shaded_wrapped(
    font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, bg: Color, wrap_width: Int32
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Shaded_Wrapped
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_shaded_wrapped(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=fg).bitcast[Color]()[],
        Ptr(to=bg).bitcast[Color]()[],
        Ptr(to=wrap_width).bitcast[Int32]()[],
    )
    if not result:
        raise "Error in ttf_render_text_shaded_wrapped call. See official documentation for details."
    return result


fn ttf_render_glyph_shaded(
    font: Ptr[TTF_Font], ch: UInt32, fg: Color, bg: Color
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_Shaded
    """
    var result = get_sdl_ttf_function_table().ttf_render_glyph_shaded(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=ch).bitcast[UInt32]()[],
        Ptr(to=fg).bitcast[Color]()[],
        Ptr(to=bg).bitcast[Color]()[],
    )
    if not result:
        raise "Error in ttf_render_glyph_shaded call. See official documentation for details."
    return result


fn ttf_render_text_blended(
    font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Blended
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_blended(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=fg).bitcast[Color]()[],
    )
    if not result:
        raise "Error in ttf_render_text_blended call. See official documentation for details."
    return result


fn ttf_render_text_blended_wrapped(
    font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, wrap_width: Int32
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_Blended_Wrapped
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_blended_wrapped(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=fg).bitcast[Color]()[],
        Ptr(to=wrap_width).bitcast[Int32]()[],
    )
    if not result:
        raise "Error in ttf_render_text_blended_wrapped call. See official documentation for details."
    return result


fn ttf_render_glyph_blended(
    font: Ptr[TTF_Font], ch: UInt32, fg: Color
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_Blended
    """
    var result = get_sdl_ttf_function_table().ttf_render_glyph_blended(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=ch).bitcast[UInt32]()[],
        Ptr(to=fg).bitcast[Color]()[],
    )
    if not result:
        raise "Error in ttf_render_glyph_blended call. See official documentation for details."
    return result


fn ttf_render_text_lcd(
    font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, bg: Color
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_LCD
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_lcd(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=fg).bitcast[Color]()[],
        Ptr(to=bg).bitcast[Color]()[],
    )
    if not result:
        raise "Error in ttf_render_text_lcd call. See official documentation for details."
    return result


fn ttf_render_text_lcd_wrapped(
    font: Ptr[TTF_Font], text: CStringSlice, length: Int32, fg: Color, bg: Color, wrap_width: Int32
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderText_LCD_Wrapped
    """
    var result = get_sdl_ttf_function_table().ttf_render_text_lcd_wrapped(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=fg).bitcast[Color]()[],
        Ptr(to=bg).bitcast[Color]()[],
        Ptr(to=wrap_width).bitcast[Int32]()[],
    )
    if not result:
        raise "Error in ttf_render_text_lcd_wrapped call. See official documentation for details."
    return result


fn ttf_render_glyph_lcd(
    font: Ptr[TTF_Font], ch: UInt32, fg: Color, bg: Color
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_RenderGlyph_LCD
    """
    var result = get_sdl_ttf_function_table().ttf_render_glyph_lcd(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        Ptr(to=ch).bitcast[UInt32]()[],
        Ptr(to=fg).bitcast[Color]()[],
        Ptr(to=bg).bitcast[Color]()[],
    )
    if not result:
        raise "Error in ttf_render_glyph_lcd call. See official documentation for details."
    return result


fn ttf_create_surface_text_engine() raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateSurfaceTextEngine
    """
    var result = get_sdl_ttf_function_table().ttf_create_surface_text_engine()
    if not result:
        raise get_error()
    return result


fn ttf_draw_surface_text(text: Ptr[TTF_Text], x: Int32, y: Int32, surface: Ptr[Surface]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DrawSurfaceText
    """
    var success = get_sdl_ttf_function_table().ttf_draw_surface_text(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Int32]()[],
        Ptr(to=y).bitcast[Int32]()[],
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_destroy_surface_text_engine(engine: Ptr[TTF_TextEngine]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DestroySurfaceTextEngine
    """
    get_sdl_ttf_function_table().ttf_destroy_surface_text_engine(
        Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[]
    )


fn ttf_create_renderer_text_engine(
    renderer: Ptr[Renderer]
) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateRendererTextEngine
    """
    var result = get_sdl_ttf_function_table().ttf_create_renderer_text_engine(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn ttf_create_renderer_text_engine_with_properties(
    props: PropertiesID
) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateRendererTextEngineWithProperties
    """
    var result = get_sdl_ttf_function_table().ttf_create_renderer_text_engine_with_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not result:
        raise get_error()
    return result


fn ttf_draw_renderer_text(text: Ptr[TTF_Text], x: Float32, y: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DrawRendererText
    """
    var success = get_sdl_ttf_function_table().ttf_draw_renderer_text(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Float32]()[],
        Ptr(to=y).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn ttf_destroy_renderer_text_engine(engine: Ptr[TTF_TextEngine]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DestroyRendererTextEngine
    """
    get_sdl_ttf_function_table().ttf_destroy_renderer_text_engine(
        Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[]
    )


fn ttf_create_gpu_text_engine(
    device: Ptr[GPUDevice]
) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateGPUTextEngine
    """
    var result = get_sdl_ttf_function_table().ttf_create_gpu_text_engine(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn ttf_create_gpu_text_engine_with_properties(
    props: PropertiesID
) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateGPUTextEngineWithProperties
    """
    var result = get_sdl_ttf_function_table().ttf_create_gpu_text_engine_with_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not result:
        raise get_error()
    return result


fn ttf_get_gpu_text_draw_data(
    text: Ptr[TTF_Text]
) raises -> Ptr[TTF_GPUAtlasDrawSequence, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGPUTextDrawData
    """
    var result = get_sdl_ttf_function_table().ttf_get_gpu_text_draw_data(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn ttf_destroy_gpu_text_engine(engine: Ptr[TTF_TextEngine]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DestroyGPUTextEngine
    """
    get_sdl_ttf_function_table().ttf_destroy_gpu_text_engine(
        Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[]
    )


fn ttf_set_gpu_text_engine_winding(engine: Ptr[TTF_TextEngine], winding: TTF_GPUTextEngineWinding):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetGPUTextEngineWinding
    """
    get_sdl_ttf_function_table().ttf_set_gpu_text_engine_winding(
        Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[],
        Ptr(to=winding).bitcast[TTF_GPUTextEngineWinding]()[],
    )


fn ttf_get_gpu_text_engine_winding(engine: Ptr[TTF_TextEngine]) -> TTF_GPUTextEngineWinding:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetGPUTextEngineWinding
    """
    return get_sdl_ttf_function_table().ttf_get_gpu_text_engine_winding(
        Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, ImmutExternalOrigin]]()[]
    )


fn ttf_create_text(
    engine: Ptr[TTF_TextEngine], font: Ptr[TTF_Font], text: CStringSlice, length: Int32
) raises -> Ptr[TTF_Text, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CreateText
    """
    var result = get_sdl_ttf_function_table().ttf_create_text(
        Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[],
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
    )
    if not result:
        raise get_error()
    return result


fn ttf_get_text_properties(text: Ptr[TTF_Text]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextProperties
    """
    return get_sdl_ttf_function_table().ttf_get_text_properties(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
    )


fn ttf_set_text_engine(text: Ptr[TTF_Text], engine: Ptr[TTF_TextEngine]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextEngine
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_engine(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=engine).bitcast[Ptr[TTF_TextEngine, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_engine(text: Ptr[TTF_Text]) raises -> Ptr[TTF_TextEngine, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextEngine
    """
    var result = get_sdl_ttf_function_table().ttf_get_text_engine(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn ttf_set_text_font(text: Ptr[TTF_Text], font: Ptr[TTF_Font]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextFont
    """
    return get_sdl_ttf_function_table().ttf_set_text_font(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[],
    )


fn ttf_get_text_font(text: Ptr[TTF_Text]) raises -> Ptr[TTF_Font, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextFont
    """
    var result = get_sdl_ttf_function_table().ttf_get_text_font(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn ttf_set_text_direction(text: Ptr[TTF_Text], direction: TTF_Direction) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextDirection
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_direction(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=direction).bitcast[TTF_Direction]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_direction(text: Ptr[TTF_Text]) -> TTF_Direction:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextDirection
    """
    return get_sdl_ttf_function_table().ttf_get_text_direction(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
    )


fn ttf_set_text_script(text: Ptr[TTF_Text], script: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextScript
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_script(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=script).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_script(text: Ptr[TTF_Text]) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextScript
    """
    return get_sdl_ttf_function_table().ttf_get_text_script(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
    )


fn ttf_set_text_color(text: Ptr[TTF_Text], r: UInt8, g: UInt8, b: UInt8, a: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextColor
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_color(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[UInt8]()[],
        Ptr(to=g).bitcast[UInt8]()[],
        Ptr(to=b).bitcast[UInt8]()[],
        Ptr(to=a).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn ttf_set_text_color_float(
    text: Ptr[TTF_Text], r: Float32, g: Float32, b: Float32, a: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextColorFloat
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_color_float(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Float32]()[],
        Ptr(to=g).bitcast[Float32]()[],
        Ptr(to=b).bitcast[Float32]()[],
        Ptr(to=a).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_color(
    text: Ptr[TTF_Text], r: Ptr[UInt8], g: Ptr[UInt8], b: Ptr[UInt8], a: Ptr[UInt8]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextColor
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_color(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=a).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_color_float(
    text: Ptr[TTF_Text], r: Ptr[Float32], g: Ptr[Float32], b: Ptr[Float32], a: Ptr[Float32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextColorFloat
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_color_float(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=a).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_set_text_position(text: Ptr[TTF_Text], x: Int32, y: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextPosition
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_position(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Int32]()[],
        Ptr(to=y).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_position(text: Ptr[TTF_Text], x: Ptr[Int32], y: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextPosition
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_position(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=y).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_set_text_wrap_width(text: Ptr[TTF_Text], wrap_width: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextWrapWidth
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_wrap_width(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=wrap_width).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_wrap_width(text: Ptr[TTF_Text], wrap_width: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextWrapWidth
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_wrap_width(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=wrap_width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_set_text_wrap_whitespace_visible(text: Ptr[TTF_Text], visible: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextWrapWhitespaceVisible
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_wrap_whitespace_visible(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=visible).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn ttf_text_wrap_whitespace_visible(text: Ptr[TTF_Text]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_TextWrapWhitespaceVisible
    """
    return get_sdl_ttf_function_table().ttf_text_wrap_whitespace_visible(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
    )


fn ttf_set_text_string(text: Ptr[TTF_Text], string: CStringSlice, length: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SetTextString
    """
    var success = get_sdl_ttf_function_table().ttf_set_text_string(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        string.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn ttf_insert_text_string(
    text: Ptr[TTF_Text], offset: Int32, string: CStringSlice, length: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_InsertTextString
    """
    var success = get_sdl_ttf_function_table().ttf_insert_text_string(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=offset).bitcast[Int32]()[],
        string.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn ttf_append_text_string(text: Ptr[TTF_Text], string: CStringSlice, length: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_AppendTextString
    """
    var success = get_sdl_ttf_function_table().ttf_append_text_string(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        string.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn ttf_delete_text_string(text: Ptr[TTF_Text], offset: Int32, length: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DeleteTextString
    """
    var success = get_sdl_ttf_function_table().ttf_delete_text_string(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=offset).bitcast[Int32]()[],
        Ptr(to=length).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_size(text: Ptr[TTF_Text], w: Ptr[Int32], h: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSize
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_size(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_sub_string(
    text: Ptr[TTF_Text], offset: Int32, substring: Ptr[TTF_SubString]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubString
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_sub_string(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=offset).bitcast[Int32]()[],
        Ptr(to=substring).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_sub_string_for_line(
    text: Ptr[TTF_Text], line: Int32, substring: Ptr[TTF_SubString]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubStringForLine
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_sub_string_for_line(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=line).bitcast[Int32]()[],
        Ptr(to=substring).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_text_sub_strings_for_range(
    text: Ptr[TTF_Text], offset: Int32, length: Int32, count: Ptr[Int32]
) raises -> Ptr[Ptr[TTF_SubString, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubStringsForRange
    """
    var result = get_sdl_ttf_function_table().ttf_get_text_sub_strings_for_range(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=offset).bitcast[Int32]()[],
        Ptr(to=length).bitcast[Int32]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn ttf_get_text_sub_string_for_point(
    text: Ptr[TTF_Text], x: Int32, y: Int32, substring: Ptr[TTF_SubString]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetTextSubStringForPoint
    """
    var success = get_sdl_ttf_function_table().ttf_get_text_sub_string_for_point(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Int32]()[],
        Ptr(to=y).bitcast[Int32]()[],
        Ptr(to=substring).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_previous_text_sub_string(
    text: Ptr[TTF_Text], substring: Ptr[TTF_SubString], previous: Ptr[TTF_SubString]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetPreviousTextSubString
    """
    var success = get_sdl_ttf_function_table().ttf_get_previous_text_sub_string(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=substring).bitcast[Ptr[TTF_SubString, ImmutExternalOrigin]]()[],
        Ptr(to=previous).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_get_next_text_sub_string(
    text: Ptr[TTF_Text], substring: Ptr[TTF_SubString], next: Ptr[TTF_SubString]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GetNextTextSubString
    """
    var success = get_sdl_ttf_function_table().ttf_get_next_text_sub_string(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[],
        Ptr(to=substring).bitcast[Ptr[TTF_SubString, ImmutExternalOrigin]]()[],
        Ptr(to=next).bitcast[Ptr[TTF_SubString, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn ttf_update_text(text: Ptr[TTF_Text]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_UpdateText
    """
    var success = get_sdl_ttf_function_table().ttf_update_text(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn ttf_destroy_text(text: Ptr[TTF_Text]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_DestroyText
    """
    get_sdl_ttf_function_table().ttf_destroy_text(
        Ptr(to=text).bitcast[Ptr[TTF_Text, MutExternalOrigin]]()[]
    )


fn ttf_close_font(font: Ptr[TTF_Font]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_CloseFont
    """
    get_sdl_ttf_function_table().ttf_close_font(
        Ptr(to=font).bitcast[Ptr[TTF_Font, MutExternalOrigin]]()[]
    )


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
