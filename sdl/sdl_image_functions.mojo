from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *
from .sdl_image_function_table import get_sdl_image_function_table
from .sdl3_functions import get_error
from sys.ffi import CStringSlice, c_char


comptime Ptr = UnsafePointer


fn img_version() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_Version
    """
    return get_sdl_image_function_table().img_version()


fn img_load_typed_io(
    src: Ptr[IOStream, MutAnyOrigin], closeio: Bool, type: CStringSlice
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTyped_IO
    """
    var result = get_sdl_image_function_table().img_load_typed_io(src, closeio, type.unsafe_ptr())
    if not result:
        raise "Error in img_load_typed_io call. See official documentation for details."
    return result


fn img_load(file: CStringSlice) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_Load
    """
    var result = get_sdl_image_function_table().img_load(file.unsafe_ptr())
    if not result:
        raise "Error in img_load call. See official documentation for details."
    return result


fn img_load_io(
    src: Ptr[IOStream, MutAnyOrigin], closeio: Bool
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_Load_IO
    """
    var result = get_sdl_image_function_table().img_load_io(src, closeio)
    if not result:
        raise "Error in img_load_io call. See official documentation for details."
    return result


fn img_load_texture(
    renderer: Ptr[Renderer, MutAnyOrigin], file: CStringSlice
) raises -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTexture
    """
    var result = get_sdl_image_function_table().img_load_texture(renderer, file.unsafe_ptr())
    if not result:
        raise "Error in img_load_texture call. See official documentation for details."
    return result


fn img_load_texture_io(
    renderer: Ptr[Renderer, MutAnyOrigin], src: Ptr[IOStream, MutAnyOrigin], closeio: Bool
) raises -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTexture_IO
    """
    var result = get_sdl_image_function_table().img_load_texture_io(renderer, src, closeio)
    if not result:
        raise "Error in img_load_texture_io call. See official documentation for details."
    return result


fn img_load_texture_typed_io(
    renderer: Ptr[Renderer, MutAnyOrigin],
    src: Ptr[IOStream, MutAnyOrigin],
    closeio: Bool,
    type: CStringSlice,
) raises -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTextureTyped_IO
    """
    var result = get_sdl_image_function_table().img_load_texture_typed_io(
        renderer, src, closeio, type.unsafe_ptr()
    )
    if not result:
        raise "Error in img_load_texture_typed_io call. See official documentation for details."
    return result


fn img_is_avif(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isAVIF
    """
    return get_sdl_image_function_table().img_is_avif(src)


fn img_is_ico(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isICO
    """
    return get_sdl_image_function_table().img_is_ico(src)


fn img_is_cur(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isCUR
    """
    return get_sdl_image_function_table().img_is_cur(src)


fn img_is_bmp(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isBMP
    """
    return get_sdl_image_function_table().img_is_bmp(src)


fn img_is_gif(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isGIF
    """
    return get_sdl_image_function_table().img_is_gif(src)


fn img_is_jpg(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isJPG
    """
    return get_sdl_image_function_table().img_is_jpg(src)


fn img_is_jxl(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isJXL
    """
    return get_sdl_image_function_table().img_is_jxl(src)


fn img_is_lbm(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isLBM
    """
    return get_sdl_image_function_table().img_is_lbm(src)


fn img_is_pcx(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isPCX
    """
    return get_sdl_image_function_table().img_is_pcx(src)


fn img_is_png(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isPNG
    """
    return get_sdl_image_function_table().img_is_png(src)


fn img_is_pnm(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isPNM
    """
    return get_sdl_image_function_table().img_is_pnm(src)


fn img_is_svg(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isSVG
    """
    return get_sdl_image_function_table().img_is_svg(src)


fn img_is_qoi(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isQOI
    """
    return get_sdl_image_function_table().img_is_qoi(src)


fn img_is_tif(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isTIF
    """
    return get_sdl_image_function_table().img_is_tif(src)


fn img_is_xcf(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isXCF
    """
    return get_sdl_image_function_table().img_is_xcf(src)


fn img_is_xpm(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isXPM
    """
    return get_sdl_image_function_table().img_is_xpm(src)


fn img_is_xv(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isXV
    """
    return get_sdl_image_function_table().img_is_xv(src)


fn img_is_webp(src: Ptr[IOStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isWEBP
    """
    return get_sdl_image_function_table().img_is_webp(src)


fn img_load_avif_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAVIF_IO
    """
    var result = get_sdl_image_function_table().img_load_avif_io(src)
    if not result:
        raise "Error in img_load_avif_io call. See official documentation for details."
    return result


fn img_load_ico_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadICO_IO
    """
    var result = get_sdl_image_function_table().img_load_ico_io(src)
    if not result:
        raise "Error in img_load_ico_io call. See official documentation for details."
    return result


fn img_load_cur_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadCUR_IO
    """
    var result = get_sdl_image_function_table().img_load_cur_io(src)
    if not result:
        raise "Error in img_load_cur_io call. See official documentation for details."
    return result


fn img_load_bmp_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadBMP_IO
    """
    var result = get_sdl_image_function_table().img_load_bmp_io(src)
    if not result:
        raise "Error in img_load_bmp_io call. See official documentation for details."
    return result


fn img_load_gif_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadGIF_IO
    """
    var result = get_sdl_image_function_table().img_load_gif_io(src)
    if not result:
        raise "Error in img_load_gif_io call. See official documentation for details."
    return result


fn img_load_jpg_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadJPG_IO
    """
    var result = get_sdl_image_function_table().img_load_jpg_io(src)
    if not result:
        raise "Error in img_load_jpg_io call. See official documentation for details."
    return result


fn img_load_jxl_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadJXL_IO
    """
    var result = get_sdl_image_function_table().img_load_jxl_io(src)
    if not result:
        raise "Error in img_load_jxl_io call. See official documentation for details."
    return result


fn img_load_lbm_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadLBM_IO
    """
    var result = get_sdl_image_function_table().img_load_lbm_io(src)
    if not result:
        raise "Error in img_load_lbm_io call. See official documentation for details."
    return result


fn img_load_pcx_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadPCX_IO
    """
    var result = get_sdl_image_function_table().img_load_pcx_io(src)
    if not result:
        raise "Error in img_load_pcx_io call. See official documentation for details."
    return result


fn img_load_png_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadPNG_IO
    """
    var result = get_sdl_image_function_table().img_load_png_io(src)
    if not result:
        raise "Error in img_load_png_io call. See official documentation for details."
    return result


fn img_load_pnm_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadPNM_IO
    """
    var result = get_sdl_image_function_table().img_load_pnm_io(src)
    if not result:
        raise "Error in img_load_pnm_io call. See official documentation for details."
    return result


fn img_load_svg_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadSVG_IO
    """
    var result = get_sdl_image_function_table().img_load_svg_io(src)
    if not result:
        raise "Error in img_load_svg_io call. See official documentation for details."
    return result


fn img_load_qoi_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadQOI_IO
    """
    var result = get_sdl_image_function_table().img_load_qoi_io(src)
    if not result:
        raise "Error in img_load_qoi_io call. See official documentation for details."
    return result


fn img_load_tga_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTGA_IO
    """
    var result = get_sdl_image_function_table().img_load_tga_io(src)
    if not result:
        raise "Error in img_load_tga_io call. See official documentation for details."
    return result


fn img_load_tif_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTIF_IO
    """
    var result = get_sdl_image_function_table().img_load_tif_io(src)
    if not result:
        raise "Error in img_load_tif_io call. See official documentation for details."
    return result


fn img_load_xcf_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadXCF_IO
    """
    var result = get_sdl_image_function_table().img_load_xcf_io(src)
    if not result:
        raise "Error in img_load_xcf_io call. See official documentation for details."
    return result


fn img_load_xpm_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadXPM_IO
    """
    var result = get_sdl_image_function_table().img_load_xpm_io(src)
    if not result:
        raise "Error in img_load_xpm_io call. See official documentation for details."
    return result


fn img_load_xv_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadXV_IO
    """
    var result = get_sdl_image_function_table().img_load_xv_io(src)
    if not result:
        raise "Error in img_load_xv_io call. See official documentation for details."
    return result


fn img_load_webp_io(src: Ptr[IOStream, MutAnyOrigin]) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadWEBP_IO
    """
    var result = get_sdl_image_function_table().img_load_webp_io(src)
    if not result:
        raise "Error in img_load_webp_io call. See official documentation for details."
    return result


fn img_load_sized_svg_io(
    src: Ptr[IOStream, MutAnyOrigin], width: Int32, height: Int32
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadSizedSVG_IO
    """
    var result = get_sdl_image_function_table().img_load_sized_svg_io(src, width, height)
    if not result:
        raise "Error in img_load_sized_svg_io call. See official documentation for details."
    return result


fn img_read_xpm_from_array(
    xpm: Ptr[Ptr[c_char, MutOrigin.external], MutAnyOrigin]
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_ReadXPMFromArray
    """
    var result = get_sdl_image_function_table().img_read_xpm_from_array(xpm)
    if not result:
        raise "Error in img_read_xpm_from_array call. See official documentation for details."
    return result


fn img_read_xpm_from_array_to_rg_b888(
    xpm: Ptr[Ptr[c_char, MutOrigin.external], MutAnyOrigin]
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_ReadXPMFromArrayToRGB888
    """
    var result = get_sdl_image_function_table().img_read_xpm_from_array_to_rg_b888(xpm)
    if not result:
        raise "Error in img_read_xpm_from_array_to_rg_b888 call. See official documentation for details."
    return result


fn img_save_avif(surface: Ptr[Surface, MutAnyOrigin], file: CStringSlice, quality: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveAVIF
    """
    var success = get_sdl_image_function_table().img_save_avif(surface, file.unsafe_ptr(), quality)
    if not success:
        raise get_error()


fn img_save_avif_io(
    surface: Ptr[Surface, MutAnyOrigin],
    dst: Ptr[IOStream, MutAnyOrigin],
    closeio: Bool,
    quality: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveAVIF_IO
    """
    var success = get_sdl_image_function_table().img_save_avif_io(surface, dst, closeio, quality)
    if not success:
        raise get_error()


fn img_save_png(surface: Ptr[Surface, MutAnyOrigin], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SavePNG
    """
    var success = get_sdl_image_function_table().img_save_png(surface, file.unsafe_ptr())
    if not success:
        raise get_error()


fn img_save_png_io(
    surface: Ptr[Surface, MutAnyOrigin], dst: Ptr[IOStream, MutAnyOrigin], closeio: Bool
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SavePNG_IO
    """
    var success = get_sdl_image_function_table().img_save_png_io(surface, dst, closeio)
    if not success:
        raise get_error()


fn img_save_jpg(surface: Ptr[Surface, MutAnyOrigin], file: CStringSlice, quality: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveJPG
    """
    var success = get_sdl_image_function_table().img_save_jpg(surface, file.unsafe_ptr(), quality)
    if not success:
        raise get_error()


fn img_save_jpg_io(
    surface: Ptr[Surface, MutAnyOrigin],
    dst: Ptr[IOStream, MutAnyOrigin],
    closeio: Bool,
    quality: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveJPG_IO
    """
    var success = get_sdl_image_function_table().img_save_jpg_io(surface, dst, closeio, quality)
    if not success:
        raise get_error()


fn img_load_animation(file: CStringSlice) raises -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAnimation
    """
    var result = get_sdl_image_function_table().img_load_animation(file.unsafe_ptr())
    if not result:
        raise "Error in img_load_animation call. See official documentation for details."
    return result


fn img_load_animation_io(
    src: Ptr[IOStream, MutAnyOrigin], closeio: Bool
) raises -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAnimation_IO
    """
    var result = get_sdl_image_function_table().img_load_animation_io(src, closeio)
    if not result:
        raise "Error in img_load_animation_io call. See official documentation for details."
    return result


fn img_load_animation_typed_io(
    src: Ptr[IOStream, MutAnyOrigin], closeio: Bool, type: CStringSlice
) raises -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAnimationTyped_IO
    """
    var result = get_sdl_image_function_table().img_load_animation_typed_io(
        src, closeio, type.unsafe_ptr()
    )
    if not result:
        raise "Error in img_load_animation_typed_io call. See official documentation for details."
    return result


fn img_free_animation(anim: Ptr[IMG_Animation, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_FreeAnimation
    """
    get_sdl_image_function_table().img_free_animation(anim)


fn img_load_gif_animation_io(
    src: Ptr[IOStream, MutAnyOrigin]
) raises -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadGIFAnimation_IO
    """
    var result = get_sdl_image_function_table().img_load_gif_animation_io(src)
    if not result:
        raise "Error in img_load_gif_animation_io call. See official documentation for details."
    return result


fn img_load_webp_animation_io(
    src: Ptr[IOStream, MutAnyOrigin]
) raises -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadWEBPAnimation_IO
    """
    var result = get_sdl_image_function_table().img_load_webp_animation_io(src)
    if not result:
        raise "Error in img_load_webp_animation_io call. See official documentation for details."
    return result
