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


fn img_load(file: CStringSlice) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_Load
    """
    var result = get_sdl_image_function_table().img_load(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not result:
        raise "Error in img_load call. See official documentation for details."
    return result


fn img_load_io(src: Ptr[IOStream], closeio: Bool) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_Load_IO
    """
    var result = get_sdl_image_function_table().img_load_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=closeio).bitcast[Bool]()[]
    )
    if not result:
        raise "Error in img_load_io call. See official documentation for details."
    return result


fn img_load_typed_io(
    src: Ptr[IOStream], closeio: Bool, type: CStringSlice
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTyped_IO
    """
    var result = get_sdl_image_function_table().img_load_typed_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise "Error in img_load_typed_io call. See official documentation for details."
    return result


fn img_load_texture(
    renderer: Ptr[Renderer], file: CStringSlice
) raises -> Ptr[Texture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTexture
    """
    var result = get_sdl_image_function_table().img_load_texture(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise "Error in img_load_texture call. See official documentation for details."
    return result


fn img_load_texture_io(
    renderer: Ptr[Renderer], src: Ptr[IOStream], closeio: Bool
) raises -> Ptr[Texture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTexture_IO
    """
    var result = get_sdl_image_function_table().img_load_texture_io(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not result:
        raise "Error in img_load_texture_io call. See official documentation for details."
    return result


fn img_load_texture_typed_io(
    renderer: Ptr[Renderer], src: Ptr[IOStream], closeio: Bool, type: CStringSlice
) raises -> Ptr[Texture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTextureTyped_IO
    """
    var result = get_sdl_image_function_table().img_load_texture_typed_io(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise "Error in img_load_texture_typed_io call. See official documentation for details."
    return result


fn img_load_gpu_texture(
    device: Ptr[GPUDevice],
    copy_pass: Ptr[GPUCopyPass],
    file: CStringSlice,
    width: Ptr[Int32],
    height: Ptr[Int32],
) raises -> Ptr[GPUTexture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadGPUTexture
    """
    var result = get_sdl_image_function_table().img_load_gpu_texture(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=height).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise "Error in img_load_gpu_texture call. See official documentation for details."
    return result


fn img_load_gpu_texture_io(
    device: Ptr[GPUDevice],
    copy_pass: Ptr[GPUCopyPass],
    src: Ptr[IOStream],
    closeio: Bool,
    width: Ptr[Int32],
    height: Ptr[Int32],
) raises -> Ptr[GPUTexture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadGPUTexture_IO
    """
    var result = get_sdl_image_function_table().img_load_gpu_texture_io(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        Ptr(to=width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=height).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise "Error in img_load_gpu_texture_io call. See official documentation for details."
    return result


fn img_load_gpu_texture_typed_io(
    device: Ptr[GPUDevice],
    copy_pass: Ptr[GPUCopyPass],
    src: Ptr[IOStream],
    closeio: Bool,
    type: CStringSlice,
    width: Ptr[Int32],
    height: Ptr[Int32],
) raises -> Ptr[GPUTexture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadGPUTextureTyped_IO
    """
    var result = get_sdl_image_function_table().img_load_gpu_texture_typed_io(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=height).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise "Error in img_load_gpu_texture_typed_io call. See official documentation for details."
    return result


fn img_get_clipboard_image() raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_GetClipboardImage
    """
    var result = get_sdl_image_function_table().img_get_clipboard_image()
    if not result:
        raise "Error in img_get_clipboard_image call. See official documentation for details."
    return result


fn img_is_ani(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isANI
    """
    return get_sdl_image_function_table().img_is_ani(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_avif(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isAVIF
    """
    return get_sdl_image_function_table().img_is_avif(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_cur(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isCUR
    """
    return get_sdl_image_function_table().img_is_cur(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_bmp(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isBMP
    """
    return get_sdl_image_function_table().img_is_bmp(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_gif(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isGIF
    """
    return get_sdl_image_function_table().img_is_gif(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_ico(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isICO
    """
    return get_sdl_image_function_table().img_is_ico(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_jpg(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isJPG
    """
    return get_sdl_image_function_table().img_is_jpg(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_jxl(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isJXL
    """
    return get_sdl_image_function_table().img_is_jxl(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_lbm(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isLBM
    """
    return get_sdl_image_function_table().img_is_lbm(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_pcx(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isPCX
    """
    return get_sdl_image_function_table().img_is_pcx(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_png(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isPNG
    """
    return get_sdl_image_function_table().img_is_png(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_pnm(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isPNM
    """
    return get_sdl_image_function_table().img_is_pnm(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_qoi(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isQOI
    """
    return get_sdl_image_function_table().img_is_qoi(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_svg(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isSVG
    """
    return get_sdl_image_function_table().img_is_svg(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_tif(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isTIF
    """
    return get_sdl_image_function_table().img_is_tif(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_webp(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isWEBP
    """
    return get_sdl_image_function_table().img_is_webp(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_xcf(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isXCF
    """
    return get_sdl_image_function_table().img_is_xcf(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_xpm(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isXPM
    """
    return get_sdl_image_function_table().img_is_xpm(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_is_xv(src: Ptr[IOStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_isXV
    """
    return get_sdl_image_function_table().img_is_xv(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn img_load_avif_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAVIF_IO
    """
    var result = get_sdl_image_function_table().img_load_avif_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_avif_io call. See official documentation for details."
    return result


fn img_load_bmp_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadBMP_IO
    """
    var result = get_sdl_image_function_table().img_load_bmp_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_bmp_io call. See official documentation for details."
    return result


fn img_load_cur_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadCUR_IO
    """
    var result = get_sdl_image_function_table().img_load_cur_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_cur_io call. See official documentation for details."
    return result


fn img_load_gif_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadGIF_IO
    """
    var result = get_sdl_image_function_table().img_load_gif_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_gif_io call. See official documentation for details."
    return result


fn img_load_ico_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadICO_IO
    """
    var result = get_sdl_image_function_table().img_load_ico_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_ico_io call. See official documentation for details."
    return result


fn img_load_jpg_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadJPG_IO
    """
    var result = get_sdl_image_function_table().img_load_jpg_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_jpg_io call. See official documentation for details."
    return result


fn img_load_jxl_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadJXL_IO
    """
    var result = get_sdl_image_function_table().img_load_jxl_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_jxl_io call. See official documentation for details."
    return result


fn img_load_lbm_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadLBM_IO
    """
    var result = get_sdl_image_function_table().img_load_lbm_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_lbm_io call. See official documentation for details."
    return result


fn img_load_pcx_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadPCX_IO
    """
    var result = get_sdl_image_function_table().img_load_pcx_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_pcx_io call. See official documentation for details."
    return result


fn img_load_png_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadPNG_IO
    """
    var result = get_sdl_image_function_table().img_load_png_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_png_io call. See official documentation for details."
    return result


fn img_load_pnm_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadPNM_IO
    """
    var result = get_sdl_image_function_table().img_load_pnm_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_pnm_io call. See official documentation for details."
    return result


fn img_load_svg_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadSVG_IO
    """
    var result = get_sdl_image_function_table().img_load_svg_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_svg_io call. See official documentation for details."
    return result


fn img_load_sized_svg_io(
    src: Ptr[IOStream], width: Int32, height: Int32
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadSizedSVG_IO
    """
    var result = get_sdl_image_function_table().img_load_sized_svg_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=width).bitcast[Int32]()[],
        Ptr(to=height).bitcast[Int32]()[],
    )
    if not result:
        raise "Error in img_load_sized_svg_io call. See official documentation for details."
    return result


fn img_load_qoi_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadQOI_IO
    """
    var result = get_sdl_image_function_table().img_load_qoi_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_qoi_io call. See official documentation for details."
    return result


fn img_load_tga_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTGA_IO
    """
    var result = get_sdl_image_function_table().img_load_tga_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_tga_io call. See official documentation for details."
    return result


fn img_load_tif_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadTIF_IO
    """
    var result = get_sdl_image_function_table().img_load_tif_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_tif_io call. See official documentation for details."
    return result


fn img_load_webp_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadWEBP_IO
    """
    var result = get_sdl_image_function_table().img_load_webp_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_webp_io call. See official documentation for details."
    return result


fn img_load_xcf_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadXCF_IO
    """
    var result = get_sdl_image_function_table().img_load_xcf_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_xcf_io call. See official documentation for details."
    return result


fn img_load_xpm_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadXPM_IO
    """
    var result = get_sdl_image_function_table().img_load_xpm_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_xpm_io call. See official documentation for details."
    return result


fn img_load_xv_io(src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadXV_IO
    """
    var result = get_sdl_image_function_table().img_load_xv_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_xv_io call. See official documentation for details."
    return result


fn img_read_xpm_from_array(
    xpm: Ptr[Ptr[c_char, MutExternalOrigin]]
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_ReadXPMFromArray
    """
    var result = get_sdl_image_function_table().img_read_xpm_from_array(
        Ptr(to=xpm).bitcast[Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_read_xpm_from_array call. See official documentation for details."
    return result


fn img_read_xpm_from_array_to_rg_b888(
    xpm: Ptr[Ptr[c_char, MutExternalOrigin]]
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_ReadXPMFromArrayToRGB888
    """
    var result = get_sdl_image_function_table().img_read_xpm_from_array_to_rg_b888(
        Ptr(to=xpm).bitcast[Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_read_xpm_from_array_to_rg_b888 call. See official documentation for details."
    return result


fn img_save(surface: Ptr[Surface], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_Save
    """
    var success = get_sdl_image_function_table().img_save(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_typed_io(
    surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool, type: CStringSlice
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveTyped_IO
    """
    var success = get_sdl_image_function_table().img_save_typed_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_avif(surface: Ptr[Surface], file: CStringSlice, quality: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveAVIF
    """
    var success = get_sdl_image_function_table().img_save_avif(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=quality).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn img_save_avif_io(
    surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool, quality: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveAVIF_IO
    """
    var success = get_sdl_image_function_table().img_save_avif_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        Ptr(to=quality).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn img_save_bmp(surface: Ptr[Surface], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveBMP
    """
    var success = get_sdl_image_function_table().img_save_bmp(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_bmp_io(surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveBMP_IO
    """
    var success = get_sdl_image_function_table().img_save_bmp_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn img_save_cur(surface: Ptr[Surface], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveCUR
    """
    var success = get_sdl_image_function_table().img_save_cur(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_cur_io(surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveCUR_IO
    """
    var success = get_sdl_image_function_table().img_save_cur_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn img_save_gif(surface: Ptr[Surface], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveGIF
    """
    var success = get_sdl_image_function_table().img_save_gif(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_gif_io(surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveGIF_IO
    """
    var success = get_sdl_image_function_table().img_save_gif_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn img_save_ico(surface: Ptr[Surface], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveICO
    """
    var success = get_sdl_image_function_table().img_save_ico(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_ico_io(surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveICO_IO
    """
    var success = get_sdl_image_function_table().img_save_ico_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn img_save_jpg(surface: Ptr[Surface], file: CStringSlice, quality: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveJPG
    """
    var success = get_sdl_image_function_table().img_save_jpg(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=quality).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn img_save_jpg_io(
    surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool, quality: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveJPG_IO
    """
    var success = get_sdl_image_function_table().img_save_jpg_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        Ptr(to=quality).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn img_save_png(surface: Ptr[Surface], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SavePNG
    """
    var success = get_sdl_image_function_table().img_save_png(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_png_io(surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SavePNG_IO
    """
    var success = get_sdl_image_function_table().img_save_png_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn img_save_tga(surface: Ptr[Surface], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveTGA
    """
    var success = get_sdl_image_function_table().img_save_tga(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_tga_io(surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveTGA_IO
    """
    var success = get_sdl_image_function_table().img_save_tga_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn img_save_webp(surface: Ptr[Surface], file: CStringSlice, quality: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveWEBP
    """
    var success = get_sdl_image_function_table().img_save_webp(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=quality).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn img_save_webp_io(
    surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool, quality: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveWEBP_IO
    """
    var success = get_sdl_image_function_table().img_save_webp_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        Ptr(to=quality).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn img_load_animation(file: CStringSlice) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAnimation
    """
    var result = get_sdl_image_function_table().img_load_animation(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not result:
        raise "Error in img_load_animation call. See official documentation for details."
    return result


fn img_load_animation_io(
    src: Ptr[IOStream], closeio: Bool
) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAnimation_IO
    """
    var result = get_sdl_image_function_table().img_load_animation_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=closeio).bitcast[Bool]()[]
    )
    if not result:
        raise "Error in img_load_animation_io call. See official documentation for details."
    return result


fn img_load_animation_typed_io(
    src: Ptr[IOStream], closeio: Bool, type: CStringSlice
) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAnimationTyped_IO
    """
    var result = get_sdl_image_function_table().img_load_animation_typed_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise "Error in img_load_animation_typed_io call. See official documentation for details."
    return result


fn img_load_ani_animation_io(src: Ptr[IOStream]) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadANIAnimation_IO
    """
    var result = get_sdl_image_function_table().img_load_ani_animation_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_ani_animation_io call. See official documentation for details."
    return result


fn img_load_apng_animation_io(src: Ptr[IOStream]) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAPNGAnimation_IO
    """
    var result = get_sdl_image_function_table().img_load_apng_animation_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_apng_animation_io call. See official documentation for details."
    return result


fn img_load_avif_animation_io(src: Ptr[IOStream]) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadAVIFAnimation_IO
    """
    var result = get_sdl_image_function_table().img_load_avif_animation_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_avif_animation_io call. See official documentation for details."
    return result


fn img_load_gif_animation_io(src: Ptr[IOStream]) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadGIFAnimation_IO
    """
    var result = get_sdl_image_function_table().img_load_gif_animation_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_gif_animation_io call. See official documentation for details."
    return result


fn img_load_webp_animation_io(src: Ptr[IOStream]) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_LoadWEBPAnimation_IO
    """
    var result = get_sdl_image_function_table().img_load_webp_animation_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in img_load_webp_animation_io call. See official documentation for details."
    return result


fn img_save_animation(anim: Ptr[IMG_Animation], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveAnimation
    """
    var success = get_sdl_image_function_table().img_save_animation(
        Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_animation_typed_io(
    anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool, type: CStringSlice
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveAnimationTyped_IO
    """
    var success = get_sdl_image_function_table().img_save_animation_typed_io(
        Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn img_save_ani_animation_io(anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveANIAnimation_IO
    """
    var success = get_sdl_image_function_table().img_save_ani_animation_io(
        Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn img_save_apng_animation_io(anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveAPNGAnimation_IO
    """
    var success = get_sdl_image_function_table().img_save_apng_animation_io(
        Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn img_save_avif_animation_io(
    anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool, quality: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveAVIFAnimation_IO
    """
    var success = get_sdl_image_function_table().img_save_avif_animation_io(
        Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        Ptr(to=quality).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn img_save_gif_animation_io(anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveGIFAnimation_IO
    """
    var success = get_sdl_image_function_table().img_save_gif_animation_io(
        Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn img_save_webp_animation_io(
    anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool, quality: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_SaveWEBPAnimation_IO
    """
    var success = get_sdl_image_function_table().img_save_webp_animation_io(
        Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        Ptr(to=quality).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn img_create_animated_cursor(
    anim: Ptr[IMG_Animation], hot_x: Int32, hot_y: Int32
) raises -> Ptr[Cursor, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_CreateAnimatedCursor
    """
    var result = get_sdl_image_function_table().img_create_animated_cursor(
        Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
        Ptr(to=hot_x).bitcast[Int32]()[],
        Ptr(to=hot_y).bitcast[Int32]()[],
    )
    if not result:
        raise get_error()
    return result


fn img_free_animation(anim: Ptr[IMG_Animation]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_FreeAnimation
    """
    get_sdl_image_function_table().img_free_animation(
        Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[]
    )


fn img_create_animation_encoder(
    file: CStringSlice
) raises -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationEncoder
    """
    var result = get_sdl_image_function_table().img_create_animation_encoder(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not result:
        raise get_error()
    return result


fn img_create_animation_encoder_io(
    dst: Ptr[IOStream], closeio: Bool, type: CStringSlice
) raises -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationEncoder_IO
    """
    var result = get_sdl_image_function_table().img_create_animation_encoder_io(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise get_error()
    return result


fn img_create_animation_encoder_with_properties(
    props: PropertiesID
) raises -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationEncoderWithProperties
    """
    var result = get_sdl_image_function_table().img_create_animation_encoder_with_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not result:
        raise get_error()
    return result


fn img_add_animation_encoder_frame(
    encoder: Ptr[IMG_AnimationEncoder], surface: Ptr[Surface], duration: UInt64
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_AddAnimationEncoderFrame
    """
    var success = get_sdl_image_function_table().img_add_animation_encoder_frame(
        Ptr(to=encoder).bitcast[Ptr[IMG_AnimationEncoder, MutExternalOrigin]]()[],
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=duration).bitcast[UInt64]()[],
    )
    if not success:
        raise get_error()


fn img_close_animation_encoder(encoder: Ptr[IMG_AnimationEncoder]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_CloseAnimationEncoder
    """
    var success = get_sdl_image_function_table().img_close_animation_encoder(
        Ptr(to=encoder).bitcast[Ptr[IMG_AnimationEncoder, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn img_create_animation_decoder(
    file: CStringSlice
) raises -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationDecoder
    """
    var result = get_sdl_image_function_table().img_create_animation_decoder(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not result:
        raise get_error()
    return result


fn img_create_animation_decoder_io(
    src: Ptr[IOStream], closeio: Bool, type: CStringSlice
) raises -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationDecoder_IO
    """
    var result = get_sdl_image_function_table().img_create_animation_decoder_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise get_error()
    return result


fn img_create_animation_decoder_with_properties(
    props: PropertiesID
) raises -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationDecoderWithProperties
    """
    var result = get_sdl_image_function_table().img_create_animation_decoder_with_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not result:
        raise get_error()
    return result


fn img_get_animation_decoder_properties(decoder: Ptr[IMG_AnimationDecoder]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_GetAnimationDecoderProperties
    """
    return get_sdl_image_function_table().img_get_animation_decoder_properties(
        Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[]
    )


fn img_get_animation_decoder_frame(
    decoder: Ptr[IMG_AnimationDecoder],
    frame: Ptr[Ptr[Surface, MutExternalOrigin]],
    duration: Ptr[UInt64],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_GetAnimationDecoderFrame
    """
    var success = get_sdl_image_function_table().img_get_animation_decoder_frame(
        Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[],
        Ptr(to=frame).bitcast[Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]]()[],
        Ptr(to=duration).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn img_get_animation_decoder_status(
    decoder: Ptr[IMG_AnimationDecoder]
) -> IMG_AnimationDecoderStatus:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_GetAnimationDecoderStatus
    """
    return get_sdl_image_function_table().img_get_animation_decoder_status(
        Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[]
    )


fn img_reset_animation_decoder(decoder: Ptr[IMG_AnimationDecoder]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_ResetAnimationDecoder
    """
    var success = get_sdl_image_function_table().img_reset_animation_decoder(
        Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn img_close_animation_decoder(decoder: Ptr[IMG_AnimationDecoder]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_CloseAnimationDecoder
    """
    var success = get_sdl_image_function_table().img_close_animation_decoder(
        Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()
