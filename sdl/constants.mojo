from .typedefs import *
from .macros import *


comptime AUDIO_MASK_BITSIZE = 0xFF
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AUDIO_MASK_BITSIZE
"""


comptime AUDIO_MASK_FLOAT = 1 << 8
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AUDIO_MASK_FLOAT
"""


comptime AUDIO_MASK_BIG_ENDIAN = 1 << 12
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AUDIO_MASK_BIG_ENDIAN
"""


comptime AUDIO_MASK_SIGNED = 1 << 15
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AUDIO_MASK_SIGNED
"""


comptime AUDIO_DEVICE_DEFAULT_PLAYBACK = AudioDeviceID(0xFFFFFFFF)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK
"""


comptime AUDIO_DEVICE_DEFAULT_RECORDING = AudioDeviceID(0xFFFFFFFE)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_AUDIO_DEVICE_DEFAULT_RECORDING
"""


comptime PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN = "SDL.audiostream.auto_cleanup"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN
"""


comptime BLENDMODE_NONE = 0x00000000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BLENDMODE_NONE
"""


comptime BLENDMODE_BLEND = 0x00000001
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BLENDMODE_BLEND
"""


comptime BLENDMODE_BLEND_PREMULTIPLIED = 0x00000010
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BLENDMODE_BLEND_PREMULTIPLIED
"""


comptime BLENDMODE_ADD = 0x00000002
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BLENDMODE_ADD
"""


comptime BLENDMODE_ADD_PREMULTIPLIED = 0x00000020
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BLENDMODE_ADD_PREMULTIPLIED
"""


comptime BLENDMODE_MOD = 0x00000004
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BLENDMODE_MOD
"""


comptime BLENDMODE_MUL = 0x00000008
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BLENDMODE_MUL
"""


comptime BLENDMODE_INVALID = 0x7FFFFFFF
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BLENDMODE_INVALID
"""


comptime GLOB_CASEINSENSITIVE = 1 << 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GLOB_CASEINSENSITIVE
"""


comptime PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN = PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN
"""


comptime PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN = PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN
"""


comptime PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN = PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN
"""


comptime PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN = PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN
"""


comptime PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN = PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN
"""


comptime GPU_TEXTUREUSAGE_SAMPLER = 1 << 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_TEXTUREUSAGE_SAMPLER
"""


comptime GPU_TEXTUREUSAGE_COLOR_TARGET = 1 << 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_TEXTUREUSAGE_COLOR_TARGET
"""


comptime GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET = 1 << 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET
"""


comptime GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ = 1 << 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ
"""


comptime GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ = 1 << 4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ
"""


comptime GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE = 1 << 5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE
"""


comptime GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE = 1 << 6
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE
"""


comptime GPU_BUFFERUSAGE_VERTEX = 1 << 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_BUFFERUSAGE_VERTEX
"""


comptime GPU_BUFFERUSAGE_INDEX = 1 << 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_BUFFERUSAGE_INDEX
"""


comptime GPU_BUFFERUSAGE_INDIRECT = 1 << 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_BUFFERUSAGE_INDIRECT
"""


comptime GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ = 1 << 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ
"""


comptime GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ = 1 << 4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ
"""


comptime GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE = 1 << 5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE
"""


comptime GPU_SHADERFORMAT_INVALID = 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_SHADERFORMAT_INVALID
"""


comptime GPU_SHADERFORMAT_PRIVATE = 1 << 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_SHADERFORMAT_PRIVATE
"""


comptime GPU_SHADERFORMAT_SPIRV = 1 << 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_SHADERFORMAT_SPIRV
"""


comptime GPU_SHADERFORMAT_DXBC = 1 << 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_SHADERFORMAT_DXBC
"""


comptime GPU_SHADERFORMAT_DXIL = 1 << 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_SHADERFORMAT_DXIL
"""


comptime GPU_SHADERFORMAT_MSL = 1 << 4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_SHADERFORMAT_MSL
"""


comptime GPU_SHADERFORMAT_METALLIB = 1 << 5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_SHADERFORMAT_METALLIB
"""


comptime GPU_COLORCOMPONENT_R = 1 << 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_COLORCOMPONENT_R
"""


comptime GPU_COLORCOMPONENT_G = 1 << 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_COLORCOMPONENT_G
"""


comptime GPU_COLORCOMPONENT_B = 1 << 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_COLORCOMPONENT_B
"""


comptime GPU_COLORCOMPONENT_A = 1 << 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_COLORCOMPONENT_A
"""


comptime PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN = "SDL.gpu.device.create.debugmode"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN = "SDL.gpu.device.create.preferlowpower"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN = "SDL.gpu.device.create.verbose"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_NAME_STRING = "SDL.gpu.device.create.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING
"""


comptime PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN = "SDL.gpu.device.create.feature.clip_distance"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN = "SDL.gpu.device.create.feature.depth_clamping"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN = "SDL.gpu.device.create.feature.indirect_draw_first_instance"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN = "SDL.gpu.device.create.feature.anisotropy"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN = "SDL.gpu.device.create.shaders.private"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN = "SDL.gpu.device.create.shaders.spirv"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN = "SDL.gpu.device.create.shaders.dxbc"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN = "SDL.gpu.device.create.shaders.dxil"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN = "SDL.gpu.device.create.shaders.msl"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN = "SDL.gpu.device.create.shaders.metallib"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN = "SDL.gpu.device.create.d3d12.allowtier1resourcebinding"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING = "SDL.gpu.device.create.d3d12.semantic"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING
"""


comptime PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER = "SDL.gpu.device.create.d3d12.agility_sdk_version"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER
"""


comptime PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING = "SDL.gpu.device.create.d3d12.agility_sdk_path"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING
"""


comptime PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN = "SDL.gpu.device.create.vulkan.requirehardwareacceleration"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN
"""


comptime PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER = "SDL.gpu.device.create.vulkan.options"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER
"""


comptime PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN = "SDL.gpu.device.create.metal.allowmacfamily1"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN
"""


comptime PROP_GPU_DEVICE_NAME_STRING = "SDL.gpu.device.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_NAME_STRING
"""


comptime PROP_GPU_DEVICE_DRIVER_NAME_STRING = "SDL.gpu.device.driver_name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING
"""


comptime PROP_GPU_DEVICE_DRIVER_VERSION_STRING = "SDL.gpu.device.driver_version"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING
"""


comptime PROP_GPU_DEVICE_DRIVER_INFO_STRING = "SDL.gpu.device.driver_info"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING
"""


comptime PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING = "SDL.gpu.computepipeline.create.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING
"""


comptime PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING = "SDL.gpu.graphicspipeline.create.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING
"""


comptime PROP_GPU_SAMPLER_CREATE_NAME_STRING = "SDL.gpu.sampler.create.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING
"""


comptime PROP_GPU_SHADER_CREATE_NAME_STRING = "SDL.gpu.shader.create.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_SHADER_CREATE_NAME_STRING
"""


comptime PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT = "SDL.gpu.texture.create.d3d12.clear.r"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT
"""


comptime PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT = "SDL.gpu.texture.create.d3d12.clear.g"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT
"""


comptime PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT = "SDL.gpu.texture.create.d3d12.clear.b"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT
"""


comptime PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT = "SDL.gpu.texture.create.d3d12.clear.a"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT
"""


comptime PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT = "SDL.gpu.texture.create.d3d12.clear.depth"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT
"""


comptime PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER = "SDL.gpu.texture.create.d3d12.clear.stencil"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER
"""


comptime PROP_GPU_TEXTURE_CREATE_NAME_STRING = "SDL.gpu.texture.create.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING
"""


comptime PROP_GPU_BUFFER_CREATE_NAME_STRING = "SDL.gpu.buffer.create.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING
"""


comptime PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING = "SDL.gpu.transferbuffer.create.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING
"""


comptime HAPTIC_INFINITY = 4294967295
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_INFINITY
"""


comptime HAPTIC_CONSTANT = 1 << 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_CONSTANT
"""


comptime HAPTIC_SINE = 1 << 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_SINE
"""


comptime HAPTIC_SQUARE = 1 << 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_SQUARE
"""


comptime HAPTIC_TRIANGLE = 1 << 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_TRIANGLE
"""


comptime HAPTIC_SAWTOOTHUP = 1 << 4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_SAWTOOTHUP
"""


comptime HAPTIC_SAWTOOTHDOWN = 1 << 5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_SAWTOOTHDOWN
"""


comptime HAPTIC_RAMP = 1 << 6
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_RAMP
"""


comptime HAPTIC_SPRING = 1 << 7
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_SPRING
"""


comptime HAPTIC_DAMPER = 1 << 8
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_DAMPER
"""


comptime HAPTIC_INERTIA = 1 << 9
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_INERTIA
"""


comptime HAPTIC_FRICTION = 1 << 10
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_FRICTION
"""


comptime HAPTIC_LEFTRIGHT = 1 << 11
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_LEFTRIGHT
"""


comptime HAPTIC_RESERVED1 = 1 << 12
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_RESERVED1
"""


comptime HAPTIC_RESERVED2 = 1 << 13
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_RESERVED2
"""


comptime HAPTIC_RESERVED3 = 1 << 14
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_RESERVED3
"""


comptime HAPTIC_CUSTOM = 1 << 15
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_CUSTOM
"""


comptime HAPTIC_GAIN = 1 << 16
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_GAIN
"""


comptime HAPTIC_AUTOCENTER = 1 << 17
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_AUTOCENTER
"""


comptime HAPTIC_STATUS = 1 << 18
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_STATUS
"""


comptime HAPTIC_PAUSE = 1 << 19
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_PAUSE
"""


comptime HAPTIC_POLAR = 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_POLAR
"""


comptime HAPTIC_CARTESIAN = 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_CARTESIAN
"""


comptime HAPTIC_SPHERICAL = 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_SPHERICAL
"""


comptime HAPTIC_STEERING_AXIS = 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAPTIC_STEERING_AXIS
"""


comptime HINT_ALLOW_ALT_TAB_WHILE_GRABBED = "SDL_ALLOW_ALT_TAB_WHILE_GRABBED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
"""


comptime HINT_ANDROID_ALLOW_RECREATE_ACTIVITY = "SDL_ANDROID_ALLOW_RECREATE_ACTIVITY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ANDROID_ALLOW_RECREATE_ACTIVITY
"""


comptime HINT_ANDROID_BLOCK_ON_PAUSE = "SDL_ANDROID_BLOCK_ON_PAUSE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ANDROID_BLOCK_ON_PAUSE
"""


comptime HINT_ANDROID_LOW_LATENCY_AUDIO = "SDL_ANDROID_LOW_LATENCY_AUDIO"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ANDROID_LOW_LATENCY_AUDIO
"""


comptime HINT_ANDROID_TRAP_BACK_BUTTON = "SDL_ANDROID_TRAP_BACK_BUTTON"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ANDROID_TRAP_BACK_BUTTON
"""


comptime HINT_APP_ID = "SDL_APP_ID"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_APP_ID
"""


comptime HINT_APP_NAME = "SDL_APP_NAME"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_APP_NAME
"""


comptime HINT_APPLE_TV_CONTROLLER_UI_EVENTS = "SDL_APPLE_TV_CONTROLLER_UI_EVENTS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS
"""


comptime HINT_APPLE_TV_REMOTE_ALLOW_ROTATION = "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION
"""


comptime HINT_AUDIO_ALSA_DEFAULT_DEVICE = "SDL_AUDIO_ALSA_DEFAULT_DEVICE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_ALSA_DEFAULT_DEVICE
"""


comptime HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE = "SDL_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE
"""


comptime HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE = "SDL_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE
"""


comptime HINT_AUDIO_CATEGORY = "SDL_AUDIO_CATEGORY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_CATEGORY
"""


comptime HINT_AUDIO_CHANNELS = "SDL_AUDIO_CHANNELS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_CHANNELS
"""


comptime HINT_AUDIO_DEVICE_APP_ICON_NAME = "SDL_AUDIO_DEVICE_APP_ICON_NAME"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DEVICE_APP_ICON_NAME
"""


comptime HINT_AUDIO_DEVICE_SAMPLE_FRAMES = "SDL_AUDIO_DEVICE_SAMPLE_FRAMES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DEVICE_SAMPLE_FRAMES
"""


comptime HINT_AUDIO_DEVICE_STREAM_NAME = "SDL_AUDIO_DEVICE_STREAM_NAME"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DEVICE_STREAM_NAME
"""


comptime HINT_AUDIO_DEVICE_STREAM_ROLE = "SDL_AUDIO_DEVICE_STREAM_ROLE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DEVICE_STREAM_ROLE
"""


comptime HINT_AUDIO_DEVICE_RAW_STREAM = "SDL_AUDIO_DEVICE_RAW_STREAM"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DEVICE_RAW_STREAM
"""


comptime HINT_AUDIO_DISK_INPUT_FILE = "SDL_AUDIO_DISK_INPUT_FILE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DISK_INPUT_FILE
"""


comptime HINT_AUDIO_DISK_OUTPUT_FILE = "SDL_AUDIO_DISK_OUTPUT_FILE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DISK_OUTPUT_FILE
"""


comptime HINT_AUDIO_DISK_TIMESCALE = "SDL_AUDIO_DISK_TIMESCALE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DISK_TIMESCALE
"""


comptime HINT_AUDIO_DRIVER = "SDL_AUDIO_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DRIVER
"""


comptime HINT_AUDIO_DUMMY_TIMESCALE = "SDL_AUDIO_DUMMY_TIMESCALE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_DUMMY_TIMESCALE
"""


comptime HINT_AUDIO_FORMAT = "SDL_AUDIO_FORMAT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_FORMAT
"""


comptime HINT_AUDIO_FREQUENCY = "SDL_AUDIO_FREQUENCY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_FREQUENCY
"""


comptime HINT_AUDIO_INCLUDE_MONITORS = "SDL_AUDIO_INCLUDE_MONITORS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUDIO_INCLUDE_MONITORS
"""


comptime HINT_AUTO_UPDATE_JOYSTICKS = "SDL_AUTO_UPDATE_JOYSTICKS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUTO_UPDATE_JOYSTICKS
"""


comptime HINT_AUTO_UPDATE_SENSORS = "SDL_AUTO_UPDATE_SENSORS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_AUTO_UPDATE_SENSORS
"""


comptime HINT_BMP_SAVE_LEGACY_FORMAT = "SDL_BMP_SAVE_LEGACY_FORMAT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_BMP_SAVE_LEGACY_FORMAT
"""


comptime HINT_CAMERA_DRIVER = "SDL_CAMERA_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_CAMERA_DRIVER
"""


comptime HINT_CPU_FEATURE_MASK = "SDL_CPU_FEATURE_MASK"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_CPU_FEATURE_MASK
"""


comptime HINT_JOYSTICK_DIRECTINPUT = "SDL_JOYSTICK_DIRECTINPUT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_DIRECTINPUT
"""


comptime HINT_FILE_DIALOG_DRIVER = "SDL_FILE_DIALOG_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_FILE_DIALOG_DRIVER
"""


comptime HINT_DISPLAY_USABLE_BOUNDS = "SDL_DISPLAY_USABLE_BOUNDS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_DISPLAY_USABLE_BOUNDS
"""


comptime HINT_INVALID_PARAM_CHECKS = "SDL_INVALID_PARAM_CHECKS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_INVALID_PARAM_CHECKS
"""


comptime HINT_EMSCRIPTEN_ASYNCIFY = "SDL_EMSCRIPTEN_ASYNCIFY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_EMSCRIPTEN_ASYNCIFY
"""


comptime HINT_EMSCRIPTEN_CANVAS_SELECTOR = "SDL_EMSCRIPTEN_CANVAS_SELECTOR"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_EMSCRIPTEN_CANVAS_SELECTOR
"""


comptime HINT_EMSCRIPTEN_KEYBOARD_ELEMENT = "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT
"""


comptime HINT_ENABLE_SCREEN_KEYBOARD = "SDL_ENABLE_SCREEN_KEYBOARD"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ENABLE_SCREEN_KEYBOARD
"""


comptime HINT_EVDEV_DEVICES = "SDL_EVDEV_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_EVDEV_DEVICES
"""


comptime HINT_EVENT_LOGGING = "SDL_EVENT_LOGGING"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_EVENT_LOGGING
"""


comptime HINT_FORCE_RAISEWINDOW = "SDL_FORCE_RAISEWINDOW"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_FORCE_RAISEWINDOW
"""


comptime HINT_FRAMEBUFFER_ACCELERATION = "SDL_FRAMEBUFFER_ACCELERATION"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_FRAMEBUFFER_ACCELERATION
"""


comptime HINT_GAMECONTROLLERCONFIG = "SDL_GAMECONTROLLERCONFIG"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GAMECONTROLLERCONFIG
"""


comptime HINT_GAMECONTROLLERCONFIG_FILE = "SDL_GAMECONTROLLERCONFIG_FILE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GAMECONTROLLERCONFIG_FILE
"""


comptime HINT_GAMECONTROLLERTYPE = "SDL_GAMECONTROLLERTYPE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GAMECONTROLLERTYPE
"""


comptime HINT_GAMECONTROLLER_IGNORE_DEVICES = "SDL_GAMECONTROLLER_IGNORE_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES
"""


comptime HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT = "SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT
"""


comptime HINT_GAMECONTROLLER_SENSOR_FUSION = "SDL_GAMECONTROLLER_SENSOR_FUSION"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GAMECONTROLLER_SENSOR_FUSION
"""


comptime HINT_GDK_TEXTINPUT_DEFAULT_TEXT = "SDL_GDK_TEXTINPUT_DEFAULT_TEXT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GDK_TEXTINPUT_DEFAULT_TEXT
"""


comptime HINT_GDK_TEXTINPUT_DESCRIPTION = "SDL_GDK_TEXTINPUT_DESCRIPTION"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GDK_TEXTINPUT_DESCRIPTION
"""


comptime HINT_GDK_TEXTINPUT_MAX_LENGTH = "SDL_GDK_TEXTINPUT_MAX_LENGTH"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GDK_TEXTINPUT_MAX_LENGTH
"""


comptime HINT_GDK_TEXTINPUT_SCOPE = "SDL_GDK_TEXTINPUT_SCOPE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GDK_TEXTINPUT_SCOPE
"""


comptime HINT_GDK_TEXTINPUT_TITLE = "SDL_GDK_TEXTINPUT_TITLE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GDK_TEXTINPUT_TITLE
"""


comptime HINT_HIDAPI_LIBUSB = "SDL_HIDAPI_LIBUSB"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_HIDAPI_LIBUSB
"""


comptime HINT_HIDAPI_LIBUSB_GAMECUBE = "SDL_HIDAPI_LIBUSB_GAMECUBE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_HIDAPI_LIBUSB_GAMECUBE
"""


comptime HINT_HIDAPI_LIBUSB_WHITELIST = "SDL_HIDAPI_LIBUSB_WHITELIST"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_HIDAPI_LIBUSB_WHITELIST
"""


comptime HINT_HIDAPI_UDEV = "SDL_HIDAPI_UDEV"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_HIDAPI_UDEV
"""


comptime HINT_GPU_DRIVER = "SDL_GPU_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_GPU_DRIVER
"""


comptime HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS = "SDL_HIDAPI_ENUMERATE_ONLY_CONTROLLERS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS
"""


comptime HINT_HIDAPI_IGNORE_DEVICES = "SDL_HIDAPI_IGNORE_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_HIDAPI_IGNORE_DEVICES
"""


comptime HINT_IME_IMPLEMENTED_UI = "SDL_IME_IMPLEMENTED_UI"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_IME_IMPLEMENTED_UI
"""


comptime HINT_IOS_HIDE_HOME_INDICATOR = "SDL_IOS_HIDE_HOME_INDICATOR"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_IOS_HIDE_HOME_INDICATOR
"""


comptime HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS = "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS
"""


comptime HINT_JOYSTICK_ARCADESTICK_DEVICES = "SDL_JOYSTICK_ARCADESTICK_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_ARCADESTICK_DEVICES
"""


comptime HINT_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED = "SDL_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED
"""


comptime HINT_JOYSTICK_BLACKLIST_DEVICES = "SDL_JOYSTICK_BLACKLIST_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_BLACKLIST_DEVICES
"""


comptime HINT_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED = "SDL_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED
"""


comptime HINT_JOYSTICK_DEVICE = "SDL_JOYSTICK_DEVICE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_DEVICE
"""


comptime HINT_JOYSTICK_ENHANCED_REPORTS = "SDL_JOYSTICK_ENHANCED_REPORTS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_ENHANCED_REPORTS
"""


comptime HINT_JOYSTICK_FLIGHTSTICK_DEVICES = "SDL_JOYSTICK_FLIGHTSTICK_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES
"""


comptime HINT_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED = "SDL_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED
"""


comptime HINT_JOYSTICK_GAMEINPUT = "SDL_JOYSTICK_GAMEINPUT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_GAMEINPUT
"""


comptime HINT_JOYSTICK_GAMECUBE_DEVICES = "SDL_JOYSTICK_GAMECUBE_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_GAMECUBE_DEVICES
"""


comptime HINT_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED = "SDL_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED
"""


comptime HINT_JOYSTICK_HIDAPI = "SDL_JOYSTICK_HIDAPI"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI
"""


comptime HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS = "SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS
"""


comptime HINT_JOYSTICK_HIDAPI_GAMECUBE = "SDL_JOYSTICK_HIDAPI_GAMECUBE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE
"""


comptime HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE = "SDL_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE
"""


comptime HINT_JOYSTICK_HIDAPI_JOY_CONS = "SDL_JOYSTICK_HIDAPI_JOY_CONS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS
"""


comptime HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED = "SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED
"""


comptime HINT_JOYSTICK_HIDAPI_LUNA = "SDL_JOYSTICK_HIDAPI_LUNA"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_LUNA
"""


comptime HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC = "SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC
"""


comptime HINT_JOYSTICK_HIDAPI_PS3 = "SDL_JOYSTICK_HIDAPI_PS3"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_PS3
"""


comptime HINT_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER = "SDL_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER
"""


comptime HINT_JOYSTICK_HIDAPI_PS4 = "SDL_JOYSTICK_HIDAPI_PS4"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_PS4
"""


comptime HINT_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL = "SDL_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL
"""


comptime HINT_JOYSTICK_HIDAPI_PS5 = "SDL_JOYSTICK_HIDAPI_PS5"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_PS5
"""


comptime HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_PS5_PLAYER_LED
"""


comptime HINT_JOYSTICK_HIDAPI_SHIELD = "SDL_JOYSTICK_HIDAPI_SHIELD"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_SHIELD
"""


comptime HINT_JOYSTICK_HIDAPI_STADIA = "SDL_JOYSTICK_HIDAPI_STADIA"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_STADIA
"""


comptime HINT_JOYSTICK_HIDAPI_STEAM = "SDL_JOYSTICK_HIDAPI_STEAM"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_STEAM
"""


comptime HINT_JOYSTICK_HIDAPI_STEAM_HOME_LED = "SDL_JOYSTICK_HIDAPI_STEAM_HOME_LED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_STEAM_HOME_LED
"""


comptime HINT_JOYSTICK_HIDAPI_STEAMDECK = "SDL_JOYSTICK_HIDAPI_STEAMDECK"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_STEAMDECK
"""


comptime HINT_JOYSTICK_HIDAPI_STEAM_HORI = "SDL_JOYSTICK_HIDAPI_STEAM_HORI"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_STEAM_HORI
"""


comptime HINT_JOYSTICK_HIDAPI_LG4FF = "SDL_JOYSTICK_HIDAPI_LG4FF"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_LG4FF
"""


comptime HINT_JOYSTICK_HIDAPI_8BITDO = "SDL_JOYSTICK_HIDAPI_8BITDO"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_8BITDO
"""


comptime HINT_JOYSTICK_HIDAPI_SINPUT = "SDL_JOYSTICK_HIDAPI_SINPUT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_SINPUT
"""


comptime HINT_JOYSTICK_HIDAPI_ZUIKI = "SDL_JOYSTICK_HIDAPI_ZUIKI"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_ZUIKI
"""


comptime HINT_JOYSTICK_HIDAPI_FLYDIGI = "SDL_JOYSTICK_HIDAPI_FLYDIGI"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_FLYDIGI
"""


comptime HINT_JOYSTICK_HIDAPI_SWITCH = "SDL_JOYSTICK_HIDAPI_SWITCH"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_SWITCH
"""


comptime HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED = "SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED
"""


comptime HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED
"""


comptime HINT_JOYSTICK_HIDAPI_SWITCH2 = "SDL_JOYSTICK_HIDAPI_SWITCH2"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_SWITCH2
"""


comptime HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS = "SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS
"""


comptime HINT_JOYSTICK_HIDAPI_WII = "SDL_JOYSTICK_HIDAPI_WII"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_WII
"""


comptime HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED
"""


comptime HINT_JOYSTICK_HIDAPI_XBOX = "SDL_JOYSTICK_HIDAPI_XBOX"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_XBOX
"""


comptime HINT_JOYSTICK_HIDAPI_XBOX_360 = "SDL_JOYSTICK_HIDAPI_XBOX_360"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_XBOX_360
"""


comptime HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED = "SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED
"""


comptime HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS = "SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS
"""


comptime HINT_JOYSTICK_HIDAPI_XBOX_ONE = "SDL_JOYSTICK_HIDAPI_XBOX_ONE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE
"""


comptime HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED = "SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED
"""


comptime HINT_JOYSTICK_HIDAPI_GIP = "SDL_JOYSTICK_HIDAPI_GIP"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_GIP
"""


comptime HINT_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA = "SDL_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA
"""


comptime HINT_JOYSTICK_IOKIT = "SDL_JOYSTICK_IOKIT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_IOKIT
"""


comptime HINT_JOYSTICK_LINUX_CLASSIC = "SDL_JOYSTICK_LINUX_CLASSIC"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_LINUX_CLASSIC
"""


comptime HINT_JOYSTICK_LINUX_DEADZONES = "SDL_JOYSTICK_LINUX_DEADZONES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_LINUX_DEADZONES
"""


comptime HINT_JOYSTICK_LINUX_DIGITAL_HATS = "SDL_JOYSTICK_LINUX_DIGITAL_HATS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_LINUX_DIGITAL_HATS
"""


comptime HINT_JOYSTICK_LINUX_HAT_DEADZONES = "SDL_JOYSTICK_LINUX_HAT_DEADZONES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_LINUX_HAT_DEADZONES
"""


comptime HINT_JOYSTICK_MFI = "SDL_JOYSTICK_MFI"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_MFI
"""


comptime HINT_JOYSTICK_RAWINPUT = "SDL_JOYSTICK_RAWINPUT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_RAWINPUT
"""


comptime HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT = "SDL_JOYSTICK_RAWINPUT_CORRELATE_XINPUT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_RAWINPUT_CORRELATE_XINPUT
"""


comptime HINT_JOYSTICK_ROG_CHAKRAM = "SDL_JOYSTICK_ROG_CHAKRAM"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_ROG_CHAKRAM
"""


comptime HINT_JOYSTICK_THREAD = "SDL_JOYSTICK_THREAD"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_THREAD
"""


comptime HINT_JOYSTICK_THROTTLE_DEVICES = "SDL_JOYSTICK_THROTTLE_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_THROTTLE_DEVICES
"""


comptime HINT_JOYSTICK_THROTTLE_DEVICES_EXCLUDED = "SDL_JOYSTICK_THROTTLE_DEVICES_EXCLUDED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_THROTTLE_DEVICES_EXCLUDED
"""


comptime HINT_JOYSTICK_WGI = "SDL_JOYSTICK_WGI"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_WGI
"""


comptime HINT_JOYSTICK_WHEEL_DEVICES = "SDL_JOYSTICK_WHEEL_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_WHEEL_DEVICES
"""


comptime HINT_JOYSTICK_WHEEL_DEVICES_EXCLUDED = "SDL_JOYSTICK_WHEEL_DEVICES_EXCLUDED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_WHEEL_DEVICES_EXCLUDED
"""


comptime HINT_JOYSTICK_ZERO_CENTERED_DEVICES = "SDL_JOYSTICK_ZERO_CENTERED_DEVICES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_ZERO_CENTERED_DEVICES
"""


comptime HINT_JOYSTICK_HAPTIC_AXES = "SDL_JOYSTICK_HAPTIC_AXES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_JOYSTICK_HAPTIC_AXES
"""


comptime HINT_KEYCODE_OPTIONS = "SDL_KEYCODE_OPTIONS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_KEYCODE_OPTIONS
"""


comptime HINT_KMSDRM_DEVICE_INDEX = "SDL_KMSDRM_DEVICE_INDEX"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_KMSDRM_DEVICE_INDEX
"""


comptime HINT_KMSDRM_REQUIRE_DRM_MASTER = "SDL_KMSDRM_REQUIRE_DRM_MASTER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_KMSDRM_REQUIRE_DRM_MASTER
"""


comptime HINT_KMSDRM_ATOMIC = "SDL_KMSDRM_ATOMIC"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_KMSDRM_ATOMIC
"""


comptime HINT_LOGGING = "SDL_LOGGING"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_LOGGING
"""


comptime HINT_MAC_BACKGROUND_APP = "SDL_MAC_BACKGROUND_APP"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MAC_BACKGROUND_APP
"""


comptime HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK = "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK
"""


comptime HINT_MAC_OPENGL_ASYNC_DISPATCH = "SDL_MAC_OPENGL_ASYNC_DISPATCH"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH
"""


comptime HINT_MAC_OPTION_AS_ALT = "SDL_MAC_OPTION_AS_ALT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MAC_OPTION_AS_ALT
"""


comptime HINT_MAC_SCROLL_MOMENTUM = "SDL_MAC_SCROLL_MOMENTUM"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MAC_SCROLL_MOMENTUM
"""


comptime HINT_MAC_PRESS_AND_HOLD = "SDL_MAC_PRESS_AND_HOLD"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MAC_PRESS_AND_HOLD
"""


comptime HINT_MAIN_CALLBACK_RATE = "SDL_MAIN_CALLBACK_RATE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MAIN_CALLBACK_RATE
"""


comptime HINT_MOUSE_AUTO_CAPTURE = "SDL_MOUSE_AUTO_CAPTURE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_AUTO_CAPTURE
"""


comptime HINT_MOUSE_DOUBLE_CLICK_RADIUS = "SDL_MOUSE_DOUBLE_CLICK_RADIUS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS
"""


comptime HINT_MOUSE_DOUBLE_CLICK_TIME = "SDL_MOUSE_DOUBLE_CLICK_TIME"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_DOUBLE_CLICK_TIME
"""


comptime HINT_MOUSE_DEFAULT_SYSTEM_CURSOR = "SDL_MOUSE_DEFAULT_SYSTEM_CURSOR"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_DEFAULT_SYSTEM_CURSOR
"""


comptime HINT_MOUSE_DPI_SCALE_CURSORS = "SDL_MOUSE_DPI_SCALE_CURSORS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_DPI_SCALE_CURSORS
"""


comptime HINT_MOUSE_EMULATE_WARP_WITH_RELATIVE = "SDL_MOUSE_EMULATE_WARP_WITH_RELATIVE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_EMULATE_WARP_WITH_RELATIVE
"""


comptime HINT_MOUSE_FOCUS_CLICKTHROUGH = "SDL_MOUSE_FOCUS_CLICKTHROUGH"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH
"""


comptime HINT_MOUSE_NORMAL_SPEED_SCALE = "SDL_MOUSE_NORMAL_SPEED_SCALE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_NORMAL_SPEED_SCALE
"""


comptime HINT_MOUSE_RELATIVE_MODE_CENTER = "SDL_MOUSE_RELATIVE_MODE_CENTER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_RELATIVE_MODE_CENTER
"""


comptime HINT_MOUSE_RELATIVE_SPEED_SCALE = "SDL_MOUSE_RELATIVE_SPEED_SCALE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE
"""


comptime HINT_MOUSE_RELATIVE_SYSTEM_SCALE = "SDL_MOUSE_RELATIVE_SYSTEM_SCALE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE
"""


comptime HINT_MOUSE_RELATIVE_WARP_MOTION = "SDL_MOUSE_RELATIVE_WARP_MOTION"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_RELATIVE_WARP_MOTION
"""


comptime HINT_MOUSE_RELATIVE_CURSOR_VISIBLE = "SDL_MOUSE_RELATIVE_CURSOR_VISIBLE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_RELATIVE_CURSOR_VISIBLE
"""


comptime HINT_MOUSE_TOUCH_EVENTS = "SDL_MOUSE_TOUCH_EVENTS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MOUSE_TOUCH_EVENTS
"""


comptime HINT_MUTE_CONSOLE_KEYBOARD = "SDL_MUTE_CONSOLE_KEYBOARD"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_MUTE_CONSOLE_KEYBOARD
"""


comptime HINT_NO_SIGNAL_HANDLERS = "SDL_NO_SIGNAL_HANDLERS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_NO_SIGNAL_HANDLERS
"""


comptime HINT_OPENGL_LIBRARY = "SDL_OPENGL_LIBRARY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_OPENGL_LIBRARY
"""


comptime HINT_EGL_LIBRARY = "SDL_EGL_LIBRARY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_EGL_LIBRARY
"""


comptime HINT_OPENGL_ES_DRIVER = "SDL_OPENGL_ES_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_OPENGL_ES_DRIVER
"""


comptime HINT_OPENGL_FORCE_SRGB_FRAMEBUFFER = "SDL_OPENGL_FORCE_SRGB_FRAMEBUFFER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_OPENGL_FORCE_SRGB_FRAMEBUFFER
"""


comptime HINT_OPENVR_LIBRARY = "SDL_OPENVR_LIBRARY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_OPENVR_LIBRARY
"""


comptime HINT_ORIENTATIONS = "SDL_ORIENTATIONS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ORIENTATIONS
"""


comptime HINT_POLL_SENTINEL = "SDL_POLL_SENTINEL"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_POLL_SENTINEL
"""


comptime HINT_PREFERRED_LOCALES = "SDL_PREFERRED_LOCALES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_PREFERRED_LOCALES
"""


comptime HINT_QUIT_ON_LAST_WINDOW_CLOSE = "SDL_QUIT_ON_LAST_WINDOW_CLOSE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE
"""


comptime HINT_RENDER_DIRECT3D_THREADSAFE = "SDL_RENDER_DIRECT3D_THREADSAFE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_DIRECT3D_THREADSAFE
"""


comptime HINT_RENDER_DIRECT3D11_DEBUG = "SDL_RENDER_DIRECT3D11_DEBUG"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_DIRECT3D11_DEBUG
"""


comptime HINT_RENDER_DIRECT3D11_WARP = "SDL_RENDER_DIRECT3D11_WARP"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_DIRECT3D11_WARP
"""


comptime HINT_RENDER_VULKAN_DEBUG = "SDL_RENDER_VULKAN_DEBUG"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_VULKAN_DEBUG
"""


comptime HINT_RENDER_GPU_DEBUG = "SDL_RENDER_GPU_DEBUG"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_GPU_DEBUG
"""


comptime HINT_RENDER_GPU_LOW_POWER = "SDL_RENDER_GPU_LOW_POWER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_GPU_LOW_POWER
"""


comptime HINT_RENDER_DRIVER = "SDL_RENDER_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_DRIVER
"""


comptime HINT_RENDER_LINE_METHOD = "SDL_RENDER_LINE_METHOD"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_LINE_METHOD
"""


comptime HINT_RENDER_METAL_PREFER_LOW_POWER_DEVICE = "SDL_RENDER_METAL_PREFER_LOW_POWER_DEVICE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_METAL_PREFER_LOW_POWER_DEVICE
"""


comptime HINT_RENDER_VSYNC = "SDL_RENDER_VSYNC"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RENDER_VSYNC
"""


comptime HINT_RETURN_KEY_HIDES_IME = "SDL_RETURN_KEY_HIDES_IME"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RETURN_KEY_HIDES_IME
"""


comptime HINT_ROG_GAMEPAD_MICE = "SDL_ROG_GAMEPAD_MICE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ROG_GAMEPAD_MICE
"""


comptime HINT_ROG_GAMEPAD_MICE_EXCLUDED = "SDL_ROG_GAMEPAD_MICE_EXCLUDED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ROG_GAMEPAD_MICE_EXCLUDED
"""


comptime HINT_PS2_GS_WIDTH = "SDL_PS2_GS_WIDTH"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_PS2_GS_WIDTH
"""


comptime HINT_PS2_GS_HEIGHT = "SDL_PS2_GS_HEIGHT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_PS2_GS_HEIGHT
"""


comptime HINT_PS2_GS_PROGRESSIVE = "SDL_PS2_GS_PROGRESSIVE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_PS2_GS_PROGRESSIVE
"""


comptime HINT_PS2_GS_MODE = "SDL_PS2_GS_MODE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_PS2_GS_MODE
"""


comptime HINT_RPI_VIDEO_LAYER = "SDL_RPI_VIDEO_LAYER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_RPI_VIDEO_LAYER
"""


comptime HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME = "SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_SCREENSAVER_INHIBIT_ACTIVITY_NAME
"""


comptime HINT_SHUTDOWN_DBUS_ON_QUIT = "SDL_SHUTDOWN_DBUS_ON_QUIT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_SHUTDOWN_DBUS_ON_QUIT
"""


comptime HINT_STORAGE_TITLE_DRIVER = "SDL_STORAGE_TITLE_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_STORAGE_TITLE_DRIVER
"""


comptime HINT_STORAGE_USER_DRIVER = "SDL_STORAGE_USER_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_STORAGE_USER_DRIVER
"""


comptime HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL = "SDL_THREAD_FORCE_REALTIME_TIME_CRITICAL"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_THREAD_FORCE_REALTIME_TIME_CRITICAL
"""


comptime HINT_THREAD_PRIORITY_POLICY = "SDL_THREAD_PRIORITY_POLICY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_THREAD_PRIORITY_POLICY
"""


comptime HINT_TIMER_RESOLUTION = "SDL_TIMER_RESOLUTION"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_TIMER_RESOLUTION
"""


comptime HINT_TOUCH_MOUSE_EVENTS = "SDL_TOUCH_MOUSE_EVENTS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_TOUCH_MOUSE_EVENTS
"""


comptime HINT_TRACKPAD_IS_TOUCH_ONLY = "SDL_TRACKPAD_IS_TOUCH_ONLY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_TRACKPAD_IS_TOUCH_ONLY
"""


comptime HINT_TV_REMOTE_AS_JOYSTICK = "SDL_TV_REMOTE_AS_JOYSTICK"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_TV_REMOTE_AS_JOYSTICK
"""


comptime HINT_VIDEO_ALLOW_SCREENSAVER = "SDL_VIDEO_ALLOW_SCREENSAVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_ALLOW_SCREENSAVER
"""


comptime HINT_VIDEO_DISPLAY_PRIORITY = "SDL_VIDEO_DISPLAY_PRIORITY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_DISPLAY_PRIORITY
"""


comptime HINT_VIDEO_DOUBLE_BUFFER = "SDL_VIDEO_DOUBLE_BUFFER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_DOUBLE_BUFFER
"""


comptime HINT_VIDEO_DRIVER = "SDL_VIDEO_DRIVER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_DRIVER
"""


comptime HINT_VIDEO_DUMMY_SAVE_FRAMES = "SDL_VIDEO_DUMMY_SAVE_FRAMES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_DUMMY_SAVE_FRAMES
"""


comptime HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK = "SDL_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK
"""


comptime HINT_VIDEO_FORCE_EGL = "SDL_VIDEO_FORCE_EGL"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_FORCE_EGL
"""


comptime HINT_VIDEO_MAC_FULLSCREEN_SPACES = "SDL_VIDEO_MAC_FULLSCREEN_SPACES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES
"""


comptime HINT_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY = "SDL_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY
"""


comptime HINT_VIDEO_METAL_AUTO_RESIZE_DRAWABLE = "SDL_VIDEO_METAL_AUTO_RESIZE_DRAWABLE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_METAL_AUTO_RESIZE_DRAWABLE
"""


comptime HINT_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE = "SDL_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE
"""


comptime HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS = "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS
"""


comptime HINT_VIDEO_OFFSCREEN_SAVE_FRAMES = "SDL_VIDEO_OFFSCREEN_SAVE_FRAMES"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_OFFSCREEN_SAVE_FRAMES
"""


comptime HINT_VIDEO_SYNC_WINDOW_OPERATIONS = "SDL_VIDEO_SYNC_WINDOW_OPERATIONS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS
"""


comptime HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR = "SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR
"""


comptime HINT_VIDEO_WAYLAND_MODE_EMULATION = "SDL_VIDEO_WAYLAND_MODE_EMULATION"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION
"""


comptime HINT_VIDEO_WAYLAND_MODE_SCALING = "SDL_VIDEO_WAYLAND_MODE_SCALING"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_WAYLAND_MODE_SCALING
"""


comptime HINT_VIDEO_WAYLAND_PREFER_LIBDECOR = "SDL_VIDEO_WAYLAND_PREFER_LIBDECOR"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR
"""


comptime HINT_VIDEO_WAYLAND_SCALE_TO_DISPLAY = "SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_WAYLAND_SCALE_TO_DISPLAY
"""


comptime HINT_VIDEO_WIN_D3DCOMPILER = "SDL_VIDEO_WIN_D3DCOMPILER"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_WIN_D3DCOMPILER
"""


comptime HINT_VIDEO_X11_EXTERNAL_WINDOW_INPUT = "SDL_VIDEO_X11_EXTERNAL_WINDOW_INPUT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_X11_EXTERNAL_WINDOW_INPUT
"""


comptime HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR = "SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR
"""


comptime HINT_VIDEO_X11_NET_WM_PING = "SDL_VIDEO_X11_NET_WM_PING"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_X11_NET_WM_PING
"""


comptime HINT_VIDEO_X11_NODIRECTCOLOR = "SDL_VIDEO_X11_NODIRECTCOLOR"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_X11_NODIRECTCOLOR
"""


comptime HINT_VIDEO_X11_SCALING_FACTOR = "SDL_VIDEO_X11_SCALING_FACTOR"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_X11_SCALING_FACTOR
"""


comptime HINT_VIDEO_X11_VISUALID = "SDL_VIDEO_X11_VISUALID"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_X11_VISUALID
"""


comptime HINT_VIDEO_X11_WINDOW_VISUALID = "SDL_VIDEO_X11_WINDOW_VISUALID"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_X11_WINDOW_VISUALID
"""


comptime HINT_VIDEO_X11_XRANDR = "SDL_VIDEO_X11_XRANDR"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VIDEO_X11_XRANDR
"""


comptime HINT_VITA_ENABLE_BACK_TOUCH = "SDL_VITA_ENABLE_BACK_TOUCH"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VITA_ENABLE_BACK_TOUCH
"""


comptime HINT_VITA_ENABLE_FRONT_TOUCH = "SDL_VITA_ENABLE_FRONT_TOUCH"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VITA_ENABLE_FRONT_TOUCH
"""


comptime HINT_VITA_MODULE_PATH = "SDL_VITA_MODULE_PATH"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VITA_MODULE_PATH
"""


comptime HINT_VITA_PVR_INIT = "SDL_VITA_PVR_INIT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VITA_PVR_INIT
"""


comptime HINT_VITA_RESOLUTION = "SDL_VITA_RESOLUTION"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VITA_RESOLUTION
"""


comptime HINT_VITA_PVR_OPENGL = "SDL_VITA_PVR_OPENGL"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VITA_PVR_OPENGL
"""


comptime HINT_VITA_TOUCH_MOUSE_DEVICE = "SDL_VITA_TOUCH_MOUSE_DEVICE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VITA_TOUCH_MOUSE_DEVICE
"""


comptime HINT_VULKAN_DISPLAY = "SDL_VULKAN_DISPLAY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VULKAN_DISPLAY
"""


comptime HINT_VULKAN_LIBRARY = "SDL_VULKAN_LIBRARY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_VULKAN_LIBRARY
"""


comptime HINT_WAVE_FACT_CHUNK = "SDL_WAVE_FACT_CHUNK"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WAVE_FACT_CHUNK
"""


comptime HINT_WAVE_CHUNK_LIMIT = "SDL_WAVE_CHUNK_LIMIT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WAVE_CHUNK_LIMIT
"""


comptime HINT_WAVE_RIFF_CHUNK_SIZE = "SDL_WAVE_RIFF_CHUNK_SIZE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WAVE_RIFF_CHUNK_SIZE
"""


comptime HINT_WAVE_TRUNCATION = "SDL_WAVE_TRUNCATION"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WAVE_TRUNCATION
"""


comptime HINT_WINDOW_ACTIVATE_WHEN_RAISED = "SDL_WINDOW_ACTIVATE_WHEN_RAISED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOW_ACTIVATE_WHEN_RAISED
"""


comptime HINT_WINDOW_ACTIVATE_WHEN_SHOWN = "SDL_WINDOW_ACTIVATE_WHEN_SHOWN"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOW_ACTIVATE_WHEN_SHOWN
"""


comptime HINT_WINDOW_ALLOW_TOPMOST = "SDL_WINDOW_ALLOW_TOPMOST"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOW_ALLOW_TOPMOST
"""


comptime HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN = "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN
"""


comptime HINT_WINDOWS_CLOSE_ON_ALT_F4 = "SDL_WINDOWS_CLOSE_ON_ALT_F4"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_CLOSE_ON_ALT_F4
"""


comptime HINT_WINDOWS_ENABLE_MENU_MNEMONICS = "SDL_WINDOWS_ENABLE_MENU_MNEMONICS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_ENABLE_MENU_MNEMONICS
"""


comptime HINT_WINDOWS_ENABLE_MESSAGELOOP = "SDL_WINDOWS_ENABLE_MESSAGELOOP"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP
"""


comptime HINT_WINDOWS_GAMEINPUT = "SDL_WINDOWS_GAMEINPUT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_GAMEINPUT
"""


comptime HINT_WINDOWS_RAW_KEYBOARD = "SDL_WINDOWS_RAW_KEYBOARD"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_RAW_KEYBOARD
"""


comptime HINT_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS = "SDL_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS
"""


comptime HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL = "SDL_WINDOWS_FORCE_SEMAPHORE_KERNEL"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_FORCE_SEMAPHORE_KERNEL
"""


comptime HINT_WINDOWS_INTRESOURCE_ICON = "SDL_WINDOWS_INTRESOURCE_ICON"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_INTRESOURCE_ICON
"""


comptime HINT_WINDOWS_INTRESOURCE_ICON_SMALL = "SDL_WINDOWS_INTRESOURCE_ICON_SMALL"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL
"""


comptime HINT_WINDOWS_USE_D3D9EX = "SDL_WINDOWS_USE_D3D9EX"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_USE_D3D9EX
"""


comptime HINT_WINDOWS_ERASE_BACKGROUND_MODE = "SDL_WINDOWS_ERASE_BACKGROUND_MODE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_WINDOWS_ERASE_BACKGROUND_MODE
"""


comptime HINT_X11_FORCE_OVERRIDE_REDIRECT = "SDL_X11_FORCE_OVERRIDE_REDIRECT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_X11_FORCE_OVERRIDE_REDIRECT
"""


comptime HINT_X11_WINDOW_TYPE = "SDL_X11_WINDOW_TYPE"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_X11_WINDOW_TYPE
"""


comptime HINT_X11_XCB_LIBRARY = "SDL_X11_XCB_LIBRARY"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_X11_XCB_LIBRARY
"""


comptime HINT_XINPUT_ENABLED = "SDL_XINPUT_ENABLED"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_XINPUT_ENABLED
"""


comptime HINT_ASSERT = "SDL_ASSERT"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_ASSERT
"""


comptime HINT_PEN_MOUSE_EVENTS = "SDL_PEN_MOUSE_EVENTS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_PEN_MOUSE_EVENTS
"""


comptime HINT_PEN_TOUCH_EVENTS = "SDL_PEN_TOUCH_EVENTS"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HINT_PEN_TOUCH_EVENTS
"""


comptime INIT_AUDIO = 0x00000010
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_INIT_AUDIO
"""


comptime INIT_VIDEO = 0x00000020
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_INIT_VIDEO
"""


comptime INIT_JOYSTICK = 0x00000200
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_INIT_JOYSTICK
"""


comptime INIT_HAPTIC = 0x00001000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_INIT_HAPTIC
"""


comptime INIT_GAMEPAD = 0x00002000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_INIT_GAMEPAD
"""


comptime INIT_EVENTS = 0x00004000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_INIT_EVENTS
"""


comptime INIT_SENSOR = 0x00008000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_INIT_SENSOR
"""


comptime INIT_CAMERA = 0x00010000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_INIT_CAMERA
"""


comptime PROP_APP_METADATA_NAME_STRING = "SDL.app.metadata.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_APP_METADATA_NAME_STRING
"""


comptime PROP_APP_METADATA_VERSION_STRING = "SDL.app.metadata.version"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_APP_METADATA_VERSION_STRING
"""


comptime PROP_APP_METADATA_IDENTIFIER_STRING = "SDL.app.metadata.identifier"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_APP_METADATA_IDENTIFIER_STRING
"""


comptime PROP_APP_METADATA_CREATOR_STRING = "SDL.app.metadata.creator"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_APP_METADATA_CREATOR_STRING
"""


comptime PROP_APP_METADATA_COPYRIGHT_STRING = "SDL.app.metadata.copyright"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_APP_METADATA_COPYRIGHT_STRING
"""


comptime PROP_APP_METADATA_URL_STRING = "SDL.app.metadata.url"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_APP_METADATA_URL_STRING
"""


comptime PROP_APP_METADATA_TYPE_STRING = "SDL.app.metadata.type"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_APP_METADATA_TYPE_STRING
"""


comptime PROP_IOSTREAM_WINDOWS_HANDLE_POINTER = "SDL.iostream.windows.handle"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER
"""


comptime PROP_IOSTREAM_STDIO_FILE_POINTER = "SDL.iostream.stdio.file"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_IOSTREAM_STDIO_FILE_POINTER
"""


comptime PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER = "SDL.iostream.file_descriptor"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER
"""


comptime PROP_IOSTREAM_ANDROID_AASSET_POINTER = "SDL.iostream.android.aasset"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER
"""


comptime PROP_IOSTREAM_MEMORY_POINTER = "SDL.iostream.memory.base"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_IOSTREAM_MEMORY_POINTER
"""


comptime PROP_IOSTREAM_MEMORY_SIZE_NUMBER = "SDL.iostream.memory.size"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER
"""


comptime PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER = "SDL.iostream.memory.free"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER
"""


comptime PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER = "SDL.iostream.dynamic.memory"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER
"""


comptime PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER = "SDL.iostream.dynamic.chunksize"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER
"""


comptime JOYSTICK_AXIS_MAX = 32767
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_JOYSTICK_AXIS_MAX
"""


comptime JOYSTICK_AXIS_MIN = -32768
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_JOYSTICK_AXIS_MIN
"""


comptime PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN = "SDL.joystick.cap.mono_led"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN
"""


comptime PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN = "SDL.joystick.cap.rgb_led"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN
"""


comptime PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN = "SDL.joystick.cap.player_led"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN
"""


comptime PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN = "SDL.joystick.cap.rumble"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN
"""


comptime PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN = "SDL.joystick.cap.trigger_rumble"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN
"""


comptime HAT_CENTERED = 0x00
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAT_CENTERED
"""


comptime HAT_UP = 0x01
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAT_UP
"""


comptime HAT_RIGHT = 0x02
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAT_RIGHT
"""


comptime HAT_DOWN = 0x04
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAT_DOWN
"""


comptime HAT_LEFT = 0x08
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAT_LEFT
"""


comptime HAT_RIGHTUP = HAT_RIGHT | HAT_UP
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAT_RIGHTUP
"""


comptime HAT_RIGHTDOWN = HAT_RIGHT | HAT_DOWN
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAT_RIGHTDOWN
"""


comptime HAT_LEFTUP = HAT_LEFT | HAT_UP
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAT_LEFTUP
"""


comptime HAT_LEFTDOWN = HAT_LEFT | HAT_DOWN
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_HAT_LEFTDOWN
"""


comptime PROP_TEXTINPUT_TYPE_NUMBER = "SDL.textinput.type"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTINPUT_TYPE_NUMBER
"""


comptime PROP_TEXTINPUT_CAPITALIZATION_NUMBER = "SDL.textinput.capitalization"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER
"""


comptime PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN = "SDL.textinput.autocorrect"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN
"""


comptime PROP_TEXTINPUT_MULTILINE_BOOLEAN = "SDL.textinput.multiline"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN
"""


comptime PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER = "SDL.textinput.android.inputtype"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER
"""


comptime KEY_EXTENDED_MASK = 1 << 29
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_EXTENDED_MASK
"""


comptime KEY_SCANCODE_MASK = 1 << 30
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SCANCODE_MASK
"""


comptime KEY_UNKNOWN = 0x00000000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_UNKNOWN
"""


comptime KEY_RETURN = 0x0000000d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RETURN
"""


comptime KEY_ESCAPE = 0x0000001b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_ESCAPE
"""


comptime KEY_BACKSPACE = 0x00000008
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_BACKSPACE
"""


comptime KEY_TAB = 0x00000009
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_TAB
"""


comptime KEY_SPACE = 0x00000020
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SPACE
"""


comptime KEY_EXCLAIM = 0x00000021
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_EXCLAIM
"""


comptime KEY_DBLAPOSTROPHE = 0x00000022
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_DBLAPOSTROPHE
"""


comptime KEY_HASH = 0x00000023
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_HASH
"""


comptime KEY_DOLLAR = 0x00000024
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_DOLLAR
"""


comptime KEY_PERCENT = 0x00000025
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PERCENT
"""


comptime KEY_AMPERSAND = 0x00000026
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AMPERSAND
"""


comptime KEY_APOSTROPHE = 0x00000027
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_APOSTROPHE
"""


comptime KEY_LEFTPAREN = 0x00000028
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LEFTPAREN
"""


comptime KEY_RIGHTPAREN = 0x00000029
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RIGHTPAREN
"""


comptime KEY_ASTERISK = 0x0000002a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_ASTERISK
"""


comptime KEY_PLUS = 0x0000002b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PLUS
"""


comptime KEY_COMMA = 0x0000002c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_COMMA
"""


comptime KEY_MINUS = 0x0000002d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MINUS
"""


comptime KEY_PERIOD = 0x0000002e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PERIOD
"""


comptime KEY_SLASH = 0x0000002
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SLASH
"""


comptime KEY_0 = 0x00000030
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_0
"""


comptime KEY_1 = 0x00000031
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_1
"""


comptime KEY_2 = 0x00000032
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_2
"""


comptime KEY_3 = 0x00000033
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_3
"""


comptime KEY_4 = 0x00000034
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_4
"""


comptime KEY_5 = 0x00000035
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_5
"""


comptime KEY_6 = 0x00000036
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_6
"""


comptime KEY_7 = 0x00000037
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_7
"""


comptime KEY_8 = 0x00000038
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_8
"""


comptime KEY_9 = 0x00000039
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_9
"""


comptime KEY_COLON = 0x0000003a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_COLON
"""


comptime KEY_SEMICOLON = 0x0000003b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SEMICOLON
"""


comptime KEY_LESS = 0x0000003c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LESS
"""


comptime KEY_EQUALS = 0x0000003d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_EQUALS
"""


comptime KEY_GREATER = 0x0000003e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_GREATER
"""


comptime KEY_QUESTION = 0x0000003
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_QUESTION
"""


comptime KEY_AT = 0x00000040
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AT
"""


comptime KEY_LEFTBRACKET = 0x0000005b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LEFTBRACKET
"""


comptime KEY_BACKSLASH = 0x0000005c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_BACKSLASH
"""


comptime KEY_RIGHTBRACKET = 0x0000005d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RIGHTBRACKET
"""


comptime KEY_CARET = 0x0000005e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CARET
"""


comptime KEY_UNDERSCORE = 0x0000005
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_UNDERSCORE
"""


comptime KEY_GRAVE = 0x00000060
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_GRAVE
"""


comptime KEY_A = 0x00000061
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_A
"""


comptime KEY_B = 0x00000062
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_B
"""


comptime KEY_C = 0x00000063
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_C
"""


comptime KEY_D = 0x00000064
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_D
"""


comptime KEY_E = 0x00000065
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_E
"""


comptime KEY_F = 0x00000066
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F
"""


comptime KEY_G = 0x00000067
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_G
"""


comptime KEY_H = 0x00000068
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_H
"""


comptime KEY_I = 0x00000069
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_I
"""


comptime KEY_J = 0x0000006a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_J
"""


comptime KEY_K = 0x0000006b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_K
"""


comptime KEY_L = 0x0000006c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_L
"""


comptime KEY_M = 0x0000006d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_M
"""


comptime KEY_N = 0x0000006e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_N
"""


comptime KEY_O = 0x0000006
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_O
"""


comptime KEY_P = 0x00000070
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_P
"""


comptime KEY_Q = 0x00000071
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_Q
"""


comptime KEY_R = 0x00000072
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_R
"""


comptime KEY_S = 0x00000073
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_S
"""


comptime KEY_T = 0x00000074
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_T
"""


comptime KEY_U = 0x00000075
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_U
"""


comptime KEY_V = 0x00000076
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_V
"""


comptime KEY_W = 0x00000077
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_W
"""


comptime KEY_X = 0x00000078
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_X
"""


comptime KEY_Y = 0x00000079
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_Y
"""


comptime KEY_Z = 0x0000007a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_Z
"""


comptime KEY_LEFTBRACE = 0x0000007b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LEFTBRACE
"""


comptime KEY_PIPE = 0x0000007c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PIPE
"""


comptime KEY_RIGHTBRACE = 0x0000007d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RIGHTBRACE
"""


comptime KEY_TILDE = 0x0000007e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_TILDE
"""


comptime KEY_DELETE = 0x0000007
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_DELETE
"""


comptime KEY_PLUSMINUS = 0x000000b1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PLUSMINUS
"""


comptime KEY_CAPSLOCK = 0x40000039
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CAPSLOCK
"""


comptime KEY_F1 = 0x4000003a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F1
"""


comptime KEY_F2 = 0x4000003b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F2
"""


comptime KEY_F3 = 0x4000003c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F3
"""


comptime KEY_F4 = 0x4000003d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F4
"""


comptime KEY_F5 = 0x4000003e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F5
"""


comptime KEY_F6 = 0x4000003
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F6
"""


comptime KEY_F7 = 0x40000040
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F7
"""


comptime KEY_F8 = 0x40000041
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F8
"""


comptime KEY_F9 = 0x40000042
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F9
"""


comptime KEY_F10 = 0x40000043
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F10
"""


comptime KEY_F11 = 0x40000044
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F11
"""


comptime KEY_F12 = 0x40000045
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F12
"""


comptime KEY_PRINTSCREEN = 0x40000046
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PRINTSCREEN
"""


comptime KEY_SCROLLLOCK = 0x40000047
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SCROLLLOCK
"""


comptime KEY_PAUSE = 0x40000048
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PAUSE
"""


comptime KEY_INSERT = 0x40000049
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_INSERT
"""


comptime KEY_HOME = 0x4000004a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_HOME
"""


comptime KEY_PAGEUP = 0x4000004b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PAGEUP
"""


comptime KEY_END = 0x4000004d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_END
"""


comptime KEY_PAGEDOWN = 0x4000004e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PAGEDOWN
"""


comptime KEY_RIGHT = 0x4000004
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RIGHT
"""


comptime KEY_LEFT = 0x40000050
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LEFT
"""


comptime KEY_DOWN = 0x40000051
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_DOWN
"""


comptime KEY_UP = 0x40000052
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_UP
"""


comptime KEY_NUMLOCKCLEAR = 0x40000053
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_NUMLOCKCLEAR
"""


comptime KEY_KP_DIVIDE = 0x40000054
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_DIVIDE
"""


comptime KEY_KP_MULTIPLY = 0x40000055
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_MULTIPLY
"""


comptime KEY_KP_MINUS = 0x40000056
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_MINUS
"""


comptime KEY_KP_PLUS = 0x40000057
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_PLUS
"""


comptime KEY_KP_ENTER = 0x40000058
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_ENTER
"""


comptime KEY_KP_1 = 0x40000059
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_1
"""


comptime KEY_KP_2 = 0x4000005a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_2
"""


comptime KEY_KP_3 = 0x4000005b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_3
"""


comptime KEY_KP_4 = 0x4000005c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_4
"""


comptime KEY_KP_5 = 0x4000005d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_5
"""


comptime KEY_KP_6 = 0x4000005e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_6
"""


comptime KEY_KP_7 = 0x4000005
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_7
"""


comptime KEY_KP_8 = 0x40000060
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_8
"""


comptime KEY_KP_9 = 0x40000061
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_9
"""


comptime KEY_KP_0 = 0x40000062
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_0
"""


comptime KEY_KP_PERIOD = 0x40000063
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_PERIOD
"""


comptime KEY_APPLICATION = 0x40000065
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_APPLICATION
"""


comptime KEY_POWER = 0x40000066
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_POWER
"""


comptime KEY_KP_EQUALS = 0x40000067
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_EQUALS
"""


comptime KEY_F13 = 0x40000068
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F13
"""


comptime KEY_F14 = 0x40000069
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F14
"""


comptime KEY_F15 = 0x4000006a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F15
"""


comptime KEY_F16 = 0x4000006b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F16
"""


comptime KEY_F17 = 0x4000006c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F17
"""


comptime KEY_F18 = 0x4000006d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F18
"""


comptime KEY_F19 = 0x4000006e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F19
"""


comptime KEY_F20 = 0x4000006
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F20
"""


comptime KEY_F21 = 0x40000070
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F21
"""


comptime KEY_F22 = 0x40000071
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F22
"""


comptime KEY_F23 = 0x40000072
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F23
"""


comptime KEY_F24 = 0x40000073
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_F24
"""


comptime KEY_EXECUTE = 0x40000074
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_EXECUTE
"""


comptime KEY_HELP = 0x40000075
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_HELP
"""


comptime KEY_MENU = 0x40000076
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MENU
"""


comptime KEY_SELECT = 0x40000077
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SELECT
"""


comptime KEY_STOP = 0x40000078
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_STOP
"""


comptime KEY_AGAIN = 0x40000079
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AGAIN
"""


comptime KEY_UNDO = 0x4000007a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_UNDO
"""


comptime KEY_CUT = 0x4000007b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CUT
"""


comptime KEY_COPY = 0x4000007c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_COPY
"""


comptime KEY_PASTE = 0x4000007d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PASTE
"""


comptime KEY_FIND = 0x4000007e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_FIND
"""


comptime KEY_MUTE = 0x4000007
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MUTE
"""


comptime KEY_VOLUMEUP = 0x40000080
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_VOLUMEUP
"""


comptime KEY_VOLUMEDOWN = 0x40000081
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_VOLUMEDOWN
"""


comptime KEY_KP_COMMA = 0x40000085
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_COMMA
"""


comptime KEY_KP_EQUALSAS400 = 0x40000086
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_EQUALSAS400
"""


comptime KEY_ALTERASE = 0x40000099
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_ALTERASE
"""


comptime KEY_SYSREQ = 0x4000009a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SYSREQ
"""


comptime KEY_CANCEL = 0x4000009b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CANCEL
"""


comptime KEY_CLEAR = 0x4000009c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CLEAR
"""


comptime KEY_PRIOR = 0x4000009d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_PRIOR
"""


comptime KEY_RETURN2 = 0x4000009e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RETURN2
"""


comptime KEY_SEPARATOR = 0x4000009
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SEPARATOR
"""


comptime KEY_OUT = 0x400000a0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_OUT
"""


comptime KEY_OPER = 0x400000a1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_OPER
"""


comptime KEY_CLEARAGAIN = 0x400000a2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CLEARAGAIN
"""


comptime KEY_CRSEL = 0x400000a3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CRSEL
"""


comptime KEY_EXSEL = 0x400000a4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_EXSEL
"""


comptime KEY_KP_00 = 0x400000b0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_00
"""


comptime KEY_KP_000 = 0x400000b1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_000
"""


comptime KEY_THOUSANDSSEPARATOR = 0x400000b2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_THOUSANDSSEPARATOR
"""


comptime KEY_DECIMALSEPARATOR = 0x400000b3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_DECIMALSEPARATOR
"""


comptime KEY_CURRENCYUNIT = 0x400000b4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CURRENCYUNIT
"""


comptime KEY_CURRENCYSUBUNIT = 0x400000b5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CURRENCYSUBUNIT
"""


comptime KEY_KP_LEFTPAREN = 0x400000b6
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_LEFTPAREN
"""


comptime KEY_KP_RIGHTPAREN = 0x400000b7
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_RIGHTPAREN
"""


comptime KEY_KP_LEFTBRACE = 0x400000b8
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_LEFTBRACE
"""


comptime KEY_KP_RIGHTBRACE = 0x400000b9
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_RIGHTBRACE
"""


comptime KEY_KP_TAB = 0x400000ba
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_TAB
"""


comptime KEY_KP_BACKSPACE = 0x400000bb
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_BACKSPACE
"""


comptime KEY_KP_A = 0x400000bc
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_A
"""


comptime KEY_KP_B = 0x400000bd
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_B
"""


comptime KEY_KP_C = 0x400000be
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_C
"""


comptime KEY_KP_D = 0x400000bf
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_D
"""


comptime KEY_KP_E = 0x400000c0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_E
"""


comptime KEY_KP_F = 0x400000c1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_F
"""


comptime KEY_KP_XOR = 0x400000c2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_XOR
"""


comptime KEY_KP_POWER = 0x400000c3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_POWER
"""


comptime KEY_KP_PERCENT = 0x400000c4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_PERCENT
"""


comptime KEY_KP_LESS = 0x400000c5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_LESS
"""


comptime KEY_KP_GREATER = 0x400000c6
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_GREATER
"""


comptime KEY_KP_AMPERSAND = 0x400000c7
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_AMPERSAND
"""


comptime KEY_KP_DBLAMPERSAND = 0x400000c8
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_DBLAMPERSAND
"""


comptime KEY_KP_VERTICALBAR = 0x400000c9
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_VERTICALBAR
"""


comptime KEY_KP_DBLVERTICALBAR = 0x400000ca
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_DBLVERTICALBAR
"""


comptime KEY_KP_COLON = 0x400000cb
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_COLON
"""


comptime KEY_KP_HASH = 0x400000cc
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_HASH
"""


comptime KEY_KP_SPACE = 0x400000cd
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_SPACE
"""


comptime KEY_KP_AT = 0x400000ce
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_AT
"""


comptime KEY_KP_EXCLAM = 0x400000cf
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_EXCLAM
"""


comptime KEY_KP_MEMSTORE = 0x400000d0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_MEMSTORE
"""


comptime KEY_KP_MEMRECALL = 0x400000d1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_MEMRECALL
"""


comptime KEY_KP_MEMCLEAR = 0x400000d2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_MEMCLEAR
"""


comptime KEY_KP_MEMADD = 0x400000d3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_MEMADD
"""


comptime KEY_KP_MEMSUBTRACT = 0x400000d4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_MEMSUBTRACT
"""


comptime KEY_KP_MEMMULTIPLY = 0x400000d5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_MEMMULTIPLY
"""


comptime KEY_KP_MEMDIVIDE = 0x400000d6
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_MEMDIVIDE
"""


comptime KEY_KP_PLUSMINUS = 0x400000d7
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_PLUSMINUS
"""


comptime KEY_KP_CLEAR = 0x400000d8
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_CLEAR
"""


comptime KEY_KP_CLEARENTRY = 0x400000d9
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_CLEARENTRY
"""


comptime KEY_KP_BINARY = 0x400000da
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_BINARY
"""


comptime KEY_KP_OCTAL = 0x400000db
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_OCTAL
"""


comptime KEY_KP_DECIMAL = 0x400000dc
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_DECIMAL
"""


comptime KEY_KP_HEXADECIMAL = 0x400000dd
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_KP_HEXADECIMAL
"""


comptime KEY_LCTRL = 0x400000e0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LCTRL
"""


comptime KEY_LSHIFT = 0x400000e1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LSHIFT
"""


comptime KEY_LALT = 0x400000e2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LALT
"""


comptime KEY_LGUI = 0x400000e3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LGUI
"""


comptime KEY_RCTRL = 0x400000e4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RCTRL
"""


comptime KEY_RSHIFT = 0x400000e5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RSHIFT
"""


comptime KEY_RALT = 0x400000e6
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RALT
"""


comptime KEY_RGUI = 0x400000e7
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RGUI
"""


comptime KEY_MODE = 0x40000101
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MODE
"""


comptime KEY_SLEEP = 0x40000102
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SLEEP
"""


comptime KEY_WAKE = 0x40000103
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_WAKE
"""


comptime KEY_CHANNEL_INCREMENT = 0x40000104
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CHANNEL_INCREMENT
"""


comptime KEY_CHANNEL_DECREMENT = 0x40000105
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CHANNEL_DECREMENT
"""


comptime KEY_MEDIA_PLAY = 0x40000106
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_PLAY
"""


comptime KEY_MEDIA_PAUSE = 0x40000107
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_PAUSE
"""


comptime KEY_MEDIA_RECORD = 0x40000108
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_RECORD
"""


comptime KEY_MEDIA_FAST_FORWARD = 0x40000109
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_FAST_FORWARD
"""


comptime KEY_MEDIA_REWIND = 0x4000010a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_REWIND
"""


comptime KEY_MEDIA_NEXT_TRACK = 0x4000010b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_NEXT_TRACK
"""


comptime KEY_MEDIA_PREVIOUS_TRACK = 0x4000010c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_PREVIOUS_TRACK
"""


comptime KEY_MEDIA_STOP = 0x4000010d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_STOP
"""


comptime KEY_MEDIA_EJECT = 0x4000010e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_EJECT
"""


comptime KEY_MEDIA_PLAY_PAUSE = 0x4000010
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_PLAY_PAUSE
"""


comptime KEY_MEDIA_SELECT = 0x40000110
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MEDIA_SELECT
"""


comptime KEY_AC_NEW = 0x40000111
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_NEW
"""


comptime KEY_AC_OPEN = 0x40000112
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_OPEN
"""


comptime KEY_AC_CLOSE = 0x40000113
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_CLOSE
"""


comptime KEY_AC_EXIT = 0x40000114
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_EXIT
"""


comptime KEY_AC_SAVE = 0x40000115
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_SAVE
"""


comptime KEY_AC_PRINT = 0x40000116
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_PRINT
"""


comptime KEY_AC_PROPERTIES = 0x40000117
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_PROPERTIES
"""


comptime KEY_AC_SEARCH = 0x40000118
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_SEARCH
"""


comptime KEY_AC_HOME = 0x40000119
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_HOME
"""


comptime KEY_AC_BACK = 0x4000011a
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_BACK
"""


comptime KEY_AC_FORWARD = 0x4000011b
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_FORWARD
"""


comptime KEY_AC_STOP = 0x4000011c
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_STOP
"""


comptime KEY_AC_REFRESH = 0x4000011d
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_REFRESH
"""


comptime KEY_AC_BOOKMARKS = 0x4000011e
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_AC_BOOKMARKS
"""


comptime KEY_SOFTLEFT = 0x4000011
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SOFTLEFT
"""


comptime KEY_SOFTRIGHT = 0x40000120
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_SOFTRIGHT
"""


comptime KEY_CALL = 0x40000121
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_CALL
"""


comptime KEY_ENDCALL = 0x40000122
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_ENDCALL
"""


comptime KEY_LEFT_TAB = 0x20000001
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LEFT_TAB
"""


comptime KEY_LEVEL5_SHIFT = 0x20000002
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LEVEL5_SHIFT
"""


comptime KEY_MULTI_KEY_COMPOSE = 0x20000003
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_MULTI_KEY_COMPOSE
"""


comptime KEY_LMETA = 0x20000004
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LMETA
"""


comptime KEY_RMETA = 0x20000005
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RMETA
"""


comptime KEY_LHYPER = 0x20000006
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_LHYPER
"""


comptime KEY_RHYPER = 0x20000007
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDLK_RHYPER
"""


comptime KMOD_NONE = 0x0000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_NONE
"""


comptime KMOD_LSHIFT = 0x0001
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_LSHIFT
"""


comptime KMOD_RSHIFT = 0x0002
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_RSHIFT
"""


comptime KMOD_LEVEL5 = 0x0004
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_LEVEL5
"""


comptime KMOD_LCTRL = 0x0040
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_LCTRL
"""


comptime KMOD_RCTRL = 0x0080
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_RCTRL
"""


comptime KMOD_LALT = 0x0100
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_LALT
"""


comptime KMOD_RALT = 0x0200
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_RALT
"""


comptime KMOD_LGUI = 0x0400
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_LGUI
"""


comptime KMOD_RGUI = 0x0800
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_RGUI
"""


comptime KMOD_NUM = 0x1000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_NUM
"""


comptime KMOD_CAPS = 0x2000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_CAPS
"""


comptime KMOD_MODE = 0x4000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_MODE
"""


comptime KMOD_SCROLL = 0x8000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_SCROLL
"""


comptime KMOD_CTRL = KMOD_LCTRL | KMOD_RCTRL
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_CTRL
"""


comptime KMOD_SHIFT = KMOD_LSHIFT | KMOD_RSHIFT
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_SHIFT
"""


comptime KMOD_ALT = KMOD_LALT | KMOD_RALT
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_ALT
"""


comptime KMOD_GUI = KMOD_LGUI | KMOD_RGUI
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_KMOD_GUI
"""


comptime BUTTON_LEFT = 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_LEFT
"""


comptime BUTTON_MIDDLE = 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_MIDDLE
"""


comptime BUTTON_RIGHT = 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_RIGHT
"""


comptime BUTTON_X1 = 4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_X1
"""


comptime BUTTON_X2 = 5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_X2
"""


comptime BUTTON_LMASK = button_mask(BUTTON_LEFT)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_LMASK
"""


comptime BUTTON_MMASK = button_mask(BUTTON_MIDDLE)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_MMASK
"""


comptime BUTTON_RMASK = button_mask(BUTTON_RIGHT)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_RMASK
"""


comptime BUTTON_X1MASK = button_mask(BUTTON_X1)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_X1MASK
"""


comptime BUTTON_X2MASK = button_mask(BUTTON_X2)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_BUTTON_X2MASK
"""


comptime PEN_MOUSEID = MouseID(-2)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_MOUSEID
"""


comptime PEN_TOUCHID = TouchID(-2)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_TOUCHID
"""


comptime PEN_INPUT_DOWN = 1 << 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_INPUT_DOWN
"""


comptime PEN_INPUT_BUTTON_1 = 1 << 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_INPUT_BUTTON_1
"""


comptime PEN_INPUT_BUTTON_2 = 1 << 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_INPUT_BUTTON_2
"""


comptime PEN_INPUT_BUTTON_3 = 1 << 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_INPUT_BUTTON_3
"""


comptime PEN_INPUT_BUTTON_4 = 1 << 4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_INPUT_BUTTON_4
"""


comptime PEN_INPUT_BUTTON_5 = 1 << 5
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_INPUT_BUTTON_5
"""


comptime PEN_INPUT_ERASER_TIP = 1 << 30
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_INPUT_ERASER_TIP
"""


comptime PEN_INPUT_IN_PROXIMITY = 1 << 31
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PEN_INPUT_IN_PROXIMITY
"""


comptime ALPHA_OPAQUE = 255
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_ALPHA_OPAQUE
"""


comptime ALPHA_OPAQUE_FLOAT = 1.0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_ALPHA_OPAQUE_FLOAT
"""


comptime ALPHA_TRANSPARENT = 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_ALPHA_TRANSPARENT
"""


comptime ALPHA_TRANSPARENT_FLOAT = 0.0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_ALPHA_TRANSPARENT_FLOAT
"""


comptime PROP_NAME_STRING = "SDL.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_NAME_STRING
"""


comptime SOFTWARE_RENDERER = "software"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_SOFTWARE_RENDERER
"""


comptime GPU_RENDERER = "gpu"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GPU_RENDERER
"""


comptime PROP_RENDERER_CREATE_NAME_STRING = "SDL.renderer.create.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_NAME_STRING
"""


comptime PROP_RENDERER_CREATE_WINDOW_POINTER = "SDL.renderer.create.window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_WINDOW_POINTER
"""


comptime PROP_RENDERER_CREATE_SURFACE_POINTER = "SDL.renderer.create.surface"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_SURFACE_POINTER
"""


comptime PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER = "SDL.renderer.create.output_colorspace"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER
"""


comptime PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER = "SDL.renderer.create.present_vsync"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER
"""


comptime PROP_RENDERER_CREATE_GPU_DEVICE_POINTER = "SDL.renderer.create.gpu.device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER
"""


comptime PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN = "SDL.renderer.create.gpu.shaders_spirv"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN
"""


comptime PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN = "SDL.renderer.create.gpu.shaders_dxil"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN
"""


comptime PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN = "SDL.renderer.create.gpu.shaders_msl"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN
"""


comptime PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER = "SDL.renderer.create.vulkan.instance"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER
"""


comptime PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER = "SDL.renderer.create.vulkan.surface"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER
"""


comptime PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER = "SDL.renderer.create.vulkan.physical_device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER
"""


comptime PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER = "SDL.renderer.create.vulkan.device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER
"""


comptime PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.create.vulkan.graphics_queue_family_index"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER
"""


comptime PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.create.vulkan.present_queue_family_index"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER
"""


comptime PROP_RENDERER_NAME_STRING = "SDL.renderer.name"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_NAME_STRING
"""


comptime PROP_RENDERER_WINDOW_POINTER = "SDL.renderer.window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_WINDOW_POINTER
"""


comptime PROP_RENDERER_SURFACE_POINTER = "SDL.renderer.surface"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_SURFACE_POINTER
"""


comptime PROP_RENDERER_VSYNC_NUMBER = "SDL.renderer.vsync"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_VSYNC_NUMBER
"""


comptime PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER = "SDL.renderer.max_texture_size"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER
"""


comptime PROP_RENDERER_TEXTURE_FORMATS_POINTER = "SDL.renderer.texture_formats"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER
"""


comptime PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN = "SDL.renderer.texture_wrapping"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN
"""


comptime PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER = "SDL.renderer.output_colorspace"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER
"""


comptime PROP_RENDERER_HDR_ENABLED_BOOLEAN = "SDL.renderer.HDR_enabled"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN
"""


comptime PROP_RENDERER_SDR_WHITE_POINT_FLOAT = "SDL.renderer.SDR_white_point"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT
"""


comptime PROP_RENDERER_HDR_HEADROOM_FLOAT = "SDL.renderer.HDR_headroom"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT
"""


comptime PROP_RENDERER_D3D9_DEVICE_POINTER = "SDL.renderer.d3d9.device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_D3D9_DEVICE_POINTER
"""


comptime PROP_RENDERER_D3D11_DEVICE_POINTER = "SDL.renderer.d3d11.device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_D3D11_DEVICE_POINTER
"""


comptime PROP_RENDERER_D3D11_SWAPCHAIN_POINTER = "SDL.renderer.d3d11.swap_chain"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER
"""


comptime PROP_RENDERER_D3D12_DEVICE_POINTER = "SDL.renderer.d3d12.device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_D3D12_DEVICE_POINTER
"""


comptime PROP_RENDERER_D3D12_SWAPCHAIN_POINTER = "SDL.renderer.d3d12.swap_chain"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER
"""


comptime PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER = "SDL.renderer.d3d12.command_queue"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER
"""


comptime PROP_RENDERER_VULKAN_INSTANCE_POINTER = "SDL.renderer.vulkan.instance"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER
"""


comptime PROP_RENDERER_VULKAN_SURFACE_NUMBER = "SDL.renderer.vulkan.surface"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER
"""


comptime PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER = "SDL.renderer.vulkan.physical_device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER
"""


comptime PROP_RENDERER_VULKAN_DEVICE_POINTER = "SDL.renderer.vulkan.device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER
"""


comptime PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.vulkan.graphics_queue_family_index"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER
"""


comptime PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.vulkan.present_queue_family_index"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER
"""


comptime PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER = "SDL.renderer.vulkan.swapchain_image_count"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER
"""


comptime PROP_RENDERER_GPU_DEVICE_POINTER = "SDL.renderer.gpu.device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_RENDERER_GPU_DEVICE_POINTER
"""


comptime PROP_TEXTURE_CREATE_COLORSPACE_NUMBER = "SDL.texture.create.colorspace"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER
"""


comptime PROP_TEXTURE_CREATE_FORMAT_NUMBER = "SDL.texture.create.format"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER
"""


comptime PROP_TEXTURE_CREATE_ACCESS_NUMBER = "SDL.texture.create.access"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER
"""


comptime PROP_TEXTURE_CREATE_WIDTH_NUMBER = "SDL.texture.create.width"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER
"""


comptime PROP_TEXTURE_CREATE_HEIGHT_NUMBER = "SDL.texture.create.height"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER
"""


comptime PROP_TEXTURE_CREATE_PALETTE_POINTER = "SDL.texture.create.palette"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_PALETTE_POINTER
"""


comptime PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT = "SDL.texture.create.SDR_white_point"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT
"""


comptime PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT = "SDL.texture.create.HDR_headroom"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT
"""


comptime PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER = "SDL.texture.create.d3d11.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER
"""


comptime PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER = "SDL.texture.create.d3d11.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER
"""


comptime PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER = "SDL.texture.create.d3d11.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER
"""


comptime PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER = "SDL.texture.create.d3d12.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER
"""


comptime PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER = "SDL.texture.create.d3d12.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER
"""


comptime PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER = "SDL.texture.create.d3d12.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER
"""


comptime PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER = "SDL.texture.create.metal.pixelbuffer"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER
"""


comptime PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER = "SDL.texture.create.opengl.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER
"""


comptime PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER = "SDL.texture.create.opengl.texture_uv"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER
"""


comptime PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER = "SDL.texture.create.opengl.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER
"""


comptime PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER = "SDL.texture.create.opengl.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER
"""


comptime PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER = "SDL.texture.create.opengles2.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER
"""


comptime PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER = "SDL.texture.create.opengles2.texture_uv"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER
"""


comptime PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER = "SDL.texture.create.opengles2.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER
"""


comptime PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER = "SDL.texture.create.opengles2.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER
"""


comptime PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER = "SDL.texture.create.vulkan.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER
"""


comptime PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER = "SDL.texture.create.vulkan.layout"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER
"""


comptime PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER = "SDL.texture.create.gpu.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER
"""


comptime PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER = "SDL.texture.create.gpu.texture_uv"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER
"""


comptime PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER = "SDL.texture.create.gpu.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER
"""


comptime PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER = "SDL.texture.create.gpu.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER
"""


comptime PROP_TEXTURE_COLORSPACE_NUMBER = "SDL.texture.colorspace"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_COLORSPACE_NUMBER
"""


comptime PROP_TEXTURE_FORMAT_NUMBER = "SDL.texture.format"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_FORMAT_NUMBER
"""


comptime PROP_TEXTURE_ACCESS_NUMBER = "SDL.texture.access"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_ACCESS_NUMBER
"""


comptime PROP_TEXTURE_WIDTH_NUMBER = "SDL.texture.width"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_WIDTH_NUMBER
"""


comptime PROP_TEXTURE_HEIGHT_NUMBER = "SDL.texture.height"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_HEIGHT_NUMBER
"""


comptime PROP_TEXTURE_SDR_WHITE_POINT_FLOAT = "SDL.texture.SDR_white_point"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT
"""


comptime PROP_TEXTURE_HDR_HEADROOM_FLOAT = "SDL.texture.HDR_headroom"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT
"""


comptime PROP_TEXTURE_D3D11_TEXTURE_POINTER = "SDL.texture.d3d11.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER
"""


comptime PROP_TEXTURE_D3D11_TEXTURE_U_POINTER = "SDL.texture.d3d11.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER
"""


comptime PROP_TEXTURE_D3D11_TEXTURE_V_POINTER = "SDL.texture.d3d11.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER
"""


comptime PROP_TEXTURE_D3D12_TEXTURE_POINTER = "SDL.texture.d3d12.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER
"""


comptime PROP_TEXTURE_D3D12_TEXTURE_U_POINTER = "SDL.texture.d3d12.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER
"""


comptime PROP_TEXTURE_D3D12_TEXTURE_V_POINTER = "SDL.texture.d3d12.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER
"""


comptime PROP_TEXTURE_OPENGL_TEXTURE_NUMBER = "SDL.texture.opengl.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER
"""


comptime PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER = "SDL.texture.opengl.texture_uv"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER
"""


comptime PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER = "SDL.texture.opengl.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER
"""


comptime PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER = "SDL.texture.opengl.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER
"""


comptime PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER = "SDL.texture.opengl.target"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER
"""


comptime PROP_TEXTURE_OPENGL_TEX_W_FLOAT = "SDL.texture.opengl.tex_w"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT
"""


comptime PROP_TEXTURE_OPENGL_TEX_H_FLOAT = "SDL.texture.opengl.tex_h"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT
"""


comptime PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER = "SDL.texture.opengles2.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER
"""


comptime PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER = "SDL.texture.opengles2.texture_uv"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER
"""


comptime PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER = "SDL.texture.opengles2.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER
"""


comptime PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER = "SDL.texture.opengles2.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER
"""


comptime PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER = "SDL.texture.opengles2.target"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER
"""


comptime PROP_TEXTURE_VULKAN_TEXTURE_NUMBER = "SDL.texture.vulkan.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER
"""


comptime PROP_TEXTURE_GPU_TEXTURE_POINTER = "SDL.texture.gpu.texture"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_GPU_TEXTURE_POINTER
"""


comptime PROP_TEXTURE_GPU_TEXTURE_UV_POINTER = "SDL.texture.gpu.texture_uv"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER
"""


comptime PROP_TEXTURE_GPU_TEXTURE_U_POINTER = "SDL.texture.gpu.texture_u"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER
"""


comptime PROP_TEXTURE_GPU_TEXTURE_V_POINTER = "SDL.texture.gpu.texture_v"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER
"""


comptime RENDERER_VSYNC_DISABLED = 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_RENDERER_VSYNC_DISABLED
"""


comptime RENDERER_VSYNC_ADAPTIVE = -1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_RENDERER_VSYNC_ADAPTIVE
"""


comptime DEBUG_TEXT_FONT_CHARACTER_SIZE = 8
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE
"""


comptime STANDARD_GRAVITY = 9.80665
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_STANDARD_GRAVITY
"""


comptime SURFACE_PREALLOCATED = 0x00000001
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_SURFACE_PREALLOCATED
"""


comptime SURFACE_LOCK_NEEDED = 0x00000002
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_SURFACE_LOCK_NEEDED
"""


comptime SURFACE_LOCKED = 0x00000004
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_SURFACE_LOCKED
"""


comptime SURFACE_SIMD_ALIGNED = 0x00000008
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_SURFACE_SIMD_ALIGNED
"""


comptime PROP_SURFACE_SDR_WHITE_POINT_FLOAT = "SDL.surface.SDR_white_point"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT
"""


comptime PROP_SURFACE_HDR_HEADROOM_FLOAT = "SDL.surface.HDR_headroom"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT
"""


comptime PROP_SURFACE_TONEMAP_OPERATOR_STRING = "SDL.surface.tonemap"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING
"""


comptime PROP_SURFACE_HOTSPOT_X_NUMBER = "SDL.surface.hotspot.x"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_SURFACE_HOTSPOT_X_NUMBER
"""


comptime PROP_SURFACE_HOTSPOT_Y_NUMBER = "SDL.surface.hotspot.y"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER
"""


comptime PROP_SURFACE_ROTATION_FLOAT = "SDL.surface.rotation"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_SURFACE_ROTATION_FLOAT
"""


comptime MS_PER_SECOND = 1000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_MS_PER_SECOND
"""


comptime US_PER_SECOND = 1000000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_US_PER_SECOND
"""


comptime NS_PER_SECOND = 1000000000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_NS_PER_SECOND
"""


comptime NS_PER_MS = 1000000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_NS_PER_MS
"""


comptime NS_PER_US = 1000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_NS_PER_US
"""


comptime TOUCH_MOUSEID = MouseID(-1)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_TOUCH_MOUSEID
"""


comptime MOUSE_TOUCHID = TouchID(-1)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_MOUSE_TOUCHID
"""


comptime MAJOR_VERSION = 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_MAJOR_VERSION
"""


comptime MINOR_VERSION = 4
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_MINOR_VERSION
"""


comptime MICRO_VERSION = 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_MICRO_VERSION
"""


comptime VERSION = versionnum(MAJOR_VERSION, MINOR_VERSION, MICRO_VERSION)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_VERSION
"""


comptime PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER = "SDL.video.wayland.wl_display"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER
"""


comptime WINDOW_FULLSCREEN = UInt64(0x0000000000000001)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_FULLSCREEN
"""


comptime WINDOW_OPENGL = UInt64(0x0000000000000002)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_OPENGL
"""


comptime WINDOW_OCCLUDED = UInt64(0x0000000000000004)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_OCCLUDED
"""


comptime WINDOW_HIDDEN = UInt64(0x0000000000000008)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_HIDDEN
"""


comptime WINDOW_BORDERLESS = UInt64(0x0000000000000010)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_BORDERLESS
"""


comptime WINDOW_RESIZABLE = UInt64(0x0000000000000020)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_RESIZABLE
"""


comptime WINDOW_MINIMIZED = UInt64(0x0000000000000040)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_MINIMIZED
"""


comptime WINDOW_MAXIMIZED = UInt64(0x0000000000000080)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_MAXIMIZED
"""


comptime WINDOW_MOUSE_GRABBED = UInt64(0x0000000000000100)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_MOUSE_GRABBED
"""


comptime WINDOW_INPUT_FOCUS = UInt64(0x0000000000000200)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_INPUT_FOCUS
"""


comptime WINDOW_MOUSE_FOCUS = UInt64(0x0000000000000400)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_MOUSE_FOCUS
"""


comptime WINDOW_EXTERNAL = UInt64(0x0000000000000800)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_EXTERNAL
"""


comptime WINDOW_MODAL = UInt64(0x0000000000001000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_MODAL
"""


comptime WINDOW_HIGH_PIXEL_DENSITY = UInt64(0x0000000000002000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_HIGH_PIXEL_DENSITY
"""


comptime WINDOW_MOUSE_CAPTURE = UInt64(0x0000000000004000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_MOUSE_CAPTURE
"""


comptime WINDOW_MOUSE_RELATIVE_MODE = UInt64(0x0000000000008000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_MOUSE_RELATIVE_MODE
"""


comptime WINDOW_ALWAYS_ON_TOP = UInt64(0x0000000000010000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_ALWAYS_ON_TOP
"""


comptime WINDOW_UTILITY = UInt64(0x0000000000020000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_UTILITY
"""


comptime WINDOW_TOOLTIP = UInt64(0x0000000000040000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_TOOLTIP
"""


comptime WINDOW_POPUP_MENU = UInt64(0x0000000000080000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_POPUP_MENU
"""


comptime WINDOW_KEYBOARD_GRABBED = UInt64(0x0000000000100000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_KEYBOARD_GRABBED
"""


comptime WINDOW_FILL_DOCUMENT = UInt64(0x0000000000200000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_FILL_DOCUMENT
"""


comptime WINDOW_VULKAN = UInt64(0x0000000010000000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_VULKAN
"""


comptime WINDOW_METAL = UInt64(0x0000000020000000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_METAL
"""


comptime WINDOW_TRANSPARENT = UInt64(0x0000000040000000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_TRANSPARENT
"""


comptime WINDOW_NOT_FOCUSABLE = UInt64(0x0000000080000000)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_NOT_FOCUSABLE
"""


comptime WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOWPOS_UNDEFINED_MASK
"""


comptime WINDOWPOS_UNDEFINED = windowpos_undefined_display(0)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOWPOS_UNDEFINED
"""


comptime WINDOWPOS_CENTERED_MASK = 0x2FFF0000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOWPOS_CENTERED_MASK
"""


comptime WINDOWPOS_CENTERED = windowpos_centered_display(0)
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOWPOS_CENTERED
"""


comptime GL_CONTEXT_PROFILE_CORE = 0x0001
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_PROFILE_CORE
"""


comptime GL_CONTEXT_PROFILE_COMPATIBILITY = 0x0002
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_PROFILE_COMPATIBILITY
"""


comptime GL_CONTEXT_PROFILE_ES = 0x0004
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_PROFILE_ES
"""


comptime GL_CONTEXT_DEBUG_FLAG = 0x0001
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_DEBUG_FLAG
"""


comptime GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG
"""


comptime GL_CONTEXT_ROBUST_ACCESS_FLAG = 0x0004
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG
"""


comptime GL_CONTEXT_RESET_ISOLATION_FLAG = 0x0008
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_RESET_ISOLATION_FLAG
"""


comptime GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0x0000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE
"""


comptime GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x0001
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH
"""


comptime GL_CONTEXT_RESET_NO_NOTIFICATION = 0x0000
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_RESET_NO_NOTIFICATION
"""


comptime GL_CONTEXT_RESET_LOSE_CONTEXT = 0x0001
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_GL_CONTEXT_RESET_LOSE_CONTEXT
"""


comptime PROP_DISPLAY_HDR_ENABLED_BOOLEAN = "SDL.display.HDR_enabled"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN
"""


comptime PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER = "SDL.display.KMSDRM.panel_orientation"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER
"""


comptime PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER = "SDL.display.wayland.wl_output"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER
"""


comptime PROP_DISPLAY_WINDOWS_HMONITOR_POINTER = "SDL.display.windows.hmonitor"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER
"""


comptime PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN = "SDL.window.create.always_on_top"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN = "SDL.window.create.borderless"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN = "SDL.window.create.constrain_popup"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN = "SDL.window.create.focusable"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN = "SDL.window.create.external_graphics_context"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_FLAGS_NUMBER = "SDL.window.create.flags"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER
"""


comptime PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN = "SDL.window.create.fullscreen"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_HEIGHT_NUMBER = "SDL.window.create.height"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER
"""


comptime PROP_WINDOW_CREATE_HIDDEN_BOOLEAN = "SDL.window.create.hidden"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN = "SDL.window.create.high_pixel_density"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN = "SDL.window.create.maximized"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_MENU_BOOLEAN = "SDL.window.create.menu"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_METAL_BOOLEAN = "SDL.window.create.metal"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN = "SDL.window.create.minimized"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_MODAL_BOOLEAN = "SDL.window.create.modal"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN = "SDL.window.create.mouse_grabbed"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_OPENGL_BOOLEAN = "SDL.window.create.opengl"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_PARENT_POINTER = "SDL.window.create.parent"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_PARENT_POINTER
"""


comptime PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN = "SDL.window.create.resizable"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_TITLE_STRING = "SDL.window.create.title"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_TITLE_STRING
"""


comptime PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN = "SDL.window.create.transparent"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN = "SDL.window.create.tooltip"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_UTILITY_BOOLEAN = "SDL.window.create.utility"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_VULKAN_BOOLEAN = "SDL.window.create.vulkan"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_WIDTH_NUMBER = "SDL.window.create.width"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER
"""


comptime PROP_WINDOW_CREATE_X_NUMBER = "SDL.window.create.x"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_X_NUMBER
"""


comptime PROP_WINDOW_CREATE_Y_NUMBER = "SDL.window.create.y"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_Y_NUMBER
"""


comptime PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER = "SDL.window.create.cocoa.window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER
"""


comptime PROP_WINDOW_CREATE_COCOA_VIEW_POINTER = "SDL.window.create.cocoa.view"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER
"""


comptime PROP_WINDOW_CREATE_WINDOWSCENE_POINTER = "SDL.window.create.uikit.windowscene"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER
"""


comptime PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN = "SDL.window.create.wayland.surface_role_custom"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN = "SDL.window.create.wayland.create_egl_window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN
"""


comptime PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER = "SDL.window.create.wayland.wl_surface"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER
"""


comptime PROP_WINDOW_CREATE_WIN32_HWND_POINTER = "SDL.window.create.win32.hwnd"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER
"""


comptime PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER = "SDL.window.create.win32.pixel_format_hwnd"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER
"""


comptime PROP_WINDOW_CREATE_X11_WINDOW_NUMBER = "SDL.window.create.x11.window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER
"""


comptime PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING = "SDL.window.create.emscripten.canvas_id"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING
"""


comptime PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING = "SDL.window.create.emscripten.keyboard_element"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING
"""


comptime PROP_WINDOW_SHAPE_POINTER = "SDL.window.shape"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_SHAPE_POINTER
"""


comptime PROP_WINDOW_HDR_ENABLED_BOOLEAN = "SDL.window.HDR_enabled"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN
"""


comptime PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT = "SDL.window.SDR_white_level"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT
"""


comptime PROP_WINDOW_HDR_HEADROOM_FLOAT = "SDL.window.HDR_headroom"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT
"""


comptime PROP_WINDOW_ANDROID_WINDOW_POINTER = "SDL.window.android.window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER
"""


comptime PROP_WINDOW_ANDROID_SURFACE_POINTER = "SDL.window.android.surface"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER
"""


comptime PROP_WINDOW_UIKIT_WINDOW_POINTER = "SDL.window.uikit.window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER
"""


comptime PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER = "SDL.window.uikit.metal_view_tag"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER
"""


comptime PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER = "SDL.window.uikit.opengl.framebuffer"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER
"""


comptime PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER = "SDL.window.uikit.opengl.renderbuffer"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER
"""


comptime PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER = "SDL.window.uikit.opengl.resolve_framebuffer"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER
"""


comptime PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER = "SDL.window.kmsdrm.dev_index"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER
"""


comptime PROP_WINDOW_KMSDRM_DRM_FD_NUMBER = "SDL.window.kmsdrm.drm_fd"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER
"""


comptime PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER = "SDL.window.kmsdrm.gbm_dev"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER
"""


comptime PROP_WINDOW_COCOA_WINDOW_POINTER = "SDL.window.cocoa.window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_COCOA_WINDOW_POINTER
"""


comptime PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER = "SDL.window.cocoa.metal_view_tag"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER
"""


comptime PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER = "SDL.window.openvr.overlay_id"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER
"""


comptime PROP_WINDOW_VIVANTE_DISPLAY_POINTER = "SDL.window.vivante.display"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER
"""


comptime PROP_WINDOW_VIVANTE_WINDOW_POINTER = "SDL.window.vivante.window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER
"""


comptime PROP_WINDOW_VIVANTE_SURFACE_POINTER = "SDL.window.vivante.surface"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER
"""


comptime PROP_WINDOW_WIN32_HWND_POINTER = "SDL.window.win32.hwnd"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WIN32_HWND_POINTER
"""


comptime PROP_WINDOW_WIN32_HDC_POINTER = "SDL.window.win32.hdc"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WIN32_HDC_POINTER
"""


comptime PROP_WINDOW_WIN32_INSTANCE_POINTER = "SDL.window.win32.instance"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER
"""


comptime PROP_WINDOW_WAYLAND_DISPLAY_POINTER = "SDL.window.wayland.display"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER
"""


comptime PROP_WINDOW_WAYLAND_SURFACE_POINTER = "SDL.window.wayland.surface"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER
"""


comptime PROP_WINDOW_WAYLAND_VIEWPORT_POINTER = "SDL.window.wayland.viewport"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER
"""


comptime PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER = "SDL.window.wayland.egl_window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER
"""


comptime PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER = "SDL.window.wayland.xdg_surface"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER
"""


comptime PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER = "SDL.window.wayland.xdg_toplevel"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER
"""


comptime PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING = "SDL.window.wayland.xdg_toplevel_export_handle"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING
"""


comptime PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER = "SDL.window.wayland.xdg_popup"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER
"""


comptime PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER = "SDL.window.wayland.xdg_positioner"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER
"""


comptime PROP_WINDOW_X11_DISPLAY_POINTER = "SDL.window.x11.display"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_X11_DISPLAY_POINTER
"""


comptime PROP_WINDOW_X11_SCREEN_NUMBER = "SDL.window.x11.screen"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_X11_SCREEN_NUMBER
"""


comptime PROP_WINDOW_X11_WINDOW_NUMBER = "SDL.window.x11.window"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_X11_WINDOW_NUMBER
"""


comptime PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING = "SDL.window.emscripten.canvas_id"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING
"""


comptime PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING = "SDL.window.emscripten.keyboard_element"
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING
"""


comptime WINDOW_SURFACE_VSYNC_DISABLED = 0
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_SURFACE_VSYNC_DISABLED
"""


comptime WINDOW_SURFACE_VSYNC_ADAPTIVE = -1
"""See official documentation for details.

https://wiki.libsdl.org/SDL3/SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE
"""


comptime IMAGE_MAJOR_VERSION = 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/SDL_IMAGE_MAJOR_VERSION
"""


comptime IMAGE_MINOR_VERSION = 4
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/SDL_IMAGE_MINOR_VERSION
"""


comptime IMAGE_MICRO_VERSION = 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/SDL_IMAGE_MICRO_VERSION
"""


comptime IMAGE_VERSION = versionnum(IMAGE_MAJOR_VERSION, IMAGE_MINOR_VERSION, IMAGE_MICRO_VERSION)
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/SDL_IMAGE_VERSION
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING = "SDL_image.animation_encoder.create.filename"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER = "SDL_image.animation_encoder.create.iostream"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN = "SDL_image.animation_encoder.create.iostream.autoclose"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_TYPE_STRING = "SDL_image.animation_encoder.create.type"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_TYPE_STRING
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_QUALITY_NUMBER = "SDL_image.animation_encoder.create.quality"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_QUALITY_NUMBER
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_NUMERATOR_NUMBER = "SDL_image.animation_encoder.create.timebase.numerator"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_NUMERATOR_NUMBER
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER = "SDL_image.animation_encoder.create.timebase.denominator"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_MAX_THREADS_NUMBER = "SDL_image.animation_encoder.create.avif.max_threads"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_MAX_THREADS_NUMBER
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_KEYFRAME_INTERVAL_NUMBER = "SDL_image.animation_encoder.create.avif.keyframe_interval"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_KEYFRAME_INTERVAL_NUMBER
"""


comptime IMG_PROP_ANIMATION_ENCODER_CREATE_GIF_USE_LUT_BOOLEAN = "SDL_image.animation_encoder.create.gif.use_lut"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_ENCODER_CREATE_GIF_USE_LUT_BOOLEAN
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING = "SDL_image.animation_decoder.create.filename"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER = "SDL_image.animation_decoder.create.iostream"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN = "SDL_image.animation_decoder.create.iostream.autoclose"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_TYPE_STRING = "SDL_image.animation_decoder.create.type"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_TYPE_STRING
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_NUMERATOR_NUMBER = "SDL_image.animation_decoder.create.timebase.numerator"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_NUMERATOR_NUMBER
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER = "SDL_image.animation_decoder.create.timebase.denominator"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_MAX_THREADS_NUMBER = "SDL_image.animation_decoder.create.avif.max_threads"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_MAX_THREADS_NUMBER
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_INCREMENTAL_BOOLEAN = "SDL_image.animation_decoder.create.avif.allow_incremental"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_INCREMENTAL_BOOLEAN
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_PROGRESSIVE_BOOLEAN = "SDL_image.animation_decoder.create.avif.allow_progressive"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_PROGRESSIVE_BOOLEAN
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_GIF_TRANSPARENT_COLOR_INDEX_NUMBER = "SDL_image.animation_encoder.create.gif.transparent_color_index"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_GIF_TRANSPARENT_COLOR_INDEX_NUMBER
"""


comptime IMG_PROP_ANIMATION_DECODER_CREATE_GIF_NUM_COLORS_NUMBER = "SDL_image.animation_encoder.create.gif.num_colors"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_ANIMATION_DECODER_CREATE_GIF_NUM_COLORS_NUMBER
"""


comptime IMG_PROP_METADATA_IGNORE_PROPS_BOOLEAN = "SDL_image.metadata.ignore_props"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_METADATA_IGNORE_PROPS_BOOLEAN
"""


comptime IMG_PROP_METADATA_DESCRIPTION_STRING = "SDL_image.metadata.description"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_METADATA_DESCRIPTION_STRING
"""


comptime IMG_PROP_METADATA_COPYRIGHT_STRING = "SDL_image.metadata.copyright"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_METADATA_COPYRIGHT_STRING
"""


comptime IMG_PROP_METADATA_TITLE_STRING = "SDL_image.metadata.title"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_METADATA_TITLE_STRING
"""


comptime IMG_PROP_METADATA_AUTHOR_STRING = "SDL_image.metadata.author"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_METADATA_AUTHOR_STRING
"""


comptime IMG_PROP_METADATA_CREATION_TIME_STRING = "SDL_image.metadata.creation_time"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_METADATA_CREATION_TIME_STRING
"""


comptime IMG_PROP_METADATA_FRAME_COUNT_NUMBER = "SDL_image.metadata.frame_count"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_METADATA_FRAME_COUNT_NUMBER
"""


comptime IMG_PROP_METADATA_LOOP_COUNT_NUMBER = "SDL_image.metadata.loop_count"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_image/IMG_PROP_METADATA_LOOP_COUNT_NUMBER
"""


comptime TTF_MAJOR_VERSION = 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/SDL_TTF_MAJOR_VERSION
"""


comptime TTF_MINOR_VERSION = 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/SDL_TTF_MINOR_VERSION
"""


comptime TTF_MICRO_VERSION = 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/SDL_TTF_MICRO_VERSION
"""


comptime TTF_VERSION = versionnum(TTF_MAJOR_VERSION, TTF_MINOR_VERSION, TTF_MICRO_VERSION)
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/SDL_TTF_VERSION
"""


comptime TTF_PROP_FONT_CREATE_FILENAME_STRING = "SDL_ttf.font.create.filename"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_CREATE_FILENAME_STRING
"""


comptime TTF_PROP_FONT_CREATE_IOSTREAM_POINTER = "SDL_ttf.font.create.iostream"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_CREATE_IOSTREAM_POINTER
"""


comptime TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER = "SDL_ttf.font.create.iostream.offset"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER
"""


comptime TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN = "SDL_ttf.font.create.iostream.autoclose"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN
"""


comptime TTF_PROP_FONT_CREATE_SIZE_FLOAT = "SDL_ttf.font.create.size"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_CREATE_SIZE_FLOAT
"""


comptime TTF_PROP_FONT_CREATE_FACE_NUMBER = "SDL_ttf.font.create.face"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_CREATE_FACE_NUMBER
"""


comptime TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER = "SDL_ttf.font.create.hdpi"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER
"""


comptime TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER = "SDL_ttf.font.create.vdpi"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER
"""


comptime TTF_PROP_FONT_CREATE_EXISTING_FONT_POINTER = "SDL_ttf.font.create.existing_font"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_CREATE_EXISTING_FONT_POINTER
"""


comptime TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER = "SDL_ttf.font.outline.line_cap"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER
"""


comptime TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER = "SDL_ttf.font.outline.line_join"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER
"""


comptime TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER = "SDL_ttf.font.outline.miter_limit"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER
"""


comptime TTF_STYLE_NORMAL = 0x00
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_STYLE_NORMAL
"""


comptime TTF_STYLE_BOLD = 0x01
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_STYLE_BOLD
"""


comptime TTF_STYLE_ITALIC = 0x02
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_STYLE_ITALIC
"""


comptime TTF_STYLE_UNDERLINE = 0x04
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_STYLE_UNDERLINE
"""


comptime TTF_STYLE_STRIKETHROUGH = 0x08
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_STYLE_STRIKETHROUGH
"""


comptime TTF_FONT_WEIGHT_THIN = 100
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_THIN
"""


comptime TTF_FONT_WEIGHT_EXTRA_LIGHT = 200
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_EXTRA_LIGHT
"""


comptime TTF_FONT_WEIGHT_LIGHT = 300
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_LIGHT
"""


comptime TTF_FONT_WEIGHT_NORMAL = 400
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_NORMAL
"""


comptime TTF_FONT_WEIGHT_MEDIUM = 500
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_MEDIUM
"""


comptime TTF_FONT_WEIGHT_SEMI_BOLD = 600
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_SEMI_BOLD
"""


comptime TTF_FONT_WEIGHT_BOLD = 700
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_BOLD
"""


comptime TTF_FONT_WEIGHT_EXTRA_BOLD = 800
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_EXTRA_BOLD
"""


comptime TTF_FONT_WEIGHT_BLACK = 900
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_BLACK
"""


comptime TTF_FONT_WEIGHT_EXTRA_BLACK = 950
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_FONT_WEIGHT_EXTRA_BLACK
"""


comptime TTF_PROP_RENDERER_TEXT_ENGINE_RENDERER_POINTER = "SDL_ttf.renderer_text_engine.create.renderer"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_RENDERER_TEXT_ENGINE_RENDERER_POINTER
"""


comptime TTF_PROP_RENDERER_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER = "SDL_ttf.renderer_text_engine.create.atlas_texture_size"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_RENDERER_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER
"""


comptime TTF_PROP_GPU_TEXT_ENGINE_DEVICE_POINTER = "SDL_ttf.gpu_text_engine.create.device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_GPU_TEXT_ENGINE_DEVICE_POINTER
"""


comptime TTF_PROP_GPU_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER = "SDL_ttf.gpu_text_engine.create.atlas_texture_size"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_PROP_GPU_TEXT_ENGINE_ATLAS_TEXTURE_SIZE_NUMBER
"""


comptime TTF_SUBSTRING_DIRECTION_MASK = 0x000000FF
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_SUBSTRING_DIRECTION_MASK
"""


comptime TTF_SUBSTRING_TEXT_START = 0x00000100
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_SUBSTRING_TEXT_START
"""


comptime TTF_SUBSTRING_LINE_START = 0x00000200
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_SUBSTRING_LINE_START
"""


comptime TTF_SUBSTRING_LINE_END = 0x00000400
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_SUBSTRING_LINE_END
"""


comptime TTF_SUBSTRING_TEXT_END = 0x00000800
"""See official documentation for details.

https://wiki.libsdl.org/SDL_ttf/TTF_SUBSTRING_TEXT_END
"""


comptime MIXER_MAJOR_VERSION = 3
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/SDL_MIXER_MAJOR_VERSION
"""


comptime MIXER_MINOR_VERSION = 1
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/SDL_MIXER_MINOR_VERSION
"""


comptime MIXER_MICRO_VERSION = 2
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/SDL_MIXER_MICRO_VERSION
"""


comptime MIXER_VERSION = versionnum(MIXER_MAJOR_VERSION, MIXER_MINOR_VERSION, MIXER_MICRO_VERSION)
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/SDL_MIXER_VERSION
"""


comptime MIX_PROP_MIXER_DEVICE_NUMBER = "SDL_mixer.mixer.device"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_MIXER_DEVICE_NUMBER
"""


comptime MIX_PROP_AUDIO_LOAD_IOSTREAM_POINTER = "SDL_mixer.audio.load.iostream"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_AUDIO_LOAD_IOSTREAM_POINTER
"""


comptime MIX_PROP_AUDIO_LOAD_CLOSEIO_BOOLEAN = "SDL_mixer.audio.load.closeio"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_AUDIO_LOAD_CLOSEIO_BOOLEAN
"""


comptime MIX_PROP_AUDIO_LOAD_PREDECODE_BOOLEAN = "SDL_mixer.audio.load.predecode"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_AUDIO_LOAD_PREDECODE_BOOLEAN
"""


comptime MIX_PROP_AUDIO_LOAD_PREFERRED_MIXER_POINTER = "SDL_mixer.audio.load.preferred_mixer"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_AUDIO_LOAD_PREFERRED_MIXER_POINTER
"""


comptime MIX_PROP_AUDIO_LOAD_SKIP_METADATA_TAGS_BOOLEAN = "SDL_mixer.audio.load.skip_metadata_tags"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_AUDIO_LOAD_SKIP_METADATA_TAGS_BOOLEAN
"""


comptime MIX_PROP_AUDIO_DECODER_STRING = "SDL_mixer.audio.decoder"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_AUDIO_DECODER_STRING
"""


comptime MIX_PROP_METADATA_TITLE_STRING = "SDL_mixer.metadata.title"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_METADATA_TITLE_STRING
"""


comptime MIX_PROP_METADATA_ARTIST_STRING = "SDL_mixer.metadata.artist"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_METADATA_ARTIST_STRING
"""


comptime MIX_PROP_METADATA_ALBUM_STRING = "SDL_mixer.metadata.album"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_METADATA_ALBUM_STRING
"""


comptime MIX_PROP_METADATA_COPYRIGHT_STRING = "SDL_mixer.metadata.copyright"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_METADATA_COPYRIGHT_STRING
"""


comptime MIX_PROP_METADATA_TRACK_NUMBER = "SDL_mixer.metadata.track"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_METADATA_TRACK_NUMBER
"""


comptime MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER = "SDL_mixer.metadata.total_tracks"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER
"""


comptime MIX_PROP_METADATA_YEAR_NUMBER = "SDL_mixer.metadata.year"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_METADATA_YEAR_NUMBER
"""


comptime MIX_PROP_METADATA_DURATION_FRAMES_NUMBER = "SDL_mixer.metadata.duration_frames"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_METADATA_DURATION_FRAMES_NUMBER
"""


comptime MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN = "SDL_mixer.metadata.duration_infinite"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN
"""


comptime MIX_DURATION_UNKNOWN = -1
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_DURATION_UNKNOWN
"""


comptime MIX_DURATION_INFINITE = -2
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_DURATION_INFINITE
"""


comptime MIX_PROP_PLAY_LOOPS_NUMBER = "SDL_mixer.play.loops"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_LOOPS_NUMBER
"""


comptime MIX_PROP_PLAY_MAX_FRAME_NUMBER = "SDL_mixer.play.max_frame"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_MAX_FRAME_NUMBER
"""


comptime MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER = "SDL_mixer.play.max_milliseconds"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER
"""


comptime MIX_PROP_PLAY_START_FRAME_NUMBER = "SDL_mixer.play.start_frame"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_START_FRAME_NUMBER
"""


comptime MIX_PROP_PLAY_START_MILLISECOND_NUMBER = "SDL_mixer.play.start_millisecond"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_START_MILLISECOND_NUMBER
"""


comptime MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER = "SDL_mixer.play.loop_start_frame"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER
"""


comptime MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER = "SDL_mixer.play.loop_start_millisecond"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER
"""


comptime MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER = "SDL_mixer.play.fade_in_frames"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER
"""


comptime MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER = "SDL_mixer.play.fade_in_milliseconds"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER
"""


comptime MIX_PROP_PLAY_FADE_IN_START_GAIN_FLOAT = "SDL_mixer.play.fade_in_start_gain"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_FADE_IN_START_GAIN_FLOAT
"""


comptime MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER = "SDL_mixer.play.append_silence_frames"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER
"""


comptime MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER = "SDL_mixer.play.append_silence_milliseconds"
"""See official documentation for details.

https://wiki.libsdl.org/SDL_mixer/MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER
"""
