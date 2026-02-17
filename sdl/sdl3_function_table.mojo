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


comptime sdl3_function_table = _Global["sdl3_function_table", zero_init[Sdl3FunctionTable]]()


fn zero_init_sdl3_function_table() -> OpaquePointer[MutExternalOrigin]:
    var fn_table = alloc[Sdl3FunctionTable](1)
    memset_zero(fn_table, 1)
    return fn_table.bitcast[NoneType]()


fn destroy_sdl3_function_table(fn_table: OpaquePointer[MutExternalOrigin]):
    fn_table.bitcast[Sdl3FunctionTable]().destroy_pointee()


fn get_sdl3_function_table() -> ref [MutExternalOrigin] Sdl3FunctionTable:
    return _get_global[
        "sdl3_function_table", zero_init_sdl3_function_table, destroy_sdl3_function_table,
    ]().bitcast[Sdl3FunctionTable]()[]


fn load_dl() raises:
    var path: Path
    @parameter
    if CompilationTarget.is_linux():
        path = Path("libSDL3.so")
    elif CompilationTarget.is_macos():
        path = Path("libSDL3.dylib")
    else:
        constrained[False, "Target OS is not supported."]()
        path = Path()
    var fn_table = Ptr(to=get_sdl3_function_table())
    fn_table.init_pointee_move(Sdl3FunctionTable(path))


fn load_dl(path: Some[PathLike]) raises:
    var fn_table = Ptr(to=get_sdl3_function_table())
    fn_table.init_pointee_move(Sdl3FunctionTable(path))


struct Sdl3FunctionTable(Movable):
    var dlhandle: OwnedDLHandle
    var get_num_audio_drivers: fn() -> Int32
    var get_audio_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var get_current_audio_driver: fn() -> CStringSlice[ImmutExternalOrigin]
    var get_audio_playback_devices: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[AudioDeviceID, MutExternalOrigin]
    var get_audio_recording_devices: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[AudioDeviceID, MutExternalOrigin]
    var get_audio_device_name: fn(AudioDeviceID) -> CStringSlice[ImmutExternalOrigin]
    var get_audio_device_format: fn(AudioDeviceID, Ptr[AudioSpec, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var get_audio_device_channel_map: fn(AudioDeviceID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]
    var open_audio_device: fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> AudioDeviceID
    var is_audio_device_physical: fn(AudioDeviceID) -> Bool
    var is_audio_device_playback: fn(AudioDeviceID) -> Bool
    var pause_audio_device: fn(AudioDeviceID) -> Bool
    var resume_audio_device: fn(AudioDeviceID) -> Bool
    var audio_device_paused: fn(AudioDeviceID) -> Bool
    var get_audio_device_gain: fn(AudioDeviceID) -> Float32
    var set_audio_device_gain: fn(AudioDeviceID, Float32) -> Bool
    var close_audio_device: fn(AudioDeviceID) -> NoneType
    var bind_audio_streams: fn(AudioDeviceID, Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin], Int32) -> Bool
    var bind_audio_stream: fn(AudioDeviceID, Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var unbind_audio_streams: fn(Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin], Int32) -> NoneType
    var unbind_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> NoneType
    var get_audio_stream_device: fn(Ptr[AudioStream, MutExternalOrigin]) -> AudioDeviceID
    var create_audio_stream: fn(Ptr[AudioSpec, ImmutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]
    var get_audio_stream_properties: fn(Ptr[AudioStream, MutExternalOrigin]) -> PropertiesID
    var get_audio_stream_format: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var set_audio_stream_format: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin]) -> Bool
    var get_audio_stream_frequency_ratio: fn(Ptr[AudioStream, MutExternalOrigin]) -> Float32
    var set_audio_stream_frequency_ratio: fn(Ptr[AudioStream, MutExternalOrigin], Float32) -> Bool
    var get_audio_stream_gain: fn(Ptr[AudioStream, MutExternalOrigin]) -> Float32
    var set_audio_stream_gain: fn(Ptr[AudioStream, MutExternalOrigin], Float32) -> Bool
    var get_audio_stream_input_channel_map: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]
    var get_audio_stream_output_channel_map: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]
    var set_audio_stream_input_channel_map: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool
    var set_audio_stream_output_channel_map: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool
    var put_audio_stream_data: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var put_audio_stream_data_no_copy: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, AudioStreamDataCompleteCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var put_audio_stream_planar_data: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Ptr[NoneType, ImmutExternalOrigin], ImmutExternalOrigin], Int32, Int32) -> Bool
    var get_audio_stream_data: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Int32
    var get_audio_stream_available: fn(Ptr[AudioStream, MutExternalOrigin]) -> Int32
    var get_audio_stream_queued: fn(Ptr[AudioStream, MutExternalOrigin]) -> Int32
    var flush_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var clear_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var pause_audio_stream_device: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var resume_audio_stream_device: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var audio_stream_device_paused: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var lock_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var unlock_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var set_audio_stream_get_callback: fn(Ptr[AudioStream, MutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var set_audio_stream_put_callback: fn(Ptr[AudioStream, MutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var destroy_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> NoneType
    var open_audio_device_stream: fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]
    var set_audio_postmix_callback: fn(AudioDeviceID, AudioPostmixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var load_wav_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[AudioSpec, MutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var load_wav: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var mix_audio: fn(Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], AudioFormat, UInt32, Float32) -> Bool
    var convert_audio_samples: fn(Ptr[AudioSpec, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var get_audio_format_name: fn(AudioFormat) -> CStringSlice[ImmutExternalOrigin]
    var get_silence_value_for_format: fn(AudioFormat) -> Int32
    var compose_custom_blend_mode: fn(BlendFactor, BlendFactor, BlendOperation, BlendFactor, BlendFactor, BlendOperation) -> BlendMode
    var get_num_camera_drivers: fn() -> Int32
    var get_camera_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var get_current_camera_driver: fn() -> CStringSlice[ImmutExternalOrigin]
    var get_cameras: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[CameraID, MutExternalOrigin]
    var get_camera_supported_formats: fn(CameraID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[CameraSpec, MutExternalOrigin], MutExternalOrigin]
    var get_camera_name: fn(CameraID) -> CStringSlice[ImmutExternalOrigin]
    var get_camera_position: fn(CameraID) -> CameraPosition
    var open_camera: fn(CameraID, Ptr[CameraSpec, ImmutExternalOrigin]) -> Ptr[Camera, MutExternalOrigin]
    var get_camera_permission_state: fn(Ptr[Camera, MutExternalOrigin]) -> CameraPermissionState
    var get_camera_id: fn(Ptr[Camera, MutExternalOrigin]) -> CameraID
    var get_camera_properties: fn(Ptr[Camera, MutExternalOrigin]) -> PropertiesID
    var get_camera_format: fn(Ptr[Camera, MutExternalOrigin], Ptr[CameraSpec, MutExternalOrigin]) -> Bool
    var acquire_camera_frame: fn(Ptr[Camera, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var release_camera_frame: fn(Ptr[Camera, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> NoneType
    var close_camera: fn(Ptr[Camera, MutExternalOrigin]) -> NoneType
    var set_clipboard_text: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var get_clipboard_text: fn() -> Ptr[c_char, MutExternalOrigin]
    var has_clipboard_text: fn() -> Bool
    var set_primary_selection_text: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var get_primary_selection_text: fn() -> Ptr[c_char, MutExternalOrigin]
    var has_primary_selection_text: fn() -> Bool
    var set_clipboard_data: fn(ClipboardDataCallback, ClipboardCleanupCallback, Ptr[NoneType, MutExternalOrigin], Ptr[CStringSlice[ImmutExternalOrigin], MutExternalOrigin], Int32) -> Bool
    var clear_clipboard_data: fn() -> Bool
    var get_clipboard_data: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var has_clipboard_data: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var get_clipboard_mime_types: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var set_error: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var set_error_v: fn(Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var out_of_memory: fn() -> Bool
    var get_error: fn() -> CStringSlice[ImmutExternalOrigin]
    var clear_error: fn() -> Bool
    var pump_events: fn() -> NoneType
    var peep_events: fn(Ptr[Event, MutExternalOrigin], Int32, EventAction, UInt32, UInt32) -> Int32
    var has_event: fn(UInt32) -> Bool
    var has_events: fn(UInt32, UInt32) -> Bool
    var flush_event: fn(UInt32) -> NoneType
    var flush_events: fn(UInt32, UInt32) -> NoneType
    var poll_event: fn(Ptr[Event, MutExternalOrigin]) -> Bool
    var wait_event: fn(Ptr[Event, MutExternalOrigin]) -> Bool
    var wait_event_timeout: fn(Ptr[Event, MutExternalOrigin], Int32) -> Bool
    var push_event: fn(Ptr[Event, MutExternalOrigin]) -> Bool
    var set_event_filter: fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var get_event_filter: fn(Ptr[EventFilter, MutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]) -> Bool
    var add_event_watch: fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var remove_event_watch: fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var filter_events: fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var set_event_enabled: fn(UInt32, Bool) -> NoneType
    var event_enabled: fn(UInt32) -> Bool
    var register_events: fn(Int32) -> UInt32
    var get_window_from_event: fn(Ptr[Event, ImmutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]
    var get_event_description: fn(Ptr[Event, ImmutExternalOrigin], Ptr[c_char, MutExternalOrigin], Int32) -> Int32
    var get_base_path: fn() -> CStringSlice[ImmutExternalOrigin]
    var get_pref_path: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[c_char, MutExternalOrigin]
    var get_user_folder: fn(Folder) -> CStringSlice[ImmutExternalOrigin]
    var create_directory: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var enumerate_directory: fn(Ptr[c_char, ImmutExternalOrigin], EnumerateDirectoryCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var remove_path: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var rename_path: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var copy_file: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var get_path_info: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[PathInfo, MutExternalOrigin]) -> Bool
    var glob_directory: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], GlobFlags, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var get_current_directory: fn() -> Ptr[c_char, MutExternalOrigin]
    var add_gamepad_mapping: fn(Ptr[c_char, ImmutExternalOrigin]) -> Int32
    var add_gamepad_mappings_from_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Int32
    var add_gamepad_mappings_from_file: fn(Ptr[c_char, ImmutExternalOrigin]) -> Int32
    var reload_gamepad_mappings: fn() -> Bool
    var get_gamepad_mappings: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var get_gamepad_mapping_for_guid: fn(GUID) -> Ptr[c_char, MutExternalOrigin]
    var get_gamepad_mapping: fn(Ptr[Gamepad, MutExternalOrigin]) -> Ptr[c_char, MutExternalOrigin]
    var set_gamepad_mapping: fn(JoystickID, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var has_gamepad: fn() -> Bool
    var get_gamepads: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[JoystickID, MutExternalOrigin]
    var is_gamepad: fn(JoystickID) -> Bool
    var get_gamepad_name_for_id: fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]
    var get_gamepad_path_for_id: fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]
    var get_gamepad_player_index_for_id: fn(JoystickID) -> Int32
    var get_gamepad_guid_for_id: fn(JoystickID) -> GUID
    var get_gamepad_vendor_for_id: fn(JoystickID) -> UInt16
    var get_gamepad_product_for_id: fn(JoystickID) -> UInt16
    var get_gamepad_product_version_for_id: fn(JoystickID) -> UInt16
    var get_gamepad_type_for_id: fn(JoystickID) -> GamepadType
    var get_real_gamepad_type_for_id: fn(JoystickID) -> GamepadType
    var get_gamepad_mapping_for_id: fn(JoystickID) -> Ptr[c_char, MutExternalOrigin]
    var open_gamepad: fn(JoystickID) -> Ptr[Gamepad, MutExternalOrigin]
    var get_gamepad_from_id: fn(JoystickID) -> Ptr[Gamepad, MutExternalOrigin]
    var get_gamepad_from_player_index: fn(Int32) -> Ptr[Gamepad, MutExternalOrigin]
    var get_gamepad_properties: fn(Ptr[Gamepad, MutExternalOrigin]) -> PropertiesID
    var get_gamepad_id: fn(Ptr[Gamepad, MutExternalOrigin]) -> JoystickID
    var get_gamepad_name: fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_gamepad_path: fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_gamepad_type: fn(Ptr[Gamepad, MutExternalOrigin]) -> GamepadType
    var get_real_gamepad_type: fn(Ptr[Gamepad, MutExternalOrigin]) -> GamepadType
    var get_gamepad_player_index: fn(Ptr[Gamepad, MutExternalOrigin]) -> Int32
    var set_gamepad_player_index: fn(Ptr[Gamepad, MutExternalOrigin], Int32) -> Bool
    var get_gamepad_vendor: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16
    var get_gamepad_product: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16
    var get_gamepad_product_version: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16
    var get_gamepad_firmware_version: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16
    var get_gamepad_serial: fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_gamepad_steam_handle: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt64
    var get_gamepad_connection_state: fn(Ptr[Gamepad, MutExternalOrigin]) -> JoystickConnectionState
    var get_gamepad_power_info: fn(Ptr[Gamepad, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState
    var gamepad_connected: fn(Ptr[Gamepad, MutExternalOrigin]) -> Bool
    var get_gamepad_joystick: fn(Ptr[Gamepad, MutExternalOrigin]) -> Ptr[Joystick, MutExternalOrigin]
    var set_gamepad_events_enabled: fn(Bool) -> NoneType
    var gamepad_events_enabled: fn() -> Bool
    var get_gamepad_bindings: fn(Ptr[Gamepad, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[GamepadBinding, MutExternalOrigin], MutExternalOrigin]
    var update_gamepads: fn() -> NoneType
    var get_gamepad_type_from_string: fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadType
    var get_gamepad_string_for_type: fn(GamepadType) -> CStringSlice[ImmutExternalOrigin]
    var get_gamepad_axis_from_string: fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadAxis
    var get_gamepad_string_for_axis: fn(GamepadAxis) -> CStringSlice[ImmutExternalOrigin]
    var gamepad_has_axis: fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> Bool
    var get_gamepad_axis: fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> Int16
    var get_gamepad_button_from_string: fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadButton
    var get_gamepad_string_for_button: fn(GamepadButton) -> CStringSlice[ImmutExternalOrigin]
    var gamepad_has_button: fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> Bool
    var get_gamepad_button: fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> Bool
    var get_gamepad_button_label_for_type: fn(GamepadType, GamepadButton) -> GamepadButtonLabel
    var get_gamepad_button_label: fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> GamepadButtonLabel
    var get_num_gamepad_touchpads: fn(Ptr[Gamepad, MutExternalOrigin]) -> Int32
    var get_num_gamepad_touchpad_fingers: fn(Ptr[Gamepad, MutExternalOrigin], Int32) -> Int32
    var get_gamepad_touchpad_finger: fn(Ptr[Gamepad, MutExternalOrigin], Int32, Int32, Ptr[Bool, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var gamepad_has_sensor: fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Bool
    var set_gamepad_sensor_enabled: fn(Ptr[Gamepad, MutExternalOrigin], SensorType, Bool) -> Bool
    var gamepad_sensor_enabled: fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Bool
    var get_gamepad_sensor_data_rate: fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Float32
    var get_gamepad_sensor_data: fn(Ptr[Gamepad, MutExternalOrigin], SensorType, Ptr[Float32, MutExternalOrigin], Int32) -> Bool
    var rumble_gamepad: fn(Ptr[Gamepad, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool
    var rumble_gamepad_triggers: fn(Ptr[Gamepad, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool
    var set_gamepad_led: fn(Ptr[Gamepad, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool
    var send_gamepad_effect: fn(Ptr[Gamepad, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var close_gamepad: fn(Ptr[Gamepad, MutExternalOrigin]) -> NoneType
    var get_gamepad_apple_sf_symbols_name_for_button: fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> CStringSlice[ImmutExternalOrigin]
    var get_gamepad_apple_sf_symbols_name_for_axis: fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> CStringSlice[ImmutExternalOrigin]
    var gpu_supports_shader_formats: fn(GPUShaderFormat, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var gpu_supports_properties: fn(PropertiesID) -> Bool
    var create_gpu_device: fn(GPUShaderFormat, Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[GPUDevice, MutExternalOrigin]
    var create_gpu_device_with_properties: fn(PropertiesID) -> Ptr[GPUDevice, MutExternalOrigin]
    var destroy_gpu_device: fn(Ptr[GPUDevice, MutExternalOrigin]) -> NoneType
    var get_num_gpu_drivers: fn() -> Int32
    var get_gpu_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var get_gpu_device_driver: fn(Ptr[GPUDevice, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_gpu_shader_formats: fn(Ptr[GPUDevice, MutExternalOrigin]) -> GPUShaderFormat
    var get_gpu_device_properties: fn(Ptr[GPUDevice, MutExternalOrigin]) -> PropertiesID
    var create_gpu_compute_pipeline: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUComputePipelineCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUComputePipeline, MutExternalOrigin]
    var create_gpu_graphics_pipeline: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUGraphicsPipelineCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUGraphicsPipeline, MutExternalOrigin]
    var create_gpu_sampler: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUSamplerCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUSampler, MutExternalOrigin]
    var create_gpu_shader: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUShaderCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUShader, MutExternalOrigin]
    var create_gpu_texture: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTextureCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]
    var create_gpu_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBufferCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUBuffer, MutExternalOrigin]
    var create_gpu_transfer_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBufferCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUTransferBuffer, MutExternalOrigin]
    var set_gpu_buffer_name: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var set_gpu_texture_name: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var insert_gpu_debug_label: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var push_gpu_debug_group: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var pop_gpu_debug_group: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> NoneType
    var release_gpu_texture: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin]) -> NoneType
    var release_gpu_sampler: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUSampler, MutExternalOrigin]) -> NoneType
    var release_gpu_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin]) -> NoneType
    var release_gpu_transfer_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin]) -> NoneType
    var release_gpu_compute_pipeline: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUComputePipeline, MutExternalOrigin]) -> NoneType
    var release_gpu_shader: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUShader, MutExternalOrigin]) -> NoneType
    var release_gpu_graphics_pipeline: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUGraphicsPipeline, MutExternalOrigin]) -> NoneType
    var acquire_gpu_command_buffer: fn(Ptr[GPUDevice, MutExternalOrigin]) -> Ptr[GPUCommandBuffer, MutExternalOrigin]
    var push_gpu_vertex_uniform_data: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType
    var push_gpu_fragment_uniform_data: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType
    var push_gpu_compute_uniform_data: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType
    var begin_gpu_render_pass: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUColorTargetInfo, ImmutExternalOrigin], UInt32, Ptr[GPUDepthStencilTargetInfo, ImmutExternalOrigin]) -> Ptr[GPURenderPass, MutExternalOrigin]
    var bind_gpu_graphics_pipeline: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUGraphicsPipeline, MutExternalOrigin]) -> NoneType
    var set_gpu_viewport: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUViewport, ImmutExternalOrigin]) -> NoneType
    var set_gpu_scissor: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> NoneType
    var set_gpu_blend_constants: fn(Ptr[GPURenderPass, MutExternalOrigin], FColor) -> NoneType
    var set_gpu_stencil_reference: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt8) -> NoneType
    var bind_gpu_vertex_buffers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUBufferBinding, ImmutExternalOrigin], UInt32) -> NoneType
    var bind_gpu_index_buffer: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBufferBinding, ImmutExternalOrigin], GPUIndexElementSize) -> NoneType
    var bind_gpu_vertex_samplers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType
    var bind_gpu_vertex_storage_textures: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var bind_gpu_vertex_storage_buffers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var bind_gpu_fragment_samplers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType
    var bind_gpu_fragment_storage_textures: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var bind_gpu_fragment_storage_buffers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var draw_gpu_indexed_primitives: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, UInt32, UInt32, Int32, UInt32) -> NoneType
    var draw_gpu_primitives: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, UInt32, UInt32, UInt32) -> NoneType
    var draw_gpu_primitives_indirect: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32, UInt32) -> NoneType
    var draw_gpu_indexed_primitives_indirect: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32, UInt32) -> NoneType
    var end_gpu_render_pass: fn(Ptr[GPURenderPass, MutExternalOrigin]) -> NoneType
    var begin_gpu_compute_pass: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUStorageTextureReadWriteBinding, ImmutExternalOrigin], UInt32, Ptr[GPUStorageBufferReadWriteBinding, ImmutExternalOrigin], UInt32) -> Ptr[GPUComputePass, MutExternalOrigin]
    var bind_gpu_compute_pipeline: fn(Ptr[GPUComputePass, MutExternalOrigin], Ptr[GPUComputePipeline, MutExternalOrigin]) -> NoneType
    var bind_gpu_compute_samplers: fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType
    var bind_gpu_compute_storage_textures: fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var bind_gpu_compute_storage_buffers: fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var dispatch_gpu_compute: fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, UInt32, UInt32) -> NoneType
    var dispatch_gpu_compute_indirect: fn(Ptr[GPUComputePass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32) -> NoneType
    var end_gpu_compute_pass: fn(Ptr[GPUComputePass, MutExternalOrigin]) -> NoneType
    var map_gpu_transfer_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin], Bool) -> Ptr[NoneType, MutExternalOrigin]
    var unmap_gpu_transfer_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin]) -> NoneType
    var begin_gpu_copy_pass: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Ptr[GPUCopyPass, MutExternalOrigin]
    var upload_to_gpu_texture: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureTransferInfo, ImmutExternalOrigin], Ptr[GPUTextureRegion, ImmutExternalOrigin], Bool) -> NoneType
    var upload_to_gpu_buffer: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTransferBufferLocation, ImmutExternalOrigin], Ptr[GPUBufferRegion, ImmutExternalOrigin], Bool) -> NoneType
    var copy_gpu_texture_to_texture: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureLocation, ImmutExternalOrigin], Ptr[GPUTextureLocation, ImmutExternalOrigin], UInt32, UInt32, UInt32, Bool) -> NoneType
    var copy_gpu_buffer_to_buffer: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUBufferLocation, ImmutExternalOrigin], Ptr[GPUBufferLocation, ImmutExternalOrigin], UInt32, Bool) -> NoneType
    var download_from_gpu_texture: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureRegion, ImmutExternalOrigin], Ptr[GPUTextureTransferInfo, ImmutExternalOrigin]) -> NoneType
    var download_from_gpu_buffer: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUBufferRegion, ImmutExternalOrigin], Ptr[GPUTransferBufferLocation, ImmutExternalOrigin]) -> NoneType
    var end_gpu_copy_pass: fn(Ptr[GPUCopyPass, MutExternalOrigin]) -> NoneType
    var generate_mipmaps_for_gpu_texture: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin]) -> NoneType
    var blit_gpu_texture: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUBlitInfo, ImmutExternalOrigin]) -> NoneType
    var window_supports_gpu_swapchain_composition: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUSwapchainComposition) -> Bool
    var window_supports_gpu_present_mode: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUPresentMode) -> Bool
    var claim_window_for_gpu_device: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool
    var release_window_from_gpu_device: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> NoneType
    var set_gpu_swapchain_parameters: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUSwapchainComposition, GPUPresentMode) -> Bool
    var set_gpu_allowed_frames_in_flight: fn(Ptr[GPUDevice, MutExternalOrigin], UInt32) -> Bool
    var get_gpu_swapchain_texture_format: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> GPUTextureFormat
    var acquire_gpu_swapchain_texture: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[Window, MutExternalOrigin], Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var wait_for_gpu_swapchain: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool
    var wait_and_acquire_gpu_swapchain_texture: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[Window, MutExternalOrigin], Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var submit_gpu_command_buffer: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Bool
    var submit_gpu_command_buffer_and_acquire_fence: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Ptr[GPUFence, MutExternalOrigin]
    var cancel_gpu_command_buffer: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Bool
    var wait_for_gpu_idle: fn(Ptr[GPUDevice, MutExternalOrigin]) -> Bool
    var wait_for_gpu_fences: fn(Ptr[GPUDevice, MutExternalOrigin], Bool, Ptr[Ptr[GPUFence, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> Bool
    var query_gpu_fence: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUFence, MutExternalOrigin]) -> Bool
    var release_gpu_fence: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUFence, MutExternalOrigin]) -> NoneType
    var gpu_texture_format_texel_block_size: fn(GPUTextureFormat) -> UInt32
    var gpu_texture_supports_format: fn(Ptr[GPUDevice, MutExternalOrigin], GPUTextureFormat, GPUTextureType, GPUTextureUsageFlags) -> Bool
    var gpu_texture_supports_sample_count: fn(Ptr[GPUDevice, MutExternalOrigin], GPUTextureFormat, GPUSampleCount) -> Bool
    var calculate_gpu_texture_format_size: fn(GPUTextureFormat, UInt32, UInt32, UInt32) -> UInt32
    var get_pixel_format_from_gpu_texture_format: fn(GPUTextureFormat) -> PixelFormat
    var get_gpu_texture_format_from_pixel_format: fn(PixelFormat) -> GPUTextureFormat
    var guid_to_string: fn(GUID, Ptr[c_char, MutExternalOrigin], Int32) -> NoneType
    var string_to_guid: fn(Ptr[c_char, ImmutExternalOrigin]) -> GUID
    var get_haptics: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[HapticID, MutExternalOrigin]
    var get_haptic_name_for_id: fn(HapticID) -> CStringSlice[ImmutExternalOrigin]
    var open_haptic: fn(HapticID) -> Ptr[Haptic, MutExternalOrigin]
    var get_haptic_from_id: fn(HapticID) -> Ptr[Haptic, MutExternalOrigin]
    var get_haptic_id: fn(Ptr[Haptic, MutExternalOrigin]) -> HapticID
    var get_haptic_name: fn(Ptr[Haptic, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var is_mouse_haptic: fn() -> Bool
    var open_haptic_from_mouse: fn() -> Ptr[Haptic, MutExternalOrigin]
    var is_joystick_haptic: fn(Ptr[Joystick, MutExternalOrigin]) -> Bool
    var open_haptic_from_joystick: fn(Ptr[Joystick, MutExternalOrigin]) -> Ptr[Haptic, MutExternalOrigin]
    var close_haptic: fn(Ptr[Haptic, MutExternalOrigin]) -> NoneType
    var get_max_haptic_effects: fn(Ptr[Haptic, MutExternalOrigin]) -> Int32
    var get_max_haptic_effects_playing: fn(Ptr[Haptic, MutExternalOrigin]) -> Int32
    var get_haptic_features: fn(Ptr[Haptic, MutExternalOrigin]) -> UInt32
    var get_num_haptic_axes: fn(Ptr[Haptic, MutExternalOrigin]) -> Int32
    var haptic_effect_supported: fn(Ptr[Haptic, MutExternalOrigin], Ptr[HapticEffect, ImmutExternalOrigin]) -> Bool
    var create_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], Ptr[HapticEffect, ImmutExternalOrigin]) -> HapticEffectID
    var update_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID, Ptr[HapticEffect, ImmutExternalOrigin]) -> Bool
    var run_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID, UInt32) -> Bool
    var stop_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> Bool
    var destroy_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> NoneType
    var get_haptic_effect_status: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> Bool
    var set_haptic_gain: fn(Ptr[Haptic, MutExternalOrigin], Int32) -> Bool
    var set_haptic_autocenter: fn(Ptr[Haptic, MutExternalOrigin], Int32) -> Bool
    var pause_haptic: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var resume_haptic: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var stop_haptic_effects: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var haptic_rumble_supported: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var init_haptic_rumble: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var play_haptic_rumble: fn(Ptr[Haptic, MutExternalOrigin], Float32, UInt32) -> Bool
    var stop_haptic_rumble: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var set_hint_with_priority: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], HintPriority) -> Bool
    var set_hint: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var reset_hint: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var reset_hints: fn() -> NoneType
    var get_hint: fn(Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_hint_boolean: fn(Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool
    var add_hint_callback: fn(Ptr[c_char, ImmutExternalOrigin], HintCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var remove_hint_callback: fn(Ptr[c_char, ImmutExternalOrigin], HintCallback, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var init: fn(InitFlags) -> Bool
    var init_sub_system: fn(InitFlags) -> Bool
    var quit_sub_system: fn(InitFlags) -> NoneType
    var was_init: fn(InitFlags) -> InitFlags
    var quit: fn() -> NoneType
    var is_main_thread: fn() -> Bool
    var run_on_main_thread: fn(MainThreadCallback, Ptr[NoneType, MutExternalOrigin], Bool) -> Bool
    var set_app_metadata: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var set_app_metadata_property: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var get_app_metadata_property: fn(Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var io_from_file: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IOStream, MutExternalOrigin]
    var io_from_mem: fn(Ptr[NoneType, MutExternalOrigin], Int32) -> Ptr[IOStream, MutExternalOrigin]
    var io_from_const_mem: fn(Ptr[NoneType, ImmutExternalOrigin], Int32) -> Ptr[IOStream, MutExternalOrigin]
    var io_from_dynamic_mem: fn() -> Ptr[IOStream, MutExternalOrigin]
    var open_io: fn(Ptr[IOStreamInterface, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[IOStream, MutExternalOrigin]
    var close_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var get_io_properties: fn(Ptr[IOStream, MutExternalOrigin]) -> PropertiesID
    var get_io_status: fn(Ptr[IOStream, MutExternalOrigin]) -> IOStatus
    var get_io_size: fn(Ptr[IOStream, MutExternalOrigin]) -> Int64
    var seek_io: fn(Ptr[IOStream, MutExternalOrigin], Int64, IOWhence) -> Int64
    var tell_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Int64
    var read_io: fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Int32
    var write_io: fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Int32
    var i_oprintf: fn(Ptr[IOStream, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Int32
    var i_ovprintf: fn(Ptr[IOStream, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Int32
    var flush_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var load_file_io: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Bool) -> Ptr[NoneType, MutExternalOrigin]
    var load_file: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var save_file_io: fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Bool) -> Bool
    var save_file: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var read_u8: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var read_s8: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int8, MutExternalOrigin]) -> Bool
    var read_u16_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> Bool
    var read_s16_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int16, MutExternalOrigin]) -> Bool
    var read_u16_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> Bool
    var read_s16_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int16, MutExternalOrigin]) -> Bool
    var read_u32_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var read_s32_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var read_u32_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var read_s32_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var read_u64_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool
    var read_s64_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int64, MutExternalOrigin]) -> Bool
    var read_u64_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool
    var read_s64_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int64, MutExternalOrigin]) -> Bool
    var write_u8: fn(Ptr[IOStream, MutExternalOrigin], UInt8) -> Bool
    var write_s8: fn(Ptr[IOStream, MutExternalOrigin], Int8) -> Bool
    var write_u16_le: fn(Ptr[IOStream, MutExternalOrigin], UInt16) -> Bool
    var write_s16_le: fn(Ptr[IOStream, MutExternalOrigin], Int16) -> Bool
    var write_u16_be: fn(Ptr[IOStream, MutExternalOrigin], UInt16) -> Bool
    var write_s16_be: fn(Ptr[IOStream, MutExternalOrigin], Int16) -> Bool
    var write_u32_le: fn(Ptr[IOStream, MutExternalOrigin], UInt32) -> Bool
    var write_s32_le: fn(Ptr[IOStream, MutExternalOrigin], Int32) -> Bool
    var write_u32_be: fn(Ptr[IOStream, MutExternalOrigin], UInt32) -> Bool
    var write_s32_be: fn(Ptr[IOStream, MutExternalOrigin], Int32) -> Bool
    var write_u64_le: fn(Ptr[IOStream, MutExternalOrigin], UInt64) -> Bool
    var write_s64_le: fn(Ptr[IOStream, MutExternalOrigin], Int64) -> Bool
    var write_u64_be: fn(Ptr[IOStream, MutExternalOrigin], UInt64) -> Bool
    var write_s64_be: fn(Ptr[IOStream, MutExternalOrigin], Int64) -> Bool
    var lock_joysticks: fn() -> NoneType
    var unlock_joysticks: fn() -> NoneType
    var has_joystick: fn() -> Bool
    var get_joysticks: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[JoystickID, MutExternalOrigin]
    var get_joystick_name_for_id: fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]
    var get_joystick_path_for_id: fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]
    var get_joystick_player_index_for_id: fn(JoystickID) -> Int32
    var get_joystick_guid_for_id: fn(JoystickID) -> GUID
    var get_joystick_vendor_for_id: fn(JoystickID) -> UInt16
    var get_joystick_product_for_id: fn(JoystickID) -> UInt16
    var get_joystick_product_version_for_id: fn(JoystickID) -> UInt16
    var get_joystick_type_for_id: fn(JoystickID) -> JoystickType
    var open_joystick: fn(JoystickID) -> Ptr[Joystick, MutExternalOrigin]
    var get_joystick_from_id: fn(JoystickID) -> Ptr[Joystick, MutExternalOrigin]
    var get_joystick_from_player_index: fn(Int32) -> Ptr[Joystick, MutExternalOrigin]
    var attach_virtual_joystick: fn(Ptr[VirtualJoystickDesc, ImmutExternalOrigin]) -> JoystickID
    var detach_virtual_joystick: fn(JoystickID) -> Bool
    var is_joystick_virtual: fn(JoystickID) -> Bool
    var set_joystick_virtual_axis: fn(Ptr[Joystick, MutExternalOrigin], Int32, Int16) -> Bool
    var set_joystick_virtual_ball: fn(Ptr[Joystick, MutExternalOrigin], Int32, Int16, Int16) -> Bool
    var set_joystick_virtual_button: fn(Ptr[Joystick, MutExternalOrigin], Int32, Bool) -> Bool
    var set_joystick_virtual_hat: fn(Ptr[Joystick, MutExternalOrigin], Int32, UInt8) -> Bool
    var set_joystick_virtual_touchpad: fn(Ptr[Joystick, MutExternalOrigin], Int32, Int32, Bool, Float32, Float32, Float32) -> Bool
    var send_joystick_virtual_sensor_data: fn(Ptr[Joystick, MutExternalOrigin], SensorType, UInt64, Ptr[Float32, ImmutExternalOrigin], Int32) -> Bool
    var get_joystick_properties: fn(Ptr[Joystick, MutExternalOrigin]) -> PropertiesID
    var get_joystick_name: fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_joystick_path: fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_joystick_player_index: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var set_joystick_player_index: fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Bool
    var get_joystick_guid: fn(Ptr[Joystick, MutExternalOrigin]) -> GUID
    var get_joystick_vendor: fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16
    var get_joystick_product: fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16
    var get_joystick_product_version: fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16
    var get_joystick_firmware_version: fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16
    var get_joystick_serial: fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_joystick_type: fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickType
    var get_joystick_guid_info: fn(GUID, Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> NoneType
    var joystick_connected: fn(Ptr[Joystick, MutExternalOrigin]) -> Bool
    var get_joystick_id: fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickID
    var get_num_joystick_axes: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var get_num_joystick_balls: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var get_num_joystick_hats: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var get_num_joystick_buttons: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var set_joystick_events_enabled: fn(Bool) -> NoneType
    var joystick_events_enabled: fn() -> Bool
    var update_joysticks: fn() -> NoneType
    var get_joystick_axis: fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Int16
    var get_joystick_axis_initial_state: fn(Ptr[Joystick, MutExternalOrigin], Int32, Ptr[Int16, MutExternalOrigin]) -> Bool
    var get_joystick_ball: fn(Ptr[Joystick, MutExternalOrigin], Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var get_joystick_hat: fn(Ptr[Joystick, MutExternalOrigin], Int32) -> UInt8
    var get_joystick_button: fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Bool
    var rumble_joystick: fn(Ptr[Joystick, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool
    var rumble_joystick_triggers: fn(Ptr[Joystick, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool
    var set_joystick_led: fn(Ptr[Joystick, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool
    var send_joystick_effect: fn(Ptr[Joystick, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var close_joystick: fn(Ptr[Joystick, MutExternalOrigin]) -> NoneType
    var get_joystick_connection_state: fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickConnectionState
    var get_joystick_power_info: fn(Ptr[Joystick, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState
    var has_keyboard: fn() -> Bool
    var get_keyboards: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[KeyboardID, MutExternalOrigin]
    var get_keyboard_name_for_id: fn(KeyboardID) -> CStringSlice[ImmutExternalOrigin]
    var get_keyboard_focus: fn() -> Ptr[Window, MutExternalOrigin]
    var get_keyboard_state: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Bool, ImmutExternalOrigin]
    var reset_keyboard: fn() -> NoneType
    var get_mod_state: fn() -> Keymod
    var set_mod_state: fn(Keymod) -> NoneType
    var get_key_from_scancode: fn(Scancode, Keymod, Bool) -> Keycode
    var get_scancode_from_key: fn(Keycode, Ptr[Keymod, MutExternalOrigin]) -> Scancode
    var set_scancode_name: fn(Scancode, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var get_scancode_name: fn(Scancode) -> CStringSlice[ImmutExternalOrigin]
    var get_scancode_from_name: fn(Ptr[c_char, ImmutExternalOrigin]) -> Scancode
    var get_key_name: fn(Keycode) -> CStringSlice[ImmutExternalOrigin]
    var get_key_from_name: fn(Ptr[c_char, ImmutExternalOrigin]) -> Keycode
    var start_text_input: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var start_text_input_with_properties: fn(Ptr[Window, MutExternalOrigin], PropertiesID) -> Bool
    var text_input_active: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var stop_text_input: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var clear_composition: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var set_text_input_area: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32) -> Bool
    var get_text_input_area: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var has_screen_keyboard_support: fn() -> Bool
    var screen_keyboard_shown: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var set_log_priorities: fn(LogPriority) -> NoneType
    var set_log_priority: fn(Int32, LogPriority) -> NoneType
    var get_log_priority: fn(Int32) -> LogPriority
    var reset_log_priorities: fn() -> NoneType
    var set_log_priority_prefix: fn(LogPriority, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var log: fn(Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var log_trace: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var log_verbose: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var log_debug: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var log_info: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var log_warn: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var log_error: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var log_critical: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var log_message: fn(Int32, LogPriority, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var log_message_v: fn(Int32, LogPriority, Ptr[c_char, ImmutExternalOrigin], Int32) -> NoneType
    var get_default_log_output_function: fn() -> LogOutputFunction
    var get_log_output_function: fn(Ptr[LogOutputFunction, MutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]) -> NoneType
    var set_log_output_function: fn(LogOutputFunction, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var has_mouse: fn() -> Bool
    var get_mice: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[MouseID, MutExternalOrigin]
    var get_mouse_name_for_id: fn(MouseID) -> CStringSlice[ImmutExternalOrigin]
    var get_mouse_focus: fn() -> Ptr[Window, MutExternalOrigin]
    var get_mouse_state: fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags
    var get_global_mouse_state: fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags
    var get_relative_mouse_state: fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags
    var warp_mouse_in_window: fn(Ptr[Window, MutExternalOrigin], Float32, Float32) -> NoneType
    var warp_mouse_global: fn(Float32, Float32) -> Bool
    var set_relative_mouse_transform: fn(MouseMotionTransformCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var set_window_relative_mouse_mode: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var get_window_relative_mouse_mode: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var capture_mouse: fn(Bool) -> Bool
    var create_cursor: fn(Ptr[UInt8, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Int32, Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]
    var create_color_cursor: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]
    var create_animated_cursor: fn(Ptr[CursorFrameInfo, MutExternalOrigin], Int32, Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]
    var create_system_cursor: fn(SystemCursor) -> Ptr[Cursor, MutExternalOrigin]
    var set_cursor: fn(Ptr[Cursor, MutExternalOrigin]) -> Bool
    var get_cursor: fn() -> Ptr[Cursor, MutExternalOrigin]
    var get_default_cursor: fn() -> Ptr[Cursor, MutExternalOrigin]
    var destroy_cursor: fn(Ptr[Cursor, MutExternalOrigin]) -> NoneType
    var show_cursor: fn() -> Bool
    var hide_cursor: fn() -> Bool
    var cursor_visible: fn() -> Bool
    var get_pen_device_type: fn(PenID) -> PenDeviceType
    var get_pixel_format_name: fn(PixelFormat) -> CStringSlice[ImmutExternalOrigin]
    var get_masks_for_pixel_format: fn(PixelFormat, Ptr[Int32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var get_pixel_format_for_masks: fn(Int32, UInt32, UInt32, UInt32, UInt32) -> PixelFormat
    var get_pixel_format_details: fn(PixelFormat) -> Ptr[PixelFormatDetails, ImmutExternalOrigin]
    var create_palette: fn(Int32) -> Ptr[Palette, MutExternalOrigin]
    var set_palette_colors: fn(Ptr[Palette, MutExternalOrigin], Ptr[Color, ImmutExternalOrigin], Int32, Int32) -> Bool
    var destroy_palette: fn(Ptr[Palette, MutExternalOrigin]) -> NoneType
    var map_rgb: fn(Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], UInt8, UInt8, UInt8) -> UInt32
    var map_rgba: fn(Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> UInt32
    var get_rgb: fn(UInt32, Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> NoneType
    var get_rgba: fn(UInt32, Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> NoneType
    var get_power_info: fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState
    var get_global_properties: fn() -> PropertiesID
    var create_properties: fn() -> PropertiesID
    var copy_properties: fn(PropertiesID, PropertiesID) -> Bool
    var lock_properties: fn(PropertiesID) -> Bool
    var unlock_properties: fn(PropertiesID) -> NoneType
    var set_pointer_property_with_cleanup: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin], CleanupPropertyCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var set_pointer_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Bool
    var set_string_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var set_number_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool
    var set_float_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool
    var set_boolean_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool
    var has_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var get_property_type: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> PropertyType
    var get_pointer_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var get_string_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_number_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Int64) -> Int64
    var get_float_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Float32) -> Float32
    var get_boolean_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool
    var clear_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var enumerate_properties: fn(PropertiesID, EnumeratePropertiesCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var destroy_properties: fn(PropertiesID) -> NoneType
    var has_rect_intersection: fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var get_rect_intersection: fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var get_rect_union: fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var get_rect_enclosing_points: fn(Ptr[Point, ImmutExternalOrigin], Int32, Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var get_rect_and_line_intersection: fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var has_rect_intersection_float: fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var get_rect_intersection_float: fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool
    var get_rect_union_float: fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool
    var get_rect_enclosing_points_float: fn(Ptr[FPoint, ImmutExternalOrigin], Int32, Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool
    var get_rect_and_line_intersection_float: fn(Ptr[FRect, ImmutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var get_num_render_drivers: fn() -> Int32
    var get_render_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var create_window_and_renderer: fn(Ptr[c_char, ImmutExternalOrigin], Int32, Int32, WindowFlags, Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin], Ptr[Ptr[Renderer, MutExternalOrigin], MutExternalOrigin]) -> Bool
    var create_renderer: fn(Ptr[Window, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var create_renderer_with_properties: fn(PropertiesID) -> Ptr[Renderer, MutExternalOrigin]
    var create_gpu_renderer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var get_gpu_renderer_device: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[GPUDevice, MutExternalOrigin]
    var create_software_renderer: fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var get_renderer: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var get_render_window: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]
    var get_renderer_name: fn(Ptr[Renderer, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_renderer_properties: fn(Ptr[Renderer, MutExternalOrigin]) -> PropertiesID
    var get_render_output_size: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var get_current_render_output_size: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var create_texture: fn(Ptr[Renderer, MutExternalOrigin], PixelFormat, TextureAccess, Int32, Int32) -> Ptr[Texture, MutExternalOrigin]
    var create_texture_from_surface: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]
    var create_texture_with_properties: fn(Ptr[Renderer, MutExternalOrigin], PropertiesID) -> Ptr[Texture, MutExternalOrigin]
    var get_texture_properties: fn(Ptr[Texture, MutExternalOrigin]) -> PropertiesID
    var get_renderer_from_texture: fn(Ptr[Texture, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var get_texture_size: fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var set_texture_palette: fn(Ptr[Texture, MutExternalOrigin], Ptr[Palette, MutExternalOrigin]) -> Bool
    var get_texture_palette: fn(Ptr[Texture, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]
    var set_texture_color_mod: fn(Ptr[Texture, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool
    var set_texture_color_mod_float: fn(Ptr[Texture, MutExternalOrigin], Float32, Float32, Float32) -> Bool
    var get_texture_color_mod: fn(Ptr[Texture, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var get_texture_color_mod_float: fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var set_texture_alpha_mod: fn(Ptr[Texture, MutExternalOrigin], UInt8) -> Bool
    var set_texture_alpha_mod_float: fn(Ptr[Texture, MutExternalOrigin], Float32) -> Bool
    var get_texture_alpha_mod: fn(Ptr[Texture, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var get_texture_alpha_mod_float: fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var set_texture_blend_mode: fn(Ptr[Texture, MutExternalOrigin], BlendMode) -> Bool
    var get_texture_blend_mode: fn(Ptr[Texture, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool
    var set_texture_scale_mode: fn(Ptr[Texture, MutExternalOrigin], ScaleMode) -> Bool
    var get_texture_scale_mode: fn(Ptr[Texture, MutExternalOrigin], Ptr[ScaleMode, MutExternalOrigin]) -> Bool
    var update_texture: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var update_yuv_texture: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32) -> Bool
    var update_nv_texture: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32) -> Bool
    var lock_texture: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var lock_texture_to_surface: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]) -> Bool
    var unlock_texture: fn(Ptr[Texture, MutExternalOrigin]) -> NoneType
    var set_render_target: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin]) -> Bool
    var get_render_target: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]
    var set_render_logical_presentation: fn(Ptr[Renderer, MutExternalOrigin], Int32, Int32, RendererLogicalPresentation) -> Bool
    var get_render_logical_presentation: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[RendererLogicalPresentation, MutExternalOrigin]) -> Bool
    var get_render_logical_presentation_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool
    var render_coordinates_from_window: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var render_coordinates_to_window: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var convert_event_to_render_coordinates: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Event, MutExternalOrigin]) -> Bool
    var set_render_viewport: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var get_render_viewport: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var render_viewport_set: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var get_render_safe_area: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var set_render_clip_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var get_render_clip_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var render_clip_enabled: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var set_render_scale: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32) -> Bool
    var get_render_scale: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var set_render_draw_color: fn(Ptr[Renderer, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> Bool
    var set_render_draw_color_float: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool
    var get_render_draw_color: fn(Ptr[Renderer, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var get_render_draw_color_float: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var set_render_color_scale: fn(Ptr[Renderer, MutExternalOrigin], Float32) -> Bool
    var get_render_color_scale: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var set_render_draw_blend_mode: fn(Ptr[Renderer, MutExternalOrigin], BlendMode) -> Bool
    var get_render_draw_blend_mode: fn(Ptr[Renderer, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool
    var render_clear: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var render_point: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32) -> Bool
    var render_points: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Int32) -> Bool
    var render_line: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool
    var render_lines: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Int32) -> Bool
    var render_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var render_rects: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Int32) -> Bool
    var render_fill_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var render_fill_rects: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Int32) -> Bool
    var render_texture: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var render_texture_rotated: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float64, Ptr[FPoint, ImmutExternalOrigin], FlipMode) -> Bool
    var render_texture_affine: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin]) -> Bool
    var render_texture_tiled: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var render_texture9_grid: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Float32, Float32, Float32, Float32, Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var render_texture9_grid_tiled: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Float32, Float32, Float32, Float32, Ptr[FRect, ImmutExternalOrigin], Float32) -> Bool
    var render_geometry: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[Vertex, ImmutExternalOrigin], Int32, Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool
    var render_geometry_raw: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[Float32, ImmutExternalOrigin], Int32, Ptr[FColor, ImmutExternalOrigin], Int32, Ptr[Float32, ImmutExternalOrigin], Int32, Int32, Ptr[NoneType, ImmutExternalOrigin], Int32, Int32) -> Bool
    var set_render_texture_address_mode: fn(Ptr[Renderer, MutExternalOrigin], TextureAddressMode, TextureAddressMode) -> Bool
    var get_render_texture_address_mode: fn(Ptr[Renderer, MutExternalOrigin], Ptr[TextureAddressMode, MutExternalOrigin], Ptr[TextureAddressMode, MutExternalOrigin]) -> Bool
    var render_read_pixels: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var render_present: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var destroy_texture: fn(Ptr[Texture, MutExternalOrigin]) -> NoneType
    var destroy_renderer: fn(Ptr[Renderer, MutExternalOrigin]) -> NoneType
    var flush_renderer: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var get_render_metal_layer: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var get_render_metal_command_encoder: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var add_vulkan_render_semaphores: fn(Ptr[Renderer, MutExternalOrigin], UInt32, Int64, Int64) -> Bool
    var set_render_v_sync: fn(Ptr[Renderer, MutExternalOrigin], Int32) -> Bool
    var get_render_v_sync: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var render_debug_text: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var render_debug_text_format: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var set_default_texture_scale_mode: fn(Ptr[Renderer, MutExternalOrigin], ScaleMode) -> Bool
    var get_default_texture_scale_mode: fn(Ptr[Renderer, MutExternalOrigin], Ptr[ScaleMode, MutExternalOrigin]) -> Bool
    var create_gpu_render_state: fn(Ptr[Renderer, MutExternalOrigin], Ptr[GPURenderStateCreateInfo, ImmutExternalOrigin]) -> Ptr[GPURenderState, MutExternalOrigin]
    var set_gpu_render_state_fragment_uniforms: fn(Ptr[GPURenderState, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> Bool
    var set_gpu_render_state: fn(Ptr[Renderer, MutExternalOrigin], Ptr[GPURenderState, MutExternalOrigin]) -> Bool
    var destroy_gpu_render_state: fn(Ptr[GPURenderState, MutExternalOrigin]) -> NoneType
    var get_sensors: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[SensorID, MutExternalOrigin]
    var get_sensor_name_for_id: fn(SensorID) -> CStringSlice[ImmutExternalOrigin]
    var get_sensor_type_for_id: fn(SensorID) -> SensorType
    var get_sensor_non_portable_type_for_id: fn(SensorID) -> Int32
    var open_sensor: fn(SensorID) -> Ptr[Sensor, MutExternalOrigin]
    var get_sensor_from_id: fn(SensorID) -> Ptr[Sensor, MutExternalOrigin]
    var get_sensor_properties: fn(Ptr[Sensor, MutExternalOrigin]) -> PropertiesID
    var get_sensor_name: fn(Ptr[Sensor, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var get_sensor_type: fn(Ptr[Sensor, MutExternalOrigin]) -> SensorType
    var get_sensor_non_portable_type: fn(Ptr[Sensor, MutExternalOrigin]) -> Int32
    var get_sensor_id: fn(Ptr[Sensor, MutExternalOrigin]) -> SensorID
    var get_sensor_data: fn(Ptr[Sensor, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Int32) -> Bool
    var close_sensor: fn(Ptr[Sensor, MutExternalOrigin]) -> NoneType
    var update_sensors: fn() -> NoneType
    var open_title_storage: fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[Storage, MutExternalOrigin]
    var open_user_storage: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[Storage, MutExternalOrigin]
    var open_file_storage: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Storage, MutExternalOrigin]
    var open_storage: fn(Ptr[StorageInterface, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[Storage, MutExternalOrigin]
    var close_storage: fn(Ptr[Storage, MutExternalOrigin]) -> Bool
    var storage_ready: fn(Ptr[Storage, MutExternalOrigin]) -> Bool
    var get_storage_file_size: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool
    var read_storage_file: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin], UInt64) -> Bool
    var write_storage_file: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], UInt64) -> Bool
    var create_storage_directory: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var enumerate_storage_directory: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], EnumerateDirectoryCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var remove_storage_path: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var rename_storage_path: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var copy_storage_file: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var get_storage_path_info: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[PathInfo, MutExternalOrigin]) -> Bool
    var get_storage_space_remaining: fn(Ptr[Storage, MutExternalOrigin]) -> UInt64
    var glob_storage_directory: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], GlobFlags, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var create_surface: fn(Int32, Int32, PixelFormat) -> Ptr[Surface, MutExternalOrigin]
    var create_surface_from: fn(Int32, Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32) -> Ptr[Surface, MutExternalOrigin]
    var destroy_surface: fn(Ptr[Surface, MutExternalOrigin]) -> NoneType
    var get_surface_properties: fn(Ptr[Surface, MutExternalOrigin]) -> PropertiesID
    var set_surface_colorspace: fn(Ptr[Surface, MutExternalOrigin], Colorspace) -> Bool
    var get_surface_colorspace: fn(Ptr[Surface, MutExternalOrigin]) -> Colorspace
    var create_surface_palette: fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]
    var set_surface_palette: fn(Ptr[Surface, MutExternalOrigin], Ptr[Palette, MutExternalOrigin]) -> Bool
    var get_surface_palette: fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]
    var add_surface_alternate_image: fn(Ptr[Surface, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool
    var surface_has_alternate_images: fn(Ptr[Surface, MutExternalOrigin]) -> Bool
    var get_surface_images: fn(Ptr[Surface, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]
    var remove_surface_alternate_images: fn(Ptr[Surface, MutExternalOrigin]) -> NoneType
    var lock_surface: fn(Ptr[Surface, MutExternalOrigin]) -> Bool
    var unlock_surface: fn(Ptr[Surface, MutExternalOrigin]) -> NoneType
    var load_surface_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]
    var load_surface: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var load_bmp_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]
    var load_bmp: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var save_bmp_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var save_bmp: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var load_png_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]
    var load_png: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var save_png_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var save_png: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var set_surface_rle: fn(Ptr[Surface, MutExternalOrigin], Bool) -> Bool
    var surface_has_rle: fn(Ptr[Surface, MutExternalOrigin]) -> Bool
    var set_surface_color_key: fn(Ptr[Surface, MutExternalOrigin], Bool, UInt32) -> Bool
    var surface_has_color_key: fn(Ptr[Surface, MutExternalOrigin]) -> Bool
    var get_surface_color_key: fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var set_surface_color_mod: fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool
    var get_surface_color_mod: fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var set_surface_alpha_mod: fn(Ptr[Surface, MutExternalOrigin], UInt8) -> Bool
    var get_surface_alpha_mod: fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var set_surface_blend_mode: fn(Ptr[Surface, MutExternalOrigin], BlendMode) -> Bool
    var get_surface_blend_mode: fn(Ptr[Surface, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool
    var set_surface_clip_rect: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var get_surface_clip_rect: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var flip_surface: fn(Ptr[Surface, MutExternalOrigin], FlipMode) -> Bool
    var rotate_surface: fn(Ptr[Surface, MutExternalOrigin], Float32) -> Ptr[Surface, MutExternalOrigin]
    var duplicate_surface: fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var scale_surface: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, ScaleMode) -> Ptr[Surface, MutExternalOrigin]
    var convert_surface: fn(Ptr[Surface, MutExternalOrigin], PixelFormat) -> Ptr[Surface, MutExternalOrigin]
    var convert_surface_and_colorspace: fn(Ptr[Surface, MutExternalOrigin], PixelFormat, Ptr[Palette, MutExternalOrigin], Colorspace, PropertiesID) -> Ptr[Surface, MutExternalOrigin]
    var convert_pixels: fn(Int32, Int32, PixelFormat, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32) -> Bool
    var convert_pixels_and_colorspace: fn(Int32, Int32, PixelFormat, Colorspace, PropertiesID, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Colorspace, PropertiesID, Ptr[NoneType, MutExternalOrigin], Int32) -> Bool
    var premultiply_alpha: fn(Int32, Int32, PixelFormat, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32, Bool) -> Bool
    var premultiply_surface_alpha: fn(Ptr[Surface, MutExternalOrigin], Bool) -> Bool
    var clear_surface: fn(Ptr[Surface, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool
    var fill_surface_rect: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], UInt32) -> Bool
    var fill_surface_rects: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32, UInt32) -> Bool
    var blit_surface: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var blit_surface_unchecked: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var blit_surface_scaled: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool
    var blit_surface_unchecked_scaled: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool
    var stretch_surface: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool
    var blit_surface_tiled: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var blit_surface_tiled_with_scale: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Float32, ScaleMode, Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var blit_surface9_grid: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32, Int32, Int32, Int32, Float32, ScaleMode, Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var map_surface_rgb: fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8) -> UInt32
    var map_surface_rgba: fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> UInt32
    var read_surface_pixel: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var read_surface_pixel_float: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var write_surface_pixel: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, UInt8, UInt8, UInt8, UInt8) -> Bool
    var write_surface_pixel_float: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Float32, Float32, Float32, Float32) -> Bool
    var get_date_time_locale_preferences: fn(Ptr[DateFormat, MutExternalOrigin], Ptr[TimeFormat, MutExternalOrigin]) -> Bool
    var get_current_time: fn(Ptr[Time, MutExternalOrigin]) -> Bool
    var time_to_date_time: fn(Time, Ptr[DateTime, MutExternalOrigin], Bool) -> Bool
    var date_time_to_time: fn(Ptr[DateTime, ImmutExternalOrigin], Ptr[Time, MutExternalOrigin]) -> Bool
    var time_to_windows: fn(Time, Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> NoneType
    var time_from_windows: fn(UInt32, UInt32) -> Time
    var get_days_in_month: fn(Int32, Int32) -> Int32
    var get_day_of_year: fn(Int32, Int32, Int32) -> Int32
    var get_day_of_week: fn(Int32, Int32, Int32) -> Int32
    var get_ticks: fn() -> UInt64
    var get_ticks_ns: fn() -> UInt64
    var get_performance_counter: fn() -> UInt64
    var get_performance_frequency: fn() -> UInt64
    var delay: fn(UInt32) -> NoneType
    var delay_ns: fn(UInt64) -> NoneType
    var delay_precise: fn(UInt64) -> NoneType
    var add_timer: fn(UInt32, TimerCallback, Ptr[NoneType, MutExternalOrigin]) -> TimerID
    var add_timer_ns: fn(UInt64, NSTimerCallback, Ptr[NoneType, MutExternalOrigin]) -> TimerID
    var remove_timer: fn(TimerID) -> Bool
    var get_touch_devices: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[TouchID, MutExternalOrigin]
    var get_touch_device_name: fn(TouchID) -> CStringSlice[ImmutExternalOrigin]
    var get_touch_device_type: fn(TouchID) -> TouchDeviceType
    var get_touch_fingers: fn(TouchID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Finger, MutExternalOrigin], MutExternalOrigin]
    var get_version: fn() -> Int32
    var get_revision: fn() -> CStringSlice[ImmutExternalOrigin]
    var get_num_video_drivers: fn() -> Int32
    var get_video_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var get_current_video_driver: fn() -> CStringSlice[ImmutExternalOrigin]
    var get_system_theme: fn() -> SystemTheme
    var get_displays: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[DisplayID, MutExternalOrigin]
    var get_primary_display: fn() -> DisplayID
    var get_display_properties: fn(DisplayID) -> PropertiesID
    var get_display_name: fn(DisplayID) -> CStringSlice[ImmutExternalOrigin]
    var get_display_bounds: fn(DisplayID, Ptr[Rect, MutExternalOrigin]) -> Bool
    var get_display_usable_bounds: fn(DisplayID, Ptr[Rect, MutExternalOrigin]) -> Bool
    var get_natural_display_orientation: fn(DisplayID) -> DisplayOrientation
    var get_current_display_orientation: fn(DisplayID) -> DisplayOrientation
    var get_display_content_scale: fn(DisplayID) -> Float32
    var get_fullscreen_display_modes: fn(DisplayID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[DisplayMode, MutExternalOrigin], MutExternalOrigin]
    var get_closest_fullscreen_display_mode: fn(DisplayID, Int32, Int32, Float32, Bool, Ptr[DisplayMode, MutExternalOrigin]) -> Bool
    var get_desktop_display_mode: fn(DisplayID) -> Ptr[DisplayMode, ImmutExternalOrigin]
    var get_current_display_mode: fn(DisplayID) -> Ptr[DisplayMode, ImmutExternalOrigin]
    var get_display_for_point: fn(Ptr[Point, ImmutExternalOrigin]) -> DisplayID
    var get_display_for_rect: fn(Ptr[Rect, ImmutExternalOrigin]) -> DisplayID
    var get_display_for_window: fn(Ptr[Window, MutExternalOrigin]) -> DisplayID
    var get_window_pixel_density: fn(Ptr[Window, MutExternalOrigin]) -> Float32
    var get_window_display_scale: fn(Ptr[Window, MutExternalOrigin]) -> Float32
    var set_window_fullscreen_mode: fn(Ptr[Window, MutExternalOrigin], Ptr[DisplayMode, ImmutExternalOrigin]) -> Bool
    var get_window_fullscreen_mode: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[DisplayMode, ImmutExternalOrigin]
    var get_window_icc_profile: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var get_window_pixel_format: fn(Ptr[Window, MutExternalOrigin]) -> PixelFormat
    var get_windows: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin]
    var create_window: fn(Ptr[c_char, ImmutExternalOrigin], Int32, Int32, WindowFlags) -> Ptr[Window, MutExternalOrigin]
    var create_popup_window: fn(Ptr[Window, MutExternalOrigin], Int32, Int32, Int32, Int32, WindowFlags) -> Ptr[Window, MutExternalOrigin]
    var create_window_with_properties: fn(PropertiesID) -> Ptr[Window, MutExternalOrigin]
    var get_window_id: fn(Ptr[Window, MutExternalOrigin]) -> WindowID
    var get_window_from_id: fn(WindowID) -> Ptr[Window, MutExternalOrigin]
    var get_window_parent: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]
    var get_window_properties: fn(Ptr[Window, MutExternalOrigin]) -> PropertiesID
    var get_window_flags: fn(Ptr[Window, MutExternalOrigin]) -> WindowFlags
    var set_window_title: fn(Ptr[Window, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var get_window_title: fn(Ptr[Window, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var set_window_icon: fn(Ptr[Window, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool
    var set_window_position: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var get_window_position: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var set_window_size: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var get_window_size: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var get_window_safe_area: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var set_window_aspect_ratio: fn(Ptr[Window, MutExternalOrigin], Float32, Float32) -> Bool
    var get_window_aspect_ratio: fn(Ptr[Window, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var get_window_borders_size: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var get_window_size_in_pixels: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var set_window_minimum_size: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var get_window_minimum_size: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var set_window_maximum_size: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var get_window_maximum_size: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var set_window_bordered: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var set_window_resizable: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var set_window_always_on_top: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var set_window_fill_document: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var show_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var hide_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var raise_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var maximize_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var minimize_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var restore_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var set_window_fullscreen: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var sync_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var window_has_surface: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var get_window_surface: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var set_window_surface_v_sync: fn(Ptr[Window, MutExternalOrigin], Int32) -> Bool
    var get_window_surface_v_sync: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var update_window_surface: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var update_window_surface_rects: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32) -> Bool
    var destroy_window_surface: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var set_window_keyboard_grab: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var set_window_mouse_grab: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var get_window_keyboard_grab: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var get_window_mouse_grab: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var get_grabbed_window: fn() -> Ptr[Window, MutExternalOrigin]
    var set_window_mouse_rect: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var get_window_mouse_rect: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Rect, ImmutExternalOrigin]
    var set_window_opacity: fn(Ptr[Window, MutExternalOrigin], Float32) -> Bool
    var get_window_opacity: fn(Ptr[Window, MutExternalOrigin]) -> Float32
    var set_window_parent: fn(Ptr[Window, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool
    var set_window_modal: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var set_window_focusable: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var show_window_system_menu: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var set_window_hit_test: fn(Ptr[Window, MutExternalOrigin], HitTest, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var set_window_shape: fn(Ptr[Window, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool
    var flash_window: fn(Ptr[Window, MutExternalOrigin], FlashOperation) -> Bool
    var set_window_progress_state: fn(Ptr[Window, MutExternalOrigin], ProgressState) -> Bool
    var get_window_progress_state: fn(Ptr[Window, MutExternalOrigin]) -> ProgressState
    var set_window_progress_value: fn(Ptr[Window, MutExternalOrigin], Float32) -> Bool
    var get_window_progress_value: fn(Ptr[Window, MutExternalOrigin]) -> Float32
    var destroy_window: fn(Ptr[Window, MutExternalOrigin]) -> NoneType
    var screen_saver_enabled: fn() -> Bool
    var enable_screen_saver: fn() -> Bool
    var disable_screen_saver: fn() -> Bool
    var gl_load_library: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var gl_get_proc_address: fn(Ptr[c_char, ImmutExternalOrigin]) -> FunctionPointer
    var egl_get_proc_address: fn(Ptr[c_char, ImmutExternalOrigin]) -> FunctionPointer
    var gl_unload_library: fn() -> NoneType
    var gl_extension_supported: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var gl_reset_attributes: fn() -> NoneType
    var gl_set_attribute: fn(GLAttr, Int32) -> Bool
    var gl_get_attribute: fn(GLAttr, Ptr[Int32, MutExternalOrigin]) -> Bool
    var gl_create_context: fn(Ptr[Window, MutExternalOrigin]) -> GLContext
    var gl_make_current: fn(Ptr[Window, MutExternalOrigin], GLContext) -> Bool
    var gl_get_current_window: fn() -> Ptr[Window, MutExternalOrigin]
    var gl_get_current_context: fn() -> GLContext
    var egl_get_current_display: fn() -> EGLDisplay
    var egl_get_current_config: fn() -> EGLConfig
    var egl_get_window_surface: fn(Ptr[Window, MutExternalOrigin]) -> EGLSurface
    var egl_set_attribute_callbacks: fn(EGLAttribArrayCallback, EGLIntArrayCallback, EGLIntArrayCallback, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var gl_set_swap_interval: fn(Int32) -> Bool
    var gl_get_swap_interval: fn(Ptr[Int32, MutExternalOrigin]) -> Bool
    var gl_swap_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var gl_destroy_context: fn(GLContext) -> Bool
    var vulkan_load_library: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var vulkan_get_vk_get_instance_proc_addr: fn() -> FunctionPointer
    var vulkan_unload_library: fn() -> NoneType
    var vulkan_get_instance_extensions: fn(Ptr[UInt32, MutExternalOrigin]) -> Ptr[CStringSlice[ImmutExternalOrigin], ImmutExternalOrigin]
    var vulkan_create_surface: fn(Ptr[Window, MutExternalOrigin], VkInstance, Ptr[VkAllocationCallbacks, ImmutExternalOrigin], Ptr[VkSurfaceKHR, MutExternalOrigin]) -> Bool
    var vulkan_destroy_surface: fn(VkInstance, VkSurfaceKHR, Ptr[VkAllocationCallbacks, ImmutExternalOrigin]) -> NoneType
    var vulkan_get_presentation_support: fn(VkInstance, VkPhysicalDevice, UInt32) -> Bool

    fn __init__(out self, path: Some[PathLike]) raises:
        self.dlhandle = OwnedDLHandle(path)
        self.get_num_audio_drivers = self.dlhandle.get_function[fn() -> Int32]("SDL_GetNumAudioDrivers")
        self.get_audio_driver = self.dlhandle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetAudioDriver")
        self.get_current_audio_driver = self.dlhandle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCurrentAudioDriver")
        self.get_audio_playback_devices = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[AudioDeviceID, MutExternalOrigin]]("SDL_GetAudioPlaybackDevices")
        self.get_audio_recording_devices = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[AudioDeviceID, MutExternalOrigin]]("SDL_GetAudioRecordingDevices")
        self.get_audio_device_name = self.dlhandle.get_function[fn(AudioDeviceID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetAudioDeviceName")
        self.get_audio_device_format = self.dlhandle.get_function[fn(AudioDeviceID, Ptr[AudioSpec, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetAudioDeviceFormat")
        self.get_audio_device_channel_map = self.dlhandle.get_function[fn(AudioDeviceID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]]("SDL_GetAudioDeviceChannelMap")
        self.open_audio_device = self.dlhandle.get_function[fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> AudioDeviceID]("SDL_OpenAudioDevice")
        self.is_audio_device_physical = self.dlhandle.get_function[fn(AudioDeviceID) -> Bool]("SDL_IsAudioDevicePhysical")
        self.is_audio_device_playback = self.dlhandle.get_function[fn(AudioDeviceID) -> Bool]("SDL_IsAudioDevicePlayback")
        self.pause_audio_device = self.dlhandle.get_function[fn(AudioDeviceID) -> Bool]("SDL_PauseAudioDevice")
        self.resume_audio_device = self.dlhandle.get_function[fn(AudioDeviceID) -> Bool]("SDL_ResumeAudioDevice")
        self.audio_device_paused = self.dlhandle.get_function[fn(AudioDeviceID) -> Bool]("SDL_AudioDevicePaused")
        self.get_audio_device_gain = self.dlhandle.get_function[fn(AudioDeviceID) -> Float32]("SDL_GetAudioDeviceGain")
        self.set_audio_device_gain = self.dlhandle.get_function[fn(AudioDeviceID, Float32) -> Bool]("SDL_SetAudioDeviceGain")
        self.close_audio_device = self.dlhandle.get_function[fn(AudioDeviceID) -> NoneType]("SDL_CloseAudioDevice")
        self.bind_audio_streams = self.dlhandle.get_function[fn(AudioDeviceID, Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin], Int32) -> Bool]("SDL_BindAudioStreams")
        self.bind_audio_stream = self.dlhandle.get_function[fn(AudioDeviceID, Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_BindAudioStream")
        self.unbind_audio_streams = self.dlhandle.get_function[fn(Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin], Int32) -> NoneType]("SDL_UnbindAudioStreams")
        self.unbind_audio_stream = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> NoneType]("SDL_UnbindAudioStream")
        self.get_audio_stream_device = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> AudioDeviceID]("SDL_GetAudioStreamDevice")
        self.create_audio_stream = self.dlhandle.get_function[fn(Ptr[AudioSpec, ImmutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]]("SDL_CreateAudioStream")
        self.get_audio_stream_properties = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> PropertiesID]("SDL_GetAudioStreamProperties")
        self.get_audio_stream_format = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("SDL_GetAudioStreamFormat")
        self.set_audio_stream_format = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin]) -> Bool]("SDL_SetAudioStreamFormat")
        self.get_audio_stream_frequency_ratio = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Float32]("SDL_GetAudioStreamFrequencyRatio")
        self.set_audio_stream_frequency_ratio = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Float32) -> Bool]("SDL_SetAudioStreamFrequencyRatio")
        self.get_audio_stream_gain = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Float32]("SDL_GetAudioStreamGain")
        self.set_audio_stream_gain = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Float32) -> Bool]("SDL_SetAudioStreamGain")
        self.get_audio_stream_input_channel_map = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]]("SDL_GetAudioStreamInputChannelMap")
        self.get_audio_stream_output_channel_map = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]]("SDL_GetAudioStreamOutputChannelMap")
        self.set_audio_stream_input_channel_map = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool]("SDL_SetAudioStreamInputChannelMap")
        self.set_audio_stream_output_channel_map = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool]("SDL_SetAudioStreamOutputChannelMap")
        self.put_audio_stream_data = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_PutAudioStreamData")
        self.put_audio_stream_data_no_copy = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, AudioStreamDataCompleteCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_PutAudioStreamDataNoCopy")
        self.put_audio_stream_planar_data = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Ptr[NoneType, ImmutExternalOrigin], ImmutExternalOrigin], Int32, Int32) -> Bool]("SDL_PutAudioStreamPlanarData")
        self.get_audio_stream_data = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Int32]("SDL_GetAudioStreamData")
        self.get_audio_stream_available = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Int32]("SDL_GetAudioStreamAvailable")
        self.get_audio_stream_queued = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Int32]("SDL_GetAudioStreamQueued")
        self.flush_audio_stream = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_FlushAudioStream")
        self.clear_audio_stream = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_ClearAudioStream")
        self.pause_audio_stream_device = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_PauseAudioStreamDevice")
        self.resume_audio_stream_device = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_ResumeAudioStreamDevice")
        self.audio_stream_device_paused = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_AudioStreamDevicePaused")
        self.lock_audio_stream = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_LockAudioStream")
        self.unlock_audio_stream = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_UnlockAudioStream")
        self.set_audio_stream_get_callback = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetAudioStreamGetCallback")
        self.set_audio_stream_put_callback = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetAudioStreamPutCallback")
        self.destroy_audio_stream = self.dlhandle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> NoneType]("SDL_DestroyAudioStream")
        self.open_audio_device_stream = self.dlhandle.get_function[fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]]("SDL_OpenAudioDeviceStream")
        self.set_audio_postmix_callback = self.dlhandle.get_function[fn(AudioDeviceID, AudioPostmixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetAudioPostmixCallback")
        self.load_wav_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[AudioSpec, MutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_LoadWAV_IO")
        self.load_wav = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_LoadWAV")
        self.mix_audio = self.dlhandle.get_function[fn(Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], AudioFormat, UInt32, Float32) -> Bool]("SDL_MixAudio")
        self.convert_audio_samples = self.dlhandle.get_function[fn(Ptr[AudioSpec, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_ConvertAudioSamples")
        self.get_audio_format_name = self.dlhandle.get_function[fn(AudioFormat) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetAudioFormatName")
        self.get_silence_value_for_format = self.dlhandle.get_function[fn(AudioFormat) -> Int32]("SDL_GetSilenceValueForFormat")
        self.compose_custom_blend_mode = self.dlhandle.get_function[fn(BlendFactor, BlendFactor, BlendOperation, BlendFactor, BlendFactor, BlendOperation) -> BlendMode]("SDL_ComposeCustomBlendMode")
        self.get_num_camera_drivers = self.dlhandle.get_function[fn() -> Int32]("SDL_GetNumCameraDrivers")
        self.get_camera_driver = self.dlhandle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCameraDriver")
        self.get_current_camera_driver = self.dlhandle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCurrentCameraDriver")
        self.get_cameras = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[CameraID, MutExternalOrigin]]("SDL_GetCameras")
        self.get_camera_supported_formats = self.dlhandle.get_function[fn(CameraID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[CameraSpec, MutExternalOrigin], MutExternalOrigin]]("SDL_GetCameraSupportedFormats")
        self.get_camera_name = self.dlhandle.get_function[fn(CameraID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCameraName")
        self.get_camera_position = self.dlhandle.get_function[fn(CameraID) -> CameraPosition]("SDL_GetCameraPosition")
        self.open_camera = self.dlhandle.get_function[fn(CameraID, Ptr[CameraSpec, ImmutExternalOrigin]) -> Ptr[Camera, MutExternalOrigin]]("SDL_OpenCamera")
        self.get_camera_permission_state = self.dlhandle.get_function[fn(Ptr[Camera, MutExternalOrigin]) -> CameraPermissionState]("SDL_GetCameraPermissionState")
        self.get_camera_id = self.dlhandle.get_function[fn(Ptr[Camera, MutExternalOrigin]) -> CameraID]("SDL_GetCameraID")
        self.get_camera_properties = self.dlhandle.get_function[fn(Ptr[Camera, MutExternalOrigin]) -> PropertiesID]("SDL_GetCameraProperties")
        self.get_camera_format = self.dlhandle.get_function[fn(Ptr[Camera, MutExternalOrigin], Ptr[CameraSpec, MutExternalOrigin]) -> Bool]("SDL_GetCameraFormat")
        self.acquire_camera_frame = self.dlhandle.get_function[fn(Ptr[Camera, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_AcquireCameraFrame")
        self.release_camera_frame = self.dlhandle.get_function[fn(Ptr[Camera, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> NoneType]("SDL_ReleaseCameraFrame")
        self.close_camera = self.dlhandle.get_function[fn(Ptr[Camera, MutExternalOrigin]) -> NoneType]("SDL_CloseCamera")
        self.set_clipboard_text = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetClipboardText")
        self.get_clipboard_text = self.dlhandle.get_function[fn() -> Ptr[c_char, MutExternalOrigin]]("SDL_GetClipboardText")
        self.has_clipboard_text = self.dlhandle.get_function[fn() -> Bool]("SDL_HasClipboardText")
        self.set_primary_selection_text = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetPrimarySelectionText")
        self.get_primary_selection_text = self.dlhandle.get_function[fn() -> Ptr[c_char, MutExternalOrigin]]("SDL_GetPrimarySelectionText")
        self.has_primary_selection_text = self.dlhandle.get_function[fn() -> Bool]("SDL_HasPrimarySelectionText")
        self.set_clipboard_data = self.dlhandle.get_function[fn(ClipboardDataCallback, ClipboardCleanupCallback, Ptr[NoneType, MutExternalOrigin], Ptr[CStringSlice[ImmutExternalOrigin], MutExternalOrigin], Int32) -> Bool]("SDL_SetClipboardData")
        self.clear_clipboard_data = self.dlhandle.get_function[fn() -> Bool]("SDL_ClearClipboardData")
        self.get_clipboard_data = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetClipboardData")
        self.has_clipboard_data = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_HasClipboardData")
        self.get_clipboard_mime_types = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("SDL_GetClipboardMimeTypes")
        self.set_error = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetError")
        self.set_error_v = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("SDL_SetErrorV")
        self.out_of_memory = self.dlhandle.get_function[fn() -> Bool]("SDL_OutOfMemory")
        self.get_error = self.dlhandle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetError")
        self.clear_error = self.dlhandle.get_function[fn() -> Bool]("SDL_ClearError")
        self.pump_events = self.dlhandle.get_function[fn() -> NoneType]("SDL_PumpEvents")
        self.peep_events = self.dlhandle.get_function[fn(Ptr[Event, MutExternalOrigin], Int32, EventAction, UInt32, UInt32) -> Int32]("SDL_PeepEvents")
        self.has_event = self.dlhandle.get_function[fn(UInt32) -> Bool]("SDL_HasEvent")
        self.has_events = self.dlhandle.get_function[fn(UInt32, UInt32) -> Bool]("SDL_HasEvents")
        self.flush_event = self.dlhandle.get_function[fn(UInt32) -> NoneType]("SDL_FlushEvent")
        self.flush_events = self.dlhandle.get_function[fn(UInt32, UInt32) -> NoneType]("SDL_FlushEvents")
        self.poll_event = self.dlhandle.get_function[fn(Ptr[Event, MutExternalOrigin]) -> Bool]("SDL_PollEvent")
        self.wait_event = self.dlhandle.get_function[fn(Ptr[Event, MutExternalOrigin]) -> Bool]("SDL_WaitEvent")
        self.wait_event_timeout = self.dlhandle.get_function[fn(Ptr[Event, MutExternalOrigin], Int32) -> Bool]("SDL_WaitEventTimeout")
        self.push_event = self.dlhandle.get_function[fn(Ptr[Event, MutExternalOrigin]) -> Bool]("SDL_PushEvent")
        self.set_event_filter = self.dlhandle.get_function[fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_SetEventFilter")
        self.get_event_filter = self.dlhandle.get_function[fn(Ptr[EventFilter, MutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]) -> Bool]("SDL_GetEventFilter")
        self.add_event_watch = self.dlhandle.get_function[fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_AddEventWatch")
        self.remove_event_watch = self.dlhandle.get_function[fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_RemoveEventWatch")
        self.filter_events = self.dlhandle.get_function[fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_FilterEvents")
        self.set_event_enabled = self.dlhandle.get_function[fn(UInt32, Bool) -> NoneType]("SDL_SetEventEnabled")
        self.event_enabled = self.dlhandle.get_function[fn(UInt32) -> Bool]("SDL_EventEnabled")
        self.register_events = self.dlhandle.get_function[fn(Int32) -> UInt32]("SDL_RegisterEvents")
        self.get_window_from_event = self.dlhandle.get_function[fn(Ptr[Event, ImmutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]]("SDL_GetWindowFromEvent")
        self.get_event_description = self.dlhandle.get_function[fn(Ptr[Event, ImmutExternalOrigin], Ptr[c_char, MutExternalOrigin], Int32) -> Int32]("SDL_GetEventDescription")
        self.get_base_path = self.dlhandle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetBasePath")
        self.get_pref_path = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[c_char, MutExternalOrigin]]("SDL_GetPrefPath")
        self.get_user_folder = self.dlhandle.get_function[fn(Folder) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetUserFolder")
        self.create_directory = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_CreateDirectory")
        self.enumerate_directory = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], EnumerateDirectoryCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_EnumerateDirectory")
        self.remove_path = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RemovePath")
        self.rename_path = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RenamePath")
        self.copy_file = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_CopyFile")
        self.get_path_info = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[PathInfo, MutExternalOrigin]) -> Bool]("SDL_GetPathInfo")
        self.glob_directory = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], GlobFlags, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("SDL_GlobDirectory")
        self.get_current_directory = self.dlhandle.get_function[fn() -> Ptr[c_char, MutExternalOrigin]]("SDL_GetCurrentDirectory")
        self.add_gamepad_mapping = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Int32]("SDL_AddGamepadMapping")
        self.add_gamepad_mappings_from_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Int32]("SDL_AddGamepadMappingsFromIO")
        self.add_gamepad_mappings_from_file = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Int32]("SDL_AddGamepadMappingsFromFile")
        self.reload_gamepad_mappings = self.dlhandle.get_function[fn() -> Bool]("SDL_ReloadGamepadMappings")
        self.get_gamepad_mappings = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("SDL_GetGamepadMappings")
        self.get_gamepad_mapping_for_guid = self.dlhandle.get_function[fn(GUID) -> Ptr[c_char, MutExternalOrigin]]("SDL_GetGamepadMappingForGUID")
        self.get_gamepad_mapping = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Ptr[c_char, MutExternalOrigin]]("SDL_GetGamepadMapping")
        self.set_gamepad_mapping = self.dlhandle.get_function[fn(JoystickID, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetGamepadMapping")
        self.has_gamepad = self.dlhandle.get_function[fn() -> Bool]("SDL_HasGamepad")
        self.get_gamepads = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[JoystickID, MutExternalOrigin]]("SDL_GetGamepads")
        self.is_gamepad = self.dlhandle.get_function[fn(JoystickID) -> Bool]("SDL_IsGamepad")
        self.get_gamepad_name_for_id = self.dlhandle.get_function[fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadNameForID")
        self.get_gamepad_path_for_id = self.dlhandle.get_function[fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadPathForID")
        self.get_gamepad_player_index_for_id = self.dlhandle.get_function[fn(JoystickID) -> Int32]("SDL_GetGamepadPlayerIndexForID")
        self.get_gamepad_guid_for_id = self.dlhandle.get_function[fn(JoystickID) -> GUID]("SDL_GetGamepadGUIDForID")
        self.get_gamepad_vendor_for_id = self.dlhandle.get_function[fn(JoystickID) -> UInt16]("SDL_GetGamepadVendorForID")
        self.get_gamepad_product_for_id = self.dlhandle.get_function[fn(JoystickID) -> UInt16]("SDL_GetGamepadProductForID")
        self.get_gamepad_product_version_for_id = self.dlhandle.get_function[fn(JoystickID) -> UInt16]("SDL_GetGamepadProductVersionForID")
        self.get_gamepad_type_for_id = self.dlhandle.get_function[fn(JoystickID) -> GamepadType]("SDL_GetGamepadTypeForID")
        self.get_real_gamepad_type_for_id = self.dlhandle.get_function[fn(JoystickID) -> GamepadType]("SDL_GetRealGamepadTypeForID")
        self.get_gamepad_mapping_for_id = self.dlhandle.get_function[fn(JoystickID) -> Ptr[c_char, MutExternalOrigin]]("SDL_GetGamepadMappingForID")
        self.open_gamepad = self.dlhandle.get_function[fn(JoystickID) -> Ptr[Gamepad, MutExternalOrigin]]("SDL_OpenGamepad")
        self.get_gamepad_from_id = self.dlhandle.get_function[fn(JoystickID) -> Ptr[Gamepad, MutExternalOrigin]]("SDL_GetGamepadFromID")
        self.get_gamepad_from_player_index = self.dlhandle.get_function[fn(Int32) -> Ptr[Gamepad, MutExternalOrigin]]("SDL_GetGamepadFromPlayerIndex")
        self.get_gamepad_properties = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> PropertiesID]("SDL_GetGamepadProperties")
        self.get_gamepad_id = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> JoystickID]("SDL_GetGamepadID")
        self.get_gamepad_name = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadName")
        self.get_gamepad_path = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadPath")
        self.get_gamepad_type = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> GamepadType]("SDL_GetGamepadType")
        self.get_real_gamepad_type = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> GamepadType]("SDL_GetRealGamepadType")
        self.get_gamepad_player_index = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Int32]("SDL_GetGamepadPlayerIndex")
        self.set_gamepad_player_index = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Int32) -> Bool]("SDL_SetGamepadPlayerIndex")
        self.get_gamepad_vendor = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16]("SDL_GetGamepadVendor")
        self.get_gamepad_product = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16]("SDL_GetGamepadProduct")
        self.get_gamepad_product_version = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16]("SDL_GetGamepadProductVersion")
        self.get_gamepad_firmware_version = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16]("SDL_GetGamepadFirmwareVersion")
        self.get_gamepad_serial = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadSerial")
        self.get_gamepad_steam_handle = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt64]("SDL_GetGamepadSteamHandle")
        self.get_gamepad_connection_state = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> JoystickConnectionState]("SDL_GetGamepadConnectionState")
        self.get_gamepad_power_info = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState]("SDL_GetGamepadPowerInfo")
        self.gamepad_connected = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Bool]("SDL_GamepadConnected")
        self.get_gamepad_joystick = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Ptr[Joystick, MutExternalOrigin]]("SDL_GetGamepadJoystick")
        self.set_gamepad_events_enabled = self.dlhandle.get_function[fn(Bool) -> NoneType]("SDL_SetGamepadEventsEnabled")
        self.gamepad_events_enabled = self.dlhandle.get_function[fn() -> Bool]("SDL_GamepadEventsEnabled")
        self.get_gamepad_bindings = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[GamepadBinding, MutExternalOrigin], MutExternalOrigin]]("SDL_GetGamepadBindings")
        self.update_gamepads = self.dlhandle.get_function[fn() -> NoneType]("SDL_UpdateGamepads")
        self.get_gamepad_type_from_string = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadType]("SDL_GetGamepadTypeFromString")
        self.get_gamepad_string_for_type = self.dlhandle.get_function[fn(GamepadType) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadStringForType")
        self.get_gamepad_axis_from_string = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadAxis]("SDL_GetGamepadAxisFromString")
        self.get_gamepad_string_for_axis = self.dlhandle.get_function[fn(GamepadAxis) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadStringForAxis")
        self.gamepad_has_axis = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> Bool]("SDL_GamepadHasAxis")
        self.get_gamepad_axis = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> Int16]("SDL_GetGamepadAxis")
        self.get_gamepad_button_from_string = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadButton]("SDL_GetGamepadButtonFromString")
        self.get_gamepad_string_for_button = self.dlhandle.get_function[fn(GamepadButton) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadStringForButton")
        self.gamepad_has_button = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> Bool]("SDL_GamepadHasButton")
        self.get_gamepad_button = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> Bool]("SDL_GetGamepadButton")
        self.get_gamepad_button_label_for_type = self.dlhandle.get_function[fn(GamepadType, GamepadButton) -> GamepadButtonLabel]("SDL_GetGamepadButtonLabelForType")
        self.get_gamepad_button_label = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> GamepadButtonLabel]("SDL_GetGamepadButtonLabel")
        self.get_num_gamepad_touchpads = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Int32]("SDL_GetNumGamepadTouchpads")
        self.get_num_gamepad_touchpad_fingers = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Int32) -> Int32]("SDL_GetNumGamepadTouchpadFingers")
        self.get_gamepad_touchpad_finger = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Int32, Int32, Ptr[Bool, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetGamepadTouchpadFinger")
        self.gamepad_has_sensor = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Bool]("SDL_GamepadHasSensor")
        self.set_gamepad_sensor_enabled = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType, Bool) -> Bool]("SDL_SetGamepadSensorEnabled")
        self.gamepad_sensor_enabled = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Bool]("SDL_GamepadSensorEnabled")
        self.get_gamepad_sensor_data_rate = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Float32]("SDL_GetGamepadSensorDataRate")
        self.get_gamepad_sensor_data = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType, Ptr[Float32, MutExternalOrigin], Int32) -> Bool]("SDL_GetGamepadSensorData")
        self.rumble_gamepad = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool]("SDL_RumbleGamepad")
        self.rumble_gamepad_triggers = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool]("SDL_RumbleGamepadTriggers")
        self.set_gamepad_led = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool]("SDL_SetGamepadLED")
        self.send_gamepad_effect = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_SendGamepadEffect")
        self.close_gamepad = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> NoneType]("SDL_CloseGamepad")
        self.get_gamepad_apple_sf_symbols_name_for_button = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadAppleSFSymbolsNameForButton")
        self.get_gamepad_apple_sf_symbols_name_for_axis = self.dlhandle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadAppleSFSymbolsNameForAxis")
        self.gpu_supports_shader_formats = self.dlhandle.get_function[fn(GPUShaderFormat, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_GPUSupportsShaderFormats")
        self.gpu_supports_properties = self.dlhandle.get_function[fn(PropertiesID) -> Bool]("SDL_GPUSupportsProperties")
        self.create_gpu_device = self.dlhandle.get_function[fn(GPUShaderFormat, Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[GPUDevice, MutExternalOrigin]]("SDL_CreateGPUDevice")
        self.create_gpu_device_with_properties = self.dlhandle.get_function[fn(PropertiesID) -> Ptr[GPUDevice, MutExternalOrigin]]("SDL_CreateGPUDeviceWithProperties")
        self.destroy_gpu_device = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> NoneType]("SDL_DestroyGPUDevice")
        self.get_num_gpu_drivers = self.dlhandle.get_function[fn() -> Int32]("SDL_GetNumGPUDrivers")
        self.get_gpu_driver = self.dlhandle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGPUDriver")
        self.get_gpu_device_driver = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGPUDeviceDriver")
        self.get_gpu_shader_formats = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> GPUShaderFormat]("SDL_GetGPUShaderFormats")
        self.get_gpu_device_properties = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> PropertiesID]("SDL_GetGPUDeviceProperties")
        self.create_gpu_compute_pipeline = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUComputePipelineCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUComputePipeline, MutExternalOrigin]]("SDL_CreateGPUComputePipeline")
        self.create_gpu_graphics_pipeline = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUGraphicsPipelineCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUGraphicsPipeline, MutExternalOrigin]]("SDL_CreateGPUGraphicsPipeline")
        self.create_gpu_sampler = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUSamplerCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUSampler, MutExternalOrigin]]("SDL_CreateGPUSampler")
        self.create_gpu_shader = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUShaderCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUShader, MutExternalOrigin]]("SDL_CreateGPUShader")
        self.create_gpu_texture = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTextureCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]]("SDL_CreateGPUTexture")
        self.create_gpu_buffer = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBufferCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUBuffer, MutExternalOrigin]]("SDL_CreateGPUBuffer")
        self.create_gpu_transfer_buffer = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBufferCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUTransferBuffer, MutExternalOrigin]]("SDL_CreateGPUTransferBuffer")
        self.set_gpu_buffer_name = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_SetGPUBufferName")
        self.set_gpu_texture_name = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_SetGPUTextureName")
        self.insert_gpu_debug_label = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_InsertGPUDebugLabel")
        self.push_gpu_debug_group = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_PushGPUDebugGroup")
        self.pop_gpu_debug_group = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> NoneType]("SDL_PopGPUDebugGroup")
        self.release_gpu_texture = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUTexture")
        self.release_gpu_sampler = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUSampler, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUSampler")
        self.release_gpu_buffer = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUBuffer")
        self.release_gpu_transfer_buffer = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUTransferBuffer")
        self.release_gpu_compute_pipeline = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUComputePipeline, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUComputePipeline")
        self.release_gpu_shader = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUShader, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUShader")
        self.release_gpu_graphics_pipeline = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUGraphicsPipeline, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUGraphicsPipeline")
        self.acquire_gpu_command_buffer = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> Ptr[GPUCommandBuffer, MutExternalOrigin]]("SDL_AcquireGPUCommandBuffer")
        self.push_gpu_vertex_uniform_data = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_PushGPUVertexUniformData")
        self.push_gpu_fragment_uniform_data = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_PushGPUFragmentUniformData")
        self.push_gpu_compute_uniform_data = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_PushGPUComputeUniformData")
        self.begin_gpu_render_pass = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUColorTargetInfo, ImmutExternalOrigin], UInt32, Ptr[GPUDepthStencilTargetInfo, ImmutExternalOrigin]) -> Ptr[GPURenderPass, MutExternalOrigin]]("SDL_BeginGPURenderPass")
        self.bind_gpu_graphics_pipeline = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUGraphicsPipeline, MutExternalOrigin]) -> NoneType]("SDL_BindGPUGraphicsPipeline")
        self.set_gpu_viewport = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUViewport, ImmutExternalOrigin]) -> NoneType]("SDL_SetGPUViewport")
        self.set_gpu_scissor = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> NoneType]("SDL_SetGPUScissor")
        self.set_gpu_blend_constants = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], FColor) -> NoneType]("SDL_SetGPUBlendConstants")
        self.set_gpu_stencil_reference = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt8) -> NoneType]("SDL_SetGPUStencilReference")
        self.bind_gpu_vertex_buffers = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUBufferBinding, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUVertexBuffers")
        self.bind_gpu_index_buffer = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBufferBinding, ImmutExternalOrigin], GPUIndexElementSize) -> NoneType]("SDL_BindGPUIndexBuffer")
        self.bind_gpu_vertex_samplers = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUVertexSamplers")
        self.bind_gpu_vertex_storage_textures = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUVertexStorageTextures")
        self.bind_gpu_vertex_storage_buffers = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUVertexStorageBuffers")
        self.bind_gpu_fragment_samplers = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUFragmentSamplers")
        self.bind_gpu_fragment_storage_textures = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUFragmentStorageTextures")
        self.bind_gpu_fragment_storage_buffers = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUFragmentStorageBuffers")
        self.draw_gpu_indexed_primitives = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, UInt32, UInt32, Int32, UInt32) -> NoneType]("SDL_DrawGPUIndexedPrimitives")
        self.draw_gpu_primitives = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, UInt32, UInt32, UInt32) -> NoneType]("SDL_DrawGPUPrimitives")
        self.draw_gpu_primitives_indirect = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32, UInt32) -> NoneType]("SDL_DrawGPUPrimitivesIndirect")
        self.draw_gpu_indexed_primitives_indirect = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32, UInt32) -> NoneType]("SDL_DrawGPUIndexedPrimitivesIndirect")
        self.end_gpu_render_pass = self.dlhandle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin]) -> NoneType]("SDL_EndGPURenderPass")
        self.begin_gpu_compute_pass = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUStorageTextureReadWriteBinding, ImmutExternalOrigin], UInt32, Ptr[GPUStorageBufferReadWriteBinding, ImmutExternalOrigin], UInt32) -> Ptr[GPUComputePass, MutExternalOrigin]]("SDL_BeginGPUComputePass")
        self.bind_gpu_compute_pipeline = self.dlhandle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], Ptr[GPUComputePipeline, MutExternalOrigin]) -> NoneType]("SDL_BindGPUComputePipeline")
        self.bind_gpu_compute_samplers = self.dlhandle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUComputeSamplers")
        self.bind_gpu_compute_storage_textures = self.dlhandle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUComputeStorageTextures")
        self.bind_gpu_compute_storage_buffers = self.dlhandle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUComputeStorageBuffers")
        self.dispatch_gpu_compute = self.dlhandle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, UInt32, UInt32) -> NoneType]("SDL_DispatchGPUCompute")
        self.dispatch_gpu_compute_indirect = self.dlhandle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32) -> NoneType]("SDL_DispatchGPUComputeIndirect")
        self.end_gpu_compute_pass = self.dlhandle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin]) -> NoneType]("SDL_EndGPUComputePass")
        self.map_gpu_transfer_buffer = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin], Bool) -> Ptr[NoneType, MutExternalOrigin]]("SDL_MapGPUTransferBuffer")
        self.unmap_gpu_transfer_buffer = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin]) -> NoneType]("SDL_UnmapGPUTransferBuffer")
        self.begin_gpu_copy_pass = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Ptr[GPUCopyPass, MutExternalOrigin]]("SDL_BeginGPUCopyPass")
        self.upload_to_gpu_texture = self.dlhandle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureTransferInfo, ImmutExternalOrigin], Ptr[GPUTextureRegion, ImmutExternalOrigin], Bool) -> NoneType]("SDL_UploadToGPUTexture")
        self.upload_to_gpu_buffer = self.dlhandle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTransferBufferLocation, ImmutExternalOrigin], Ptr[GPUBufferRegion, ImmutExternalOrigin], Bool) -> NoneType]("SDL_UploadToGPUBuffer")
        self.copy_gpu_texture_to_texture = self.dlhandle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureLocation, ImmutExternalOrigin], Ptr[GPUTextureLocation, ImmutExternalOrigin], UInt32, UInt32, UInt32, Bool) -> NoneType]("SDL_CopyGPUTextureToTexture")
        self.copy_gpu_buffer_to_buffer = self.dlhandle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUBufferLocation, ImmutExternalOrigin], Ptr[GPUBufferLocation, ImmutExternalOrigin], UInt32, Bool) -> NoneType]("SDL_CopyGPUBufferToBuffer")
        self.download_from_gpu_texture = self.dlhandle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureRegion, ImmutExternalOrigin], Ptr[GPUTextureTransferInfo, ImmutExternalOrigin]) -> NoneType]("SDL_DownloadFromGPUTexture")
        self.download_from_gpu_buffer = self.dlhandle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUBufferRegion, ImmutExternalOrigin], Ptr[GPUTransferBufferLocation, ImmutExternalOrigin]) -> NoneType]("SDL_DownloadFromGPUBuffer")
        self.end_gpu_copy_pass = self.dlhandle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin]) -> NoneType]("SDL_EndGPUCopyPass")
        self.generate_mipmaps_for_gpu_texture = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin]) -> NoneType]("SDL_GenerateMipmapsForGPUTexture")
        self.blit_gpu_texture = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUBlitInfo, ImmutExternalOrigin]) -> NoneType]("SDL_BlitGPUTexture")
        self.window_supports_gpu_swapchain_composition = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUSwapchainComposition) -> Bool]("SDL_WindowSupportsGPUSwapchainComposition")
        self.window_supports_gpu_present_mode = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUPresentMode) -> Bool]("SDL_WindowSupportsGPUPresentMode")
        self.claim_window_for_gpu_device = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_ClaimWindowForGPUDevice")
        self.release_window_from_gpu_device = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> NoneType]("SDL_ReleaseWindowFromGPUDevice")
        self.set_gpu_swapchain_parameters = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUSwapchainComposition, GPUPresentMode) -> Bool]("SDL_SetGPUSwapchainParameters")
        self.set_gpu_allowed_frames_in_flight = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], UInt32) -> Bool]("SDL_SetGPUAllowedFramesInFlight")
        self.get_gpu_swapchain_texture_format = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> GPUTextureFormat]("SDL_GetGPUSwapchainTextureFormat")
        self.acquire_gpu_swapchain_texture = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[Window, MutExternalOrigin], Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_AcquireGPUSwapchainTexture")
        self.wait_for_gpu_swapchain = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_WaitForGPUSwapchain")
        self.wait_and_acquire_gpu_swapchain_texture = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[Window, MutExternalOrigin], Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_WaitAndAcquireGPUSwapchainTexture")
        self.submit_gpu_command_buffer = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Bool]("SDL_SubmitGPUCommandBuffer")
        self.submit_gpu_command_buffer_and_acquire_fence = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Ptr[GPUFence, MutExternalOrigin]]("SDL_SubmitGPUCommandBufferAndAcquireFence")
        self.cancel_gpu_command_buffer = self.dlhandle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Bool]("SDL_CancelGPUCommandBuffer")
        self.wait_for_gpu_idle = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> Bool]("SDL_WaitForGPUIdle")
        self.wait_for_gpu_fences = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Bool, Ptr[Ptr[GPUFence, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> Bool]("SDL_WaitForGPUFences")
        self.query_gpu_fence = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUFence, MutExternalOrigin]) -> Bool]("SDL_QueryGPUFence")
        self.release_gpu_fence = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUFence, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUFence")
        self.gpu_texture_format_texel_block_size = self.dlhandle.get_function[fn(GPUTextureFormat) -> UInt32]("SDL_GPUTextureFormatTexelBlockSize")
        self.gpu_texture_supports_format = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], GPUTextureFormat, GPUTextureType, GPUTextureUsageFlags) -> Bool]("SDL_GPUTextureSupportsFormat")
        self.gpu_texture_supports_sample_count = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], GPUTextureFormat, GPUSampleCount) -> Bool]("SDL_GPUTextureSupportsSampleCount")
        self.calculate_gpu_texture_format_size = self.dlhandle.get_function[fn(GPUTextureFormat, UInt32, UInt32, UInt32) -> UInt32]("SDL_CalculateGPUTextureFormatSize")
        self.get_pixel_format_from_gpu_texture_format = self.dlhandle.get_function[fn(GPUTextureFormat) -> PixelFormat]("SDL_GetPixelFormatFromGPUTextureFormat")
        self.get_gpu_texture_format_from_pixel_format = self.dlhandle.get_function[fn(PixelFormat) -> GPUTextureFormat]("SDL_GetGPUTextureFormatFromPixelFormat")
        self.guid_to_string = self.dlhandle.get_function[fn(GUID, Ptr[c_char, MutExternalOrigin], Int32) -> NoneType]("SDL_GUIDToString")
        self.string_to_guid = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> GUID]("SDL_StringToGUID")
        self.get_haptics = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[HapticID, MutExternalOrigin]]("SDL_GetHaptics")
        self.get_haptic_name_for_id = self.dlhandle.get_function[fn(HapticID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetHapticNameForID")
        self.open_haptic = self.dlhandle.get_function[fn(HapticID) -> Ptr[Haptic, MutExternalOrigin]]("SDL_OpenHaptic")
        self.get_haptic_from_id = self.dlhandle.get_function[fn(HapticID) -> Ptr[Haptic, MutExternalOrigin]]("SDL_GetHapticFromID")
        self.get_haptic_id = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> HapticID]("SDL_GetHapticID")
        self.get_haptic_name = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetHapticName")
        self.is_mouse_haptic = self.dlhandle.get_function[fn() -> Bool]("SDL_IsMouseHaptic")
        self.open_haptic_from_mouse = self.dlhandle.get_function[fn() -> Ptr[Haptic, MutExternalOrigin]]("SDL_OpenHapticFromMouse")
        self.is_joystick_haptic = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Bool]("SDL_IsJoystickHaptic")
        self.open_haptic_from_joystick = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Ptr[Haptic, MutExternalOrigin]]("SDL_OpenHapticFromJoystick")
        self.close_haptic = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> NoneType]("SDL_CloseHaptic")
        self.get_max_haptic_effects = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Int32]("SDL_GetMaxHapticEffects")
        self.get_max_haptic_effects_playing = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Int32]("SDL_GetMaxHapticEffectsPlaying")
        self.get_haptic_features = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> UInt32]("SDL_GetHapticFeatures")
        self.get_num_haptic_axes = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Int32]("SDL_GetNumHapticAxes")
        self.haptic_effect_supported = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Ptr[HapticEffect, ImmutExternalOrigin]) -> Bool]("SDL_HapticEffectSupported")
        self.create_haptic_effect = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Ptr[HapticEffect, ImmutExternalOrigin]) -> HapticEffectID]("SDL_CreateHapticEffect")
        self.update_haptic_effect = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID, Ptr[HapticEffect, ImmutExternalOrigin]) -> Bool]("SDL_UpdateHapticEffect")
        self.run_haptic_effect = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID, UInt32) -> Bool]("SDL_RunHapticEffect")
        self.stop_haptic_effect = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> Bool]("SDL_StopHapticEffect")
        self.destroy_haptic_effect = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> NoneType]("SDL_DestroyHapticEffect")
        self.get_haptic_effect_status = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> Bool]("SDL_GetHapticEffectStatus")
        self.set_haptic_gain = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Int32) -> Bool]("SDL_SetHapticGain")
        self.set_haptic_autocenter = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Int32) -> Bool]("SDL_SetHapticAutocenter")
        self.pause_haptic = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_PauseHaptic")
        self.resume_haptic = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_ResumeHaptic")
        self.stop_haptic_effects = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_StopHapticEffects")
        self.haptic_rumble_supported = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_HapticRumbleSupported")
        self.init_haptic_rumble = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_InitHapticRumble")
        self.play_haptic_rumble = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Float32, UInt32) -> Bool]("SDL_PlayHapticRumble")
        self.stop_haptic_rumble = self.dlhandle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_StopHapticRumble")
        self.set_hint_with_priority = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], HintPriority) -> Bool]("SDL_SetHintWithPriority")
        self.set_hint = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetHint")
        self.reset_hint = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_ResetHint")
        self.reset_hints = self.dlhandle.get_function[fn() -> NoneType]("SDL_ResetHints")
        self.get_hint = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetHint")
        self.get_hint_boolean = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool]("SDL_GetHintBoolean")
        self.add_hint_callback = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], HintCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_AddHintCallback")
        self.remove_hint_callback = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], HintCallback, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_RemoveHintCallback")
        self.init = self.dlhandle.get_function[fn(InitFlags) -> Bool]("SDL_Init")
        self.init_sub_system = self.dlhandle.get_function[fn(InitFlags) -> Bool]("SDL_InitSubSystem")
        self.quit_sub_system = self.dlhandle.get_function[fn(InitFlags) -> NoneType]("SDL_QuitSubSystem")
        self.was_init = self.dlhandle.get_function[fn(InitFlags) -> InitFlags]("SDL_WasInit")
        self.quit = self.dlhandle.get_function[fn() -> NoneType]("SDL_Quit")
        self.is_main_thread = self.dlhandle.get_function[fn() -> Bool]("SDL_IsMainThread")
        self.run_on_main_thread = self.dlhandle.get_function[fn(MainThreadCallback, Ptr[NoneType, MutExternalOrigin], Bool) -> Bool]("SDL_RunOnMainThread")
        self.set_app_metadata = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetAppMetadata")
        self.set_app_metadata_property = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetAppMetadataProperty")
        self.get_app_metadata_property = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetAppMetadataProperty")
        self.io_from_file = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IOStream, MutExternalOrigin]]("SDL_IOFromFile")
        self.io_from_mem = self.dlhandle.get_function[fn(Ptr[NoneType, MutExternalOrigin], Int32) -> Ptr[IOStream, MutExternalOrigin]]("SDL_IOFromMem")
        self.io_from_const_mem = self.dlhandle.get_function[fn(Ptr[NoneType, ImmutExternalOrigin], Int32) -> Ptr[IOStream, MutExternalOrigin]]("SDL_IOFromConstMem")
        self.io_from_dynamic_mem = self.dlhandle.get_function[fn() -> Ptr[IOStream, MutExternalOrigin]]("SDL_IOFromDynamicMem")
        self.open_io = self.dlhandle.get_function[fn(Ptr[IOStreamInterface, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[IOStream, MutExternalOrigin]]("SDL_OpenIO")
        self.close_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("SDL_CloseIO")
        self.get_io_properties = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> PropertiesID]("SDL_GetIOProperties")
        self.get_io_status = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> IOStatus]("SDL_GetIOStatus")
        self.get_io_size = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Int64]("SDL_GetIOSize")
        self.seek_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int64, IOWhence) -> Int64]("SDL_SeekIO")
        self.tell_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Int64]("SDL_TellIO")
        self.read_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Int32]("SDL_ReadIO")
        self.write_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Int32]("SDL_WriteIO")
        self.i_oprintf = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Int32]("SDL_IOprintf")
        self.i_ovprintf = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Int32]("SDL_IOvprintf")
        self.flush_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("SDL_FlushIO")
        self.load_file_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Bool) -> Ptr[NoneType, MutExternalOrigin]]("SDL_LoadFile_IO")
        self.load_file = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_LoadFile")
        self.save_file_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Bool) -> Bool]("SDL_SaveFile_IO")
        self.save_file = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_SaveFile")
        self.read_u8 = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_ReadU8")
        self.read_s8 = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int8, MutExternalOrigin]) -> Bool]("SDL_ReadS8")
        self.read_u16_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> Bool]("SDL_ReadU16LE")
        self.read_s16_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int16, MutExternalOrigin]) -> Bool]("SDL_ReadS16LE")
        self.read_u16_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> Bool]("SDL_ReadU16BE")
        self.read_s16_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int16, MutExternalOrigin]) -> Bool]("SDL_ReadS16BE")
        self.read_u32_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_ReadU32LE")
        self.read_s32_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_ReadS32LE")
        self.read_u32_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_ReadU32BE")
        self.read_s32_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_ReadS32BE")
        self.read_u64_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool]("SDL_ReadU64LE")
        self.read_s64_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int64, MutExternalOrigin]) -> Bool]("SDL_ReadS64LE")
        self.read_u64_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool]("SDL_ReadU64BE")
        self.read_s64_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int64, MutExternalOrigin]) -> Bool]("SDL_ReadS64BE")
        self.write_u8 = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt8) -> Bool]("SDL_WriteU8")
        self.write_s8 = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int8) -> Bool]("SDL_WriteS8")
        self.write_u16_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt16) -> Bool]("SDL_WriteU16LE")
        self.write_s16_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int16) -> Bool]("SDL_WriteS16LE")
        self.write_u16_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt16) -> Bool]("SDL_WriteU16BE")
        self.write_s16_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int16) -> Bool]("SDL_WriteS16BE")
        self.write_u32_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt32) -> Bool]("SDL_WriteU32LE")
        self.write_s32_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int32) -> Bool]("SDL_WriteS32LE")
        self.write_u32_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt32) -> Bool]("SDL_WriteU32BE")
        self.write_s32_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int32) -> Bool]("SDL_WriteS32BE")
        self.write_u64_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt64) -> Bool]("SDL_WriteU64LE")
        self.write_s64_le = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int64) -> Bool]("SDL_WriteS64LE")
        self.write_u64_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt64) -> Bool]("SDL_WriteU64BE")
        self.write_s64_be = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int64) -> Bool]("SDL_WriteS64BE")
        self.lock_joysticks = self.dlhandle.get_function[fn() -> NoneType]("SDL_LockJoysticks")
        self.unlock_joysticks = self.dlhandle.get_function[fn() -> NoneType]("SDL_UnlockJoysticks")
        self.has_joystick = self.dlhandle.get_function[fn() -> Bool]("SDL_HasJoystick")
        self.get_joysticks = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[JoystickID, MutExternalOrigin]]("SDL_GetJoysticks")
        self.get_joystick_name_for_id = self.dlhandle.get_function[fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickNameForID")
        self.get_joystick_path_for_id = self.dlhandle.get_function[fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickPathForID")
        self.get_joystick_player_index_for_id = self.dlhandle.get_function[fn(JoystickID) -> Int32]("SDL_GetJoystickPlayerIndexForID")
        self.get_joystick_guid_for_id = self.dlhandle.get_function[fn(JoystickID) -> GUID]("SDL_GetJoystickGUIDForID")
        self.get_joystick_vendor_for_id = self.dlhandle.get_function[fn(JoystickID) -> UInt16]("SDL_GetJoystickVendorForID")
        self.get_joystick_product_for_id = self.dlhandle.get_function[fn(JoystickID) -> UInt16]("SDL_GetJoystickProductForID")
        self.get_joystick_product_version_for_id = self.dlhandle.get_function[fn(JoystickID) -> UInt16]("SDL_GetJoystickProductVersionForID")
        self.get_joystick_type_for_id = self.dlhandle.get_function[fn(JoystickID) -> JoystickType]("SDL_GetJoystickTypeForID")
        self.open_joystick = self.dlhandle.get_function[fn(JoystickID) -> Ptr[Joystick, MutExternalOrigin]]("SDL_OpenJoystick")
        self.get_joystick_from_id = self.dlhandle.get_function[fn(JoystickID) -> Ptr[Joystick, MutExternalOrigin]]("SDL_GetJoystickFromID")
        self.get_joystick_from_player_index = self.dlhandle.get_function[fn(Int32) -> Ptr[Joystick, MutExternalOrigin]]("SDL_GetJoystickFromPlayerIndex")
        self.attach_virtual_joystick = self.dlhandle.get_function[fn(Ptr[VirtualJoystickDesc, ImmutExternalOrigin]) -> JoystickID]("SDL_AttachVirtualJoystick")
        self.detach_virtual_joystick = self.dlhandle.get_function[fn(JoystickID) -> Bool]("SDL_DetachVirtualJoystick")
        self.is_joystick_virtual = self.dlhandle.get_function[fn(JoystickID) -> Bool]("SDL_IsJoystickVirtual")
        self.set_joystick_virtual_axis = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Int16) -> Bool]("SDL_SetJoystickVirtualAxis")
        self.set_joystick_virtual_ball = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Int16, Int16) -> Bool]("SDL_SetJoystickVirtualBall")
        self.set_joystick_virtual_button = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Bool) -> Bool]("SDL_SetJoystickVirtualButton")
        self.set_joystick_virtual_hat = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, UInt8) -> Bool]("SDL_SetJoystickVirtualHat")
        self.set_joystick_virtual_touchpad = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Int32, Bool, Float32, Float32, Float32) -> Bool]("SDL_SetJoystickVirtualTouchpad")
        self.send_joystick_virtual_sensor_data = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], SensorType, UInt64, Ptr[Float32, ImmutExternalOrigin], Int32) -> Bool]("SDL_SendJoystickVirtualSensorData")
        self.get_joystick_properties = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> PropertiesID]("SDL_GetJoystickProperties")
        self.get_joystick_name = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickName")
        self.get_joystick_path = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickPath")
        self.get_joystick_player_index = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetJoystickPlayerIndex")
        self.set_joystick_player_index = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Bool]("SDL_SetJoystickPlayerIndex")
        self.get_joystick_guid = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> GUID]("SDL_GetJoystickGUID")
        self.get_joystick_vendor = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16]("SDL_GetJoystickVendor")
        self.get_joystick_product = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16]("SDL_GetJoystickProduct")
        self.get_joystick_product_version = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16]("SDL_GetJoystickProductVersion")
        self.get_joystick_firmware_version = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16]("SDL_GetJoystickFirmwareVersion")
        self.get_joystick_serial = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickSerial")
        self.get_joystick_type = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickType]("SDL_GetJoystickType")
        self.get_joystick_guid_info = self.dlhandle.get_function[fn(GUID, Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> NoneType]("SDL_GetJoystickGUIDInfo")
        self.joystick_connected = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Bool]("SDL_JoystickConnected")
        self.get_joystick_id = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickID]("SDL_GetJoystickID")
        self.get_num_joystick_axes = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetNumJoystickAxes")
        self.get_num_joystick_balls = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetNumJoystickBalls")
        self.get_num_joystick_hats = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetNumJoystickHats")
        self.get_num_joystick_buttons = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetNumJoystickButtons")
        self.set_joystick_events_enabled = self.dlhandle.get_function[fn(Bool) -> NoneType]("SDL_SetJoystickEventsEnabled")
        self.joystick_events_enabled = self.dlhandle.get_function[fn() -> Bool]("SDL_JoystickEventsEnabled")
        self.update_joysticks = self.dlhandle.get_function[fn() -> NoneType]("SDL_UpdateJoysticks")
        self.get_joystick_axis = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Int16]("SDL_GetJoystickAxis")
        self.get_joystick_axis_initial_state = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Ptr[Int16, MutExternalOrigin]) -> Bool]("SDL_GetJoystickAxisInitialState")
        self.get_joystick_ball = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetJoystickBall")
        self.get_joystick_hat = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32) -> UInt8]("SDL_GetJoystickHat")
        self.get_joystick_button = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Bool]("SDL_GetJoystickButton")
        self.rumble_joystick = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool]("SDL_RumbleJoystick")
        self.rumble_joystick_triggers = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool]("SDL_RumbleJoystickTriggers")
        self.set_joystick_led = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool]("SDL_SetJoystickLED")
        self.send_joystick_effect = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_SendJoystickEffect")
        self.close_joystick = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> NoneType]("SDL_CloseJoystick")
        self.get_joystick_connection_state = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickConnectionState]("SDL_GetJoystickConnectionState")
        self.get_joystick_power_info = self.dlhandle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState]("SDL_GetJoystickPowerInfo")
        self.has_keyboard = self.dlhandle.get_function[fn() -> Bool]("SDL_HasKeyboard")
        self.get_keyboards = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[KeyboardID, MutExternalOrigin]]("SDL_GetKeyboards")
        self.get_keyboard_name_for_id = self.dlhandle.get_function[fn(KeyboardID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetKeyboardNameForID")
        self.get_keyboard_focus = self.dlhandle.get_function[fn() -> Ptr[Window, MutExternalOrigin]]("SDL_GetKeyboardFocus")
        self.get_keyboard_state = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Bool, ImmutExternalOrigin]]("SDL_GetKeyboardState")
        self.reset_keyboard = self.dlhandle.get_function[fn() -> NoneType]("SDL_ResetKeyboard")
        self.get_mod_state = self.dlhandle.get_function[fn() -> Keymod]("SDL_GetModState")
        self.set_mod_state = self.dlhandle.get_function[fn(Keymod) -> NoneType]("SDL_SetModState")
        self.get_key_from_scancode = self.dlhandle.get_function[fn(Scancode, Keymod, Bool) -> Keycode]("SDL_GetKeyFromScancode")
        self.get_scancode_from_key = self.dlhandle.get_function[fn(Keycode, Ptr[Keymod, MutExternalOrigin]) -> Scancode]("SDL_GetScancodeFromKey")
        self.set_scancode_name = self.dlhandle.get_function[fn(Scancode, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetScancodeName")
        self.get_scancode_name = self.dlhandle.get_function[fn(Scancode) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetScancodeName")
        self.get_scancode_from_name = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Scancode]("SDL_GetScancodeFromName")
        self.get_key_name = self.dlhandle.get_function[fn(Keycode) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetKeyName")
        self.get_key_from_name = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Keycode]("SDL_GetKeyFromName")
        self.start_text_input = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_StartTextInput")
        self.start_text_input_with_properties = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], PropertiesID) -> Bool]("SDL_StartTextInputWithProperties")
        self.text_input_active = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_TextInputActive")
        self.stop_text_input = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_StopTextInput")
        self.clear_composition = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_ClearComposition")
        self.set_text_input_area = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32) -> Bool]("SDL_SetTextInputArea")
        self.get_text_input_area = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetTextInputArea")
        self.has_screen_keyboard_support = self.dlhandle.get_function[fn() -> Bool]("SDL_HasScreenKeyboardSupport")
        self.screen_keyboard_shown = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_ScreenKeyboardShown")
        self.set_log_priorities = self.dlhandle.get_function[fn(LogPriority) -> NoneType]("SDL_SetLogPriorities")
        self.set_log_priority = self.dlhandle.get_function[fn(Int32, LogPriority) -> NoneType]("SDL_SetLogPriority")
        self.get_log_priority = self.dlhandle.get_function[fn(Int32) -> LogPriority]("SDL_GetLogPriority")
        self.reset_log_priorities = self.dlhandle.get_function[fn() -> NoneType]("SDL_ResetLogPriorities")
        self.set_log_priority_prefix = self.dlhandle.get_function[fn(LogPriority, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetLogPriorityPrefix")
        self.log = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_Log")
        self.log_trace = self.dlhandle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogTrace")
        self.log_verbose = self.dlhandle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogVerbose")
        self.log_debug = self.dlhandle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogDebug")
        self.log_info = self.dlhandle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogInfo")
        self.log_warn = self.dlhandle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogWarn")
        self.log_error = self.dlhandle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogError")
        self.log_critical = self.dlhandle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogCritical")
        self.log_message = self.dlhandle.get_function[fn(Int32, LogPriority, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogMessage")
        self.log_message_v = self.dlhandle.get_function[fn(Int32, LogPriority, Ptr[c_char, ImmutExternalOrigin], Int32) -> NoneType]("SDL_LogMessageV")
        self.get_default_log_output_function = self.dlhandle.get_function[fn() -> LogOutputFunction]("SDL_GetDefaultLogOutputFunction")
        self.get_log_output_function = self.dlhandle.get_function[fn(Ptr[LogOutputFunction, MutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]) -> NoneType]("SDL_GetLogOutputFunction")
        self.set_log_output_function = self.dlhandle.get_function[fn(LogOutputFunction, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_SetLogOutputFunction")
        self.has_mouse = self.dlhandle.get_function[fn() -> Bool]("SDL_HasMouse")
        self.get_mice = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[MouseID, MutExternalOrigin]]("SDL_GetMice")
        self.get_mouse_name_for_id = self.dlhandle.get_function[fn(MouseID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetMouseNameForID")
        self.get_mouse_focus = self.dlhandle.get_function[fn() -> Ptr[Window, MutExternalOrigin]]("SDL_GetMouseFocus")
        self.get_mouse_state = self.dlhandle.get_function[fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags]("SDL_GetMouseState")
        self.get_global_mouse_state = self.dlhandle.get_function[fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags]("SDL_GetGlobalMouseState")
        self.get_relative_mouse_state = self.dlhandle.get_function[fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags]("SDL_GetRelativeMouseState")
        self.warp_mouse_in_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Float32, Float32) -> NoneType]("SDL_WarpMouseInWindow")
        self.warp_mouse_global = self.dlhandle.get_function[fn(Float32, Float32) -> Bool]("SDL_WarpMouseGlobal")
        self.set_relative_mouse_transform = self.dlhandle.get_function[fn(MouseMotionTransformCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetRelativeMouseTransform")
        self.set_window_relative_mouse_mode = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowRelativeMouseMode")
        self.get_window_relative_mouse_mode = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_GetWindowRelativeMouseMode")
        self.capture_mouse = self.dlhandle.get_function[fn(Bool) -> Bool]("SDL_CaptureMouse")
        self.create_cursor = self.dlhandle.get_function[fn(Ptr[UInt8, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Int32, Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]]("SDL_CreateCursor")
        self.create_color_cursor = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]]("SDL_CreateColorCursor")
        self.create_animated_cursor = self.dlhandle.get_function[fn(Ptr[CursorFrameInfo, MutExternalOrigin], Int32, Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]]("SDL_CreateAnimatedCursor")
        self.create_system_cursor = self.dlhandle.get_function[fn(SystemCursor) -> Ptr[Cursor, MutExternalOrigin]]("SDL_CreateSystemCursor")
        self.set_cursor = self.dlhandle.get_function[fn(Ptr[Cursor, MutExternalOrigin]) -> Bool]("SDL_SetCursor")
        self.get_cursor = self.dlhandle.get_function[fn() -> Ptr[Cursor, MutExternalOrigin]]("SDL_GetCursor")
        self.get_default_cursor = self.dlhandle.get_function[fn() -> Ptr[Cursor, MutExternalOrigin]]("SDL_GetDefaultCursor")
        self.destroy_cursor = self.dlhandle.get_function[fn(Ptr[Cursor, MutExternalOrigin]) -> NoneType]("SDL_DestroyCursor")
        self.show_cursor = self.dlhandle.get_function[fn() -> Bool]("SDL_ShowCursor")
        self.hide_cursor = self.dlhandle.get_function[fn() -> Bool]("SDL_HideCursor")
        self.cursor_visible = self.dlhandle.get_function[fn() -> Bool]("SDL_CursorVisible")
        self.get_pen_device_type = self.dlhandle.get_function[fn(PenID) -> PenDeviceType]("SDL_GetPenDeviceType")
        self.get_pixel_format_name = self.dlhandle.get_function[fn(PixelFormat) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetPixelFormatName")
        self.get_masks_for_pixel_format = self.dlhandle.get_function[fn(PixelFormat, Ptr[Int32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_GetMasksForPixelFormat")
        self.get_pixel_format_for_masks = self.dlhandle.get_function[fn(Int32, UInt32, UInt32, UInt32, UInt32) -> PixelFormat]("SDL_GetPixelFormatForMasks")
        self.get_pixel_format_details = self.dlhandle.get_function[fn(PixelFormat) -> Ptr[PixelFormatDetails, ImmutExternalOrigin]]("SDL_GetPixelFormatDetails")
        self.create_palette = self.dlhandle.get_function[fn(Int32) -> Ptr[Palette, MutExternalOrigin]]("SDL_CreatePalette")
        self.set_palette_colors = self.dlhandle.get_function[fn(Ptr[Palette, MutExternalOrigin], Ptr[Color, ImmutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetPaletteColors")
        self.destroy_palette = self.dlhandle.get_function[fn(Ptr[Palette, MutExternalOrigin]) -> NoneType]("SDL_DestroyPalette")
        self.map_rgb = self.dlhandle.get_function[fn(Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], UInt8, UInt8, UInt8) -> UInt32]("SDL_MapRGB")
        self.map_rgba = self.dlhandle.get_function[fn(Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> UInt32]("SDL_MapRGBA")
        self.get_rgb = self.dlhandle.get_function[fn(UInt32, Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> NoneType]("SDL_GetRGB")
        self.get_rgba = self.dlhandle.get_function[fn(UInt32, Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> NoneType]("SDL_GetRGBA")
        self.get_power_info = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState]("SDL_GetPowerInfo")
        self.get_global_properties = self.dlhandle.get_function[fn() -> PropertiesID]("SDL_GetGlobalProperties")
        self.create_properties = self.dlhandle.get_function[fn() -> PropertiesID]("SDL_CreateProperties")
        self.copy_properties = self.dlhandle.get_function[fn(PropertiesID, PropertiesID) -> Bool]("SDL_CopyProperties")
        self.lock_properties = self.dlhandle.get_function[fn(PropertiesID) -> Bool]("SDL_LockProperties")
        self.unlock_properties = self.dlhandle.get_function[fn(PropertiesID) -> NoneType]("SDL_UnlockProperties")
        self.set_pointer_property_with_cleanup = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin], CleanupPropertyCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetPointerPropertyWithCleanup")
        self.set_pointer_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetPointerProperty")
        self.set_string_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetStringProperty")
        self.set_number_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool]("SDL_SetNumberProperty")
        self.set_float_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool]("SDL_SetFloatProperty")
        self.set_boolean_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool]("SDL_SetBooleanProperty")
        self.has_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_HasProperty")
        self.get_property_type = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> PropertyType]("SDL_GetPropertyType")
        self.get_pointer_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetPointerProperty")
        self.get_string_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetStringProperty")
        self.get_number_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Int64) -> Int64]("SDL_GetNumberProperty")
        self.get_float_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Float32) -> Float32]("SDL_GetFloatProperty")
        self.get_boolean_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool]("SDL_GetBooleanProperty")
        self.clear_property = self.dlhandle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_ClearProperty")
        self.enumerate_properties = self.dlhandle.get_function[fn(PropertiesID, EnumeratePropertiesCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_EnumerateProperties")
        self.destroy_properties = self.dlhandle.get_function[fn(PropertiesID) -> NoneType]("SDL_DestroyProperties")
        self.has_rect_intersection = self.dlhandle.get_function[fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_HasRectIntersection")
        self.get_rect_intersection = self.dlhandle.get_function[fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRectIntersection")
        self.get_rect_union = self.dlhandle.get_function[fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRectUnion")
        self.get_rect_enclosing_points = self.dlhandle.get_function[fn(Ptr[Point, ImmutExternalOrigin], Int32, Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRectEnclosingPoints")
        self.get_rect_and_line_intersection = self.dlhandle.get_function[fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetRectAndLineIntersection")
        self.has_rect_intersection_float = self.dlhandle.get_function[fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_HasRectIntersectionFloat")
        self.get_rect_intersection_float = self.dlhandle.get_function[fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool]("SDL_GetRectIntersectionFloat")
        self.get_rect_union_float = self.dlhandle.get_function[fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool]("SDL_GetRectUnionFloat")
        self.get_rect_enclosing_points_float = self.dlhandle.get_function[fn(Ptr[FPoint, ImmutExternalOrigin], Int32, Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool]("SDL_GetRectEnclosingPointsFloat")
        self.get_rect_and_line_intersection_float = self.dlhandle.get_function[fn(Ptr[FRect, ImmutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetRectAndLineIntersectionFloat")
        self.get_num_render_drivers = self.dlhandle.get_function[fn() -> Int32]("SDL_GetNumRenderDrivers")
        self.get_render_driver = self.dlhandle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetRenderDriver")
        self.create_window_and_renderer = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Int32, Int32, WindowFlags, Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin], Ptr[Ptr[Renderer, MutExternalOrigin], MutExternalOrigin]) -> Bool]("SDL_CreateWindowAndRenderer")
        self.create_renderer = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_CreateRenderer")
        self.create_renderer_with_properties = self.dlhandle.get_function[fn(PropertiesID) -> Ptr[Renderer, MutExternalOrigin]]("SDL_CreateRendererWithProperties")
        self.create_gpu_renderer = self.dlhandle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_CreateGPURenderer")
        self.get_gpu_renderer_device = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[GPUDevice, MutExternalOrigin]]("SDL_GetGPURendererDevice")
        self.create_software_renderer = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_CreateSoftwareRenderer")
        self.get_renderer = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_GetRenderer")
        self.get_render_window = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]]("SDL_GetRenderWindow")
        self.get_renderer_name = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetRendererName")
        self.get_renderer_properties = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> PropertiesID]("SDL_GetRendererProperties")
        self.get_render_output_size = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetRenderOutputSize")
        self.get_current_render_output_size = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetCurrentRenderOutputSize")
        self.create_texture = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], PixelFormat, TextureAccess, Int32, Int32) -> Ptr[Texture, MutExternalOrigin]]("SDL_CreateTexture")
        self.create_texture_from_surface = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]]("SDL_CreateTextureFromSurface")
        self.create_texture_with_properties = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], PropertiesID) -> Ptr[Texture, MutExternalOrigin]]("SDL_CreateTextureWithProperties")
        self.get_texture_properties = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> PropertiesID]("SDL_GetTextureProperties")
        self.get_renderer_from_texture = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_GetRendererFromTexture")
        self.get_texture_size = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetTextureSize")
        self.set_texture_palette = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Palette, MutExternalOrigin]) -> Bool]("SDL_SetTexturePalette")
        self.get_texture_palette = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]]("SDL_GetTexturePalette")
        self.set_texture_color_mod = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool]("SDL_SetTextureColorMod")
        self.set_texture_color_mod_float = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Float32, Float32, Float32) -> Bool]("SDL_SetTextureColorModFloat")
        self.get_texture_color_mod = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetTextureColorMod")
        self.get_texture_color_mod_float = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetTextureColorModFloat")
        self.set_texture_alpha_mod = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], UInt8) -> Bool]("SDL_SetTextureAlphaMod")
        self.set_texture_alpha_mod_float = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Float32) -> Bool]("SDL_SetTextureAlphaModFloat")
        self.get_texture_alpha_mod = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetTextureAlphaMod")
        self.get_texture_alpha_mod_float = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetTextureAlphaModFloat")
        self.set_texture_blend_mode = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], BlendMode) -> Bool]("SDL_SetTextureBlendMode")
        self.get_texture_blend_mode = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool]("SDL_GetTextureBlendMode")
        self.set_texture_scale_mode = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], ScaleMode) -> Bool]("SDL_SetTextureScaleMode")
        self.get_texture_scale_mode = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[ScaleMode, MutExternalOrigin]) -> Bool]("SDL_GetTextureScaleMode")
        self.update_texture = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_UpdateTexture")
        self.update_yuv_texture = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32) -> Bool]("SDL_UpdateYUVTexture")
        self.update_nv_texture = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32) -> Bool]("SDL_UpdateNVTexture")
        self.lock_texture = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_LockTexture")
        self.lock_texture_to_surface = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]) -> Bool]("SDL_LockTextureToSurface")
        self.unlock_texture = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> NoneType]("SDL_UnlockTexture")
        self.set_render_target = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin]) -> Bool]("SDL_SetRenderTarget")
        self.get_render_target = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]]("SDL_GetRenderTarget")
        self.set_render_logical_presentation = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Int32, Int32, RendererLogicalPresentation) -> Bool]("SDL_SetRenderLogicalPresentation")
        self.get_render_logical_presentation = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[RendererLogicalPresentation, MutExternalOrigin]) -> Bool]("SDL_GetRenderLogicalPresentation")
        self.get_render_logical_presentation_rect = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool]("SDL_GetRenderLogicalPresentationRect")
        self.render_coordinates_from_window = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_RenderCoordinatesFromWindow")
        self.render_coordinates_to_window = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_RenderCoordinatesToWindow")
        self.convert_event_to_render_coordinates = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Event, MutExternalOrigin]) -> Bool]("SDL_ConvertEventToRenderCoordinates")
        self.set_render_viewport = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_SetRenderViewport")
        self.get_render_viewport = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRenderViewport")
        self.render_viewport_set = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_RenderViewportSet")
        self.get_render_safe_area = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRenderSafeArea")
        self.set_render_clip_rect = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_SetRenderClipRect")
        self.get_render_clip_rect = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRenderClipRect")
        self.render_clip_enabled = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_RenderClipEnabled")
        self.set_render_scale = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32) -> Bool]("SDL_SetRenderScale")
        self.get_render_scale = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetRenderScale")
        self.set_render_draw_color = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> Bool]("SDL_SetRenderDrawColor")
        self.set_render_draw_color_float = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool]("SDL_SetRenderDrawColorFloat")
        self.get_render_draw_color = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetRenderDrawColor")
        self.get_render_draw_color_float = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetRenderDrawColorFloat")
        self.set_render_color_scale = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32) -> Bool]("SDL_SetRenderColorScale")
        self.get_render_color_scale = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetRenderColorScale")
        self.set_render_draw_blend_mode = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], BlendMode) -> Bool]("SDL_SetRenderDrawBlendMode")
        self.get_render_draw_blend_mode = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool]("SDL_GetRenderDrawBlendMode")
        self.render_clear = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_RenderClear")
        self.render_point = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32) -> Bool]("SDL_RenderPoint")
        self.render_points = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderPoints")
        self.render_line = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool]("SDL_RenderLine")
        self.render_lines = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderLines")
        self.render_rect = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderRect")
        self.render_rects = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderRects")
        self.render_fill_rect = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderFillRect")
        self.render_fill_rects = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderFillRects")
        self.render_texture = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderTexture")
        self.render_texture_rotated = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float64, Ptr[FPoint, ImmutExternalOrigin], FlipMode) -> Bool]("SDL_RenderTextureRotated")
        self.render_texture_affine = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin]) -> Bool]("SDL_RenderTextureAffine")
        self.render_texture_tiled = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderTextureTiled")
        self.render_texture9_grid = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Float32, Float32, Float32, Float32, Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderTexture9Grid")
        self.render_texture9_grid_tiled = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Float32, Float32, Float32, Float32, Ptr[FRect, ImmutExternalOrigin], Float32) -> Bool]("SDL_RenderTexture9GridTiled")
        self.render_geometry = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[Vertex, ImmutExternalOrigin], Int32, Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderGeometry")
        self.render_geometry_raw = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[Float32, ImmutExternalOrigin], Int32, Ptr[FColor, ImmutExternalOrigin], Int32, Ptr[Float32, ImmutExternalOrigin], Int32, Int32, Ptr[NoneType, ImmutExternalOrigin], Int32, Int32) -> Bool]("SDL_RenderGeometryRaw")
        self.set_render_texture_address_mode = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], TextureAddressMode, TextureAddressMode) -> Bool]("SDL_SetRenderTextureAddressMode")
        self.get_render_texture_address_mode = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[TextureAddressMode, MutExternalOrigin], Ptr[TextureAddressMode, MutExternalOrigin]) -> Bool]("SDL_GetRenderTextureAddressMode")
        self.render_read_pixels = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_RenderReadPixels")
        self.render_present = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_RenderPresent")
        self.destroy_texture = self.dlhandle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> NoneType]("SDL_DestroyTexture")
        self.destroy_renderer = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> NoneType]("SDL_DestroyRenderer")
        self.flush_renderer = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_FlushRenderer")
        self.get_render_metal_layer = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetRenderMetalLayer")
        self.get_render_metal_command_encoder = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetRenderMetalCommandEncoder")
        self.add_vulkan_render_semaphores = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], UInt32, Int64, Int64) -> Bool]("SDL_AddVulkanRenderSemaphores")
        self.set_render_v_sync = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Int32) -> Bool]("SDL_SetRenderVSync")
        self.get_render_v_sync = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetRenderVSync")
        self.render_debug_text = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RenderDebugText")
        self.render_debug_text_format = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RenderDebugTextFormat")
        self.set_default_texture_scale_mode = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], ScaleMode) -> Bool]("SDL_SetDefaultTextureScaleMode")
        self.get_default_texture_scale_mode = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[ScaleMode, MutExternalOrigin]) -> Bool]("SDL_GetDefaultTextureScaleMode")
        self.create_gpu_render_state = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[GPURenderStateCreateInfo, ImmutExternalOrigin]) -> Ptr[GPURenderState, MutExternalOrigin]]("SDL_CreateGPURenderState")
        self.set_gpu_render_state_fragment_uniforms = self.dlhandle.get_function[fn(Ptr[GPURenderState, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> Bool]("SDL_SetGPURenderStateFragmentUniforms")
        self.set_gpu_render_state = self.dlhandle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[GPURenderState, MutExternalOrigin]) -> Bool]("SDL_SetGPURenderState")
        self.destroy_gpu_render_state = self.dlhandle.get_function[fn(Ptr[GPURenderState, MutExternalOrigin]) -> NoneType]("SDL_DestroyGPURenderState")
        self.get_sensors = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[SensorID, MutExternalOrigin]]("SDL_GetSensors")
        self.get_sensor_name_for_id = self.dlhandle.get_function[fn(SensorID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetSensorNameForID")
        self.get_sensor_type_for_id = self.dlhandle.get_function[fn(SensorID) -> SensorType]("SDL_GetSensorTypeForID")
        self.get_sensor_non_portable_type_for_id = self.dlhandle.get_function[fn(SensorID) -> Int32]("SDL_GetSensorNonPortableTypeForID")
        self.open_sensor = self.dlhandle.get_function[fn(SensorID) -> Ptr[Sensor, MutExternalOrigin]]("SDL_OpenSensor")
        self.get_sensor_from_id = self.dlhandle.get_function[fn(SensorID) -> Ptr[Sensor, MutExternalOrigin]]("SDL_GetSensorFromID")
        self.get_sensor_properties = self.dlhandle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> PropertiesID]("SDL_GetSensorProperties")
        self.get_sensor_name = self.dlhandle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetSensorName")
        self.get_sensor_type = self.dlhandle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> SensorType]("SDL_GetSensorType")
        self.get_sensor_non_portable_type = self.dlhandle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> Int32]("SDL_GetSensorNonPortableType")
        self.get_sensor_id = self.dlhandle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> SensorID]("SDL_GetSensorID")
        self.get_sensor_data = self.dlhandle.get_function[fn(Ptr[Sensor, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Int32) -> Bool]("SDL_GetSensorData")
        self.close_sensor = self.dlhandle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> NoneType]("SDL_CloseSensor")
        self.update_sensors = self.dlhandle.get_function[fn() -> NoneType]("SDL_UpdateSensors")
        self.open_title_storage = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[Storage, MutExternalOrigin]]("SDL_OpenTitleStorage")
        self.open_user_storage = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[Storage, MutExternalOrigin]]("SDL_OpenUserStorage")
        self.open_file_storage = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Storage, MutExternalOrigin]]("SDL_OpenFileStorage")
        self.open_storage = self.dlhandle.get_function[fn(Ptr[StorageInterface, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[Storage, MutExternalOrigin]]("SDL_OpenStorage")
        self.close_storage = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin]) -> Bool]("SDL_CloseStorage")
        self.storage_ready = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin]) -> Bool]("SDL_StorageReady")
        self.get_storage_file_size = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool]("SDL_GetStorageFileSize")
        self.read_storage_file = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin], UInt64) -> Bool]("SDL_ReadStorageFile")
        self.write_storage_file = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], UInt64) -> Bool]("SDL_WriteStorageFile")
        self.create_storage_directory = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_CreateStorageDirectory")
        self.enumerate_storage_directory = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], EnumerateDirectoryCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_EnumerateStorageDirectory")
        self.remove_storage_path = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RemoveStoragePath")
        self.rename_storage_path = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RenameStoragePath")
        self.copy_storage_file = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_CopyStorageFile")
        self.get_storage_path_info = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[PathInfo, MutExternalOrigin]) -> Bool]("SDL_GetStoragePathInfo")
        self.get_storage_space_remaining = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin]) -> UInt64]("SDL_GetStorageSpaceRemaining")
        self.glob_storage_directory = self.dlhandle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], GlobFlags, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("SDL_GlobStorageDirectory")
        self.create_surface = self.dlhandle.get_function[fn(Int32, Int32, PixelFormat) -> Ptr[Surface, MutExternalOrigin]]("SDL_CreateSurface")
        self.create_surface_from = self.dlhandle.get_function[fn(Int32, Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32) -> Ptr[Surface, MutExternalOrigin]]("SDL_CreateSurfaceFrom")
        self.destroy_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> NoneType]("SDL_DestroySurface")
        self.get_surface_properties = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> PropertiesID]("SDL_GetSurfaceProperties")
        self.set_surface_colorspace = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Colorspace) -> Bool]("SDL_SetSurfaceColorspace")
        self.get_surface_colorspace = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Colorspace]("SDL_GetSurfaceColorspace")
        self.create_surface_palette = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]]("SDL_CreateSurfacePalette")
        self.set_surface_palette = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Palette, MutExternalOrigin]) -> Bool]("SDL_SetSurfacePalette")
        self.get_surface_palette = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]]("SDL_GetSurfacePalette")
        self.add_surface_alternate_image = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_AddSurfaceAlternateImage")
        self.surface_has_alternate_images = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SurfaceHasAlternateImages")
        self.get_surface_images = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]]("SDL_GetSurfaceImages")
        self.remove_surface_alternate_images = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> NoneType]("SDL_RemoveSurfaceAlternateImages")
        self.lock_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_LockSurface")
        self.unlock_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> NoneType]("SDL_UnlockSurface")
        self.load_surface_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadSurface_IO")
        self.load_surface = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadSurface")
        self.load_bmp_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadBMP_IO")
        self.load_bmp = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadBMP")
        self.save_bmp_io = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("SDL_SaveBMP_IO")
        self.save_bmp = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SaveBMP")
        self.load_png_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadPNG_IO")
        self.load_png = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadPNG")
        self.save_png_io = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("SDL_SavePNG_IO")
        self.save_png = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SavePNG")
        self.set_surface_rle = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Bool) -> Bool]("SDL_SetSurfaceRLE")
        self.surface_has_rle = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SurfaceHasRLE")
        self.set_surface_color_key = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Bool, UInt32) -> Bool]("SDL_SetSurfaceColorKey")
        self.surface_has_color_key = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SurfaceHasColorKey")
        self.get_surface_color_key = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceColorKey")
        self.set_surface_color_mod = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool]("SDL_SetSurfaceColorMod")
        self.get_surface_color_mod = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceColorMod")
        self.set_surface_alpha_mod = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], UInt8) -> Bool]("SDL_SetSurfaceAlphaMod")
        self.get_surface_alpha_mod = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceAlphaMod")
        self.set_surface_blend_mode = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], BlendMode) -> Bool]("SDL_SetSurfaceBlendMode")
        self.get_surface_blend_mode = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceBlendMode")
        self.set_surface_clip_rect = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_SetSurfaceClipRect")
        self.get_surface_clip_rect = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceClipRect")
        self.flip_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], FlipMode) -> Bool]("SDL_FlipSurface")
        self.rotate_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Float32) -> Ptr[Surface, MutExternalOrigin]]("SDL_RotateSurface")
        self.duplicate_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_DuplicateSurface")
        self.scale_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, ScaleMode) -> Ptr[Surface, MutExternalOrigin]]("SDL_ScaleSurface")
        self.convert_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], PixelFormat) -> Ptr[Surface, MutExternalOrigin]]("SDL_ConvertSurface")
        self.convert_surface_and_colorspace = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], PixelFormat, Ptr[Palette, MutExternalOrigin], Colorspace, PropertiesID) -> Ptr[Surface, MutExternalOrigin]]("SDL_ConvertSurfaceAndColorspace")
        self.convert_pixels = self.dlhandle.get_function[fn(Int32, Int32, PixelFormat, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32) -> Bool]("SDL_ConvertPixels")
        self.convert_pixels_and_colorspace = self.dlhandle.get_function[fn(Int32, Int32, PixelFormat, Colorspace, PropertiesID, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Colorspace, PropertiesID, Ptr[NoneType, MutExternalOrigin], Int32) -> Bool]("SDL_ConvertPixelsAndColorspace")
        self.premultiply_alpha = self.dlhandle.get_function[fn(Int32, Int32, PixelFormat, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32, Bool) -> Bool]("SDL_PremultiplyAlpha")
        self.premultiply_surface_alpha = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Bool) -> Bool]("SDL_PremultiplySurfaceAlpha")
        self.clear_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool]("SDL_ClearSurface")
        self.fill_surface_rect = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], UInt32) -> Bool]("SDL_FillSurfaceRect")
        self.fill_surface_rects = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32, UInt32) -> Bool]("SDL_FillSurfaceRects")
        self.blit_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurface")
        self.blit_surface_unchecked = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurfaceUnchecked")
        self.blit_surface_scaled = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool]("SDL_BlitSurfaceScaled")
        self.blit_surface_unchecked_scaled = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool]("SDL_BlitSurfaceUncheckedScaled")
        self.stretch_surface = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool]("SDL_StretchSurface")
        self.blit_surface_tiled = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurfaceTiled")
        self.blit_surface_tiled_with_scale = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Float32, ScaleMode, Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurfaceTiledWithScale")
        self.blit_surface9_grid = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32, Int32, Int32, Int32, Float32, ScaleMode, Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurface9Grid")
        self.map_surface_rgb = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8) -> UInt32]("SDL_MapSurfaceRGB")
        self.map_surface_rgba = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> UInt32]("SDL_MapSurfaceRGBA")
        self.read_surface_pixel = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_ReadSurfacePixel")
        self.read_surface_pixel_float = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_ReadSurfacePixelFloat")
        self.write_surface_pixel = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, UInt8, UInt8, UInt8, UInt8) -> Bool]("SDL_WriteSurfacePixel")
        self.write_surface_pixel_float = self.dlhandle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Float32, Float32, Float32, Float32) -> Bool]("SDL_WriteSurfacePixelFloat")
        self.get_date_time_locale_preferences = self.dlhandle.get_function[fn(Ptr[DateFormat, MutExternalOrigin], Ptr[TimeFormat, MutExternalOrigin]) -> Bool]("SDL_GetDateTimeLocalePreferences")
        self.get_current_time = self.dlhandle.get_function[fn(Ptr[Time, MutExternalOrigin]) -> Bool]("SDL_GetCurrentTime")
        self.time_to_date_time = self.dlhandle.get_function[fn(Time, Ptr[DateTime, MutExternalOrigin], Bool) -> Bool]("SDL_TimeToDateTime")
        self.date_time_to_time = self.dlhandle.get_function[fn(Ptr[DateTime, ImmutExternalOrigin], Ptr[Time, MutExternalOrigin]) -> Bool]("SDL_DateTimeToTime")
        self.time_to_windows = self.dlhandle.get_function[fn(Time, Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> NoneType]("SDL_TimeToWindows")
        self.time_from_windows = self.dlhandle.get_function[fn(UInt32, UInt32) -> Time]("SDL_TimeFromWindows")
        self.get_days_in_month = self.dlhandle.get_function[fn(Int32, Int32) -> Int32]("SDL_GetDaysInMonth")
        self.get_day_of_year = self.dlhandle.get_function[fn(Int32, Int32, Int32) -> Int32]("SDL_GetDayOfYear")
        self.get_day_of_week = self.dlhandle.get_function[fn(Int32, Int32, Int32) -> Int32]("SDL_GetDayOfWeek")
        self.get_ticks = self.dlhandle.get_function[fn() -> UInt64]("SDL_GetTicks")
        self.get_ticks_ns = self.dlhandle.get_function[fn() -> UInt64]("SDL_GetTicksNS")
        self.get_performance_counter = self.dlhandle.get_function[fn() -> UInt64]("SDL_GetPerformanceCounter")
        self.get_performance_frequency = self.dlhandle.get_function[fn() -> UInt64]("SDL_GetPerformanceFrequency")
        self.delay = self.dlhandle.get_function[fn(UInt32) -> NoneType]("SDL_Delay")
        self.delay_ns = self.dlhandle.get_function[fn(UInt64) -> NoneType]("SDL_DelayNS")
        self.delay_precise = self.dlhandle.get_function[fn(UInt64) -> NoneType]("SDL_DelayPrecise")
        self.add_timer = self.dlhandle.get_function[fn(UInt32, TimerCallback, Ptr[NoneType, MutExternalOrigin]) -> TimerID]("SDL_AddTimer")
        self.add_timer_ns = self.dlhandle.get_function[fn(UInt64, NSTimerCallback, Ptr[NoneType, MutExternalOrigin]) -> TimerID]("SDL_AddTimerNS")
        self.remove_timer = self.dlhandle.get_function[fn(TimerID) -> Bool]("SDL_RemoveTimer")
        self.get_touch_devices = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[TouchID, MutExternalOrigin]]("SDL_GetTouchDevices")
        self.get_touch_device_name = self.dlhandle.get_function[fn(TouchID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetTouchDeviceName")
        self.get_touch_device_type = self.dlhandle.get_function[fn(TouchID) -> TouchDeviceType]("SDL_GetTouchDeviceType")
        self.get_touch_fingers = self.dlhandle.get_function[fn(TouchID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Finger, MutExternalOrigin], MutExternalOrigin]]("SDL_GetTouchFingers")
        self.get_version = self.dlhandle.get_function[fn() -> Int32]("SDL_GetVersion")
        self.get_revision = self.dlhandle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetRevision")
        self.get_num_video_drivers = self.dlhandle.get_function[fn() -> Int32]("SDL_GetNumVideoDrivers")
        self.get_video_driver = self.dlhandle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetVideoDriver")
        self.get_current_video_driver = self.dlhandle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCurrentVideoDriver")
        self.get_system_theme = self.dlhandle.get_function[fn() -> SystemTheme]("SDL_GetSystemTheme")
        self.get_displays = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[DisplayID, MutExternalOrigin]]("SDL_GetDisplays")
        self.get_primary_display = self.dlhandle.get_function[fn() -> DisplayID]("SDL_GetPrimaryDisplay")
        self.get_display_properties = self.dlhandle.get_function[fn(DisplayID) -> PropertiesID]("SDL_GetDisplayProperties")
        self.get_display_name = self.dlhandle.get_function[fn(DisplayID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetDisplayName")
        self.get_display_bounds = self.dlhandle.get_function[fn(DisplayID, Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetDisplayBounds")
        self.get_display_usable_bounds = self.dlhandle.get_function[fn(DisplayID, Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetDisplayUsableBounds")
        self.get_natural_display_orientation = self.dlhandle.get_function[fn(DisplayID) -> DisplayOrientation]("SDL_GetNaturalDisplayOrientation")
        self.get_current_display_orientation = self.dlhandle.get_function[fn(DisplayID) -> DisplayOrientation]("SDL_GetCurrentDisplayOrientation")
        self.get_display_content_scale = self.dlhandle.get_function[fn(DisplayID) -> Float32]("SDL_GetDisplayContentScale")
        self.get_fullscreen_display_modes = self.dlhandle.get_function[fn(DisplayID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[DisplayMode, MutExternalOrigin], MutExternalOrigin]]("SDL_GetFullscreenDisplayModes")
        self.get_closest_fullscreen_display_mode = self.dlhandle.get_function[fn(DisplayID, Int32, Int32, Float32, Bool, Ptr[DisplayMode, MutExternalOrigin]) -> Bool]("SDL_GetClosestFullscreenDisplayMode")
        self.get_desktop_display_mode = self.dlhandle.get_function[fn(DisplayID) -> Ptr[DisplayMode, ImmutExternalOrigin]]("SDL_GetDesktopDisplayMode")
        self.get_current_display_mode = self.dlhandle.get_function[fn(DisplayID) -> Ptr[DisplayMode, ImmutExternalOrigin]]("SDL_GetCurrentDisplayMode")
        self.get_display_for_point = self.dlhandle.get_function[fn(Ptr[Point, ImmutExternalOrigin]) -> DisplayID]("SDL_GetDisplayForPoint")
        self.get_display_for_rect = self.dlhandle.get_function[fn(Ptr[Rect, ImmutExternalOrigin]) -> DisplayID]("SDL_GetDisplayForRect")
        self.get_display_for_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> DisplayID]("SDL_GetDisplayForWindow")
        self.get_window_pixel_density = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Float32]("SDL_GetWindowPixelDensity")
        self.get_window_display_scale = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Float32]("SDL_GetWindowDisplayScale")
        self.set_window_fullscreen_mode = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[DisplayMode, ImmutExternalOrigin]) -> Bool]("SDL_SetWindowFullscreenMode")
        self.get_window_fullscreen_mode = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[DisplayMode, ImmutExternalOrigin]]("SDL_GetWindowFullscreenMode")
        self.get_window_icc_profile = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetWindowICCProfile")
        self.get_window_pixel_format = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> PixelFormat]("SDL_GetWindowPixelFormat")
        self.get_windows = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin]]("SDL_GetWindows")
        self.create_window = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Int32, Int32, WindowFlags) -> Ptr[Window, MutExternalOrigin]]("SDL_CreateWindow")
        self.create_popup_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32, Int32, Int32, WindowFlags) -> Ptr[Window, MutExternalOrigin]]("SDL_CreatePopupWindow")
        self.create_window_with_properties = self.dlhandle.get_function[fn(PropertiesID) -> Ptr[Window, MutExternalOrigin]]("SDL_CreateWindowWithProperties")
        self.get_window_id = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> WindowID]("SDL_GetWindowID")
        self.get_window_from_id = self.dlhandle.get_function[fn(WindowID) -> Ptr[Window, MutExternalOrigin]]("SDL_GetWindowFromID")
        self.get_window_parent = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]]("SDL_GetWindowParent")
        self.get_window_properties = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> PropertiesID]("SDL_GetWindowProperties")
        self.get_window_flags = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> WindowFlags]("SDL_GetWindowFlags")
        self.set_window_title = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetWindowTitle")
        self.get_window_title = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetWindowTitle")
        self.set_window_icon = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SetWindowIcon")
        self.set_window_position = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetWindowPosition")
        self.get_window_position = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowPosition")
        self.set_window_size = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetWindowSize")
        self.get_window_size = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowSize")
        self.get_window_safe_area = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetWindowSafeArea")
        self.set_window_aspect_ratio = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Float32, Float32) -> Bool]("SDL_SetWindowAspectRatio")
        self.get_window_aspect_ratio = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetWindowAspectRatio")
        self.get_window_borders_size = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowBordersSize")
        self.get_window_size_in_pixels = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowSizeInPixels")
        self.set_window_minimum_size = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetWindowMinimumSize")
        self.get_window_minimum_size = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowMinimumSize")
        self.set_window_maximum_size = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetWindowMaximumSize")
        self.get_window_maximum_size = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowMaximumSize")
        self.set_window_bordered = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowBordered")
        self.set_window_resizable = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowResizable")
        self.set_window_always_on_top = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowAlwaysOnTop")
        self.set_window_fill_document = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowFillDocument")
        self.show_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_ShowWindow")
        self.hide_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_HideWindow")
        self.raise_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_RaiseWindow")
        self.maximize_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_MaximizeWindow")
        self.minimize_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_MinimizeWindow")
        self.restore_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_RestoreWindow")
        self.set_window_fullscreen = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowFullscreen")
        self.sync_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_SyncWindow")
        self.window_has_surface = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_WindowHasSurface")
        self.get_window_surface = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_GetWindowSurface")
        self.set_window_surface_v_sync = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32) -> Bool]("SDL_SetWindowSurfaceVSync")
        self.get_window_surface_v_sync = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowSurfaceVSync")
        self.update_window_surface = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_UpdateWindowSurface")
        self.update_window_surface_rects = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32) -> Bool]("SDL_UpdateWindowSurfaceRects")
        self.destroy_window_surface = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_DestroyWindowSurface")
        self.set_window_keyboard_grab = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowKeyboardGrab")
        self.set_window_mouse_grab = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowMouseGrab")
        self.get_window_keyboard_grab = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_GetWindowKeyboardGrab")
        self.get_window_mouse_grab = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_GetWindowMouseGrab")
        self.get_grabbed_window = self.dlhandle.get_function[fn() -> Ptr[Window, MutExternalOrigin]]("SDL_GetGrabbedWindow")
        self.set_window_mouse_rect = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_SetWindowMouseRect")
        self.get_window_mouse_rect = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Rect, ImmutExternalOrigin]]("SDL_GetWindowMouseRect")
        self.set_window_opacity = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Float32) -> Bool]("SDL_SetWindowOpacity")
        self.get_window_opacity = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Float32]("SDL_GetWindowOpacity")
        self.set_window_parent = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_SetWindowParent")
        self.set_window_modal = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowModal")
        self.set_window_focusable = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowFocusable")
        self.show_window_system_menu = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_ShowWindowSystemMenu")
        self.set_window_hit_test = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], HitTest, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetWindowHitTest")
        self.set_window_shape = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SetWindowShape")
        self.flash_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], FlashOperation) -> Bool]("SDL_FlashWindow")
        self.set_window_progress_state = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], ProgressState) -> Bool]("SDL_SetWindowProgressState")
        self.get_window_progress_state = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> ProgressState]("SDL_GetWindowProgressState")
        self.set_window_progress_value = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], Float32) -> Bool]("SDL_SetWindowProgressValue")
        self.get_window_progress_value = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Float32]("SDL_GetWindowProgressValue")
        self.destroy_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> NoneType]("SDL_DestroyWindow")
        self.screen_saver_enabled = self.dlhandle.get_function[fn() -> Bool]("SDL_ScreenSaverEnabled")
        self.enable_screen_saver = self.dlhandle.get_function[fn() -> Bool]("SDL_EnableScreenSaver")
        self.disable_screen_saver = self.dlhandle.get_function[fn() -> Bool]("SDL_DisableScreenSaver")
        self.gl_load_library = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_GL_LoadLibrary")
        self.gl_get_proc_address = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> FunctionPointer]("SDL_GL_GetProcAddress")
        self.egl_get_proc_address = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> FunctionPointer]("SDL_EGL_GetProcAddress")
        self.gl_unload_library = self.dlhandle.get_function[fn() -> NoneType]("SDL_GL_UnloadLibrary")
        self.gl_extension_supported = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_GL_ExtensionSupported")
        self.gl_reset_attributes = self.dlhandle.get_function[fn() -> NoneType]("SDL_GL_ResetAttributes")
        self.gl_set_attribute = self.dlhandle.get_function[fn(GLAttr, Int32) -> Bool]("SDL_GL_SetAttribute")
        self.gl_get_attribute = self.dlhandle.get_function[fn(GLAttr, Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GL_GetAttribute")
        self.gl_create_context = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> GLContext]("SDL_GL_CreateContext")
        self.gl_make_current = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], GLContext) -> Bool]("SDL_GL_MakeCurrent")
        self.gl_get_current_window = self.dlhandle.get_function[fn() -> Ptr[Window, MutExternalOrigin]]("SDL_GL_GetCurrentWindow")
        self.gl_get_current_context = self.dlhandle.get_function[fn() -> GLContext]("SDL_GL_GetCurrentContext")
        self.egl_get_current_display = self.dlhandle.get_function[fn() -> EGLDisplay]("SDL_EGL_GetCurrentDisplay")
        self.egl_get_current_config = self.dlhandle.get_function[fn() -> EGLConfig]("SDL_EGL_GetCurrentConfig")
        self.egl_get_window_surface = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> EGLSurface]("SDL_EGL_GetWindowSurface")
        self.egl_set_attribute_callbacks = self.dlhandle.get_function[fn(EGLAttribArrayCallback, EGLIntArrayCallback, EGLIntArrayCallback, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_EGL_SetAttributeCallbacks")
        self.gl_set_swap_interval = self.dlhandle.get_function[fn(Int32) -> Bool]("SDL_GL_SetSwapInterval")
        self.gl_get_swap_interval = self.dlhandle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GL_GetSwapInterval")
        self.gl_swap_window = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_GL_SwapWindow")
        self.gl_destroy_context = self.dlhandle.get_function[fn(GLContext) -> Bool]("SDL_GL_DestroyContext")
        self.vulkan_load_library = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_Vulkan_LoadLibrary")
        self.vulkan_get_vk_get_instance_proc_addr = self.dlhandle.get_function[fn() -> FunctionPointer]("SDL_Vulkan_GetVkGetInstanceProcAddr")
        self.vulkan_unload_library = self.dlhandle.get_function[fn() -> NoneType]("SDL_Vulkan_UnloadLibrary")
        self.vulkan_get_instance_extensions = self.dlhandle.get_function[fn(Ptr[UInt32, MutExternalOrigin]) -> Ptr[CStringSlice[ImmutExternalOrigin], ImmutExternalOrigin]]("SDL_Vulkan_GetInstanceExtensions")
        self.vulkan_create_surface = self.dlhandle.get_function[fn(Ptr[Window, MutExternalOrigin], VkInstance, Ptr[VkAllocationCallbacks, ImmutExternalOrigin], Ptr[VkSurfaceKHR, MutExternalOrigin]) -> Bool]("SDL_Vulkan_CreateSurface")
        self.vulkan_destroy_surface = self.dlhandle.get_function[fn(VkInstance, VkSurfaceKHR, Ptr[VkAllocationCallbacks, ImmutExternalOrigin]) -> NoneType]("SDL_Vulkan_DestroySurface")
        self.vulkan_get_presentation_support = self.dlhandle.get_function[fn(VkInstance, VkPhysicalDevice, UInt32) -> Bool]("SDL_Vulkan_GetPresentationSupport")
