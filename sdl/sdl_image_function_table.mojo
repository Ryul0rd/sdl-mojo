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


comptime sdl_image_function_table = _Global["sdl_image_function_table", zero_init[SdlImageFunctionTable]]()


fn zero_init_sdl_image_function_table() -> OpaquePointer[MutExternalOrigin]:
    var fn_table = alloc[SdlImageFunctionTable](1)
    memset_zero(fn_table, 1)
    return fn_table.bitcast[NoneType]()


fn destroy_sdl_image_function_table(fn_table: OpaquePointer[MutExternalOrigin]):
    fn_table.bitcast[SdlImageFunctionTable]().destroy_pointee()


fn get_sdl_image_function_table() -> ref [MutExternalOrigin] SdlImageFunctionTable:
    return _get_global[
        "sdl_image_function_table", zero_init_sdl_image_function_table, destroy_sdl_image_function_table,
    ]().bitcast[SdlImageFunctionTable]()[]


fn load_image_dl() raises:
    var path: Path
    @parameter
    if CompilationTarget.is_linux():
        path = Path("libSDL3_image.so")
    elif CompilationTarget.is_macos():
        path = Path("libSDL3_image.dylib")
    else:
        constrained[False, "Target OS is not supported."]()
        path = Path()
    var fn_table = Ptr(to=get_sdl_image_function_table())
    fn_table.init_pointee_move(SdlImageFunctionTable(path))


fn load_image_dl(path: Some[PathLike]) raises:
    var fn_table = Ptr(to=get_sdl_image_function_table())
    fn_table.init_pointee_move(SdlImageFunctionTable(path))


struct SdlImageFunctionTable(Movable):
    var dlhandle: OwnedDLHandle
    var img_version: fn() -> Int32
    var img_load_typed_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]
    var img_load_texture: fn(Ptr[Renderer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]
    var img_load_texture_io: fn(Ptr[Renderer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Texture, MutExternalOrigin]
    var img_load_texture_typed_io: fn(Ptr[Renderer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]
    var img_is_avif: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_ico: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_cur: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_bmp: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_gif: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_jpg: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_jxl: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_lbm: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_pcx: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_png: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_pnm: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_svg: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_qoi: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_tif: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_xcf: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_xpm: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_xv: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_is_webp: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var img_load_avif_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_ico_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_cur_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_bmp_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_gif_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_jpg_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_jxl_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_lbm_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_pcx_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_png_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_pnm_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_svg_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_qoi_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_tga_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_tif_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_xcf_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_xpm_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_xv_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_webp_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_load_sized_svg_io: fn(Ptr[IOStream, MutExternalOrigin], Int32, Int32) -> Ptr[Surface, MutExternalOrigin]
    var img_read_xpm_from_array: fn(Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_read_xpm_from_array_to_rg_b888: fn(Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var img_save_avif: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var img_save_avif_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool
    var img_save_png: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var img_save_png_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var img_save_jpg: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var img_save_jpg_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool
    var img_load_animation: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var img_load_animation_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[IMG_Animation, MutExternalOrigin]
    var img_load_animation_typed_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var img_free_animation: fn(Ptr[IMG_Animation, MutExternalOrigin]) -> NoneType
    var img_load_gif_animation_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var img_load_webp_animation_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]

    fn __init__(out self, path: Some[PathLike]) raises:
        self.dlhandle = OwnedDLHandle(path)
        self.img_version = self.dlhandle.get_function[fn() -> Int32]("IMG_Version")
        self.img_load_typed_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadTyped_IO")
        self.img_load = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_Load")
        self.img_load_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]]("IMG_Load_IO")
        self.img_load_texture = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]]("IMG_LoadTexture")
        self.img_load_texture_io = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Texture, MutExternalOrigin]]("IMG_LoadTexture_IO")
        self.img_load_texture_typed_io = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]]("IMG_LoadTextureTyped_IO")
        self.img_is_avif = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isAVIF")
        self.img_is_ico = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isICO")
        self.img_is_cur = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isCUR")
        self.img_is_bmp = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isBMP")
        self.img_is_gif = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isGIF")
        self.img_is_jpg = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isJPG")
        self.img_is_jxl = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isJXL")
        self.img_is_lbm = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isLBM")
        self.img_is_pcx = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isPCX")
        self.img_is_png = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isPNG")
        self.img_is_pnm = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isPNM")
        self.img_is_svg = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isSVG")
        self.img_is_qoi = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isQOI")
        self.img_is_tif = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isTIF")
        self.img_is_xcf = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isXCF")
        self.img_is_xpm = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isXPM")
        self.img_is_xv = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isXV")
        self.img_is_webp = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isWEBP")
        self.img_load_avif_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadAVIF_IO")
        self.img_load_ico_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadICO_IO")
        self.img_load_cur_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadCUR_IO")
        self.img_load_bmp_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadBMP_IO")
        self.img_load_gif_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadGIF_IO")
        self.img_load_jpg_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadJPG_IO")
        self.img_load_jxl_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadJXL_IO")
        self.img_load_lbm_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadLBM_IO")
        self.img_load_pcx_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadPCX_IO")
        self.img_load_png_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadPNG_IO")
        self.img_load_pnm_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadPNM_IO")
        self.img_load_svg_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadSVG_IO")
        self.img_load_qoi_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadQOI_IO")
        self.img_load_tga_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadTGA_IO")
        self.img_load_tif_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadTIF_IO")
        self.img_load_xcf_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadXCF_IO")
        self.img_load_xpm_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadXPM_IO")
        self.img_load_xv_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadXV_IO")
        self.img_load_webp_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadWEBP_IO")
        self.img_load_sized_svg_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int32, Int32) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadSizedSVG_IO")
        self.img_read_xpm_from_array = self.dlhandle.get_function[fn(Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_ReadXPMFromArray")
        self.img_read_xpm_from_array_to_rg_b888 = self.dlhandle.get_function[fn(Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_ReadXPMFromArrayToRGB888")
        self.img_save_avif = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("IMG_SaveAVIF")
        self.img_save_avif_io = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool]("IMG_SaveAVIF_IO")
        self.img_save_png = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SavePNG")
        self.img_save_png_io = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SavePNG_IO")
        self.img_save_jpg = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("IMG_SaveJPG")
        self.img_save_jpg_io = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool]("IMG_SaveJPG_IO")
        self.img_load_animation = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadAnimation")
        self.img_load_animation_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadAnimation_IO")
        self.img_load_animation_typed_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadAnimationTyped_IO")
        self.img_free_animation = self.dlhandle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin]) -> NoneType]("IMG_FreeAnimation")
        self.img_load_gif_animation_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadGIFAnimation_IO")
        self.img_load_webp_animation_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadWEBPAnimation_IO")
