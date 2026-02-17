from .typedefs import *
from .enums import *
from .misc import *


comptime Ptr = UnsafePointer


@fieldwise_init
struct AudioSpec(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AudioSpec
    """
    var format: AudioFormat
    var channels: Int32
    var freq: Int32


@fieldwise_init
struct CameraSpec(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CameraSpec
    """
    var format: PixelFormat
    var colorspace: Colorspace
    var width: Int32
    var height: Int32
    var framerate_numerator: Int32
    var framerate_denominator: Int32


@fieldwise_init
struct CommonEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CommonEvent
    """
    var type: UInt32
    var reserved: UInt32
    var timestamp: UInt64


@fieldwise_init
struct DisplayEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DisplayEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var displayID: DisplayID
    var data1: Int32
    var data2: Int32


@fieldwise_init
struct WindowEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WindowEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var data1: Int32
    var data2: Int32


@fieldwise_init
struct KeyboardDeviceEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_KeyboardDeviceEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: KeyboardID


@fieldwise_init
struct KeyboardEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_KeyboardEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var which: KeyboardID
    var scancode: Scancode
    var key: Keycode
    var mod: Keymod
    var raw: UInt16
    var down: Bool
    var repeat: Bool


@fieldwise_init
struct TextEditingEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TextEditingEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var text: CStringSlice[ImmutExternalOrigin]
    var start: Int32
    var length: Int32


@fieldwise_init
struct TextEditingCandidatesEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TextEditingCandidatesEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var candidates: Ptr[CStringSlice[ImmutExternalOrigin], ImmutExternalOrigin]
    var num_candidates: Int32
    var selected_candidate: Int32
    var horizontal: Bool
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8


@fieldwise_init
struct TextInputEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TextInputEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var text: CStringSlice[ImmutExternalOrigin]


@fieldwise_init
struct MouseDeviceEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MouseDeviceEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: MouseID


@fieldwise_init
struct MouseMotionEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MouseMotionEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var which: MouseID
    var state: MouseButtonFlags
    var x: Float32
    var y: Float32
    var xrel: Float32
    var yrel: Float32


@fieldwise_init
struct MouseButtonEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MouseButtonEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var which: MouseID
    var button: UInt8
    var down: Bool
    var clicks: UInt8
    var padding: UInt8
    var x: Float32
    var y: Float32


@fieldwise_init
struct MouseWheelEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MouseWheelEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var which: MouseID
    var x: Float32
    var y: Float32
    var direction: MouseWheelDirection
    var mouse_x: Float32
    var mouse_y: Float32
    var integer_x: Int32
    var integer_y: Int32


@fieldwise_init
struct JoyAxisEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoyAxisEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID
    var axis: UInt8
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8
    var value: Int16
    var padding4: UInt16


@fieldwise_init
struct JoyBallEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoyBallEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID
    var ball: UInt8
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8
    var xrel: Int16
    var yrel: Int16


@fieldwise_init
struct JoyHatEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoyHatEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID
    var hat: UInt8
    var value: UInt8
    var padding1: UInt8
    var padding2: UInt8


@fieldwise_init
struct JoyButtonEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoyButtonEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID
    var button: UInt8
    var down: Bool
    var padding1: UInt8
    var padding2: UInt8


@fieldwise_init
struct JoyDeviceEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoyDeviceEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID


@fieldwise_init
struct JoyBatteryEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoyBatteryEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID
    var state: PowerState
    var percent: Int32


@fieldwise_init
struct GamepadAxisEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadAxisEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID
    var axis: UInt8
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8
    var value: Int16
    var padding4: UInt16


@fieldwise_init
struct GamepadButtonEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadButtonEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID
    var button: UInt8
    var down: Bool
    var padding1: UInt8
    var padding2: UInt8


@fieldwise_init
struct GamepadDeviceEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadDeviceEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID


@fieldwise_init
struct GamepadTouchpadEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadTouchpadEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID
    var touchpad: Int32
    var finger: Int32
    var x: Float32
    var y: Float32
    var pressure: Float32


@fieldwise_init
struct GamepadSensorEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadSensorEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: JoystickID
    var sensor: Int32
    var data: InlineArray[Float32, Int(3)]
    var sensor_timestamp: UInt64


@fieldwise_init
struct AudioDeviceEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AudioDeviceEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: AudioDeviceID
    var recording: Bool
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8


@fieldwise_init
struct CameraDeviceEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CameraDeviceEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: CameraID


@fieldwise_init
struct RenderEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID


@fieldwise_init
struct TouchFingerEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TouchFingerEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var touchID: TouchID
    var fingerID: FingerID
    var x: Float32
    var y: Float32
    var dx: Float32
    var dy: Float32
    var pressure: Float32
    var windowID: WindowID


@fieldwise_init
struct PinchFingerEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PinchFingerEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var scale: Float32
    var windowID: WindowID


@fieldwise_init
struct PenProximityEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PenProximityEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var which: PenID


@fieldwise_init
struct PenMotionEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PenMotionEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var which: PenID
    var pen_state: PenInputFlags
    var x: Float32
    var y: Float32


@fieldwise_init
struct PenTouchEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PenTouchEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var which: PenID
    var pen_state: PenInputFlags
    var x: Float32
    var y: Float32
    var eraser: Bool
    var down: Bool


@fieldwise_init
struct PenButtonEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PenButtonEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var which: PenID
    var pen_state: PenInputFlags
    var x: Float32
    var y: Float32
    var button: UInt8
    var down: Bool


@fieldwise_init
struct PenAxisEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PenAxisEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var which: PenID
    var pen_state: PenInputFlags
    var x: Float32
    var y: Float32
    var axis: PenAxis
    var value: Float32


@fieldwise_init
struct DropEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DropEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var x: Float32
    var y: Float32
    var source: CStringSlice[ImmutExternalOrigin]
    var data: CStringSlice[ImmutExternalOrigin]


@fieldwise_init
struct ClipboardEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClipboardEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var owner: Bool
    var num_mime_types: Int32
    var mime_types: Ptr[CStringSlice[ImmutExternalOrigin], MutExternalOrigin]


@fieldwise_init
struct SensorEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SensorEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64
    var which: SensorID
    var data: InlineArray[Float32, Int(6)]
    var sensor_timestamp: UInt64


@fieldwise_init
struct QuitEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_QuitEvent
    """
    var type: EventType
    var reserved: UInt32
    var timestamp: UInt64


@fieldwise_init
struct UserEvent(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UserEvent
    """
    var type: UInt32
    var reserved: UInt32
    var timestamp: UInt64
    var windowID: WindowID
    var code: Int32
    var data1: Ptr[NoneType, MutExternalOrigin]
    var data2: Ptr[NoneType, MutExternalOrigin]


@fieldwise_init
struct PathInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PathInfo
    """
    var type: PathType
    var size: UInt64
    var create_time: Time
    var modify_time: Time
    var access_time: Time


@fieldwise_init
struct GPUViewport(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUViewport
    """
    var x: Float32
    var y: Float32
    var w: Float32
    var h: Float32
    var min_depth: Float32
    var max_depth: Float32


@fieldwise_init
struct GPUTextureTransferInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureTransferInfo
    """
    var transfer_buffer: Ptr[GPUTransferBuffer, MutExternalOrigin]
    var offset: UInt32
    var pixels_per_row: UInt32
    var rows_per_layer: UInt32


@fieldwise_init
struct GPUTransferBufferLocation(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTransferBufferLocation
    """
    var transfer_buffer: Ptr[GPUTransferBuffer, MutExternalOrigin]
    var offset: UInt32


@fieldwise_init
struct GPUTextureLocation(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureLocation
    """
    var texture: Ptr[GPUTexture, MutExternalOrigin]
    var mip_level: UInt32
    var layer: UInt32
    var x: UInt32
    var y: UInt32
    var z: UInt32


@fieldwise_init
struct GPUTextureRegion(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureRegion
    """
    var texture: Ptr[GPUTexture, MutExternalOrigin]
    var mip_level: UInt32
    var layer: UInt32
    var x: UInt32
    var y: UInt32
    var z: UInt32
    var w: UInt32
    var h: UInt32
    var d: UInt32


@fieldwise_init
struct GPUBlitRegion(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUBlitRegion
    """
    var texture: Ptr[GPUTexture, MutExternalOrigin]
    var mip_level: UInt32
    var layer_or_depth_plane: UInt32
    var x: UInt32
    var y: UInt32
    var w: UInt32
    var h: UInt32


@fieldwise_init
struct GPUBufferLocation(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUBufferLocation
    """
    var buffer: Ptr[GPUBuffer, MutExternalOrigin]
    var offset: UInt32


@fieldwise_init
struct GPUBufferRegion(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUBufferRegion
    """
    var buffer: Ptr[GPUBuffer, MutExternalOrigin]
    var offset: UInt32
    var size: UInt32


@fieldwise_init
struct GPUIndirectDrawCommand(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUIndirectDrawCommand
    """
    var num_vertices: UInt32
    var num_instances: UInt32
    var first_vertex: UInt32
    var first_instance: UInt32


@fieldwise_init
struct GPUIndexedIndirectDrawCommand(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUIndexedIndirectDrawCommand
    """
    var num_indices: UInt32
    var num_instances: UInt32
    var first_index: UInt32
    var vertex_offset: Int32
    var first_instance: UInt32


@fieldwise_init
struct GPUIndirectDispatchCommand(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUIndirectDispatchCommand
    """
    var groupcount_x: UInt32
    var groupcount_y: UInt32
    var groupcount_z: UInt32


@fieldwise_init
struct GPUSamplerCreateInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSamplerCreateInfo
    """
    var min_filter: GPUFilter
    var mag_filter: GPUFilter
    var mipmap_mode: GPUSamplerMipmapMode
    var address_mode_u: GPUSamplerAddressMode
    var address_mode_v: GPUSamplerAddressMode
    var address_mode_w: GPUSamplerAddressMode
    var mip_lod_bias: Float32
    var max_anisotropy: Float32
    var compare_op: GPUCompareOp
    var min_lod: Float32
    var max_lod: Float32
    var enable_anisotropy: Bool
    var enable_compare: Bool
    var padding1: UInt8
    var padding2: UInt8
    var props: PropertiesID


@fieldwise_init
struct GPUVertexBufferDescription(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUVertexBufferDescription
    """
    var slot: UInt32
    var pitch: UInt32
    var input_rate: GPUVertexInputRate
    var instance_step_rate: UInt32


@fieldwise_init
struct GPUVertexAttribute(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUVertexAttribute
    """
    var location: UInt32
    var buffer_slot: UInt32
    var format: GPUVertexElementFormat
    var offset: UInt32


@fieldwise_init
struct GPUVertexInputState(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUVertexInputState
    """
    var vertex_buffer_descriptions: Ptr[GPUVertexBufferDescription, ImmutExternalOrigin]
    var num_vertex_buffers: UInt32
    var vertex_attributes: Ptr[GPUVertexAttribute, ImmutExternalOrigin]
    var num_vertex_attributes: UInt32


@fieldwise_init
struct GPUStencilOpState(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUStencilOpState
    """
    var fail_op: GPUStencilOp
    var pass_op: GPUStencilOp
    var depth_fail_op: GPUStencilOp
    var compare_op: GPUCompareOp


@fieldwise_init
struct GPUColorTargetBlendState(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUColorTargetBlendState
    """
    var src_color_blendfactor: GPUBlendFactor
    var dst_color_blendfactor: GPUBlendFactor
    var color_blend_op: GPUBlendOp
    var src_alpha_blendfactor: GPUBlendFactor
    var dst_alpha_blendfactor: GPUBlendFactor
    var alpha_blend_op: GPUBlendOp
    var color_write_mask: GPUColorComponentFlags
    var enable_blend: Bool
    var enable_color_write_mask: Bool
    var padding1: UInt8
    var padding2: UInt8


@fieldwise_init
struct GPUShaderCreateInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUShaderCreateInfo
    """
    var code_size: Int32
    var code: Ptr[UInt8, ImmutExternalOrigin]
    var entrypoint: CStringSlice[ImmutExternalOrigin]
    var format: GPUShaderFormat
    var stage: GPUShaderStage
    var num_samplers: UInt32
    var num_storage_textures: UInt32
    var num_storage_buffers: UInt32
    var num_uniform_buffers: UInt32
    var props: PropertiesID


@fieldwise_init
struct GPUTextureCreateInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureCreateInfo
    """
    var type: GPUTextureType
    var format: GPUTextureFormat
    var usage: GPUTextureUsageFlags
    var width: UInt32
    var height: UInt32
    var layer_count_or_depth: UInt32
    var num_levels: UInt32
    var sample_count: GPUSampleCount
    var props: PropertiesID


@fieldwise_init
struct GPUBufferCreateInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUBufferCreateInfo
    """
    var usage: GPUBufferUsageFlags
    var size: UInt32
    var props: PropertiesID


@fieldwise_init
struct GPUTransferBufferCreateInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTransferBufferCreateInfo
    """
    var usage: GPUTransferBufferUsage
    var size: UInt32
    var props: PropertiesID


@fieldwise_init
struct GPURasterizerState(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPURasterizerState
    """
    var fill_mode: GPUFillMode
    var cull_mode: GPUCullMode
    var front_face: GPUFrontFace
    var depth_bias_constant_factor: Float32
    var depth_bias_clamp: Float32
    var depth_bias_slope_factor: Float32
    var enable_depth_bias: Bool
    var enable_depth_clip: Bool
    var padding1: UInt8
    var padding2: UInt8


@fieldwise_init
struct GPUMultisampleState(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUMultisampleState
    """
    var sample_count: GPUSampleCount
    var sample_mask: UInt32
    var enable_mask: Bool
    var enable_alpha_to_coverage: Bool
    var padding2: UInt8
    var padding3: UInt8


@fieldwise_init
struct GPUDepthStencilState(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUDepthStencilState
    """
    var compare_op: GPUCompareOp
    var back_stencil_state: GPUStencilOpState
    var front_stencil_state: GPUStencilOpState
    var compare_mask: UInt8
    var write_mask: UInt8
    var enable_depth_test: Bool
    var enable_depth_write: Bool
    var enable_stencil_test: Bool
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8


@fieldwise_init
struct GPUColorTargetDescription(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUColorTargetDescription
    """
    var format: GPUTextureFormat
    var blend_state: GPUColorTargetBlendState


@fieldwise_init
struct GPUGraphicsPipelineTargetInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUGraphicsPipelineTargetInfo
    """
    var color_target_descriptions: Ptr[GPUColorTargetDescription, ImmutExternalOrigin]
    var num_color_targets: UInt32
    var depth_stencil_format: GPUTextureFormat
    var has_depth_stencil_target: Bool
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8


@fieldwise_init
struct GPUGraphicsPipelineCreateInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUGraphicsPipelineCreateInfo
    """
    var vertex_shader: Ptr[GPUShader, MutExternalOrigin]
    var fragment_shader: Ptr[GPUShader, MutExternalOrigin]
    var vertex_input_state: GPUVertexInputState
    var primitive_type: GPUPrimitiveType
    var rasterizer_state: GPURasterizerState
    var multisample_state: GPUMultisampleState
    var depth_stencil_state: GPUDepthStencilState
    var target_info: GPUGraphicsPipelineTargetInfo
    var props: PropertiesID


@fieldwise_init
struct GPUComputePipelineCreateInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUComputePipelineCreateInfo
    """
    var code_size: Int32
    var code: Ptr[UInt8, ImmutExternalOrigin]
    var entrypoint: CStringSlice[ImmutExternalOrigin]
    var format: GPUShaderFormat
    var num_samplers: UInt32
    var num_readonly_storage_textures: UInt32
    var num_readonly_storage_buffers: UInt32
    var num_readwrite_storage_textures: UInt32
    var num_readwrite_storage_buffers: UInt32
    var num_uniform_buffers: UInt32
    var threadcount_x: UInt32
    var threadcount_y: UInt32
    var threadcount_z: UInt32
    var props: PropertiesID


@fieldwise_init
struct GPUColorTargetInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUColorTargetInfo
    """
    var texture: Ptr[GPUTexture, MutExternalOrigin]
    var mip_level: UInt32
    var layer_or_depth_plane: UInt32
    var clear_color: FColor
    var load_op: GPULoadOp
    var store_op: GPUStoreOp
    var resolve_texture: Ptr[GPUTexture, MutExternalOrigin]
    var resolve_mip_level: UInt32
    var resolve_layer: UInt32
    var cycle: Bool
    var cycle_resolve_texture: Bool
    var padding1: UInt8
    var padding2: UInt8


@fieldwise_init
struct GPUDepthStencilTargetInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUDepthStencilTargetInfo
    """
    var texture: Ptr[GPUTexture, MutExternalOrigin]
    var clear_depth: Float32
    var load_op: GPULoadOp
    var store_op: GPUStoreOp
    var stencil_load_op: GPULoadOp
    var stencil_store_op: GPUStoreOp
    var cycle: Bool
    var clear_stencil: UInt8
    var mip_level: UInt8
    var layer: UInt8


@fieldwise_init
struct GPUBlitInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUBlitInfo
    """
    var source: GPUBlitRegion
    var destination: GPUBlitRegion
    var load_op: GPULoadOp
    var clear_color: FColor
    var flip_mode: FlipMode
    var filter: GPUFilter
    var cycle: Bool
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8


@fieldwise_init
struct GPUBufferBinding(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUBufferBinding
    """
    var buffer: Ptr[GPUBuffer, MutExternalOrigin]
    var offset: UInt32


@fieldwise_init
struct GPUTextureSamplerBinding(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureSamplerBinding
    """
    var texture: Ptr[GPUTexture, MutExternalOrigin]
    var sampler: Ptr[GPUSampler, MutExternalOrigin]


@fieldwise_init
struct GPUStorageBufferReadWriteBinding(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUStorageBufferReadWriteBinding
    """
    var buffer: Ptr[GPUBuffer, MutExternalOrigin]
    var cycle: Bool
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8


@fieldwise_init
struct GPUStorageTextureReadWriteBinding(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUStorageTextureReadWriteBinding
    """
    var texture: Ptr[GPUTexture, MutExternalOrigin]
    var mip_level: UInt32
    var layer: UInt32
    var cycle: Bool
    var padding1: UInt8
    var padding2: UInt8
    var padding3: UInt8


@fieldwise_init
struct GPUVulkanOptions(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUVulkanOptions
    """
    var vulkan_api_version: UInt32
    var feature_list: Ptr[NoneType, MutExternalOrigin]
    var vulkan_10_physical_device_features: Ptr[NoneType, MutExternalOrigin]
    var device_extension_count: UInt32
    var device_extension_names: Ptr[CStringSlice[ImmutExternalOrigin], MutExternalOrigin]
    var instance_extension_count: UInt32
    var instance_extension_names: Ptr[CStringSlice[ImmutExternalOrigin], MutExternalOrigin]


@fieldwise_init
struct GUID(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GUID
    """
    var data: InlineArray[UInt8, Int(16)]


@fieldwise_init
struct HapticDirection(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticDirection
    """
    var type: HapticDirectionType
    var dir: InlineArray[Int32, Int(3)]


@fieldwise_init
struct HapticConstant(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticConstant
    """
    var type: HapticEffectType
    var direction: HapticDirection
    var length: UInt32
    var delay: UInt16
    var button: UInt16
    var interval: UInt16
    var level: Int16
    var attack_length: UInt16
    var attack_level: UInt16
    var fade_length: UInt16
    var fade_level: UInt16


@fieldwise_init
struct HapticPeriodic(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticPeriodic
    """
    var type: HapticEffectType
    var direction: HapticDirection
    var length: UInt32
    var delay: UInt16
    var button: UInt16
    var interval: UInt16
    var period: UInt16
    var magnitude: Int16
    var offset: Int16
    var phase: UInt16
    var attack_length: UInt16
    var attack_level: UInt16
    var fade_length: UInt16
    var fade_level: UInt16


@fieldwise_init
struct HapticCondition(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticCondition
    """
    var type: HapticEffectType
    var direction: HapticDirection
    var length: UInt32
    var delay: UInt16
    var button: UInt16
    var interval: UInt16
    var right_sat: InlineArray[UInt16, Int(3)]
    var left_sat: InlineArray[UInt16, Int(3)]
    var right_coeff: InlineArray[Int16, Int(3)]
    var left_coeff: InlineArray[Int16, Int(3)]
    var deadband: InlineArray[UInt16, Int(3)]
    var center: InlineArray[Int16, Int(3)]


@fieldwise_init
struct HapticRamp(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticRamp
    """
    var type: HapticEffectType
    var direction: HapticDirection
    var length: UInt32
    var delay: UInt16
    var button: UInt16
    var interval: UInt16
    var start: Int16
    var end: Int16
    var attack_length: UInt16
    var attack_level: UInt16
    var fade_length: UInt16
    var fade_level: UInt16


@fieldwise_init
struct HapticLeftRight(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticLeftRight
    """
    var type: HapticEffectType
    var length: UInt32
    var large_magnitude: UInt16
    var small_magnitude: UInt16


@fieldwise_init
struct HapticCustom(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticCustom
    """
    var type: HapticEffectType
    var direction: HapticDirection
    var length: UInt32
    var delay: UInt16
    var button: UInt16
    var interval: UInt16
    var channels: UInt8
    var period: UInt16
    var samples: UInt16
    var data: Ptr[UInt16, MutExternalOrigin]
    var attack_length: UInt16
    var attack_level: UInt16
    var fade_length: UInt16
    var fade_level: UInt16


@fieldwise_init
struct IOStreamInterface(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOStreamInterface
    """
    var version: UInt32
    var size: Ptr[fn(Ptr[NoneType, MutExternalOrigin]) -> Int64, ImmutExternalOrigin]
    var seek: Ptr[fn(Ptr[NoneType, MutExternalOrigin], Int64, IOWhence) -> Int64, ImmutExternalOrigin]
    var size_t: fn(Ptr[Int32, MutExternalOrigin]) -> fn(Ptr[NoneType, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32, Ptr[IOStatus, MutExternalOrigin]) -> Int32
    var flush: Ptr[fn(Ptr[NoneType, MutExternalOrigin], Ptr[IOStatus, MutExternalOrigin]) -> Bool, ImmutExternalOrigin]
    var close: Ptr[fn(Ptr[NoneType, MutExternalOrigin]) -> Bool, ImmutExternalOrigin]


@fieldwise_init
struct VirtualJoystickTouchpadDesc(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_VirtualJoystickTouchpadDesc
    """
    var nfingers: UInt16
    var padding: InlineArray[UInt16, Int(3)]


@fieldwise_init
struct VirtualJoystickSensorDesc(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_VirtualJoystickSensorDesc
    """
    var type: SensorType
    var rate: Float32


@fieldwise_init
struct VirtualJoystickDesc(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_VirtualJoystickDesc
    """
    var version: UInt32
    var type: UInt16
    var padding: UInt16
    var vendor_id: UInt16
    var product_id: UInt16
    var naxes: UInt16
    var nbuttons: UInt16
    var nballs: UInt16
    var nhats: UInt16
    var ntouchpads: UInt16
    var nsensors: UInt16
    var padding2: InlineArray[UInt16, Int(2)]
    var button_mask: UInt32
    var axis_mask: UInt32
    var name: CStringSlice[ImmutExternalOrigin]
    var touchpads: Ptr[VirtualJoystickTouchpadDesc, ImmutExternalOrigin]
    var sensors: Ptr[VirtualJoystickSensorDesc, ImmutExternalOrigin]
    var userdata: Ptr[NoneType, MutExternalOrigin]
    var Update: Ptr[fn(Ptr[NoneType, MutExternalOrigin]) -> NoneType, ImmutExternalOrigin]
    var SetPlayerIndex: Ptr[fn(Ptr[NoneType, MutExternalOrigin], Int32) -> NoneType, ImmutExternalOrigin]
    var Rumble: Ptr[fn(Ptr[NoneType, MutExternalOrigin], UInt16, UInt16) -> Bool, ImmutExternalOrigin]
    var RumbleTriggers: Ptr[fn(Ptr[NoneType, MutExternalOrigin], UInt16, UInt16) -> Bool, ImmutExternalOrigin]
    var SetLED: Ptr[fn(Ptr[NoneType, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool, ImmutExternalOrigin]
    var SendEffect: Ptr[fn(Ptr[NoneType, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool, ImmutExternalOrigin]
    var SetSensorsEnabled: Ptr[fn(Ptr[NoneType, MutExternalOrigin], Bool) -> Bool, ImmutExternalOrigin]
    var Cleanup: Ptr[fn(Ptr[NoneType, MutExternalOrigin]) -> NoneType, ImmutExternalOrigin]


@fieldwise_init
struct CursorFrameInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CursorFrameInfo
    """
    var surface: Ptr[Surface, MutExternalOrigin]
    var duration: UInt32


@fieldwise_init
struct Color(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Color
    """
    var r: UInt8
    var g: UInt8
    var b: UInt8
    var a: UInt8


@fieldwise_init
struct FColor(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FColor
    """
    var r: Float32
    var g: Float32
    var b: Float32
    var a: Float32


@fieldwise_init
struct Palette(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Palette
    """
    var ncolors: Int32
    var colors: Ptr[Color, MutExternalOrigin]
    var version: UInt32
    var refcount: Int32


@fieldwise_init
struct PixelFormatDetails(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PixelFormatDetails
    """
    var format: PixelFormat
    var bits_per_pixel: UInt8
    var bytes_per_pixel: UInt8
    var padding: InlineArray[UInt8, Int(2)]
    var Rmask: UInt32
    var Gmask: UInt32
    var Bmask: UInt32
    var Amask: UInt32
    var Rbits: UInt8
    var Gbits: UInt8
    var Bbits: UInt8
    var Abits: UInt8
    var Rshift: UInt8
    var Gshift: UInt8
    var Bshift: UInt8
    var Ashift: UInt8


@fieldwise_init
struct Point(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Point
    """
    var x: Int32
    var y: Int32


@fieldwise_init
struct FPoint(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FPoint
    """
    var x: Float32
    var y: Float32


@fieldwise_init
struct Rect(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Rect
    """
    var x: Int32
    var y: Int32
    var w: Int32
    var h: Int32


@fieldwise_init
struct FRect(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FRect
    """
    var x: Float32
    var y: Float32
    var w: Float32
    var h: Float32


@fieldwise_init
struct Vertex(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vertex
    """
    var position: FPoint
    var color: FColor
    var tex_coord: FPoint


@fieldwise_init
struct Texture(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Texture
    """
    var format: PixelFormat
    var w: Int32
    var h: Int32
    var refcount: Int32


@fieldwise_init
struct GPURenderStateCreateInfo(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPURenderStateCreateInfo
    """
    var fragment_shader: Ptr[GPUShader, MutExternalOrigin]
    var num_sampler_bindings: Int32
    var sampler_bindings: Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin]
    var num_storage_textures: Int32
    var storage_textures: Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin]
    var num_storage_buffers: Int32
    var storage_buffers: Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin]
    var props: PropertiesID


@fieldwise_init
struct StorageInterface(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StorageInterface
    """
    var version: UInt32
    var close: Ptr[fn(Ptr[NoneType, MutExternalOrigin]) -> Bool, ImmutExternalOrigin]
    var ready: Ptr[fn(Ptr[NoneType, MutExternalOrigin]) -> Bool, ImmutExternalOrigin]
    var enumerate: Ptr[fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin], EnumerateDirectoryCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool, ImmutExternalOrigin]
    var info: Ptr[fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin], Ptr[PathInfo, MutExternalOrigin]) -> Bool, ImmutExternalOrigin]
    var read_file: Ptr[fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin], UInt64) -> Bool, ImmutExternalOrigin]
    var write_file: Ptr[fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], UInt64) -> Bool, ImmutExternalOrigin]
    var mkdir: Ptr[fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin]) -> Bool, ImmutExternalOrigin]
    var remove: Ptr[fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin]) -> Bool, ImmutExternalOrigin]
    var rename: Ptr[fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin], CStringSlice[ImmutExternalOrigin]) -> Bool, ImmutExternalOrigin]
    var copy_: Ptr[fn(Ptr[NoneType, MutExternalOrigin], CStringSlice[ImmutExternalOrigin], CStringSlice[ImmutExternalOrigin]) -> Bool, ImmutExternalOrigin]
    var space_remaining: Ptr[fn(Ptr[NoneType, MutExternalOrigin]) -> UInt64, ImmutExternalOrigin]


@fieldwise_init
struct Surface(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Surface
    """
    var flags: SurfaceFlags
    var format: PixelFormat
    var w: Int32
    var h: Int32
    var pitch: Int32
    var pixels: Ptr[NoneType, MutExternalOrigin]
    var refcount: Int32
    var reserved: Ptr[NoneType, MutExternalOrigin]


@fieldwise_init
struct DateTime(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DateTime
    """
    var year: Int32
    var month: Int32
    var day: Int32
    var hour: Int32
    var minute: Int32
    var second: Int32
    var nanosecond: Int32
    var day_of_week: Int32
    var utc_offset: Int32


@fieldwise_init
struct Finger(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Finger
    """
    var id: FingerID
    var x: Float32
    var y: Float32
    var pressure: Float32


@fieldwise_init
struct DisplayMode(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DisplayMode
    """
    var displayID: DisplayID
    var format: PixelFormat
    var w: Int32
    var h: Int32
    var pixel_density: Float32
    var refresh_rate: Float32
    var refresh_rate_numerator: Int32
    var refresh_rate_denominator: Int32
    var internal: Ptr[DisplayModeData, MutExternalOrigin]


@fieldwise_init
struct IMG_Animation(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_image/IMG_Animation
    """
    var w: Int32
    var h: Int32
    var count: Int32
    var frames: Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]
    var delays: Ptr[Int32, MutExternalOrigin]


@fieldwise_init
struct TTF_Text(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_Text
    """
    var text: Ptr[c_char, MutExternalOrigin]
    var num_lines: Int32
    var refcount: Int32
    var internal: Ptr[TTF_TextData, MutExternalOrigin]


@fieldwise_init
struct TTF_GPUAtlasDrawSequence(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_GPUAtlasDrawSequence
    """
    var atlas_texture: Ptr[GPUTexture, MutExternalOrigin]
    var xy: Ptr[FPoint, MutExternalOrigin]
    var uv: Ptr[FPoint, MutExternalOrigin]
    var num_vertices: Int32
    var indices: Ptr[Int32, MutExternalOrigin]
    var num_indices: Int32
    var image_type: TTF_ImageType
    var next: Ptr[TTF_GPUAtlasDrawSequence, MutExternalOrigin]


@fieldwise_init
struct TTF_SubString(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_ttf/TTF_SubString
    """
    var flags: TTF_SubStringFlags
    var offset: Int32
    var length: Int32
    var line_index: Int32
    var cluster_index: Int32
    var rect: Rect


@fieldwise_init
struct MIX_StereoGains(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_StereoGains
    """
    var left: Float32
    var right: Float32


@fieldwise_init
struct MIX_Point3D(Copyable):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_Point3D
    """
    var x: Float32
    var y: Float32
    var z: Float32
