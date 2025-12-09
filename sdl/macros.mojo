from memory import bitcast
from .constants import *
from .structs import *
from .enums import *


fn define_audio_format(signed: Bool, bigendian: Bool, flt: Bool, size: Int) -> AudioFormat:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_DEFINE_AUDIO_FORMAT
    """
    var value = (Int32(signed) << 15) | (Int32(bigendian) << 12) | (Int32(flt) << 8) | Int32(size & AUDIO_MASK_BITSIZE)
    return AudioFormat(value=value)


fn audio_bitsize(x: AudioFormat) -> Int:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_AUDIO_BITSIZE
    """
    return Int(x.value & AUDIO_MASK_BITSIZE)


fn audio_bytesize(x: AudioFormat) -> Int:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_AUDIO_BYTESIZE
    """
    return audio_bitsize(x) // 8


fn audio_isfloat(x: AudioFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_AUDIO_ISFLOAT
    """
    return (x.value & AUDIO_MASK_FLOAT) != 0


fn audio_isbigendian(x: AudioFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_AUDIO_ISBIGENDIAN
    """
    return (x.value & AUDIO_MASK_BIG_ENDIAN) != 0


fn audio_islittleendian(x: AudioFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_AUDIO_ISLITTLEENDIAN
    """
    return not audio_isbigendian(x)


fn audio_issigned(x: AudioFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_AUDIO_ISSIGNED
    """
    return (x.value & AUDIO_MASK_SIGNED) != 0


fn audio_isint(x: AudioFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_AUDIO_ISINT
    """
    return not audio_isfloat(x)


fn audio_isunsigned(x: AudioFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_AUDIO_ISUNSIGNED
    """
    return not audio_issigned(x)


fn audio_framesize(x: AudioSpec) -> Int:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_AUDIO_FRAMESIZE
    """
    return audio_bytesize(x.format) * Int(x.channels)


# omitting fn unsupported since it relies on SDL_SetError which we cannot call because it's an extern macro


# omitting fn invalidparamerror since it relies on SDL_SetError which we cannot call because it's an extern macro


fn scancode_to_keycode(x: Scancode) -> Keycode:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_SCANCODE_TO_KEYCODE
    """
    return bitcast[DType.uint32, 1](x.value) | KEY_SCANCODE_MASK


fn button_mask(x: MouseButtonFlags) -> UInt32:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_BUTTON_MASK
    """
    return 1 << (x - 1)


fn define_pixelfourcc(a: UInt8, b: UInt8, c: UInt8, d: UInt8) -> PixelFormat:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_DEFINE_PIXELFOURCC
    """
    var value = (Int32(a) << 0) | (Int32(b) << 8) | (Int32(c) << 16) | (Int32(d) << 24)
    return PixelFormat(value=value)


fn define_pixelformat(type: Int32, order: Int32, layout: Int32, bits: Int, bytes: Int) -> PixelFormat:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_DEFINE_PIXELFORMAT
    """
    var value = (1 << 28) | (type << 24) | (order << 20) | (layout << 16) | (bits << 8) | (bytes << 0)
    return PixelFormat(value=value)


fn pixelflag(format: PixelFormat) -> Int32:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_PIXELFLAG
    """
    return (format.value >> 28) & 0x0F


fn pixeltype(format: PixelFormat) -> PixelType:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_PIXELTYPE
    """
    return PixelType(value=(format.value >> 24) & 0x0F)


fn pixelorder(format: PixelFormat) -> Int32:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_PIXELORDER
    """
    return (format.value >> 20) & 0x0F


fn pixellayout(format: PixelFormat) -> Int32:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_PIXELLAYOUT
    """
    return (format.value >> 16) & 0x0F


fn bitsperpixel(format: PixelFormat) -> Int:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_BITSPERPIXEL
    """
    return Int((format.value >> 8) & 0xFF)


fn bytesperpixel(format: PixelFormat) -> Int:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_BYTESPERPIXEL
    """
    if not ispixelformat_fourcc(format):
        return Int(format.value & 0xFF)
    if format == PixelFormat.YUY2 or format == PixelFormat.UYVY or format == PixelFormat.YVYU:
        return 2
    return 1


fn ispixelformat_fourcc(format: PixelFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISPIXELFORMAT_FOURCC
    """
    return format.value and (pixelflag(format) != 1)


fn ispixelformat_indexed(format: PixelFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISPIXELFORMAT_INDEXED
    """
    if ispixelformat_fourcc(format):
        return False
    var pixel_type = pixeltype(format)
    return (
        pixel_type == PixelType.INDEX1
        or pixel_type == PixelType.INDEX2
        or pixel_type == PixelType.INDEX4
        or pixel_type == PixelType.INDEX8
    )


fn ispixelformat_packed(format: PixelFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISPIXELFORMAT_PACKED
    """
    if ispixelformat_fourcc(format):
        return False
    var pixel_type = pixeltype(format)
    return pixel_type == PixelType.PACKED8 or pixel_type == PixelType.PACKED16 or pixel_type == PixelType.PACKED32


fn ispixelformat_array(format: PixelFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISPIXELFORMAT_ARRAY
    """
    if ispixelformat_fourcc(format):
        return False
    var pixel_type = pixeltype(format)
    return (
        pixel_type == PixelType.ARRAYU8
        or pixel_type == PixelType.ARRAYU16
        or pixel_type == PixelType.ARRAYU32
        or pixel_type == PixelType.ARRAYF16
        or pixel_type == PixelType.ARRAYF32
    )


fn ispixelformat_10bit(format: PixelFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISPIXELFORMAT_10BIT
    """
    return (
        not ispixelformat_fourcc(format)
        and pixeltype(format) == PixelType.PACKED32
        and pixellayout(format) == PackedLayout.N_2101010.value
    )


fn ispixelformat_float(format: PixelFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISPIXELFORMAT_FLOAT
    """
    if ispixelformat_fourcc(format):
        return False
    var pixel_type = pixeltype(format)
    return pixel_type == PixelType.ARRAYF16 or pixel_type == PixelType.ARRAYF32


fn ispixelformat_alpha(format: PixelFormat) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISPIXELFORMAT_ALPHA
    """
    var pixel_order = pixelorder(format)
    var is_packed_alpha = ispixelformat_packed(format) and (
        pixel_order == PackedOrder.ARGB.value
        or pixel_order == PackedOrder.RGBA.value
        or pixel_order == PackedOrder.ABGR.value
        or pixel_order == PackedOrder.BGRA.value
    )
    var is_array_alpha = ispixelformat_array(format) and (
        pixel_order == ArrayOrder.ARGB.value
        or pixel_order == ArrayOrder.RGBA.value
        or pixel_order == ArrayOrder.ABGR.value
        or pixel_order == ArrayOrder.BGRA.value
    )
    return is_packed_alpha or is_array_alpha


fn define_colorspace(
    type: ColorType,
    range: ColorRange,
    primaries: ColorPrimaries,
    transfer: TransferCharacteristics,
    matrix: MatrixCoefficients,
    chroma: ChromaLocation,
) -> Colorspace:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_DEFINE_COLORSPACE
    """
    var value = (
        (type.value << 28) | (range.value << 24) | (chroma.value << 20)
        | (primaries.value << 10) | (transfer.value << 5) | (matrix.value << 0)
    )
    return Colorspace(value=value)


fn colorspacetype(cspace: Colorspace) -> ColorType:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_COLORSPACETYPE
    """
    return ColorType(value=(cspace.value >> 28) & 0x0F)


fn colorspacerange(cspace: Colorspace) -> ColorRange:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_COLORSPACERANGE
    """
    return ColorRange(value=(cspace.value >> 24) & 0x0F)


fn colorspacechroma(cspace: Colorspace) -> ChromaLocation:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_COLORSPACECHROMA
    """
    return ChromaLocation(value=(cspace.value >> 20) & 0x0F)


fn colorspaceprimaries(cspace: Colorspace) -> ColorPrimaries:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_COLORSPACEPRIMARIES
    """
    return ColorPrimaries(value=(cspace.value >> 10) & 0x1F)


fn colorspacetransfer(cspace: Colorspace) -> TransferCharacteristics:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_COLORSPACETRANSFER
    """
    return TransferCharacteristics(value=(cspace.value >> 5) & 0x1F)


fn colorspacematrix(cspace: Colorspace) -> MatrixCoefficients:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_COLORSPACEMATRIX
    """
    return MatrixCoefficients(value=(cspace.value >> 0) & 0x1F)


fn iscolorspace_matrix_bt601(cspace: Colorspace) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISCOLORSPACE_MATRIX_BT601
    """
    var matrix = colorspacematrix(cspace)
    return matrix == MatrixCoefficients.BT601 or matrix == MatrixCoefficients.BT470BG



fn iscolorspace_matrix_bt709(cspace: Colorspace) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISCOLORSPACE_MATRIX_BT709
    """
    return colorspacematrix(cspace) == MatrixCoefficients.BT709


fn iscolorspace_matrix_bt2020_ncl(cspace: Colorspace) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISCOLORSPACE_MATRIX_BT2020_NCL
    """
    return colorspacematrix(cspace) == MatrixCoefficients.BT2020_NCL


fn iscolorspace_limited_range(cspace: Colorspace) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISCOLORSPACE_LIMITED_RANGE
    """
    return colorspacerange(cspace) != ColorRange.FULL


fn iscolorspace_full_range(cspace: Colorspace) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_ISCOLORSPACE_FULL_RANGE
    """
    return colorspacerange(cspace) == ColorRange.FULL


fn mustlock(s: Surface) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_MUSTLOCK
    """
    return (s.flags & SURFACE_LOCK_NEEDED) == SURFACE_LOCK_NEEDED


fn seconds_to_ns[dtype: DType, size: Int, //](s: SIMD[dtype, size]) -> SIMD[dtype, size]:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_SECONDS_TO_NS
    """
    return s * 1_000_000_000


fn ns_to_seconds[dtype: DType, size: Int, //](s: SIMD[dtype, size]) -> SIMD[dtype, size]:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_NS_TO_SECONDS
    """
    @parameter
    if dtype.is_integral():
        return s // 1_000_000_000
    return s / 1_000_000_000


fn ms_to_ns[dtype: DType, size: Int, //](ms: SIMD[dtype, size]) -> SIMD[dtype, size]:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_MS_TO_NS
    """
    return ms * 1_000_000


fn ns_to_ms[dtype: DType, size: Int, //](ns: SIMD[dtype, size]) -> SIMD[dtype, size]:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_NS_TO_MS
    """
    @parameter
    if dtype.is_integral():
        return ns // 1_000_000
    return ns / 1_000_000


fn us_to_ns[dtype: DType, size: Int, //](us: SIMD[dtype, size]) -> SIMD[dtype, size]:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_US_TO_NS
    """
    return us * 1_000


fn ns_to_us[dtype: DType, size: Int, //](ns: SIMD[dtype, size]) -> SIMD[dtype, size]:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_NS_TO_US
    """
    @parameter
    if dtype.is_integral():
        return ns // 1_000
    return ns / 1_000


fn versionnum(major: Int, minor: Int, patch: Int) -> Int:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_VERSIONNUM
    """
    return major * 1_000_000 + minor * 1_000 + patch


fn versionnum_major(version: Int) -> Int:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_VERSIONNUM_MAJOR
    """
    return version // 1_000_000


fn versionnum_minor(version: Int) -> Int:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_VERSIONNUM_MINOR
    """
    return (version // 1_000) % 1_000


fn versionnum_micro(version: Int) -> Int:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_VERSIONNUM_MICRO
    """
    return version % 1_000


fn version_atleast(x: Int, y: Int, z: Int) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_VERSION_ATLEAST
    """
    return VERSION >= versionnum(x, y, z)


fn windowpos_undefined_display(x: DisplayID) -> DisplayID:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_WINDOWPOS_UNDEFINED_DISPLAY
    """
    return WINDOWPOS_UNDEFINED_MASK | x


fn windowpos_isundefined(x: DisplayID) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_WINDOWPOS_ISUNDEFINED
    """
    return (x & 0xFFFF0000) == WINDOWPOS_UNDEFINED_MASK


fn windowpos_centered_display(x: DisplayID) -> DisplayID:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_WINDOWPOS_CENTERED_DISPLAY
    """
    return WINDOWPOS_CENTERED_MASK | x


fn windowpos_iscentered(x: DisplayID) -> Bool:
    """See official documentation for details.

    https://wiki.libsdl.org/SDL3/SDL_WINDOWPOS_ISCENTERED
    """
    return (x & 0xFFFF0000) == WINDOWPOS_CENTERED_MASK