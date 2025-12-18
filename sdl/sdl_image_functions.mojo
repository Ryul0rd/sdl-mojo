from .typedefs import *
from .structs import *
from .enums import *
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
) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTyped_IO
    """
    return get_sdl_image_function_table().img_load_typed_io(src, closeio, type.unsafe_ptr())


fn img_load(file: CStringSlice) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_Load
    """
    return get_sdl_image_function_table().img_load(file.unsafe_ptr())


fn img_load_io(
    src: Ptr[IOStream, MutAnyOrigin], closeio: Bool
) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_Load_IO
    """
    return get_sdl_image_function_table().img_load_io(src, closeio)


fn img_load_texture(
    renderer: Ptr[Renderer, MutAnyOrigin], file: CStringSlice
) -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTexture
    """
    return get_sdl_image_function_table().img_load_texture(renderer, file.unsafe_ptr())


fn img_load_texture_io(
    renderer: Ptr[Renderer, MutAnyOrigin], src: Ptr[IOStream, MutAnyOrigin], closeio: Bool
) -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTexture_IO
    """
    return get_sdl_image_function_table().img_load_texture_io(renderer, src, closeio)


fn img_load_texture_typed_io(
    renderer: Ptr[Renderer, MutAnyOrigin],
    src: Ptr[IOStream, MutAnyOrigin],
    closeio: Bool,
    type: CStringSlice,
) -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTextureTyped_IO
    """
    return get_sdl_image_function_table().img_load_texture_typed_io(
        renderer, src, closeio, type.unsafe_ptr()
    )


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


fn img_load_avif_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAVIF_IO
    """
    return get_sdl_image_function_table().img_load_avif_io(src)


fn img_load_ico_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadICO_IO
    """
    return get_sdl_image_function_table().img_load_ico_io(src)


fn img_load_cur_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadCUR_IO
    """
    return get_sdl_image_function_table().img_load_cur_io(src)


fn img_load_bmp_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadBMP_IO
    """
    return get_sdl_image_function_table().img_load_bmp_io(src)


fn img_load_gif_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadGIF_IO
    """
    return get_sdl_image_function_table().img_load_gif_io(src)


fn img_load_jpg_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadJPG_IO
    """
    return get_sdl_image_function_table().img_load_jpg_io(src)


fn img_load_jxl_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadJXL_IO
    """
    return get_sdl_image_function_table().img_load_jxl_io(src)


fn img_load_lbm_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadLBM_IO
    """
    return get_sdl_image_function_table().img_load_lbm_io(src)


fn img_load_pcx_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadPCX_IO
    """
    return get_sdl_image_function_table().img_load_pcx_io(src)


fn img_load_png_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadPNG_IO
    """
    return get_sdl_image_function_table().img_load_png_io(src)


fn img_load_pnm_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadPNM_IO
    """
    return get_sdl_image_function_table().img_load_pnm_io(src)


fn img_load_svg_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadSVG_IO
    """
    return get_sdl_image_function_table().img_load_svg_io(src)


fn img_load_qoi_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadQOI_IO
    """
    return get_sdl_image_function_table().img_load_qoi_io(src)


fn img_load_tga_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTGA_IO
    """
    return get_sdl_image_function_table().img_load_tga_io(src)


fn img_load_tif_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTIF_IO
    """
    return get_sdl_image_function_table().img_load_tif_io(src)


fn img_load_xcf_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadXCF_IO
    """
    return get_sdl_image_function_table().img_load_xcf_io(src)


fn img_load_xpm_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadXPM_IO
    """
    return get_sdl_image_function_table().img_load_xpm_io(src)


fn img_load_xv_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadXV_IO
    """
    return get_sdl_image_function_table().img_load_xv_io(src)


fn img_load_webp_io(src: Ptr[IOStream, MutAnyOrigin]) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadWEBP_IO
    """
    return get_sdl_image_function_table().img_load_webp_io(src)


fn img_load_sized_svg_io(
    src: Ptr[IOStream, MutAnyOrigin], width: Int32, height: Int32
) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadSizedSVG_IO
    """
    return get_sdl_image_function_table().img_load_sized_svg_io(src, width, height)


fn img_read_xpm_from_array(
    xpm: Ptr[Ptr[c_char, MutOrigin.external], MutAnyOrigin]
) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_ReadXPMFromArray
    """
    return get_sdl_image_function_table().img_read_xpm_from_array(xpm)


fn img_read_xpm_from_array_to_rg_b888(
    xpm: Ptr[Ptr[c_char, MutOrigin.external], MutAnyOrigin]
) -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_ReadXPMFromArrayToRGB888
    """
    return get_sdl_image_function_table().img_read_xpm_from_array_to_rg_b888(xpm)


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


fn img_load_animation(file: CStringSlice) -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAnimation
    """
    return get_sdl_image_function_table().img_load_animation(file.unsafe_ptr())


fn img_load_animation_io(
    src: Ptr[IOStream, MutAnyOrigin], closeio: Bool
) -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAnimation_IO
    """
    return get_sdl_image_function_table().img_load_animation_io(src, closeio)


fn img_load_animation_typed_io(
    src: Ptr[IOStream, MutAnyOrigin], closeio: Bool, type: CStringSlice
) -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAnimationTyped_IO
    """
    return get_sdl_image_function_table().img_load_animation_typed_io(
        src, closeio, type.unsafe_ptr()
    )


fn img_free_animation(anim: Ptr[IMG_Animation, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_FreeAnimation
    """
    get_sdl_image_function_table().img_free_animation(anim)


fn img_load_gif_animation_io(
    src: Ptr[IOStream, MutAnyOrigin]
) -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadGIFAnimation_IO
    """
    return get_sdl_image_function_table().img_load_gif_animation_io(src)


fn img_load_webp_animation_io(
    src: Ptr[IOStream, MutAnyOrigin]
) -> Ptr[IMG_Animation, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadWEBPAnimation_IO
    """
    return get_sdl_image_function_table().img_load_webp_animation_io(src)
