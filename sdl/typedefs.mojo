from .structs import *
from .misc import *
from ffi import c_char


comptime Ptr = UnsafePointer


comptime AudioDeviceID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AudioDeviceID
"""


struct AudioStream:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AudioStream
    """
    pass


comptime AudioStreamDataCompleteCallback = fn(Ptr[NoneType, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AudioStreamDataCompleteCallback
"""


comptime AudioStreamCallback = fn(Ptr[NoneType, MutExternalOrigin], Ptr[AudioStream, MutExternalOrigin], Int32, Int32) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AudioStreamCallback
"""


comptime AudioPostmixCallback = fn(Ptr[NoneType, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Ptr[Float32, MutExternalOrigin], Int32) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AudioPostmixCallback
"""


comptime BlendMode = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BlendMode
"""


comptime CameraID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_CameraID
"""


struct Camera:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Camera
    """
    pass


comptime ClipboardDataCallback = fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, ImmutExternalOrigin]
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_ClipboardDataCallback
"""


comptime ClipboardCleanupCallback = fn(Ptr[NoneType, MutExternalOrigin]) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_ClipboardCleanupCallback
"""


comptime EventFilter = fn(Ptr[NoneType, MutExternalOrigin], Ptr[Event, MutExternalOrigin]) -> Bool
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EventFilter
"""


comptime GlobFlags = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GlobFlags
"""


comptime EnumerateDirectoryCallback = fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin], CStringSlice[ImmutExternalOrigin]) -> EnumerationResult
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EnumerateDirectoryCallback
"""


struct Gamepad:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Gamepad
    """
    pass


struct GPUDevice:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUDevice
    """
    pass


struct GPUBuffer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUBuffer
    """
    pass


struct GPUTransferBuffer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTransferBuffer
    """
    pass


struct GPUTexture:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTexture
    """
    pass


struct GPUSampler:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSampler
    """
    pass


struct GPUShader:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUShader
    """
    pass


struct GPUComputePipeline:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUComputePipeline
    """
    pass


struct GPUGraphicsPipeline:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUGraphicsPipeline
    """
    pass


struct GPUCommandBuffer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUCommandBuffer
    """
    pass


struct GPURenderPass:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPURenderPass
    """
    pass


struct GPUComputePass:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUComputePass
    """
    pass


struct GPUCopyPass:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUCopyPass
    """
    pass


struct GPUFence:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUFence
    """
    pass


comptime GPUTextureUsageFlags = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPUTextureUsageFlags
"""


comptime GPUBufferUsageFlags = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPUBufferUsageFlags
"""


comptime GPUShaderFormat = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPUShaderFormat
"""


comptime GPUColorComponentFlags = UInt8
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPUColorComponentFlags
"""


struct Haptic:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Haptic
    """
    pass


comptime HapticEffectType = UInt16
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HapticEffectType
"""


comptime HapticDirectionType = UInt8
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HapticDirectionType
"""


comptime HapticEffectID = Int32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HapticEffectID
"""


struct HapticEffect:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticEffect
    """
    pass


comptime HapticID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HapticID
"""


comptime HintCallback = fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin], CStringSlice[ImmutExternalOrigin], CStringSlice[ImmutExternalOrigin]) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HintCallback
"""


comptime InitFlags = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_InitFlags
"""


comptime AppInit_func = fn(Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin], Int32, Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]) -> AppResult
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AppInit_func
"""


comptime AppIterate_func = fn(Ptr[NoneType, MutExternalOrigin]) -> AppResult
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AppIterate_func
"""


comptime AppEvent_func = fn(Ptr[NoneType, MutExternalOrigin], Ptr[Event, MutExternalOrigin]) -> AppResult
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AppEvent_func
"""


comptime AppQuit_func = fn(Ptr[NoneType, MutExternalOrigin], AppResult) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AppQuit_func
"""


comptime MainThreadCallback = fn(Ptr[NoneType, MutExternalOrigin]) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_MainThreadCallback
"""


struct IOStream:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOStream
    """
    pass


struct Joystick:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Joystick
    """
    pass


comptime JoystickID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_JoystickID
"""


comptime KeyboardID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KeyboardID
"""


comptime Keycode = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_Keycode
"""


comptime Keymod = UInt16
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_Keymod
"""


comptime LogOutputFunction = fn(Ptr[NoneType, MutExternalOrigin], Int32, LogPriority, CStringSlice[ImmutExternalOrigin]) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_LogOutputFunction
"""


comptime MouseID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_MouseID
"""


struct Cursor:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Cursor
    """
    pass


comptime MouseButtonFlags = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_MouseButtonFlags
"""


comptime MouseMotionTransformCallback = fn(Ptr[NoneType, MutExternalOrigin], UInt64, Ptr[Window, MutExternalOrigin], MouseID, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_MouseMotionTransformCallback
"""


comptime PenID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PenID
"""


comptime PenInputFlags = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PenInputFlags
"""


comptime PropertiesID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PropertiesID
"""


comptime CleanupPropertyCallback = fn(Ptr[NoneType, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_CleanupPropertyCallback
"""


comptime EnumeratePropertiesCallback = fn(Ptr[NoneType, MutExternalOrigin], PropertiesID, CStringSlice[ImmutExternalOrigin]) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EnumeratePropertiesCallback
"""


struct Renderer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Renderer
    """
    pass


struct GPURenderState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPURenderState
    """
    pass


struct Sensor:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Sensor
    """
    pass


comptime SensorID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_SensorID
"""


struct Storage:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Storage
    """
    pass


comptime SurfaceFlags = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_SurfaceFlags
"""


comptime TimerID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_TimerID
"""


comptime TimerCallback = fn(Ptr[NoneType, MutExternalOrigin], TimerID, UInt32) -> UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_TimerCallback
"""


comptime NSTimerCallback = fn(Ptr[NoneType, MutExternalOrigin], TimerID, UInt64) -> UInt64
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_NSTimerCallback
"""


comptime TouchID = UInt64
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_TouchID
"""


comptime FingerID = UInt64
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_FingerID
"""


comptime DisplayID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_DisplayID
"""


comptime WindowID = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WindowID
"""


struct DisplayModeData:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DisplayModeData
    """
    pass


struct Window:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Window
    """
    pass


comptime WindowFlags = UInt64
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WindowFlags
"""


comptime GLContext = Ptr[NoneType, MutExternalOrigin]
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GLContext
"""


comptime EGLDisplay = Ptr[NoneType, MutExternalOrigin]
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EGLDisplay
"""


comptime EGLConfig = Ptr[NoneType, MutExternalOrigin]
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EGLConfig
"""


comptime EGLSurface = Ptr[NoneType, MutExternalOrigin]
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EGLSurface
"""


comptime EGLAttrib = Int
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EGLAttrib
"""


comptime EGLint = Int32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EGLint
"""


comptime EGLAttribArrayCallback = fn(Ptr[NoneType, MutExternalOrigin]) -> Ptr[EGLAttrib, MutExternalOrigin]
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EGLAttribArrayCallback
"""


comptime EGLIntArrayCallback = fn(Ptr[NoneType, MutExternalOrigin], EGLDisplay, EGLConfig) -> Ptr[EGLint, MutExternalOrigin]
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_EGLIntArrayCallback
"""


comptime GLProfile = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GLProfile
"""


comptime GLContextFlag = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GLContextFlag
"""


comptime GLContextReleaseFlag = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GLContextReleaseFlag
"""


comptime GLContextResetNotification = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GLContextResetNotification
"""


comptime HitTest = fn(Ptr[Window, MutExternalOrigin], Ptr[Point, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> HitTestResult
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HitTest
"""


struct IMG_AnimationEncoder:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_AnimationEncoder
    """
    pass


struct IMG_AnimationDecoder:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_AnimationDecoder
    """
    pass


struct TTF_Font:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_Font
    """
    pass


comptime TTF_FontStyleFlags = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FontStyleFlags
"""


struct TTF_TextEngine:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_TextEngine
    """
    pass


struct TTF_TextData:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_TextData
    """
    pass


comptime TTF_SubStringFlags = UInt32
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_SubStringFlags
"""


struct MIX_Mixer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_Mixer
    """
    pass


struct MIX_Audio:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_Audio
    """
    pass


struct MIX_Track:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_Track
    """
    pass


struct MIX_Group:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_Group
    """
    pass


comptime MIX_TrackStoppedCallback = fn(Ptr[NoneType, MutExternalOrigin], Ptr[MIX_Track, MutExternalOrigin]) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_TrackStoppedCallback
"""


comptime MIX_TrackMixCallback = fn(Ptr[NoneType, MutExternalOrigin], Ptr[MIX_Track, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Ptr[Float32, MutExternalOrigin], Int32) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_TrackMixCallback
"""


comptime MIX_GroupMixCallback = fn(Ptr[NoneType, MutExternalOrigin], Ptr[MIX_Group, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Ptr[Float32, MutExternalOrigin], Int32) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_GroupMixCallback
"""


comptime MIX_PostMixCallback = fn(Ptr[NoneType, MutExternalOrigin], Ptr[MIX_Mixer, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Ptr[Float32, MutExternalOrigin], Int32) -> NoneType
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PostMixCallback
"""


struct MIX_AudioDecoder:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_AudioDecoder
    """
    pass
