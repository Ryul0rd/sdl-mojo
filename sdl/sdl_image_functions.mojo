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


struct SdlImageFunctions:
    var _dynamic_library_handle: OwnedDLHandle
    var _get_error: fn() -> CStringSlice[ImmutExternalOrigin]
    var _version: fn() -> Int32
    var _load: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]
    var _load_typed_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_texture: fn(Ptr[Renderer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]
    var _load_texture_io: fn(Ptr[Renderer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Texture, MutExternalOrigin]
    var _load_texture_typed_io: fn(Ptr[Renderer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]
    var _load_gpu_texture: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUCopyPass, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]
    var _load_gpu_texture_io: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUCopyPass, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]
    var _load_gpu_texture_typed_io: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUCopyPass, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]
    var _get_clipboard_image: fn() -> Ptr[Surface, MutExternalOrigin]
    var _is_ani: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_avif: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_cur: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_bmp: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_gif: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_ico: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_jpg: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_jxl: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_lbm: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_pcx: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_png: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_pnm: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_qoi: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_svg: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_tif: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_webp: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_xcf: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_xpm: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _is_xv: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _load_avif_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_bmp_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_cur_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_gif_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_ico_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_jpg_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_jxl_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_lbm_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_pcx_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_png_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_pnm_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_svg_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_sized_svg_io: fn(Ptr[IOStream, MutExternalOrigin], Int32, Int32) -> Ptr[Surface, MutExternalOrigin]
    var _load_qoi_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_tga_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_tif_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_webp_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_xcf_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_xpm_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_xv_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _read_xpm_from_array: fn(Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _read_xpm_from_array_to_rg_b888: fn(Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _save: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_typed_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_avif: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var _save_avif_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool
    var _save_bmp: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_bmp_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_cur: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_cur_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_gif: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_gif_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_ico: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_ico_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_jpg: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var _save_jpg_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool
    var _save_png: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_png_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_tga: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_tga_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_webp: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool
    var _save_webp_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Float32) -> Bool
    var _load_animation: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var _load_animation_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[IMG_Animation, MutExternalOrigin]
    var _load_animation_typed_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var _load_ani_animation_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var _load_apng_animation_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var _load_avif_animation_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var _load_gif_animation_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var _load_webp_animation_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]
    var _save_animation: fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_animation_typed_io: fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _save_ani_animation_io: fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_apng_animation_io: fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_avif_animation_io: fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool
    var _save_gif_animation_io: fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_webp_animation_io: fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool
    var _create_animated_cursor: fn(Ptr[IMG_Animation, MutExternalOrigin], Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]
    var _free_animation: fn(Ptr[IMG_Animation, MutExternalOrigin]) -> NoneType
    var _create_animation_encoder: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]
    var _create_animation_encoder_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]
    var _create_animation_encoder_with_properties: fn(PropertiesID) -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]
    var _add_animation_encoder_frame: fn(Ptr[IMG_AnimationEncoder, MutExternalOrigin], Ptr[Surface, MutExternalOrigin], UInt64) -> Bool
    var _close_animation_encoder: fn(Ptr[IMG_AnimationEncoder, MutExternalOrigin]) -> Bool
    var _create_animation_decoder: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]
    var _create_animation_decoder_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]
    var _create_animation_decoder_with_properties: fn(PropertiesID) -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]
    var _get_animation_decoder_properties: fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin]) -> PropertiesID
    var _get_animation_decoder_frame: fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin], Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool
    var _get_animation_decoder_status: fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin]) -> IMG_AnimationDecoderStatus
    var _reset_animation_decoder: fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin]) -> Bool
    var _close_animation_decoder: fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin]) -> Bool

    fn __init__(out self, sdl3_functions: Sdl3Functions) raises:
        var library_path: Path
        @parameter
        if CompilationTarget.is_linux():
            library_path = Path("libSDL3_image.so")
        elif CompilationTarget.is_macos():
            library_path = Path("libSDL3_image.dylib")
        else:
            constrained[False, "Target operating system is not supported."]()
            library_path = Path()
        self = Self(sdl3_functions, library_path)

    fn __init__(out self, sdl3_functions: Sdl3Functions, library_path: Path) raises:
        self._dynamic_library_handle = OwnedDLHandle(library_path)
        self._get_error = sdl3_functions._get_error
        self._version = self._dynamic_library_handle.get_function[fn() -> Int32]("IMG_Version")
        self._load = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_Load")
        self._load_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]]("IMG_Load_IO")
        self._load_typed_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadTyped_IO")
        self._load_texture = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]]("IMG_LoadTexture")
        self._load_texture_io = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Texture, MutExternalOrigin]]("IMG_LoadTexture_IO")
        self._load_texture_typed_io = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]]("IMG_LoadTextureTyped_IO")
        self._load_gpu_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUCopyPass, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]]("IMG_LoadGPUTexture")
        self._load_gpu_texture_io = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUCopyPass, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]]("IMG_LoadGPUTexture_IO")
        self._load_gpu_texture_typed_io = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUCopyPass, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]]("IMG_LoadGPUTextureTyped_IO")
        self._get_clipboard_image = self._dynamic_library_handle.get_function[fn() -> Ptr[Surface, MutExternalOrigin]]("IMG_GetClipboardImage")
        self._is_ani = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isANI")
        self._is_avif = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isAVIF")
        self._is_cur = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isCUR")
        self._is_bmp = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isBMP")
        self._is_gif = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isGIF")
        self._is_ico = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isICO")
        self._is_jpg = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isJPG")
        self._is_jxl = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isJXL")
        self._is_lbm = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isLBM")
        self._is_pcx = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isPCX")
        self._is_png = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isPNG")
        self._is_pnm = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isPNM")
        self._is_qoi = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isQOI")
        self._is_svg = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isSVG")
        self._is_tif = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isTIF")
        self._is_webp = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isWEBP")
        self._is_xcf = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isXCF")
        self._is_xpm = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isXPM")
        self._is_xv = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("IMG_isXV")
        self._load_avif_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadAVIF_IO")
        self._load_bmp_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadBMP_IO")
        self._load_cur_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadCUR_IO")
        self._load_gif_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadGIF_IO")
        self._load_ico_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadICO_IO")
        self._load_jpg_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadJPG_IO")
        self._load_jxl_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadJXL_IO")
        self._load_lbm_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadLBM_IO")
        self._load_pcx_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadPCX_IO")
        self._load_png_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadPNG_IO")
        self._load_pnm_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadPNM_IO")
        self._load_svg_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadSVG_IO")
        self._load_sized_svg_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int32, Int32) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadSizedSVG_IO")
        self._load_qoi_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadQOI_IO")
        self._load_tga_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadTGA_IO")
        self._load_tif_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadTIF_IO")
        self._load_webp_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadWEBP_IO")
        self._load_xcf_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadXCF_IO")
        self._load_xpm_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadXPM_IO")
        self._load_xv_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_LoadXV_IO")
        self._read_xpm_from_array = self._dynamic_library_handle.get_function[fn(Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_ReadXPMFromArray")
        self._read_xpm_from_array_to_rg_b888 = self._dynamic_library_handle.get_function[fn(Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("IMG_ReadXPMFromArrayToRGB888")
        self._save = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_Save")
        self._save_typed_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SaveTyped_IO")
        self._save_avif = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("IMG_SaveAVIF")
        self._save_avif_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool]("IMG_SaveAVIF_IO")
        self._save_bmp = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SaveBMP")
        self._save_bmp_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SaveBMP_IO")
        self._save_cur = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SaveCUR")
        self._save_cur_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SaveCUR_IO")
        self._save_gif = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SaveGIF")
        self._save_gif_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SaveGIF_IO")
        self._save_ico = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SaveICO")
        self._save_ico_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SaveICO_IO")
        self._save_jpg = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("IMG_SaveJPG")
        self._save_jpg_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool]("IMG_SaveJPG_IO")
        self._save_png = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SavePNG")
        self._save_png_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SavePNG_IO")
        self._save_tga = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SaveTGA")
        self._save_tga_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SaveTGA_IO")
        self._save_webp = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool]("IMG_SaveWEBP")
        self._save_webp_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Float32) -> Bool]("IMG_SaveWEBP_IO")
        self._load_animation = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadAnimation")
        self._load_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadAnimation_IO")
        self._load_animation_typed_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadAnimationTyped_IO")
        self._load_ani_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadANIAnimation_IO")
        self._load_apng_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadAPNGAnimation_IO")
        self._load_avif_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadAVIFAnimation_IO")
        self._load_gif_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadGIFAnimation_IO")
        self._load_webp_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Ptr[IMG_Animation, MutExternalOrigin]]("IMG_LoadWEBPAnimation_IO")
        self._save_animation = self._dynamic_library_handle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SaveAnimation")
        self._save_animation_typed_io = self._dynamic_library_handle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("IMG_SaveAnimationTyped_IO")
        self._save_ani_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SaveANIAnimation_IO")
        self._save_apng_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SaveAPNGAnimation_IO")
        self._save_avif_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool]("IMG_SaveAVIFAnimation_IO")
        self._save_gif_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("IMG_SaveGIFAnimation_IO")
        self._save_webp_animation_io = self._dynamic_library_handle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Int32) -> Bool]("IMG_SaveWEBPAnimation_IO")
        self._create_animated_cursor = self._dynamic_library_handle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin], Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]]("IMG_CreateAnimatedCursor")
        self._free_animation = self._dynamic_library_handle.get_function[fn(Ptr[IMG_Animation, MutExternalOrigin]) -> NoneType]("IMG_FreeAnimation")
        self._create_animation_encoder = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]]("IMG_CreateAnimationEncoder")
        self._create_animation_encoder_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]]("IMG_CreateAnimationEncoder_IO")
        self._create_animation_encoder_with_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]]("IMG_CreateAnimationEncoderWithProperties")
        self._add_animation_encoder_frame = self._dynamic_library_handle.get_function[fn(Ptr[IMG_AnimationEncoder, MutExternalOrigin], Ptr[Surface, MutExternalOrigin], UInt64) -> Bool]("IMG_AddAnimationEncoderFrame")
        self._close_animation_encoder = self._dynamic_library_handle.get_function[fn(Ptr[IMG_AnimationEncoder, MutExternalOrigin]) -> Bool]("IMG_CloseAnimationEncoder")
        self._create_animation_decoder = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]]("IMG_CreateAnimationDecoder")
        self._create_animation_decoder_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]]("IMG_CreateAnimationDecoder_IO")
        self._create_animation_decoder_with_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]]("IMG_CreateAnimationDecoderWithProperties")
        self._get_animation_decoder_properties = self._dynamic_library_handle.get_function[fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin]) -> PropertiesID]("IMG_GetAnimationDecoderProperties")
        self._get_animation_decoder_frame = self._dynamic_library_handle.get_function[fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin], Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool]("IMG_GetAnimationDecoderFrame")
        self._get_animation_decoder_status = self._dynamic_library_handle.get_function[fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin]) -> IMG_AnimationDecoderStatus]("IMG_GetAnimationDecoderStatus")
        self._reset_animation_decoder = self._dynamic_library_handle.get_function[fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin]) -> Bool]("IMG_ResetAnimationDecoder")
        self._close_animation_decoder = self._dynamic_library_handle.get_function[fn(Ptr[IMG_AnimationDecoder, MutExternalOrigin]) -> Bool]("IMG_CloseAnimationDecoder")

    fn get_error(self) -> CStringSlice[ImmutExternalOrigin]:
        return self._get_error()

    fn version(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_Version
        """
        return self._version()

    fn load(self, file: CStringSlice) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_Load
        """
        var result_pointer = self._load(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not result_pointer:
            raise "Error in load call. See official documentation for details."
        return result_pointer

    fn load_io(self, src: Ptr[IOStream], closeio: Bool) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_Load_IO
        """
        var result_pointer = self._load_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise "Error in load_io call. See official documentation for details."
        return result_pointer

    fn load_typed_io(
        self, src: Ptr[IOStream], closeio: Bool, type: CStringSlice
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadTyped_IO
        """
        var result_pointer = self._load_typed_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise "Error in load_typed_io call. See official documentation for details."
        return result_pointer

    fn load_texture(
        self, renderer: Ptr[Renderer], file: CStringSlice
    ) raises -> Ptr[Texture, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadTexture
        """
        var result_pointer = self._load_texture(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise "Error in load_texture call. See official documentation for details."
        return result_pointer

    fn load_texture_io(
        self, renderer: Ptr[Renderer], src: Ptr[IOStream], closeio: Bool
    ) raises -> Ptr[Texture, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadTexture_IO
        """
        var result_pointer = self._load_texture_io(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise "Error in load_texture_io call. See official documentation for details."
        return result_pointer

    fn load_texture_typed_io(
        self, renderer: Ptr[Renderer], src: Ptr[IOStream], closeio: Bool, type: CStringSlice
    ) raises -> Ptr[Texture, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadTextureTyped_IO
        """
        var result_pointer = self._load_texture_typed_io(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise "Error in load_texture_typed_io call. See official documentation for details."
        return result_pointer

    fn load_gpu_texture(
        self,
        device: Ptr[GPUDevice],
        copy_pass: Ptr[GPUCopyPass],
        file: CStringSlice,
        width: Ptr[Int32],
        height: Ptr[Int32],
    ) raises -> Ptr[GPUTexture, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadGPUTexture
        """
        var result_pointer = self._load_gpu_texture(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=height).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise "Error in load_gpu_texture call. See official documentation for details."
        return result_pointer

    fn load_gpu_texture_io(
        self,
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
        var result_pointer = self._load_gpu_texture_io(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=height).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise "Error in load_gpu_texture_io call. See official documentation for details."
        return result_pointer

    fn load_gpu_texture_typed_io(
        self,
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
        var result_pointer = self._load_gpu_texture_typed_io(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=width).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=height).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise "Error in load_gpu_texture_typed_io call. See official documentation for details."
        return result_pointer

    fn get_clipboard_image(self) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_GetClipboardImage
        """
        var result_pointer = self._get_clipboard_image()
        if not result_pointer:
            raise "Error in get_clipboard_image call. See official documentation for details."
        return result_pointer

    fn is_ani(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isANI
        """
        return self._is_ani(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_avif(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isAVIF
        """
        return self._is_avif(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_cur(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isCUR
        """
        return self._is_cur(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_bmp(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isBMP
        """
        return self._is_bmp(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_gif(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isGIF
        """
        return self._is_gif(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_ico(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isICO
        """
        return self._is_ico(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_jpg(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isJPG
        """
        return self._is_jpg(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_jxl(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isJXL
        """
        return self._is_jxl(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_lbm(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isLBM
        """
        return self._is_lbm(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_pcx(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isPCX
        """
        return self._is_pcx(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_png(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isPNG
        """
        return self._is_png(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_pnm(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isPNM
        """
        return self._is_pnm(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_qoi(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isQOI
        """
        return self._is_qoi(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_svg(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isSVG
        """
        return self._is_svg(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_tif(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isTIF
        """
        return self._is_tif(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_webp(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isWEBP
        """
        return self._is_webp(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_xcf(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isXCF
        """
        return self._is_xcf(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_xpm(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isXPM
        """
        return self._is_xpm(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn is_xv(self, src: Ptr[IOStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_isXV
        """
        return self._is_xv(Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn load_avif_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadAVIF_IO
        """
        var result_pointer = self._load_avif_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_avif_io call. See official documentation for details."
        return result_pointer

    fn load_bmp_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadBMP_IO
        """
        var result_pointer = self._load_bmp_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_bmp_io call. See official documentation for details."
        return result_pointer

    fn load_cur_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadCUR_IO
        """
        var result_pointer = self._load_cur_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_cur_io call. See official documentation for details."
        return result_pointer

    fn load_gif_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadGIF_IO
        """
        var result_pointer = self._load_gif_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_gif_io call. See official documentation for details."
        return result_pointer

    fn load_ico_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadICO_IO
        """
        var result_pointer = self._load_ico_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_ico_io call. See official documentation for details."
        return result_pointer

    fn load_jpg_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadJPG_IO
        """
        var result_pointer = self._load_jpg_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_jpg_io call. See official documentation for details."
        return result_pointer

    fn load_jxl_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadJXL_IO
        """
        var result_pointer = self._load_jxl_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_jxl_io call. See official documentation for details."
        return result_pointer

    fn load_lbm_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadLBM_IO
        """
        var result_pointer = self._load_lbm_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_lbm_io call. See official documentation for details."
        return result_pointer

    fn load_pcx_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadPCX_IO
        """
        var result_pointer = self._load_pcx_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_pcx_io call. See official documentation for details."
        return result_pointer

    fn load_png_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadPNG_IO
        """
        var result_pointer = self._load_png_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_png_io call. See official documentation for details."
        return result_pointer

    fn load_pnm_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadPNM_IO
        """
        var result_pointer = self._load_pnm_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_pnm_io call. See official documentation for details."
        return result_pointer

    fn load_svg_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadSVG_IO
        """
        var result_pointer = self._load_svg_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_svg_io call. See official documentation for details."
        return result_pointer

    fn load_sized_svg_io(
        self, src: Ptr[IOStream], width: Int32, height: Int32
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadSizedSVG_IO
        """
        var result_pointer = self._load_sized_svg_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=width).bitcast[Int32]()[],
            Ptr(to=height).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise "Error in load_sized_svg_io call. See official documentation for details."
        return result_pointer

    fn load_qoi_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadQOI_IO
        """
        var result_pointer = self._load_qoi_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_qoi_io call. See official documentation for details."
        return result_pointer

    fn load_tga_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadTGA_IO
        """
        var result_pointer = self._load_tga_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_tga_io call. See official documentation for details."
        return result_pointer

    fn load_tif_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadTIF_IO
        """
        var result_pointer = self._load_tif_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_tif_io call. See official documentation for details."
        return result_pointer

    fn load_webp_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadWEBP_IO
        """
        var result_pointer = self._load_webp_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_webp_io call. See official documentation for details."
        return result_pointer

    fn load_xcf_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadXCF_IO
        """
        var result_pointer = self._load_xcf_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_xcf_io call. See official documentation for details."
        return result_pointer

    fn load_xpm_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadXPM_IO
        """
        var result_pointer = self._load_xpm_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_xpm_io call. See official documentation for details."
        return result_pointer

    fn load_xv_io(self, src: Ptr[IOStream]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadXV_IO
        """
        var result_pointer = self._load_xv_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_xv_io call. See official documentation for details."
        return result_pointer

    fn read_xpm_from_array(
        self, xpm: Ptr[Ptr[c_char, MutExternalOrigin]]
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_ReadXPMFromArray
        """
        var result_pointer = self._read_xpm_from_array(
            Ptr(to=xpm).bitcast[Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in read_xpm_from_array call. See official documentation for details."
        return result_pointer

    fn read_xpm_from_array_to_rg_b888(
        self, xpm: Ptr[Ptr[c_char, MutExternalOrigin]]
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_ReadXPMFromArrayToRGB888
        """
        var result_pointer = self._read_xpm_from_array_to_rg_b888(
            Ptr(to=xpm).bitcast[Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in read_xpm_from_array_to_rg_b888 call. See official documentation for details."
        return result_pointer

    fn save(self, surface: Ptr[Surface], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_Save
        """
        var success_status = self._save(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_typed_io(
        self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool, type: CStringSlice
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveTyped_IO
        """
        var success_status = self._save_typed_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_avif(self, surface: Ptr[Surface], file: CStringSlice, quality: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveAVIF
        """
        var success_status = self._save_avif(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=quality).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_avif_io(
        self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool, quality: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveAVIF_IO
        """
        var success_status = self._save_avif_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=quality).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_bmp(self, surface: Ptr[Surface], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveBMP
        """
        var success_status = self._save_bmp(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_bmp_io(self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveBMP_IO
        """
        var success_status = self._save_bmp_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_cur(self, surface: Ptr[Surface], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveCUR
        """
        var success_status = self._save_cur(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_cur_io(self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveCUR_IO
        """
        var success_status = self._save_cur_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_gif(self, surface: Ptr[Surface], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveGIF
        """
        var success_status = self._save_gif(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_gif_io(self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveGIF_IO
        """
        var success_status = self._save_gif_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_ico(self, surface: Ptr[Surface], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveICO
        """
        var success_status = self._save_ico(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_ico_io(self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveICO_IO
        """
        var success_status = self._save_ico_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_jpg(self, surface: Ptr[Surface], file: CStringSlice, quality: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveJPG
        """
        var success_status = self._save_jpg(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=quality).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_jpg_io(
        self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool, quality: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveJPG_IO
        """
        var success_status = self._save_jpg_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=quality).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_png(self, surface: Ptr[Surface], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SavePNG
        """
        var success_status = self._save_png(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_png_io(self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SavePNG_IO
        """
        var success_status = self._save_png_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_tga(self, surface: Ptr[Surface], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveTGA
        """
        var success_status = self._save_tga(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_tga_io(self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveTGA_IO
        """
        var success_status = self._save_tga_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_webp(self, surface: Ptr[Surface], file: CStringSlice, quality: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveWEBP
        """
        var success_status = self._save_webp(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=quality).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_webp_io(
        self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool, quality: Float32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveWEBP_IO
        """
        var success_status = self._save_webp_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=quality).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn load_animation(self, file: CStringSlice) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadAnimation
        """
        var result_pointer = self._load_animation(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not result_pointer:
            raise "Error in load_animation call. See official documentation for details."
        return result_pointer

    fn load_animation_io(
        self, src: Ptr[IOStream], closeio: Bool
    ) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadAnimation_IO
        """
        var result_pointer = self._load_animation_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise "Error in load_animation_io call. See official documentation for details."
        return result_pointer

    fn load_animation_typed_io(
        self, src: Ptr[IOStream], closeio: Bool, type: CStringSlice
    ) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadAnimationTyped_IO
        """
        var result_pointer = self._load_animation_typed_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise "Error in load_animation_typed_io call. See official documentation for details."
        return result_pointer

    fn load_ani_animation_io(
        self, src: Ptr[IOStream]
    ) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadANIAnimation_IO
        """
        var result_pointer = self._load_ani_animation_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_ani_animation_io call. See official documentation for details."
        return result_pointer

    fn load_apng_animation_io(
        self, src: Ptr[IOStream]
    ) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadAPNGAnimation_IO
        """
        var result_pointer = self._load_apng_animation_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_apng_animation_io call. See official documentation for details."
        return result_pointer

    fn load_avif_animation_io(
        self, src: Ptr[IOStream]
    ) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadAVIFAnimation_IO
        """
        var result_pointer = self._load_avif_animation_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_avif_animation_io call. See official documentation for details."
        return result_pointer

    fn load_gif_animation_io(
        self, src: Ptr[IOStream]
    ) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadGIFAnimation_IO
        """
        var result_pointer = self._load_gif_animation_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_gif_animation_io call. See official documentation for details."
        return result_pointer

    fn load_webp_animation_io(
        self, src: Ptr[IOStream]
    ) raises -> Ptr[IMG_Animation, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_LoadWEBPAnimation_IO
        """
        var result_pointer = self._load_webp_animation_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in load_webp_animation_io call. See official documentation for details."
        return result_pointer

    fn save_animation(self, anim: Ptr[IMG_Animation], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveAnimation
        """
        var success_status = self._save_animation(
            Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_animation_typed_io(
        self, anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool, type: CStringSlice
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveAnimationTyped_IO
        """
        var success_status = self._save_animation_typed_io(
            Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn save_ani_animation_io(
        self, anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveANIAnimation_IO
        """
        var success_status = self._save_ani_animation_io(
            Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_apng_animation_io(
        self, anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveAPNGAnimation_IO
        """
        var success_status = self._save_apng_animation_io(
            Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_avif_animation_io(
        self, anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool, quality: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveAVIFAnimation_IO
        """
        var success_status = self._save_avif_animation_io(
            Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=quality).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_gif_animation_io(
        self, anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveGIFAnimation_IO
        """
        var success_status = self._save_gif_animation_io(
            Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_webp_animation_io(
        self, anim: Ptr[IMG_Animation], dst: Ptr[IOStream], closeio: Bool, quality: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_SaveWEBPAnimation_IO
        """
        var success_status = self._save_webp_animation_io(
            Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=quality).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn create_animated_cursor(
        self, anim: Ptr[IMG_Animation], hot_x: Int32, hot_y: Int32
    ) raises -> Ptr[Cursor, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_CreateAnimatedCursor
        """
        var result_pointer = self._create_animated_cursor(
            Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[],
            Ptr(to=hot_x).bitcast[Int32]()[],
            Ptr(to=hot_y).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn free_animation(self, anim: Ptr[IMG_Animation]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_FreeAnimation
        """
        self._free_animation(Ptr(to=anim).bitcast[Ptr[IMG_Animation, MutExternalOrigin]]()[])

    fn create_animation_encoder(
        self, file: CStringSlice
    ) raises -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationEncoder
        """
        var result_pointer = self._create_animation_encoder(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_animation_encoder_io(
        self, dst: Ptr[IOStream], closeio: Bool, type: CStringSlice
    ) raises -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationEncoder_IO
        """
        var result_pointer = self._create_animation_encoder_io(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_animation_encoder_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[IMG_AnimationEncoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationEncoderWithProperties
        """
        var result_pointer = self._create_animation_encoder_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn add_animation_encoder_frame(
        self, encoder: Ptr[IMG_AnimationEncoder], surface: Ptr[Surface], duration: UInt64
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_AddAnimationEncoderFrame
        """
        var success_status = self._add_animation_encoder_frame(
            Ptr(to=encoder).bitcast[Ptr[IMG_AnimationEncoder, MutExternalOrigin]]()[],
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=duration).bitcast[UInt64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn close_animation_encoder(self, encoder: Ptr[IMG_AnimationEncoder]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_CloseAnimationEncoder
        """
        var success_status = self._close_animation_encoder(
            Ptr(to=encoder).bitcast[Ptr[IMG_AnimationEncoder, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn create_animation_decoder(
        self, file: CStringSlice
    ) raises -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationDecoder
        """
        var result_pointer = self._create_animation_decoder(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_animation_decoder_io(
        self, src: Ptr[IOStream], closeio: Bool, type: CStringSlice
    ) raises -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationDecoder_IO
        """
        var result_pointer = self._create_animation_decoder_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_animation_decoder_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[IMG_AnimationDecoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_CreateAnimationDecoderWithProperties
        """
        var result_pointer = self._create_animation_decoder_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_animation_decoder_properties(self, decoder: Ptr[IMG_AnimationDecoder]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_GetAnimationDecoderProperties
        """
        return self._get_animation_decoder_properties(
            Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[]
        )

    fn get_animation_decoder_frame(
        self,
        decoder: Ptr[IMG_AnimationDecoder],
        frame: Ptr[Ptr[Surface, MutExternalOrigin]],
        duration: Ptr[UInt64],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_GetAnimationDecoderFrame
        """
        var success_status = self._get_animation_decoder_frame(
            Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[],
            Ptr(to=frame).bitcast[Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]]()[],
            Ptr(to=duration).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_animation_decoder_status(
        self, decoder: Ptr[IMG_AnimationDecoder]
    ) -> IMG_AnimationDecoderStatus:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_GetAnimationDecoderStatus
        """
        return self._get_animation_decoder_status(
            Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[]
        )

    fn reset_animation_decoder(self, decoder: Ptr[IMG_AnimationDecoder]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_ResetAnimationDecoder
        """
        var success_status = self._reset_animation_decoder(
            Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn close_animation_decoder(self, decoder: Ptr[IMG_AnimationDecoder]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_image/IMG_CloseAnimationDecoder
        """
        var success_status = self._close_animation_decoder(
            Ptr(to=decoder).bitcast[Ptr[IMG_AnimationDecoder, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()
