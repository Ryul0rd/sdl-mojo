from ffi import OwnedDLHandle, c_char, CStringSlice
from sys import CompilationTarget
from os import PathLike
from pathlib import Path
from .misc import *
from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *


comptime Ptr = UnsafePointer


struct Sdl3Functions(Movable):
    var _dynamic_library_handle: OwnedDLHandle
    var _get_num_audio_drivers: fn() -> Int32
    var _get_audio_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var _get_current_audio_driver: fn() -> CStringSlice[ImmutExternalOrigin]
    var _get_audio_playback_devices: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[AudioDeviceID, MutExternalOrigin]
    var _get_audio_recording_devices: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[AudioDeviceID, MutExternalOrigin]
    var _get_audio_device_name: fn(AudioDeviceID) -> CStringSlice[ImmutExternalOrigin]
    var _get_audio_device_format: fn(AudioDeviceID, Ptr[AudioSpec, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_audio_device_channel_map: fn(AudioDeviceID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]
    var _open_audio_device: fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> AudioDeviceID
    var _is_audio_device_physical: fn(AudioDeviceID) -> Bool
    var _is_audio_device_playback: fn(AudioDeviceID) -> Bool
    var _pause_audio_device: fn(AudioDeviceID) -> Bool
    var _resume_audio_device: fn(AudioDeviceID) -> Bool
    var _audio_device_paused: fn(AudioDeviceID) -> Bool
    var _get_audio_device_gain: fn(AudioDeviceID) -> Float32
    var _set_audio_device_gain: fn(AudioDeviceID, Float32) -> Bool
    var _close_audio_device: fn(AudioDeviceID) -> NoneType
    var _bind_audio_streams: fn(AudioDeviceID, Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin], Int32) -> Bool
    var _bind_audio_stream: fn(AudioDeviceID, Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var _unbind_audio_streams: fn(Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin], Int32) -> NoneType
    var _unbind_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> NoneType
    var _get_audio_stream_device: fn(Ptr[AudioStream, MutExternalOrigin]) -> AudioDeviceID
    var _create_audio_stream: fn(Ptr[AudioSpec, ImmutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]
    var _get_audio_stream_properties: fn(Ptr[AudioStream, MutExternalOrigin]) -> PropertiesID
    var _get_audio_stream_format: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var _set_audio_stream_format: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin]) -> Bool
    var _get_audio_stream_frequency_ratio: fn(Ptr[AudioStream, MutExternalOrigin]) -> Float32
    var _set_audio_stream_frequency_ratio: fn(Ptr[AudioStream, MutExternalOrigin], Float32) -> Bool
    var _get_audio_stream_gain: fn(Ptr[AudioStream, MutExternalOrigin]) -> Float32
    var _set_audio_stream_gain: fn(Ptr[AudioStream, MutExternalOrigin], Float32) -> Bool
    var _get_audio_stream_input_channel_map: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]
    var _get_audio_stream_output_channel_map: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]
    var _set_audio_stream_input_channel_map: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool
    var _set_audio_stream_output_channel_map: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool
    var _put_audio_stream_data: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var _put_audio_stream_data_no_copy: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, AudioStreamDataCompleteCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _put_audio_stream_planar_data: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Ptr[NoneType, ImmutExternalOrigin], ImmutExternalOrigin], Int32, Int32) -> Bool
    var _get_audio_stream_data: fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Int32
    var _get_audio_stream_available: fn(Ptr[AudioStream, MutExternalOrigin]) -> Int32
    var _get_audio_stream_queued: fn(Ptr[AudioStream, MutExternalOrigin]) -> Int32
    var _flush_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var _clear_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var _pause_audio_stream_device: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var _resume_audio_stream_device: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var _audio_stream_device_paused: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var _lock_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var _unlock_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var _set_audio_stream_get_callback: fn(Ptr[AudioStream, MutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _set_audio_stream_put_callback: fn(Ptr[AudioStream, MutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _destroy_audio_stream: fn(Ptr[AudioStream, MutExternalOrigin]) -> NoneType
    var _open_audio_device_stream: fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]
    var _set_audio_postmix_callback: fn(AudioDeviceID, AudioPostmixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _load_wav_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[AudioSpec, MutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var _load_wav: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var _mix_audio: fn(Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], AudioFormat, UInt32, Float32) -> Bool
    var _convert_audio_samples: fn(Ptr[AudioSpec, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_audio_format_name: fn(AudioFormat) -> CStringSlice[ImmutExternalOrigin]
    var _get_silence_value_for_format: fn(AudioFormat) -> Int32
    var _compose_custom_blend_mode: fn(BlendFactor, BlendFactor, BlendOperation, BlendFactor, BlendFactor, BlendOperation) -> BlendMode
    var _get_num_camera_drivers: fn() -> Int32
    var _get_camera_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var _get_current_camera_driver: fn() -> CStringSlice[ImmutExternalOrigin]
    var _get_cameras: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[CameraID, MutExternalOrigin]
    var _get_camera_supported_formats: fn(CameraID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[CameraSpec, MutExternalOrigin], MutExternalOrigin]
    var _get_camera_name: fn(CameraID) -> CStringSlice[ImmutExternalOrigin]
    var _get_camera_position: fn(CameraID) -> CameraPosition
    var _open_camera: fn(CameraID, Ptr[CameraSpec, ImmutExternalOrigin]) -> Ptr[Camera, MutExternalOrigin]
    var _get_camera_permission_state: fn(Ptr[Camera, MutExternalOrigin]) -> CameraPermissionState
    var _get_camera_id: fn(Ptr[Camera, MutExternalOrigin]) -> CameraID
    var _get_camera_properties: fn(Ptr[Camera, MutExternalOrigin]) -> PropertiesID
    var _get_camera_format: fn(Ptr[Camera, MutExternalOrigin], Ptr[CameraSpec, MutExternalOrigin]) -> Bool
    var _acquire_camera_frame: fn(Ptr[Camera, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _release_camera_frame: fn(Ptr[Camera, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> NoneType
    var _close_camera: fn(Ptr[Camera, MutExternalOrigin]) -> NoneType
    var _set_clipboard_text: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _get_clipboard_text: fn() -> Ptr[c_char, MutExternalOrigin]
    var _has_clipboard_text: fn() -> Bool
    var _set_primary_selection_text: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _get_primary_selection_text: fn() -> Ptr[c_char, MutExternalOrigin]
    var _has_primary_selection_text: fn() -> Bool
    var _set_clipboard_data: fn(ClipboardDataCallback, ClipboardCleanupCallback, Ptr[NoneType, MutExternalOrigin], Ptr[CStringSlice[ImmutExternalOrigin], MutExternalOrigin], Int32) -> Bool
    var _clear_clipboard_data: fn() -> Bool
    var _get_clipboard_data: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var _has_clipboard_data: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _get_clipboard_mime_types: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var _set_error: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _set_error_v: fn(Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool
    var _out_of_memory: fn() -> Bool
    var _get_error: fn() -> CStringSlice[ImmutExternalOrigin]
    var _clear_error: fn() -> Bool
    var _pump_events: fn() -> NoneType
    var _peep_events: fn(Ptr[Event, MutExternalOrigin], Int32, EventAction, UInt32, UInt32) -> Int32
    var _has_event: fn(UInt32) -> Bool
    var _has_events: fn(UInt32, UInt32) -> Bool
    var _flush_event: fn(UInt32) -> NoneType
    var _flush_events: fn(UInt32, UInt32) -> NoneType
    var _poll_event: fn(Ptr[Event, MutExternalOrigin]) -> Bool
    var _wait_event: fn(Ptr[Event, MutExternalOrigin]) -> Bool
    var _wait_event_timeout: fn(Ptr[Event, MutExternalOrigin], Int32) -> Bool
    var _push_event: fn(Ptr[Event, MutExternalOrigin]) -> Bool
    var _set_event_filter: fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var _get_event_filter: fn(Ptr[EventFilter, MutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]) -> Bool
    var _add_event_watch: fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _remove_event_watch: fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var _filter_events: fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var _set_event_enabled: fn(UInt32, Bool) -> NoneType
    var _event_enabled: fn(UInt32) -> Bool
    var _register_events: fn(Int32) -> UInt32
    var _get_window_from_event: fn(Ptr[Event, ImmutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]
    var _get_event_description: fn(Ptr[Event, ImmutExternalOrigin], Ptr[c_char, MutExternalOrigin], Int32) -> Int32
    var _get_base_path: fn() -> CStringSlice[ImmutExternalOrigin]
    var _get_pref_path: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[c_char, MutExternalOrigin]
    var _get_user_folder: fn(Folder) -> CStringSlice[ImmutExternalOrigin]
    var _create_directory: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _enumerate_directory: fn(Ptr[c_char, ImmutExternalOrigin], EnumerateDirectoryCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _remove_path: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _rename_path: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _copy_file: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _get_path_info: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[PathInfo, MutExternalOrigin]) -> Bool
    var _glob_directory: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], GlobFlags, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var _get_current_directory: fn() -> Ptr[c_char, MutExternalOrigin]
    var _add_gamepad_mapping: fn(Ptr[c_char, ImmutExternalOrigin]) -> Int32
    var _add_gamepad_mappings_from_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Int32
    var _add_gamepad_mappings_from_file: fn(Ptr[c_char, ImmutExternalOrigin]) -> Int32
    var _reload_gamepad_mappings: fn() -> Bool
    var _get_gamepad_mappings: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var _get_gamepad_mapping_for_guid: fn(GUID) -> Ptr[c_char, MutExternalOrigin]
    var _get_gamepad_mapping: fn(Ptr[Gamepad, MutExternalOrigin]) -> Ptr[c_char, MutExternalOrigin]
    var _set_gamepad_mapping: fn(JoystickID, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _has_gamepad: fn() -> Bool
    var _get_gamepads: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[JoystickID, MutExternalOrigin]
    var _is_gamepad: fn(JoystickID) -> Bool
    var _get_gamepad_name_for_id: fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]
    var _get_gamepad_path_for_id: fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]
    var _get_gamepad_player_index_for_id: fn(JoystickID) -> Int32
    var _get_gamepad_guid_for_id: fn(JoystickID) -> GUID
    var _get_gamepad_vendor_for_id: fn(JoystickID) -> UInt16
    var _get_gamepad_product_for_id: fn(JoystickID) -> UInt16
    var _get_gamepad_product_version_for_id: fn(JoystickID) -> UInt16
    var _get_gamepad_type_for_id: fn(JoystickID) -> GamepadType
    var _get_real_gamepad_type_for_id: fn(JoystickID) -> GamepadType
    var _get_gamepad_mapping_for_id: fn(JoystickID) -> Ptr[c_char, MutExternalOrigin]
    var _open_gamepad: fn(JoystickID) -> Ptr[Gamepad, MutExternalOrigin]
    var _get_gamepad_from_id: fn(JoystickID) -> Ptr[Gamepad, MutExternalOrigin]
    var _get_gamepad_from_player_index: fn(Int32) -> Ptr[Gamepad, MutExternalOrigin]
    var _get_gamepad_properties: fn(Ptr[Gamepad, MutExternalOrigin]) -> PropertiesID
    var _get_gamepad_id: fn(Ptr[Gamepad, MutExternalOrigin]) -> JoystickID
    var _get_gamepad_name: fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_gamepad_path: fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_gamepad_type: fn(Ptr[Gamepad, MutExternalOrigin]) -> GamepadType
    var _get_real_gamepad_type: fn(Ptr[Gamepad, MutExternalOrigin]) -> GamepadType
    var _get_gamepad_player_index: fn(Ptr[Gamepad, MutExternalOrigin]) -> Int32
    var _set_gamepad_player_index: fn(Ptr[Gamepad, MutExternalOrigin], Int32) -> Bool
    var _get_gamepad_vendor: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16
    var _get_gamepad_product: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16
    var _get_gamepad_product_version: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16
    var _get_gamepad_firmware_version: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16
    var _get_gamepad_serial: fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_gamepad_steam_handle: fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt64
    var _get_gamepad_connection_state: fn(Ptr[Gamepad, MutExternalOrigin]) -> JoystickConnectionState
    var _get_gamepad_power_info: fn(Ptr[Gamepad, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState
    var _gamepad_connected: fn(Ptr[Gamepad, MutExternalOrigin]) -> Bool
    var _get_gamepad_joystick: fn(Ptr[Gamepad, MutExternalOrigin]) -> Ptr[Joystick, MutExternalOrigin]
    var _set_gamepad_events_enabled: fn(Bool) -> NoneType
    var _gamepad_events_enabled: fn() -> Bool
    var _get_gamepad_bindings: fn(Ptr[Gamepad, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[GamepadBinding, MutExternalOrigin], MutExternalOrigin]
    var _update_gamepads: fn() -> NoneType
    var _get_gamepad_type_from_string: fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadType
    var _get_gamepad_string_for_type: fn(GamepadType) -> CStringSlice[ImmutExternalOrigin]
    var _get_gamepad_axis_from_string: fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadAxis
    var _get_gamepad_string_for_axis: fn(GamepadAxis) -> CStringSlice[ImmutExternalOrigin]
    var _gamepad_has_axis: fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> Bool
    var _get_gamepad_axis: fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> Int16
    var _get_gamepad_button_from_string: fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadButton
    var _get_gamepad_string_for_button: fn(GamepadButton) -> CStringSlice[ImmutExternalOrigin]
    var _gamepad_has_button: fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> Bool
    var _get_gamepad_button: fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> Bool
    var _get_gamepad_button_label_for_type: fn(GamepadType, GamepadButton) -> GamepadButtonLabel
    var _get_gamepad_button_label: fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> GamepadButtonLabel
    var _get_num_gamepad_touchpads: fn(Ptr[Gamepad, MutExternalOrigin]) -> Int32
    var _get_num_gamepad_touchpad_fingers: fn(Ptr[Gamepad, MutExternalOrigin], Int32) -> Int32
    var _get_gamepad_touchpad_finger: fn(Ptr[Gamepad, MutExternalOrigin], Int32, Int32, Ptr[Bool, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _gamepad_has_sensor: fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Bool
    var _set_gamepad_sensor_enabled: fn(Ptr[Gamepad, MutExternalOrigin], SensorType, Bool) -> Bool
    var _gamepad_sensor_enabled: fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Bool
    var _get_gamepad_sensor_data_rate: fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Float32
    var _get_gamepad_sensor_data: fn(Ptr[Gamepad, MutExternalOrigin], SensorType, Ptr[Float32, MutExternalOrigin], Int32) -> Bool
    var _rumble_gamepad: fn(Ptr[Gamepad, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool
    var _rumble_gamepad_triggers: fn(Ptr[Gamepad, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool
    var _set_gamepad_led: fn(Ptr[Gamepad, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool
    var _send_gamepad_effect: fn(Ptr[Gamepad, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var _close_gamepad: fn(Ptr[Gamepad, MutExternalOrigin]) -> NoneType
    var _get_gamepad_apple_sf_symbols_name_for_button: fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> CStringSlice[ImmutExternalOrigin]
    var _get_gamepad_apple_sf_symbols_name_for_axis: fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> CStringSlice[ImmutExternalOrigin]
    var _gpu_supports_shader_formats: fn(GPUShaderFormat, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _gpu_supports_properties: fn(PropertiesID) -> Bool
    var _create_gpu_device: fn(GPUShaderFormat, Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[GPUDevice, MutExternalOrigin]
    var _create_gpu_device_with_properties: fn(PropertiesID) -> Ptr[GPUDevice, MutExternalOrigin]
    var _destroy_gpu_device: fn(Ptr[GPUDevice, MutExternalOrigin]) -> NoneType
    var _get_num_gpu_drivers: fn() -> Int32
    var _get_gpu_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var _get_gpu_device_driver: fn(Ptr[GPUDevice, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_gpu_shader_formats: fn(Ptr[GPUDevice, MutExternalOrigin]) -> GPUShaderFormat
    var _get_gpu_device_properties: fn(Ptr[GPUDevice, MutExternalOrigin]) -> PropertiesID
    var _create_gpu_compute_pipeline: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUComputePipelineCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUComputePipeline, MutExternalOrigin]
    var _create_gpu_graphics_pipeline: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUGraphicsPipelineCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUGraphicsPipeline, MutExternalOrigin]
    var _create_gpu_sampler: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUSamplerCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUSampler, MutExternalOrigin]
    var _create_gpu_shader: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUShaderCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUShader, MutExternalOrigin]
    var _create_gpu_texture: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTextureCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]
    var _create_gpu_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBufferCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUBuffer, MutExternalOrigin]
    var _create_gpu_transfer_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBufferCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUTransferBuffer, MutExternalOrigin]
    var _set_gpu_buffer_name: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _set_gpu_texture_name: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _insert_gpu_debug_label: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _push_gpu_debug_group: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _pop_gpu_debug_group: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> NoneType
    var _release_gpu_texture: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin]) -> NoneType
    var _release_gpu_sampler: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUSampler, MutExternalOrigin]) -> NoneType
    var _release_gpu_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin]) -> NoneType
    var _release_gpu_transfer_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin]) -> NoneType
    var _release_gpu_compute_pipeline: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUComputePipeline, MutExternalOrigin]) -> NoneType
    var _release_gpu_shader: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUShader, MutExternalOrigin]) -> NoneType
    var _release_gpu_graphics_pipeline: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUGraphicsPipeline, MutExternalOrigin]) -> NoneType
    var _acquire_gpu_command_buffer: fn(Ptr[GPUDevice, MutExternalOrigin]) -> Ptr[GPUCommandBuffer, MutExternalOrigin]
    var _push_gpu_vertex_uniform_data: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType
    var _push_gpu_fragment_uniform_data: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType
    var _push_gpu_compute_uniform_data: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType
    var _begin_gpu_render_pass: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUColorTargetInfo, ImmutExternalOrigin], UInt32, Ptr[GPUDepthStencilTargetInfo, ImmutExternalOrigin]) -> Ptr[GPURenderPass, MutExternalOrigin]
    var _bind_gpu_graphics_pipeline: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUGraphicsPipeline, MutExternalOrigin]) -> NoneType
    var _set_gpu_viewport: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUViewport, ImmutExternalOrigin]) -> NoneType
    var _set_gpu_scissor: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> NoneType
    var _set_gpu_blend_constants: fn(Ptr[GPURenderPass, MutExternalOrigin], FColor) -> NoneType
    var _set_gpu_stencil_reference: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt8) -> NoneType
    var _bind_gpu_vertex_buffers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUBufferBinding, ImmutExternalOrigin], UInt32) -> NoneType
    var _bind_gpu_index_buffer: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBufferBinding, ImmutExternalOrigin], GPUIndexElementSize) -> NoneType
    var _bind_gpu_vertex_samplers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType
    var _bind_gpu_vertex_storage_textures: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var _bind_gpu_vertex_storage_buffers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var _bind_gpu_fragment_samplers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType
    var _bind_gpu_fragment_storage_textures: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var _bind_gpu_fragment_storage_buffers: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var _draw_gpu_indexed_primitives: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, UInt32, UInt32, Int32, UInt32) -> NoneType
    var _draw_gpu_primitives: fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, UInt32, UInt32, UInt32) -> NoneType
    var _draw_gpu_primitives_indirect: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32, UInt32) -> NoneType
    var _draw_gpu_indexed_primitives_indirect: fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32, UInt32) -> NoneType
    var _end_gpu_render_pass: fn(Ptr[GPURenderPass, MutExternalOrigin]) -> NoneType
    var _begin_gpu_compute_pass: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUStorageTextureReadWriteBinding, ImmutExternalOrigin], UInt32, Ptr[GPUStorageBufferReadWriteBinding, ImmutExternalOrigin], UInt32) -> Ptr[GPUComputePass, MutExternalOrigin]
    var _bind_gpu_compute_pipeline: fn(Ptr[GPUComputePass, MutExternalOrigin], Ptr[GPUComputePipeline, MutExternalOrigin]) -> NoneType
    var _bind_gpu_compute_samplers: fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType
    var _bind_gpu_compute_storage_textures: fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var _bind_gpu_compute_storage_buffers: fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType
    var _dispatch_gpu_compute: fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, UInt32, UInt32) -> NoneType
    var _dispatch_gpu_compute_indirect: fn(Ptr[GPUComputePass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32) -> NoneType
    var _end_gpu_compute_pass: fn(Ptr[GPUComputePass, MutExternalOrigin]) -> NoneType
    var _map_gpu_transfer_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin], Bool) -> Ptr[NoneType, MutExternalOrigin]
    var _unmap_gpu_transfer_buffer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin]) -> NoneType
    var _begin_gpu_copy_pass: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Ptr[GPUCopyPass, MutExternalOrigin]
    var _upload_to_gpu_texture: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureTransferInfo, ImmutExternalOrigin], Ptr[GPUTextureRegion, ImmutExternalOrigin], Bool) -> NoneType
    var _upload_to_gpu_buffer: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTransferBufferLocation, ImmutExternalOrigin], Ptr[GPUBufferRegion, ImmutExternalOrigin], Bool) -> NoneType
    var _copy_gpu_texture_to_texture: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureLocation, ImmutExternalOrigin], Ptr[GPUTextureLocation, ImmutExternalOrigin], UInt32, UInt32, UInt32, Bool) -> NoneType
    var _copy_gpu_buffer_to_buffer: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUBufferLocation, ImmutExternalOrigin], Ptr[GPUBufferLocation, ImmutExternalOrigin], UInt32, Bool) -> NoneType
    var _download_from_gpu_texture: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureRegion, ImmutExternalOrigin], Ptr[GPUTextureTransferInfo, ImmutExternalOrigin]) -> NoneType
    var _download_from_gpu_buffer: fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUBufferRegion, ImmutExternalOrigin], Ptr[GPUTransferBufferLocation, ImmutExternalOrigin]) -> NoneType
    var _end_gpu_copy_pass: fn(Ptr[GPUCopyPass, MutExternalOrigin]) -> NoneType
    var _generate_mipmaps_for_gpu_texture: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin]) -> NoneType
    var _blit_gpu_texture: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUBlitInfo, ImmutExternalOrigin]) -> NoneType
    var _window_supports_gpu_swapchain_composition: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUSwapchainComposition) -> Bool
    var _window_supports_gpu_present_mode: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUPresentMode) -> Bool
    var _claim_window_for_gpu_device: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool
    var _release_window_from_gpu_device: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> NoneType
    var _set_gpu_swapchain_parameters: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUSwapchainComposition, GPUPresentMode) -> Bool
    var _set_gpu_allowed_frames_in_flight: fn(Ptr[GPUDevice, MutExternalOrigin], UInt32) -> Bool
    var _get_gpu_swapchain_texture_format: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> GPUTextureFormat
    var _acquire_gpu_swapchain_texture: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[Window, MutExternalOrigin], Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var _wait_for_gpu_swapchain: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool
    var _wait_and_acquire_gpu_swapchain_texture: fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[Window, MutExternalOrigin], Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var _submit_gpu_command_buffer: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Bool
    var _submit_gpu_command_buffer_and_acquire_fence: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Ptr[GPUFence, MutExternalOrigin]
    var _cancel_gpu_command_buffer: fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Bool
    var _wait_for_gpu_idle: fn(Ptr[GPUDevice, MutExternalOrigin]) -> Bool
    var _wait_for_gpu_fences: fn(Ptr[GPUDevice, MutExternalOrigin], Bool, Ptr[Ptr[GPUFence, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> Bool
    var _query_gpu_fence: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUFence, MutExternalOrigin]) -> Bool
    var _release_gpu_fence: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUFence, MutExternalOrigin]) -> NoneType
    var _gpu_texture_format_texel_block_size: fn(GPUTextureFormat) -> UInt32
    var _gpu_texture_supports_format: fn(Ptr[GPUDevice, MutExternalOrigin], GPUTextureFormat, GPUTextureType, GPUTextureUsageFlags) -> Bool
    var _gpu_texture_supports_sample_count: fn(Ptr[GPUDevice, MutExternalOrigin], GPUTextureFormat, GPUSampleCount) -> Bool
    var _calculate_gpu_texture_format_size: fn(GPUTextureFormat, UInt32, UInt32, UInt32) -> UInt32
    var _get_pixel_format_from_gpu_texture_format: fn(GPUTextureFormat) -> PixelFormat
    var _get_gpu_texture_format_from_pixel_format: fn(PixelFormat) -> GPUTextureFormat
    var _guid_to_string: fn(GUID, Ptr[c_char, MutExternalOrigin], Int32) -> NoneType
    var _string_to_guid: fn(Ptr[c_char, ImmutExternalOrigin]) -> GUID
    var _get_haptics: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[HapticID, MutExternalOrigin]
    var _get_haptic_name_for_id: fn(HapticID) -> CStringSlice[ImmutExternalOrigin]
    var _open_haptic: fn(HapticID) -> Ptr[Haptic, MutExternalOrigin]
    var _get_haptic_from_id: fn(HapticID) -> Ptr[Haptic, MutExternalOrigin]
    var _get_haptic_id: fn(Ptr[Haptic, MutExternalOrigin]) -> HapticID
    var _get_haptic_name: fn(Ptr[Haptic, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _is_mouse_haptic: fn() -> Bool
    var _open_haptic_from_mouse: fn() -> Ptr[Haptic, MutExternalOrigin]
    var _is_joystick_haptic: fn(Ptr[Joystick, MutExternalOrigin]) -> Bool
    var _open_haptic_from_joystick: fn(Ptr[Joystick, MutExternalOrigin]) -> Ptr[Haptic, MutExternalOrigin]
    var _close_haptic: fn(Ptr[Haptic, MutExternalOrigin]) -> NoneType
    var _get_max_haptic_effects: fn(Ptr[Haptic, MutExternalOrigin]) -> Int32
    var _get_max_haptic_effects_playing: fn(Ptr[Haptic, MutExternalOrigin]) -> Int32
    var _get_haptic_features: fn(Ptr[Haptic, MutExternalOrigin]) -> UInt32
    var _get_num_haptic_axes: fn(Ptr[Haptic, MutExternalOrigin]) -> Int32
    var _haptic_effect_supported: fn(Ptr[Haptic, MutExternalOrigin], Ptr[HapticEffect, ImmutExternalOrigin]) -> Bool
    var _create_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], Ptr[HapticEffect, ImmutExternalOrigin]) -> HapticEffectID
    var _update_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID, Ptr[HapticEffect, ImmutExternalOrigin]) -> Bool
    var _run_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID, UInt32) -> Bool
    var _stop_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> Bool
    var _destroy_haptic_effect: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> NoneType
    var _get_haptic_effect_status: fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> Bool
    var _set_haptic_gain: fn(Ptr[Haptic, MutExternalOrigin], Int32) -> Bool
    var _set_haptic_autocenter: fn(Ptr[Haptic, MutExternalOrigin], Int32) -> Bool
    var _pause_haptic: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var _resume_haptic: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var _stop_haptic_effects: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var _haptic_rumble_supported: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var _init_haptic_rumble: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var _play_haptic_rumble: fn(Ptr[Haptic, MutExternalOrigin], Float32, UInt32) -> Bool
    var _stop_haptic_rumble: fn(Ptr[Haptic, MutExternalOrigin]) -> Bool
    var _set_hint_with_priority: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], HintPriority) -> Bool
    var _set_hint: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _reset_hint: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _reset_hints: fn() -> NoneType
    var _get_hint: fn(Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_hint_boolean: fn(Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool
    var _add_hint_callback: fn(Ptr[c_char, ImmutExternalOrigin], HintCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _remove_hint_callback: fn(Ptr[c_char, ImmutExternalOrigin], HintCallback, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var _init: fn(InitFlags) -> Bool
    var _init_sub_system: fn(InitFlags) -> Bool
    var _quit_sub_system: fn(InitFlags) -> NoneType
    var _was_init: fn(InitFlags) -> InitFlags
    var _quit: fn() -> NoneType
    var _is_main_thread: fn() -> Bool
    var _run_on_main_thread: fn(MainThreadCallback, Ptr[NoneType, MutExternalOrigin], Bool) -> Bool
    var _set_app_metadata: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _set_app_metadata_property: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _get_app_metadata_property: fn(Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _io_from_file: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IOStream, MutExternalOrigin]
    var _io_from_mem: fn(Ptr[NoneType, MutExternalOrigin], Int32) -> Ptr[IOStream, MutExternalOrigin]
    var _io_from_const_mem: fn(Ptr[NoneType, ImmutExternalOrigin], Int32) -> Ptr[IOStream, MutExternalOrigin]
    var _io_from_dynamic_mem: fn() -> Ptr[IOStream, MutExternalOrigin]
    var _open_io: fn(Ptr[IOStreamInterface, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[IOStream, MutExternalOrigin]
    var _close_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _get_io_properties: fn(Ptr[IOStream, MutExternalOrigin]) -> PropertiesID
    var _get_io_status: fn(Ptr[IOStream, MutExternalOrigin]) -> IOStatus
    var _get_io_size: fn(Ptr[IOStream, MutExternalOrigin]) -> Int64
    var _seek_io: fn(Ptr[IOStream, MutExternalOrigin], Int64, IOWhence) -> Int64
    var _tell_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Int64
    var _read_io: fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Int32
    var _write_io: fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Int32
    var _i_oprintf: fn(Ptr[IOStream, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Int32
    var _i_ovprintf: fn(Ptr[IOStream, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Int32
    var _flush_io: fn(Ptr[IOStream, MutExternalOrigin]) -> Bool
    var _load_file_io: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Bool) -> Ptr[NoneType, MutExternalOrigin]
    var _load_file: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var _save_file_io: fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Bool) -> Bool
    var _save_file: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var _read_u8: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var _read_s8: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int8, MutExternalOrigin]) -> Bool
    var _read_u16_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> Bool
    var _read_s16_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int16, MutExternalOrigin]) -> Bool
    var _read_u16_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> Bool
    var _read_s16_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int16, MutExternalOrigin]) -> Bool
    var _read_u32_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var _read_s32_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _read_u32_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var _read_s32_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _read_u64_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool
    var _read_s64_le: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int64, MutExternalOrigin]) -> Bool
    var _read_u64_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool
    var _read_s64_be: fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int64, MutExternalOrigin]) -> Bool
    var _write_u8: fn(Ptr[IOStream, MutExternalOrigin], UInt8) -> Bool
    var _write_s8: fn(Ptr[IOStream, MutExternalOrigin], Int8) -> Bool
    var _write_u16_le: fn(Ptr[IOStream, MutExternalOrigin], UInt16) -> Bool
    var _write_s16_le: fn(Ptr[IOStream, MutExternalOrigin], Int16) -> Bool
    var _write_u16_be: fn(Ptr[IOStream, MutExternalOrigin], UInt16) -> Bool
    var _write_s16_be: fn(Ptr[IOStream, MutExternalOrigin], Int16) -> Bool
    var _write_u32_le: fn(Ptr[IOStream, MutExternalOrigin], UInt32) -> Bool
    var _write_s32_le: fn(Ptr[IOStream, MutExternalOrigin], Int32) -> Bool
    var _write_u32_be: fn(Ptr[IOStream, MutExternalOrigin], UInt32) -> Bool
    var _write_s32_be: fn(Ptr[IOStream, MutExternalOrigin], Int32) -> Bool
    var _write_u64_le: fn(Ptr[IOStream, MutExternalOrigin], UInt64) -> Bool
    var _write_s64_le: fn(Ptr[IOStream, MutExternalOrigin], Int64) -> Bool
    var _write_u64_be: fn(Ptr[IOStream, MutExternalOrigin], UInt64) -> Bool
    var _write_s64_be: fn(Ptr[IOStream, MutExternalOrigin], Int64) -> Bool
    var _lock_joysticks: fn() -> NoneType
    var _unlock_joysticks: fn() -> NoneType
    var _has_joystick: fn() -> Bool
    var _get_joysticks: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[JoystickID, MutExternalOrigin]
    var _get_joystick_name_for_id: fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]
    var _get_joystick_path_for_id: fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]
    var _get_joystick_player_index_for_id: fn(JoystickID) -> Int32
    var _get_joystick_guid_for_id: fn(JoystickID) -> GUID
    var _get_joystick_vendor_for_id: fn(JoystickID) -> UInt16
    var _get_joystick_product_for_id: fn(JoystickID) -> UInt16
    var _get_joystick_product_version_for_id: fn(JoystickID) -> UInt16
    var _get_joystick_type_for_id: fn(JoystickID) -> JoystickType
    var _open_joystick: fn(JoystickID) -> Ptr[Joystick, MutExternalOrigin]
    var _get_joystick_from_id: fn(JoystickID) -> Ptr[Joystick, MutExternalOrigin]
    var _get_joystick_from_player_index: fn(Int32) -> Ptr[Joystick, MutExternalOrigin]
    var _attach_virtual_joystick: fn(Ptr[VirtualJoystickDesc, ImmutExternalOrigin]) -> JoystickID
    var _detach_virtual_joystick: fn(JoystickID) -> Bool
    var _is_joystick_virtual: fn(JoystickID) -> Bool
    var _set_joystick_virtual_axis: fn(Ptr[Joystick, MutExternalOrigin], Int32, Int16) -> Bool
    var _set_joystick_virtual_ball: fn(Ptr[Joystick, MutExternalOrigin], Int32, Int16, Int16) -> Bool
    var _set_joystick_virtual_button: fn(Ptr[Joystick, MutExternalOrigin], Int32, Bool) -> Bool
    var _set_joystick_virtual_hat: fn(Ptr[Joystick, MutExternalOrigin], Int32, UInt8) -> Bool
    var _set_joystick_virtual_touchpad: fn(Ptr[Joystick, MutExternalOrigin], Int32, Int32, Bool, Float32, Float32, Float32) -> Bool
    var _send_joystick_virtual_sensor_data: fn(Ptr[Joystick, MutExternalOrigin], SensorType, UInt64, Ptr[Float32, ImmutExternalOrigin], Int32) -> Bool
    var _get_joystick_properties: fn(Ptr[Joystick, MutExternalOrigin]) -> PropertiesID
    var _get_joystick_name: fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_joystick_path: fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_joystick_player_index: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var _set_joystick_player_index: fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Bool
    var _get_joystick_guid: fn(Ptr[Joystick, MutExternalOrigin]) -> GUID
    var _get_joystick_vendor: fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16
    var _get_joystick_product: fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16
    var _get_joystick_product_version: fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16
    var _get_joystick_firmware_version: fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16
    var _get_joystick_serial: fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_joystick_type: fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickType
    var _get_joystick_guid_info: fn(GUID, Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> NoneType
    var _joystick_connected: fn(Ptr[Joystick, MutExternalOrigin]) -> Bool
    var _get_joystick_id: fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickID
    var _get_num_joystick_axes: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var _get_num_joystick_balls: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var _get_num_joystick_hats: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var _get_num_joystick_buttons: fn(Ptr[Joystick, MutExternalOrigin]) -> Int32
    var _set_joystick_events_enabled: fn(Bool) -> NoneType
    var _joystick_events_enabled: fn() -> Bool
    var _update_joysticks: fn() -> NoneType
    var _get_joystick_axis: fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Int16
    var _get_joystick_axis_initial_state: fn(Ptr[Joystick, MutExternalOrigin], Int32, Ptr[Int16, MutExternalOrigin]) -> Bool
    var _get_joystick_ball: fn(Ptr[Joystick, MutExternalOrigin], Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_joystick_hat: fn(Ptr[Joystick, MutExternalOrigin], Int32) -> UInt8
    var _get_joystick_button: fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Bool
    var _rumble_joystick: fn(Ptr[Joystick, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool
    var _rumble_joystick_triggers: fn(Ptr[Joystick, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool
    var _set_joystick_led: fn(Ptr[Joystick, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool
    var _send_joystick_effect: fn(Ptr[Joystick, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var _close_joystick: fn(Ptr[Joystick, MutExternalOrigin]) -> NoneType
    var _get_joystick_connection_state: fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickConnectionState
    var _get_joystick_power_info: fn(Ptr[Joystick, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState
    var _has_keyboard: fn() -> Bool
    var _get_keyboards: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[KeyboardID, MutExternalOrigin]
    var _get_keyboard_name_for_id: fn(KeyboardID) -> CStringSlice[ImmutExternalOrigin]
    var _get_keyboard_focus: fn() -> Ptr[Window, MutExternalOrigin]
    var _get_keyboard_state: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Bool, ImmutExternalOrigin]
    var _reset_keyboard: fn() -> NoneType
    var _get_mod_state: fn() -> Keymod
    var _set_mod_state: fn(Keymod) -> NoneType
    var _get_key_from_scancode: fn(Scancode, Keymod, Bool) -> Keycode
    var _get_scancode_from_key: fn(Keycode, Ptr[Keymod, MutExternalOrigin]) -> Scancode
    var _set_scancode_name: fn(Scancode, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _get_scancode_name: fn(Scancode) -> CStringSlice[ImmutExternalOrigin]
    var _get_scancode_from_name: fn(Ptr[c_char, ImmutExternalOrigin]) -> Scancode
    var _get_key_name: fn(Keycode) -> CStringSlice[ImmutExternalOrigin]
    var _get_key_from_name: fn(Ptr[c_char, ImmutExternalOrigin]) -> Keycode
    var _start_text_input: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _start_text_input_with_properties: fn(Ptr[Window, MutExternalOrigin], PropertiesID) -> Bool
    var _text_input_active: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _stop_text_input: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _clear_composition: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _set_text_input_area: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32) -> Bool
    var _get_text_input_area: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _has_screen_keyboard_support: fn() -> Bool
    var _screen_keyboard_shown: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _set_log_priorities: fn(LogPriority) -> NoneType
    var _set_log_priority: fn(Int32, LogPriority) -> NoneType
    var _get_log_priority: fn(Int32) -> LogPriority
    var _reset_log_priorities: fn() -> NoneType
    var _set_log_priority_prefix: fn(LogPriority, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _log: fn(Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _log_trace: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _log_verbose: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _log_debug: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _log_info: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _log_warn: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _log_error: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _log_critical: fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _log_message: fn(Int32, LogPriority, Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _log_message_v: fn(Int32, LogPriority, Ptr[c_char, ImmutExternalOrigin], Int32) -> NoneType
    var _get_default_log_output_function: fn() -> LogOutputFunction
    var _get_log_output_function: fn(Ptr[LogOutputFunction, MutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]) -> NoneType
    var _set_log_output_function: fn(LogOutputFunction, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var _has_mouse: fn() -> Bool
    var _get_mice: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[MouseID, MutExternalOrigin]
    var _get_mouse_name_for_id: fn(MouseID) -> CStringSlice[ImmutExternalOrigin]
    var _get_mouse_focus: fn() -> Ptr[Window, MutExternalOrigin]
    var _get_mouse_state: fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags
    var _get_global_mouse_state: fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags
    var _get_relative_mouse_state: fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags
    var _warp_mouse_in_window: fn(Ptr[Window, MutExternalOrigin], Float32, Float32) -> NoneType
    var _warp_mouse_global: fn(Float32, Float32) -> Bool
    var _set_relative_mouse_transform: fn(MouseMotionTransformCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _set_window_relative_mouse_mode: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _get_window_relative_mouse_mode: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _capture_mouse: fn(Bool) -> Bool
    var _create_cursor: fn(Ptr[UInt8, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Int32, Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]
    var _create_color_cursor: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]
    var _create_animated_cursor: fn(Ptr[CursorFrameInfo, MutExternalOrigin], Int32, Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]
    var _create_system_cursor: fn(SystemCursor) -> Ptr[Cursor, MutExternalOrigin]
    var _set_cursor: fn(Ptr[Cursor, MutExternalOrigin]) -> Bool
    var _get_cursor: fn() -> Ptr[Cursor, MutExternalOrigin]
    var _get_default_cursor: fn() -> Ptr[Cursor, MutExternalOrigin]
    var _destroy_cursor: fn(Ptr[Cursor, MutExternalOrigin]) -> NoneType
    var _show_cursor: fn() -> Bool
    var _hide_cursor: fn() -> Bool
    var _cursor_visible: fn() -> Bool
    var _get_pen_device_type: fn(PenID) -> PenDeviceType
    var _get_pixel_format_name: fn(PixelFormat) -> CStringSlice[ImmutExternalOrigin]
    var _get_masks_for_pixel_format: fn(PixelFormat, Ptr[Int32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var _get_pixel_format_for_masks: fn(Int32, UInt32, UInt32, UInt32, UInt32) -> PixelFormat
    var _get_pixel_format_details: fn(PixelFormat) -> Ptr[PixelFormatDetails, ImmutExternalOrigin]
    var _create_palette: fn(Int32) -> Ptr[Palette, MutExternalOrigin]
    var _set_palette_colors: fn(Ptr[Palette, MutExternalOrigin], Ptr[Color, ImmutExternalOrigin], Int32, Int32) -> Bool
    var _destroy_palette: fn(Ptr[Palette, MutExternalOrigin]) -> NoneType
    var _map_rgb: fn(Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], UInt8, UInt8, UInt8) -> UInt32
    var _map_rgba: fn(Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> UInt32
    var _get_rgb: fn(UInt32, Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> NoneType
    var _get_rgba: fn(UInt32, Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> NoneType
    var _get_power_info: fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState
    var _get_global_properties: fn() -> PropertiesID
    var _create_properties: fn() -> PropertiesID
    var _copy_properties: fn(PropertiesID, PropertiesID) -> Bool
    var _lock_properties: fn(PropertiesID) -> Bool
    var _unlock_properties: fn(PropertiesID) -> NoneType
    var _set_pointer_property_with_cleanup: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin], CleanupPropertyCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _set_pointer_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _set_string_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _set_number_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool
    var _set_float_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool
    var _set_boolean_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool
    var _has_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _get_property_type: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> PropertyType
    var _get_pointer_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var _get_string_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_number_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Int64) -> Int64
    var _get_float_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Float32) -> Float32
    var _get_boolean_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool
    var _clear_property: fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _enumerate_properties: fn(PropertiesID, EnumeratePropertiesCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _destroy_properties: fn(PropertiesID) -> NoneType
    var _has_rect_intersection: fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _get_rect_intersection: fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var _get_rect_union: fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var _get_rect_enclosing_points: fn(Ptr[Point, ImmutExternalOrigin], Int32, Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var _get_rect_and_line_intersection: fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _has_rect_intersection_float: fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var _get_rect_intersection_float: fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool
    var _get_rect_union_float: fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool
    var _get_rect_enclosing_points_float: fn(Ptr[FPoint, ImmutExternalOrigin], Int32, Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool
    var _get_rect_and_line_intersection_float: fn(Ptr[FRect, ImmutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _get_num_render_drivers: fn() -> Int32
    var _get_render_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var _create_window_and_renderer: fn(Ptr[c_char, ImmutExternalOrigin], Int32, Int32, WindowFlags, Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin], Ptr[Ptr[Renderer, MutExternalOrigin], MutExternalOrigin]) -> Bool
    var _create_renderer: fn(Ptr[Window, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var _create_renderer_with_properties: fn(PropertiesID) -> Ptr[Renderer, MutExternalOrigin]
    var _create_gpu_renderer: fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var _get_gpu_renderer_device: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[GPUDevice, MutExternalOrigin]
    var _create_software_renderer: fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var _get_renderer: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var _get_render_window: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]
    var _get_renderer_name: fn(Ptr[Renderer, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_renderer_properties: fn(Ptr[Renderer, MutExternalOrigin]) -> PropertiesID
    var _get_render_output_size: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_current_render_output_size: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _create_texture: fn(Ptr[Renderer, MutExternalOrigin], PixelFormat, TextureAccess, Int32, Int32) -> Ptr[Texture, MutExternalOrigin]
    var _create_texture_from_surface: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]
    var _create_texture_with_properties: fn(Ptr[Renderer, MutExternalOrigin], PropertiesID) -> Ptr[Texture, MutExternalOrigin]
    var _get_texture_properties: fn(Ptr[Texture, MutExternalOrigin]) -> PropertiesID
    var _get_renderer_from_texture: fn(Ptr[Texture, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]
    var _get_texture_size: fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _set_texture_palette: fn(Ptr[Texture, MutExternalOrigin], Ptr[Palette, MutExternalOrigin]) -> Bool
    var _get_texture_palette: fn(Ptr[Texture, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]
    var _set_texture_color_mod: fn(Ptr[Texture, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool
    var _set_texture_color_mod_float: fn(Ptr[Texture, MutExternalOrigin], Float32, Float32, Float32) -> Bool
    var _get_texture_color_mod: fn(Ptr[Texture, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var _get_texture_color_mod_float: fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _set_texture_alpha_mod: fn(Ptr[Texture, MutExternalOrigin], UInt8) -> Bool
    var _set_texture_alpha_mod_float: fn(Ptr[Texture, MutExternalOrigin], Float32) -> Bool
    var _get_texture_alpha_mod: fn(Ptr[Texture, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var _get_texture_alpha_mod_float: fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _set_texture_blend_mode: fn(Ptr[Texture, MutExternalOrigin], BlendMode) -> Bool
    var _get_texture_blend_mode: fn(Ptr[Texture, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool
    var _set_texture_scale_mode: fn(Ptr[Texture, MutExternalOrigin], ScaleMode) -> Bool
    var _get_texture_scale_mode: fn(Ptr[Texture, MutExternalOrigin], Ptr[ScaleMode, MutExternalOrigin]) -> Bool
    var _update_texture: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool
    var _update_yuv_texture: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32) -> Bool
    var _update_nv_texture: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32) -> Bool
    var _lock_texture: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _lock_texture_to_surface: fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]) -> Bool
    var _unlock_texture: fn(Ptr[Texture, MutExternalOrigin]) -> NoneType
    var _set_render_target: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin]) -> Bool
    var _get_render_target: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]
    var _set_render_logical_presentation: fn(Ptr[Renderer, MutExternalOrigin], Int32, Int32, RendererLogicalPresentation) -> Bool
    var _get_render_logical_presentation: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[RendererLogicalPresentation, MutExternalOrigin]) -> Bool
    var _get_render_logical_presentation_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool
    var _render_coordinates_from_window: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _render_coordinates_to_window: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _convert_event_to_render_coordinates: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Event, MutExternalOrigin]) -> Bool
    var _set_render_viewport: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _get_render_viewport: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var _render_viewport_set: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var _get_render_safe_area: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var _set_render_clip_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _get_render_clip_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var _render_clip_enabled: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var _set_render_scale: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32) -> Bool
    var _get_render_scale: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _set_render_draw_color: fn(Ptr[Renderer, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> Bool
    var _set_render_draw_color_float: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool
    var _get_render_draw_color: fn(Ptr[Renderer, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var _get_render_draw_color_float: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _set_render_color_scale: fn(Ptr[Renderer, MutExternalOrigin], Float32) -> Bool
    var _get_render_color_scale: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _set_render_draw_blend_mode: fn(Ptr[Renderer, MutExternalOrigin], BlendMode) -> Bool
    var _get_render_draw_blend_mode: fn(Ptr[Renderer, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool
    var _render_clear: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var _render_point: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32) -> Bool
    var _render_points: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Int32) -> Bool
    var _render_line: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool
    var _render_lines: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Int32) -> Bool
    var _render_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var _render_rects: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Int32) -> Bool
    var _render_fill_rect: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var _render_fill_rects: fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Int32) -> Bool
    var _render_texture: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var _render_texture_rotated: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float64, Ptr[FPoint, ImmutExternalOrigin], FlipMode) -> Bool
    var _render_texture_affine: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin]) -> Bool
    var _render_texture_tiled: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var _render_texture9_grid: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Float32, Float32, Float32, Float32, Ptr[FRect, ImmutExternalOrigin]) -> Bool
    var _render_texture9_grid_tiled: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Float32, Float32, Float32, Float32, Ptr[FRect, ImmutExternalOrigin], Float32) -> Bool
    var _render_geometry: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[Vertex, ImmutExternalOrigin], Int32, Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool
    var _render_geometry_raw: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[Float32, ImmutExternalOrigin], Int32, Ptr[FColor, ImmutExternalOrigin], Int32, Ptr[Float32, ImmutExternalOrigin], Int32, Int32, Ptr[NoneType, ImmutExternalOrigin], Int32, Int32) -> Bool
    var _set_render_texture_address_mode: fn(Ptr[Renderer, MutExternalOrigin], TextureAddressMode, TextureAddressMode) -> Bool
    var _get_render_texture_address_mode: fn(Ptr[Renderer, MutExternalOrigin], Ptr[TextureAddressMode, MutExternalOrigin], Ptr[TextureAddressMode, MutExternalOrigin]) -> Bool
    var _render_read_pixels: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _render_present: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var _destroy_texture: fn(Ptr[Texture, MutExternalOrigin]) -> NoneType
    var _destroy_renderer: fn(Ptr[Renderer, MutExternalOrigin]) -> NoneType
    var _flush_renderer: fn(Ptr[Renderer, MutExternalOrigin]) -> Bool
    var _get_render_metal_layer: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var _get_render_metal_command_encoder: fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var _add_vulkan_render_semaphores: fn(Ptr[Renderer, MutExternalOrigin], UInt32, Int64, Int64) -> Bool
    var _set_render_v_sync: fn(Ptr[Renderer, MutExternalOrigin], Int32) -> Bool
    var _get_render_v_sync: fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _render_debug_text: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _render_debug_text_format: fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _set_default_texture_scale_mode: fn(Ptr[Renderer, MutExternalOrigin], ScaleMode) -> Bool
    var _get_default_texture_scale_mode: fn(Ptr[Renderer, MutExternalOrigin], Ptr[ScaleMode, MutExternalOrigin]) -> Bool
    var _create_gpu_render_state: fn(Ptr[Renderer, MutExternalOrigin], Ptr[GPURenderStateCreateInfo, ImmutExternalOrigin]) -> Ptr[GPURenderState, MutExternalOrigin]
    var _set_gpu_render_state_fragment_uniforms: fn(Ptr[GPURenderState, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> Bool
    var _set_gpu_render_state: fn(Ptr[Renderer, MutExternalOrigin], Ptr[GPURenderState, MutExternalOrigin]) -> Bool
    var _destroy_gpu_render_state: fn(Ptr[GPURenderState, MutExternalOrigin]) -> NoneType
    var _get_sensors: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[SensorID, MutExternalOrigin]
    var _get_sensor_name_for_id: fn(SensorID) -> CStringSlice[ImmutExternalOrigin]
    var _get_sensor_type_for_id: fn(SensorID) -> SensorType
    var _get_sensor_non_portable_type_for_id: fn(SensorID) -> Int32
    var _open_sensor: fn(SensorID) -> Ptr[Sensor, MutExternalOrigin]
    var _get_sensor_from_id: fn(SensorID) -> Ptr[Sensor, MutExternalOrigin]
    var _get_sensor_properties: fn(Ptr[Sensor, MutExternalOrigin]) -> PropertiesID
    var _get_sensor_name: fn(Ptr[Sensor, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _get_sensor_type: fn(Ptr[Sensor, MutExternalOrigin]) -> SensorType
    var _get_sensor_non_portable_type: fn(Ptr[Sensor, MutExternalOrigin]) -> Int32
    var _get_sensor_id: fn(Ptr[Sensor, MutExternalOrigin]) -> SensorID
    var _get_sensor_data: fn(Ptr[Sensor, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Int32) -> Bool
    var _close_sensor: fn(Ptr[Sensor, MutExternalOrigin]) -> NoneType
    var _update_sensors: fn() -> NoneType
    var _open_title_storage: fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[Storage, MutExternalOrigin]
    var _open_user_storage: fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[Storage, MutExternalOrigin]
    var _open_file_storage: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Storage, MutExternalOrigin]
    var _open_storage: fn(Ptr[StorageInterface, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[Storage, MutExternalOrigin]
    var _close_storage: fn(Ptr[Storage, MutExternalOrigin]) -> Bool
    var _storage_ready: fn(Ptr[Storage, MutExternalOrigin]) -> Bool
    var _get_storage_file_size: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool
    var _read_storage_file: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin], UInt64) -> Bool
    var _write_storage_file: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], UInt64) -> Bool
    var _create_storage_directory: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _enumerate_storage_directory: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], EnumerateDirectoryCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _remove_storage_path: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _rename_storage_path: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _copy_storage_file: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _get_storage_path_info: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[PathInfo, MutExternalOrigin]) -> Bool
    var _get_storage_space_remaining: fn(Ptr[Storage, MutExternalOrigin]) -> UInt64
    var _glob_storage_directory: fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], GlobFlags, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var _create_surface: fn(Int32, Int32, PixelFormat) -> Ptr[Surface, MutExternalOrigin]
    var _create_surface_from: fn(Int32, Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32) -> Ptr[Surface, MutExternalOrigin]
    var _destroy_surface: fn(Ptr[Surface, MutExternalOrigin]) -> NoneType
    var _get_surface_properties: fn(Ptr[Surface, MutExternalOrigin]) -> PropertiesID
    var _set_surface_colorspace: fn(Ptr[Surface, MutExternalOrigin], Colorspace) -> Bool
    var _get_surface_colorspace: fn(Ptr[Surface, MutExternalOrigin]) -> Colorspace
    var _create_surface_palette: fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]
    var _set_surface_palette: fn(Ptr[Surface, MutExternalOrigin], Ptr[Palette, MutExternalOrigin]) -> Bool
    var _get_surface_palette: fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]
    var _add_surface_alternate_image: fn(Ptr[Surface, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool
    var _surface_has_alternate_images: fn(Ptr[Surface, MutExternalOrigin]) -> Bool
    var _get_surface_images: fn(Ptr[Surface, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]
    var _remove_surface_alternate_images: fn(Ptr[Surface, MutExternalOrigin]) -> NoneType
    var _lock_surface: fn(Ptr[Surface, MutExternalOrigin]) -> Bool
    var _unlock_surface: fn(Ptr[Surface, MutExternalOrigin]) -> NoneType
    var _load_surface_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]
    var _load_surface: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _load_bmp_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]
    var _load_bmp: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _save_bmp_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_bmp: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _load_png_io: fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]
    var _load_png: fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _save_png_io: fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _save_png: fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _set_surface_rle: fn(Ptr[Surface, MutExternalOrigin], Bool) -> Bool
    var _surface_has_rle: fn(Ptr[Surface, MutExternalOrigin]) -> Bool
    var _set_surface_color_key: fn(Ptr[Surface, MutExternalOrigin], Bool, UInt32) -> Bool
    var _surface_has_color_key: fn(Ptr[Surface, MutExternalOrigin]) -> Bool
    var _get_surface_color_key: fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool
    var _set_surface_color_mod: fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool
    var _get_surface_color_mod: fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var _set_surface_alpha_mod: fn(Ptr[Surface, MutExternalOrigin], UInt8) -> Bool
    var _get_surface_alpha_mod: fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var _set_surface_blend_mode: fn(Ptr[Surface, MutExternalOrigin], BlendMode) -> Bool
    var _get_surface_blend_mode: fn(Ptr[Surface, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool
    var _set_surface_clip_rect: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _get_surface_clip_rect: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var _flip_surface: fn(Ptr[Surface, MutExternalOrigin], FlipMode) -> Bool
    var _rotate_surface: fn(Ptr[Surface, MutExternalOrigin], Float32) -> Ptr[Surface, MutExternalOrigin]
    var _duplicate_surface: fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _scale_surface: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, ScaleMode) -> Ptr[Surface, MutExternalOrigin]
    var _convert_surface: fn(Ptr[Surface, MutExternalOrigin], PixelFormat) -> Ptr[Surface, MutExternalOrigin]
    var _convert_surface_and_colorspace: fn(Ptr[Surface, MutExternalOrigin], PixelFormat, Ptr[Palette, MutExternalOrigin], Colorspace, PropertiesID) -> Ptr[Surface, MutExternalOrigin]
    var _convert_pixels: fn(Int32, Int32, PixelFormat, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32) -> Bool
    var _convert_pixels_and_colorspace: fn(Int32, Int32, PixelFormat, Colorspace, PropertiesID, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Colorspace, PropertiesID, Ptr[NoneType, MutExternalOrigin], Int32) -> Bool
    var _premultiply_alpha: fn(Int32, Int32, PixelFormat, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32, Bool) -> Bool
    var _premultiply_surface_alpha: fn(Ptr[Surface, MutExternalOrigin], Bool) -> Bool
    var _clear_surface: fn(Ptr[Surface, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool
    var _fill_surface_rect: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], UInt32) -> Bool
    var _fill_surface_rects: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32, UInt32) -> Bool
    var _blit_surface: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _blit_surface_unchecked: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _blit_surface_scaled: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool
    var _blit_surface_unchecked_scaled: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool
    var _stretch_surface: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool
    var _blit_surface_tiled: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _blit_surface_tiled_with_scale: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Float32, ScaleMode, Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _blit_surface9_grid: fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32, Int32, Int32, Int32, Float32, ScaleMode, Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _map_surface_rgb: fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8) -> UInt32
    var _map_surface_rgba: fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> UInt32
    var _read_surface_pixel: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool
    var _read_surface_pixel_float: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _write_surface_pixel: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, UInt8, UInt8, UInt8, UInt8) -> Bool
    var _write_surface_pixel_float: fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Float32, Float32, Float32, Float32) -> Bool
    var _get_date_time_locale_preferences: fn(Ptr[DateFormat, MutExternalOrigin], Ptr[TimeFormat, MutExternalOrigin]) -> Bool
    var _get_current_time: fn(Ptr[Time, MutExternalOrigin]) -> Bool
    var _time_to_date_time: fn(Time, Ptr[DateTime, MutExternalOrigin], Bool) -> Bool
    var _date_time_to_time: fn(Ptr[DateTime, ImmutExternalOrigin], Ptr[Time, MutExternalOrigin]) -> Bool
    var _time_to_windows: fn(Time, Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> NoneType
    var _time_from_windows: fn(UInt32, UInt32) -> Time
    var _get_days_in_month: fn(Int32, Int32) -> Int32
    var _get_day_of_year: fn(Int32, Int32, Int32) -> Int32
    var _get_day_of_week: fn(Int32, Int32, Int32) -> Int32
    var _get_ticks: fn() -> UInt64
    var _get_ticks_ns: fn() -> UInt64
    var _get_performance_counter: fn() -> UInt64
    var _get_performance_frequency: fn() -> UInt64
    var _delay: fn(UInt32) -> NoneType
    var _delay_ns: fn(UInt64) -> NoneType
    var _delay_precise: fn(UInt64) -> NoneType
    var _add_timer: fn(UInt32, TimerCallback, Ptr[NoneType, MutExternalOrigin]) -> TimerID
    var _add_timer_ns: fn(UInt64, NSTimerCallback, Ptr[NoneType, MutExternalOrigin]) -> TimerID
    var _remove_timer: fn(TimerID) -> Bool
    var _get_touch_devices: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[TouchID, MutExternalOrigin]
    var _get_touch_device_name: fn(TouchID) -> CStringSlice[ImmutExternalOrigin]
    var _get_touch_device_type: fn(TouchID) -> TouchDeviceType
    var _get_touch_fingers: fn(TouchID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Finger, MutExternalOrigin], MutExternalOrigin]
    var _get_version: fn() -> Int32
    var _get_revision: fn() -> CStringSlice[ImmutExternalOrigin]
    var _get_num_video_drivers: fn() -> Int32
    var _get_video_driver: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var _get_current_video_driver: fn() -> CStringSlice[ImmutExternalOrigin]
    var _get_system_theme: fn() -> SystemTheme
    var _get_displays: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[DisplayID, MutExternalOrigin]
    var _get_primary_display: fn() -> DisplayID
    var _get_display_properties: fn(DisplayID) -> PropertiesID
    var _get_display_name: fn(DisplayID) -> CStringSlice[ImmutExternalOrigin]
    var _get_display_bounds: fn(DisplayID, Ptr[Rect, MutExternalOrigin]) -> Bool
    var _get_display_usable_bounds: fn(DisplayID, Ptr[Rect, MutExternalOrigin]) -> Bool
    var _get_natural_display_orientation: fn(DisplayID) -> DisplayOrientation
    var _get_current_display_orientation: fn(DisplayID) -> DisplayOrientation
    var _get_display_content_scale: fn(DisplayID) -> Float32
    var _get_fullscreen_display_modes: fn(DisplayID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[DisplayMode, MutExternalOrigin], MutExternalOrigin]
    var _get_closest_fullscreen_display_mode: fn(DisplayID, Int32, Int32, Float32, Bool, Ptr[DisplayMode, MutExternalOrigin]) -> Bool
    var _get_desktop_display_mode: fn(DisplayID) -> Ptr[DisplayMode, ImmutExternalOrigin]
    var _get_current_display_mode: fn(DisplayID) -> Ptr[DisplayMode, ImmutExternalOrigin]
    var _get_display_for_point: fn(Ptr[Point, ImmutExternalOrigin]) -> DisplayID
    var _get_display_for_rect: fn(Ptr[Rect, ImmutExternalOrigin]) -> DisplayID
    var _get_display_for_window: fn(Ptr[Window, MutExternalOrigin]) -> DisplayID
    var _get_window_pixel_density: fn(Ptr[Window, MutExternalOrigin]) -> Float32
    var _get_window_display_scale: fn(Ptr[Window, MutExternalOrigin]) -> Float32
    var _set_window_fullscreen_mode: fn(Ptr[Window, MutExternalOrigin], Ptr[DisplayMode, ImmutExternalOrigin]) -> Bool
    var _get_window_fullscreen_mode: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[DisplayMode, ImmutExternalOrigin]
    var _get_window_icc_profile: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]
    var _get_window_pixel_format: fn(Ptr[Window, MutExternalOrigin]) -> PixelFormat
    var _get_windows: fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin]
    var _create_window: fn(Ptr[c_char, ImmutExternalOrigin], Int32, Int32, WindowFlags) -> Ptr[Window, MutExternalOrigin]
    var _create_popup_window: fn(Ptr[Window, MutExternalOrigin], Int32, Int32, Int32, Int32, WindowFlags) -> Ptr[Window, MutExternalOrigin]
    var _create_window_with_properties: fn(PropertiesID) -> Ptr[Window, MutExternalOrigin]
    var _get_window_id: fn(Ptr[Window, MutExternalOrigin]) -> WindowID
    var _get_window_from_id: fn(WindowID) -> Ptr[Window, MutExternalOrigin]
    var _get_window_parent: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]
    var _get_window_properties: fn(Ptr[Window, MutExternalOrigin]) -> PropertiesID
    var _get_window_flags: fn(Ptr[Window, MutExternalOrigin]) -> WindowFlags
    var _set_window_title: fn(Ptr[Window, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _get_window_title: fn(Ptr[Window, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]
    var _set_window_icon: fn(Ptr[Window, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool
    var _set_window_position: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var _get_window_position: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _set_window_size: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var _get_window_size: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_window_safe_area: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool
    var _set_window_aspect_ratio: fn(Ptr[Window, MutExternalOrigin], Float32, Float32) -> Bool
    var _get_window_aspect_ratio: fn(Ptr[Window, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool
    var _get_window_borders_size: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _get_window_size_in_pixels: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _set_window_minimum_size: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var _get_window_minimum_size: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _set_window_maximum_size: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var _get_window_maximum_size: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _set_window_bordered: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _set_window_resizable: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _set_window_always_on_top: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _set_window_fill_document: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _show_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _hide_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _raise_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _maximize_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _minimize_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _restore_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _set_window_fullscreen: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _sync_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _window_has_surface: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _get_window_surface: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]
    var _set_window_surface_v_sync: fn(Ptr[Window, MutExternalOrigin], Int32) -> Bool
    var _get_window_surface_v_sync: fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool
    var _update_window_surface: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _update_window_surface_rects: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32) -> Bool
    var _destroy_window_surface: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _set_window_keyboard_grab: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _set_window_mouse_grab: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _get_window_keyboard_grab: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _get_window_mouse_grab: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _get_grabbed_window: fn() -> Ptr[Window, MutExternalOrigin]
    var _set_window_mouse_rect: fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool
    var _get_window_mouse_rect: fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Rect, ImmutExternalOrigin]
    var _set_window_opacity: fn(Ptr[Window, MutExternalOrigin], Float32) -> Bool
    var _get_window_opacity: fn(Ptr[Window, MutExternalOrigin]) -> Float32
    var _set_window_parent: fn(Ptr[Window, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool
    var _set_window_modal: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _set_window_focusable: fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool
    var _show_window_system_menu: fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool
    var _set_window_hit_test: fn(Ptr[Window, MutExternalOrigin], HitTest, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _set_window_shape: fn(Ptr[Window, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool
    var _flash_window: fn(Ptr[Window, MutExternalOrigin], FlashOperation) -> Bool
    var _set_window_progress_state: fn(Ptr[Window, MutExternalOrigin], ProgressState) -> Bool
    var _get_window_progress_state: fn(Ptr[Window, MutExternalOrigin]) -> ProgressState
    var _set_window_progress_value: fn(Ptr[Window, MutExternalOrigin], Float32) -> Bool
    var _get_window_progress_value: fn(Ptr[Window, MutExternalOrigin]) -> Float32
    var _destroy_window: fn(Ptr[Window, MutExternalOrigin]) -> NoneType
    var _screen_saver_enabled: fn() -> Bool
    var _enable_screen_saver: fn() -> Bool
    var _disable_screen_saver: fn() -> Bool
    var _gl_load_library: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _gl_get_proc_address: fn(Ptr[c_char, ImmutExternalOrigin]) -> FunctionPointer
    var _egl_get_proc_address: fn(Ptr[c_char, ImmutExternalOrigin]) -> FunctionPointer
    var _gl_unload_library: fn() -> NoneType
    var _gl_extension_supported: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _gl_reset_attributes: fn() -> NoneType
    var _gl_set_attribute: fn(GLAttr, Int32) -> Bool
    var _gl_get_attribute: fn(GLAttr, Ptr[Int32, MutExternalOrigin]) -> Bool
    var _gl_create_context: fn(Ptr[Window, MutExternalOrigin]) -> GLContext
    var _gl_make_current: fn(Ptr[Window, MutExternalOrigin], GLContext) -> Bool
    var _gl_get_current_window: fn() -> Ptr[Window, MutExternalOrigin]
    var _gl_get_current_context: fn() -> GLContext
    var _egl_get_current_display: fn() -> EGLDisplay
    var _egl_get_current_config: fn() -> EGLConfig
    var _egl_get_window_surface: fn(Ptr[Window, MutExternalOrigin]) -> EGLSurface
    var _egl_set_attribute_callbacks: fn(EGLAttribArrayCallback, EGLIntArrayCallback, EGLIntArrayCallback, Ptr[NoneType, MutExternalOrigin]) -> NoneType
    var _gl_set_swap_interval: fn(Int32) -> Bool
    var _gl_get_swap_interval: fn(Ptr[Int32, MutExternalOrigin]) -> Bool
    var _gl_swap_window: fn(Ptr[Window, MutExternalOrigin]) -> Bool
    var _gl_destroy_context: fn(GLContext) -> Bool
    var _vulkan_load_library: fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _vulkan_get_vk_get_instance_proc_addr: fn() -> FunctionPointer
    var _vulkan_unload_library: fn() -> NoneType
    var _vulkan_get_instance_extensions: fn(Ptr[UInt32, MutExternalOrigin]) -> Ptr[CStringSlice[ImmutExternalOrigin], ImmutExternalOrigin]
    var _vulkan_create_surface: fn(Ptr[Window, MutExternalOrigin], VkInstance, Ptr[VkAllocationCallbacks, ImmutExternalOrigin], Ptr[VkSurfaceKHR, MutExternalOrigin]) -> Bool
    var _vulkan_destroy_surface: fn(VkInstance, VkSurfaceKHR, Ptr[VkAllocationCallbacks, ImmutExternalOrigin]) -> NoneType
    var _vulkan_get_presentation_support: fn(VkInstance, VkPhysicalDevice, UInt32) -> Bool

    fn __init__(out self) raises:
        var library_path: Path
        @parameter
        if CompilationTarget.is_linux():
            library_path = Path("libSDL3.so")
        elif CompilationTarget.is_macos():
            library_path = Path("libSDL3.dylib")
        else:
            constrained[False, "Target operating system is not supported."]()
            library_path = Path()
        self = Self(library_path)

    fn __init__(out self, library_path: Path) raises:
        self._dynamic_library_handle = OwnedDLHandle(library_path)
        self._get_num_audio_drivers = self._dynamic_library_handle.get_function[fn() -> Int32]("SDL_GetNumAudioDrivers")
        self._get_audio_driver = self._dynamic_library_handle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetAudioDriver")
        self._get_current_audio_driver = self._dynamic_library_handle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCurrentAudioDriver")
        self._get_audio_playback_devices = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[AudioDeviceID, MutExternalOrigin]]("SDL_GetAudioPlaybackDevices")
        self._get_audio_recording_devices = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[AudioDeviceID, MutExternalOrigin]]("SDL_GetAudioRecordingDevices")
        self._get_audio_device_name = self._dynamic_library_handle.get_function[fn(AudioDeviceID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetAudioDeviceName")
        self._get_audio_device_format = self._dynamic_library_handle.get_function[fn(AudioDeviceID, Ptr[AudioSpec, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetAudioDeviceFormat")
        self._get_audio_device_channel_map = self._dynamic_library_handle.get_function[fn(AudioDeviceID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]]("SDL_GetAudioDeviceChannelMap")
        self._open_audio_device = self._dynamic_library_handle.get_function[fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> AudioDeviceID]("SDL_OpenAudioDevice")
        self._is_audio_device_physical = self._dynamic_library_handle.get_function[fn(AudioDeviceID) -> Bool]("SDL_IsAudioDevicePhysical")
        self._is_audio_device_playback = self._dynamic_library_handle.get_function[fn(AudioDeviceID) -> Bool]("SDL_IsAudioDevicePlayback")
        self._pause_audio_device = self._dynamic_library_handle.get_function[fn(AudioDeviceID) -> Bool]("SDL_PauseAudioDevice")
        self._resume_audio_device = self._dynamic_library_handle.get_function[fn(AudioDeviceID) -> Bool]("SDL_ResumeAudioDevice")
        self._audio_device_paused = self._dynamic_library_handle.get_function[fn(AudioDeviceID) -> Bool]("SDL_AudioDevicePaused")
        self._get_audio_device_gain = self._dynamic_library_handle.get_function[fn(AudioDeviceID) -> Float32]("SDL_GetAudioDeviceGain")
        self._set_audio_device_gain = self._dynamic_library_handle.get_function[fn(AudioDeviceID, Float32) -> Bool]("SDL_SetAudioDeviceGain")
        self._close_audio_device = self._dynamic_library_handle.get_function[fn(AudioDeviceID) -> NoneType]("SDL_CloseAudioDevice")
        self._bind_audio_streams = self._dynamic_library_handle.get_function[fn(AudioDeviceID, Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin], Int32) -> Bool]("SDL_BindAudioStreams")
        self._bind_audio_stream = self._dynamic_library_handle.get_function[fn(AudioDeviceID, Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_BindAudioStream")
        self._unbind_audio_streams = self._dynamic_library_handle.get_function[fn(Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin], Int32) -> NoneType]("SDL_UnbindAudioStreams")
        self._unbind_audio_stream = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> NoneType]("SDL_UnbindAudioStream")
        self._get_audio_stream_device = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> AudioDeviceID]("SDL_GetAudioStreamDevice")
        self._create_audio_stream = self._dynamic_library_handle.get_function[fn(Ptr[AudioSpec, ImmutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]]("SDL_CreateAudioStream")
        self._get_audio_stream_properties = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> PropertiesID]("SDL_GetAudioStreamProperties")
        self._get_audio_stream_format = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("SDL_GetAudioStreamFormat")
        self._set_audio_stream_format = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin]) -> Bool]("SDL_SetAudioStreamFormat")
        self._get_audio_stream_frequency_ratio = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Float32]("SDL_GetAudioStreamFrequencyRatio")
        self._set_audio_stream_frequency_ratio = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Float32) -> Bool]("SDL_SetAudioStreamFrequencyRatio")
        self._get_audio_stream_gain = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Float32]("SDL_GetAudioStreamGain")
        self._set_audio_stream_gain = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Float32) -> Bool]("SDL_SetAudioStreamGain")
        self._get_audio_stream_input_channel_map = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]]("SDL_GetAudioStreamInputChannelMap")
        self._get_audio_stream_output_channel_map = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Int32, MutExternalOrigin]]("SDL_GetAudioStreamOutputChannelMap")
        self._set_audio_stream_input_channel_map = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool]("SDL_SetAudioStreamInputChannelMap")
        self._set_audio_stream_output_channel_map = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool]("SDL_SetAudioStreamOutputChannelMap")
        self._put_audio_stream_data = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_PutAudioStreamData")
        self._put_audio_stream_data_no_copy = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, AudioStreamDataCompleteCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_PutAudioStreamDataNoCopy")
        self._put_audio_stream_planar_data = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[Ptr[NoneType, ImmutExternalOrigin], ImmutExternalOrigin], Int32, Int32) -> Bool]("SDL_PutAudioStreamPlanarData")
        self._get_audio_stream_data = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Int32]("SDL_GetAudioStreamData")
        self._get_audio_stream_available = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Int32]("SDL_GetAudioStreamAvailable")
        self._get_audio_stream_queued = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Int32]("SDL_GetAudioStreamQueued")
        self._flush_audio_stream = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_FlushAudioStream")
        self._clear_audio_stream = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_ClearAudioStream")
        self._pause_audio_stream_device = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_PauseAudioStreamDevice")
        self._resume_audio_stream_device = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_ResumeAudioStreamDevice")
        self._audio_stream_device_paused = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_AudioStreamDevicePaused")
        self._lock_audio_stream = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_LockAudioStream")
        self._unlock_audio_stream = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> Bool]("SDL_UnlockAudioStream")
        self._set_audio_stream_get_callback = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetAudioStreamGetCallback")
        self._set_audio_stream_put_callback = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetAudioStreamPutCallback")
        self._destroy_audio_stream = self._dynamic_library_handle.get_function[fn(Ptr[AudioStream, MutExternalOrigin]) -> NoneType]("SDL_DestroyAudioStream")
        self._open_audio_device_stream = self._dynamic_library_handle.get_function[fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin], AudioStreamCallback, Ptr[NoneType, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]]("SDL_OpenAudioDeviceStream")
        self._set_audio_postmix_callback = self._dynamic_library_handle.get_function[fn(AudioDeviceID, AudioPostmixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetAudioPostmixCallback")
        self._load_wav_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, Ptr[AudioSpec, MutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_LoadWAV_IO")
        self._load_wav = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_LoadWAV")
        self._mix_audio = self._dynamic_library_handle.get_function[fn(Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], AudioFormat, UInt32, Float32) -> Bool]("SDL_MixAudio")
        self._convert_audio_samples = self._dynamic_library_handle.get_function[fn(Ptr[AudioSpec, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_ConvertAudioSamples")
        self._get_audio_format_name = self._dynamic_library_handle.get_function[fn(AudioFormat) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetAudioFormatName")
        self._get_silence_value_for_format = self._dynamic_library_handle.get_function[fn(AudioFormat) -> Int32]("SDL_GetSilenceValueForFormat")
        self._compose_custom_blend_mode = self._dynamic_library_handle.get_function[fn(BlendFactor, BlendFactor, BlendOperation, BlendFactor, BlendFactor, BlendOperation) -> BlendMode]("SDL_ComposeCustomBlendMode")
        self._get_num_camera_drivers = self._dynamic_library_handle.get_function[fn() -> Int32]("SDL_GetNumCameraDrivers")
        self._get_camera_driver = self._dynamic_library_handle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCameraDriver")
        self._get_current_camera_driver = self._dynamic_library_handle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCurrentCameraDriver")
        self._get_cameras = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[CameraID, MutExternalOrigin]]("SDL_GetCameras")
        self._get_camera_supported_formats = self._dynamic_library_handle.get_function[fn(CameraID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[CameraSpec, MutExternalOrigin], MutExternalOrigin]]("SDL_GetCameraSupportedFormats")
        self._get_camera_name = self._dynamic_library_handle.get_function[fn(CameraID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCameraName")
        self._get_camera_position = self._dynamic_library_handle.get_function[fn(CameraID) -> CameraPosition]("SDL_GetCameraPosition")
        self._open_camera = self._dynamic_library_handle.get_function[fn(CameraID, Ptr[CameraSpec, ImmutExternalOrigin]) -> Ptr[Camera, MutExternalOrigin]]("SDL_OpenCamera")
        self._get_camera_permission_state = self._dynamic_library_handle.get_function[fn(Ptr[Camera, MutExternalOrigin]) -> CameraPermissionState]("SDL_GetCameraPermissionState")
        self._get_camera_id = self._dynamic_library_handle.get_function[fn(Ptr[Camera, MutExternalOrigin]) -> CameraID]("SDL_GetCameraID")
        self._get_camera_properties = self._dynamic_library_handle.get_function[fn(Ptr[Camera, MutExternalOrigin]) -> PropertiesID]("SDL_GetCameraProperties")
        self._get_camera_format = self._dynamic_library_handle.get_function[fn(Ptr[Camera, MutExternalOrigin], Ptr[CameraSpec, MutExternalOrigin]) -> Bool]("SDL_GetCameraFormat")
        self._acquire_camera_frame = self._dynamic_library_handle.get_function[fn(Ptr[Camera, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_AcquireCameraFrame")
        self._release_camera_frame = self._dynamic_library_handle.get_function[fn(Ptr[Camera, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> NoneType]("SDL_ReleaseCameraFrame")
        self._close_camera = self._dynamic_library_handle.get_function[fn(Ptr[Camera, MutExternalOrigin]) -> NoneType]("SDL_CloseCamera")
        self._set_clipboard_text = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetClipboardText")
        self._get_clipboard_text = self._dynamic_library_handle.get_function[fn() -> Ptr[c_char, MutExternalOrigin]]("SDL_GetClipboardText")
        self._has_clipboard_text = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_HasClipboardText")
        self._set_primary_selection_text = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetPrimarySelectionText")
        self._get_primary_selection_text = self._dynamic_library_handle.get_function[fn() -> Ptr[c_char, MutExternalOrigin]]("SDL_GetPrimarySelectionText")
        self._has_primary_selection_text = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_HasPrimarySelectionText")
        self._set_clipboard_data = self._dynamic_library_handle.get_function[fn(ClipboardDataCallback, ClipboardCleanupCallback, Ptr[NoneType, MutExternalOrigin], Ptr[CStringSlice[ImmutExternalOrigin], MutExternalOrigin], Int32) -> Bool]("SDL_SetClipboardData")
        self._clear_clipboard_data = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_ClearClipboardData")
        self._get_clipboard_data = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetClipboardData")
        self._has_clipboard_data = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_HasClipboardData")
        self._get_clipboard_mime_types = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("SDL_GetClipboardMimeTypes")
        self._set_error = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetError")
        self._set_error_v = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Int32) -> Bool]("SDL_SetErrorV")
        self._out_of_memory = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_OutOfMemory")
        self._get_error = self._dynamic_library_handle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetError")
        self._clear_error = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_ClearError")
        self._pump_events = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_PumpEvents")
        self._peep_events = self._dynamic_library_handle.get_function[fn(Ptr[Event, MutExternalOrigin], Int32, EventAction, UInt32, UInt32) -> Int32]("SDL_PeepEvents")
        self._has_event = self._dynamic_library_handle.get_function[fn(UInt32) -> Bool]("SDL_HasEvent")
        self._has_events = self._dynamic_library_handle.get_function[fn(UInt32, UInt32) -> Bool]("SDL_HasEvents")
        self._flush_event = self._dynamic_library_handle.get_function[fn(UInt32) -> NoneType]("SDL_FlushEvent")
        self._flush_events = self._dynamic_library_handle.get_function[fn(UInt32, UInt32) -> NoneType]("SDL_FlushEvents")
        self._poll_event = self._dynamic_library_handle.get_function[fn(Ptr[Event, MutExternalOrigin]) -> Bool]("SDL_PollEvent")
        self._wait_event = self._dynamic_library_handle.get_function[fn(Ptr[Event, MutExternalOrigin]) -> Bool]("SDL_WaitEvent")
        self._wait_event_timeout = self._dynamic_library_handle.get_function[fn(Ptr[Event, MutExternalOrigin], Int32) -> Bool]("SDL_WaitEventTimeout")
        self._push_event = self._dynamic_library_handle.get_function[fn(Ptr[Event, MutExternalOrigin]) -> Bool]("SDL_PushEvent")
        self._set_event_filter = self._dynamic_library_handle.get_function[fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_SetEventFilter")
        self._get_event_filter = self._dynamic_library_handle.get_function[fn(Ptr[EventFilter, MutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]) -> Bool]("SDL_GetEventFilter")
        self._add_event_watch = self._dynamic_library_handle.get_function[fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_AddEventWatch")
        self._remove_event_watch = self._dynamic_library_handle.get_function[fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_RemoveEventWatch")
        self._filter_events = self._dynamic_library_handle.get_function[fn(EventFilter, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_FilterEvents")
        self._set_event_enabled = self._dynamic_library_handle.get_function[fn(UInt32, Bool) -> NoneType]("SDL_SetEventEnabled")
        self._event_enabled = self._dynamic_library_handle.get_function[fn(UInt32) -> Bool]("SDL_EventEnabled")
        self._register_events = self._dynamic_library_handle.get_function[fn(Int32) -> UInt32]("SDL_RegisterEvents")
        self._get_window_from_event = self._dynamic_library_handle.get_function[fn(Ptr[Event, ImmutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]]("SDL_GetWindowFromEvent")
        self._get_event_description = self._dynamic_library_handle.get_function[fn(Ptr[Event, ImmutExternalOrigin], Ptr[c_char, MutExternalOrigin], Int32) -> Int32]("SDL_GetEventDescription")
        self._get_base_path = self._dynamic_library_handle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetBasePath")
        self._get_pref_path = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[c_char, MutExternalOrigin]]("SDL_GetPrefPath")
        self._get_user_folder = self._dynamic_library_handle.get_function[fn(Folder) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetUserFolder")
        self._create_directory = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_CreateDirectory")
        self._enumerate_directory = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], EnumerateDirectoryCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_EnumerateDirectory")
        self._remove_path = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RemovePath")
        self._rename_path = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RenamePath")
        self._copy_file = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_CopyFile")
        self._get_path_info = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[PathInfo, MutExternalOrigin]) -> Bool]("SDL_GetPathInfo")
        self._glob_directory = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], GlobFlags, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("SDL_GlobDirectory")
        self._get_current_directory = self._dynamic_library_handle.get_function[fn() -> Ptr[c_char, MutExternalOrigin]]("SDL_GetCurrentDirectory")
        self._add_gamepad_mapping = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Int32]("SDL_AddGamepadMapping")
        self._add_gamepad_mappings_from_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Int32]("SDL_AddGamepadMappingsFromIO")
        self._add_gamepad_mappings_from_file = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Int32]("SDL_AddGamepadMappingsFromFile")
        self._reload_gamepad_mappings = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_ReloadGamepadMappings")
        self._get_gamepad_mappings = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("SDL_GetGamepadMappings")
        self._get_gamepad_mapping_for_guid = self._dynamic_library_handle.get_function[fn(GUID) -> Ptr[c_char, MutExternalOrigin]]("SDL_GetGamepadMappingForGUID")
        self._get_gamepad_mapping = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Ptr[c_char, MutExternalOrigin]]("SDL_GetGamepadMapping")
        self._set_gamepad_mapping = self._dynamic_library_handle.get_function[fn(JoystickID, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetGamepadMapping")
        self._has_gamepad = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_HasGamepad")
        self._get_gamepads = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[JoystickID, MutExternalOrigin]]("SDL_GetGamepads")
        self._is_gamepad = self._dynamic_library_handle.get_function[fn(JoystickID) -> Bool]("SDL_IsGamepad")
        self._get_gamepad_name_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadNameForID")
        self._get_gamepad_path_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadPathForID")
        self._get_gamepad_player_index_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> Int32]("SDL_GetGamepadPlayerIndexForID")
        self._get_gamepad_guid_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> GUID]("SDL_GetGamepadGUIDForID")
        self._get_gamepad_vendor_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> UInt16]("SDL_GetGamepadVendorForID")
        self._get_gamepad_product_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> UInt16]("SDL_GetGamepadProductForID")
        self._get_gamepad_product_version_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> UInt16]("SDL_GetGamepadProductVersionForID")
        self._get_gamepad_type_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> GamepadType]("SDL_GetGamepadTypeForID")
        self._get_real_gamepad_type_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> GamepadType]("SDL_GetRealGamepadTypeForID")
        self._get_gamepad_mapping_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> Ptr[c_char, MutExternalOrigin]]("SDL_GetGamepadMappingForID")
        self._open_gamepad = self._dynamic_library_handle.get_function[fn(JoystickID) -> Ptr[Gamepad, MutExternalOrigin]]("SDL_OpenGamepad")
        self._get_gamepad_from_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> Ptr[Gamepad, MutExternalOrigin]]("SDL_GetGamepadFromID")
        self._get_gamepad_from_player_index = self._dynamic_library_handle.get_function[fn(Int32) -> Ptr[Gamepad, MutExternalOrigin]]("SDL_GetGamepadFromPlayerIndex")
        self._get_gamepad_properties = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> PropertiesID]("SDL_GetGamepadProperties")
        self._get_gamepad_id = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> JoystickID]("SDL_GetGamepadID")
        self._get_gamepad_name = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadName")
        self._get_gamepad_path = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadPath")
        self._get_gamepad_type = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> GamepadType]("SDL_GetGamepadType")
        self._get_real_gamepad_type = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> GamepadType]("SDL_GetRealGamepadType")
        self._get_gamepad_player_index = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Int32]("SDL_GetGamepadPlayerIndex")
        self._set_gamepad_player_index = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Int32) -> Bool]("SDL_SetGamepadPlayerIndex")
        self._get_gamepad_vendor = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16]("SDL_GetGamepadVendor")
        self._get_gamepad_product = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16]("SDL_GetGamepadProduct")
        self._get_gamepad_product_version = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16]("SDL_GetGamepadProductVersion")
        self._get_gamepad_firmware_version = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt16]("SDL_GetGamepadFirmwareVersion")
        self._get_gamepad_serial = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadSerial")
        self._get_gamepad_steam_handle = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> UInt64]("SDL_GetGamepadSteamHandle")
        self._get_gamepad_connection_state = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> JoystickConnectionState]("SDL_GetGamepadConnectionState")
        self._get_gamepad_power_info = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState]("SDL_GetGamepadPowerInfo")
        self._gamepad_connected = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Bool]("SDL_GamepadConnected")
        self._get_gamepad_joystick = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Ptr[Joystick, MutExternalOrigin]]("SDL_GetGamepadJoystick")
        self._set_gamepad_events_enabled = self._dynamic_library_handle.get_function[fn(Bool) -> NoneType]("SDL_SetGamepadEventsEnabled")
        self._gamepad_events_enabled = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_GamepadEventsEnabled")
        self._get_gamepad_bindings = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[GamepadBinding, MutExternalOrigin], MutExternalOrigin]]("SDL_GetGamepadBindings")
        self._update_gamepads = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_UpdateGamepads")
        self._get_gamepad_type_from_string = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadType]("SDL_GetGamepadTypeFromString")
        self._get_gamepad_string_for_type = self._dynamic_library_handle.get_function[fn(GamepadType) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadStringForType")
        self._get_gamepad_axis_from_string = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadAxis]("SDL_GetGamepadAxisFromString")
        self._get_gamepad_string_for_axis = self._dynamic_library_handle.get_function[fn(GamepadAxis) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadStringForAxis")
        self._gamepad_has_axis = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> Bool]("SDL_GamepadHasAxis")
        self._get_gamepad_axis = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> Int16]("SDL_GetGamepadAxis")
        self._get_gamepad_button_from_string = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> GamepadButton]("SDL_GetGamepadButtonFromString")
        self._get_gamepad_string_for_button = self._dynamic_library_handle.get_function[fn(GamepadButton) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadStringForButton")
        self._gamepad_has_button = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> Bool]("SDL_GamepadHasButton")
        self._get_gamepad_button = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> Bool]("SDL_GetGamepadButton")
        self._get_gamepad_button_label_for_type = self._dynamic_library_handle.get_function[fn(GamepadType, GamepadButton) -> GamepadButtonLabel]("SDL_GetGamepadButtonLabelForType")
        self._get_gamepad_button_label = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> GamepadButtonLabel]("SDL_GetGamepadButtonLabel")
        self._get_num_gamepad_touchpads = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> Int32]("SDL_GetNumGamepadTouchpads")
        self._get_num_gamepad_touchpad_fingers = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Int32) -> Int32]("SDL_GetNumGamepadTouchpadFingers")
        self._get_gamepad_touchpad_finger = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Int32, Int32, Ptr[Bool, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetGamepadTouchpadFinger")
        self._gamepad_has_sensor = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Bool]("SDL_GamepadHasSensor")
        self._set_gamepad_sensor_enabled = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType, Bool) -> Bool]("SDL_SetGamepadSensorEnabled")
        self._gamepad_sensor_enabled = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Bool]("SDL_GamepadSensorEnabled")
        self._get_gamepad_sensor_data_rate = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType) -> Float32]("SDL_GetGamepadSensorDataRate")
        self._get_gamepad_sensor_data = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], SensorType, Ptr[Float32, MutExternalOrigin], Int32) -> Bool]("SDL_GetGamepadSensorData")
        self._rumble_gamepad = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool]("SDL_RumbleGamepad")
        self._rumble_gamepad_triggers = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool]("SDL_RumbleGamepadTriggers")
        self._set_gamepad_led = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool]("SDL_SetGamepadLED")
        self._send_gamepad_effect = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_SendGamepadEffect")
        self._close_gamepad = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin]) -> NoneType]("SDL_CloseGamepad")
        self._get_gamepad_apple_sf_symbols_name_for_button = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadButton) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadAppleSFSymbolsNameForButton")
        self._get_gamepad_apple_sf_symbols_name_for_axis = self._dynamic_library_handle.get_function[fn(Ptr[Gamepad, MutExternalOrigin], GamepadAxis) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGamepadAppleSFSymbolsNameForAxis")
        self._gpu_supports_shader_formats = self._dynamic_library_handle.get_function[fn(GPUShaderFormat, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_GPUSupportsShaderFormats")
        self._gpu_supports_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Bool]("SDL_GPUSupportsProperties")
        self._create_gpu_device = self._dynamic_library_handle.get_function[fn(GPUShaderFormat, Bool, Ptr[c_char, ImmutExternalOrigin]) -> Ptr[GPUDevice, MutExternalOrigin]]("SDL_CreateGPUDevice")
        self._create_gpu_device_with_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[GPUDevice, MutExternalOrigin]]("SDL_CreateGPUDeviceWithProperties")
        self._destroy_gpu_device = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> NoneType]("SDL_DestroyGPUDevice")
        self._get_num_gpu_drivers = self._dynamic_library_handle.get_function[fn() -> Int32]("SDL_GetNumGPUDrivers")
        self._get_gpu_driver = self._dynamic_library_handle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGPUDriver")
        self._get_gpu_device_driver = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetGPUDeviceDriver")
        self._get_gpu_shader_formats = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> GPUShaderFormat]("SDL_GetGPUShaderFormats")
        self._get_gpu_device_properties = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> PropertiesID]("SDL_GetGPUDeviceProperties")
        self._create_gpu_compute_pipeline = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUComputePipelineCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUComputePipeline, MutExternalOrigin]]("SDL_CreateGPUComputePipeline")
        self._create_gpu_graphics_pipeline = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUGraphicsPipelineCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUGraphicsPipeline, MutExternalOrigin]]("SDL_CreateGPUGraphicsPipeline")
        self._create_gpu_sampler = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUSamplerCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUSampler, MutExternalOrigin]]("SDL_CreateGPUSampler")
        self._create_gpu_shader = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUShaderCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUShader, MutExternalOrigin]]("SDL_CreateGPUShader")
        self._create_gpu_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTextureCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUTexture, MutExternalOrigin]]("SDL_CreateGPUTexture")
        self._create_gpu_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBufferCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUBuffer, MutExternalOrigin]]("SDL_CreateGPUBuffer")
        self._create_gpu_transfer_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBufferCreateInfo, ImmutExternalOrigin]) -> Ptr[GPUTransferBuffer, MutExternalOrigin]]("SDL_CreateGPUTransferBuffer")
        self._set_gpu_buffer_name = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_SetGPUBufferName")
        self._set_gpu_texture_name = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_SetGPUTextureName")
        self._insert_gpu_debug_label = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_InsertGPUDebugLabel")
        self._push_gpu_debug_group = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_PushGPUDebugGroup")
        self._pop_gpu_debug_group = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> NoneType]("SDL_PopGPUDebugGroup")
        self._release_gpu_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUTexture")
        self._release_gpu_sampler = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUSampler, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUSampler")
        self._release_gpu_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUBuffer")
        self._release_gpu_transfer_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUTransferBuffer")
        self._release_gpu_compute_pipeline = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUComputePipeline, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUComputePipeline")
        self._release_gpu_shader = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUShader, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUShader")
        self._release_gpu_graphics_pipeline = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUGraphicsPipeline, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUGraphicsPipeline")
        self._acquire_gpu_command_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> Ptr[GPUCommandBuffer, MutExternalOrigin]]("SDL_AcquireGPUCommandBuffer")
        self._push_gpu_vertex_uniform_data = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_PushGPUVertexUniformData")
        self._push_gpu_fragment_uniform_data = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_PushGPUFragmentUniformData")
        self._push_gpu_compute_uniform_data = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_PushGPUComputeUniformData")
        self._begin_gpu_render_pass = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUColorTargetInfo, ImmutExternalOrigin], UInt32, Ptr[GPUDepthStencilTargetInfo, ImmutExternalOrigin]) -> Ptr[GPURenderPass, MutExternalOrigin]]("SDL_BeginGPURenderPass")
        self._bind_gpu_graphics_pipeline = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUGraphicsPipeline, MutExternalOrigin]) -> NoneType]("SDL_BindGPUGraphicsPipeline")
        self._set_gpu_viewport = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUViewport, ImmutExternalOrigin]) -> NoneType]("SDL_SetGPUViewport")
        self._set_gpu_scissor = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> NoneType]("SDL_SetGPUScissor")
        self._set_gpu_blend_constants = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], FColor) -> NoneType]("SDL_SetGPUBlendConstants")
        self._set_gpu_stencil_reference = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt8) -> NoneType]("SDL_SetGPUStencilReference")
        self._bind_gpu_vertex_buffers = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUBufferBinding, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUVertexBuffers")
        self._bind_gpu_index_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBufferBinding, ImmutExternalOrigin], GPUIndexElementSize) -> NoneType]("SDL_BindGPUIndexBuffer")
        self._bind_gpu_vertex_samplers = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUVertexSamplers")
        self._bind_gpu_vertex_storage_textures = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUVertexStorageTextures")
        self._bind_gpu_vertex_storage_buffers = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUVertexStorageBuffers")
        self._bind_gpu_fragment_samplers = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUFragmentSamplers")
        self._bind_gpu_fragment_storage_textures = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUFragmentStorageTextures")
        self._bind_gpu_fragment_storage_buffers = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUFragmentStorageBuffers")
        self._draw_gpu_indexed_primitives = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, UInt32, UInt32, Int32, UInt32) -> NoneType]("SDL_DrawGPUIndexedPrimitives")
        self._draw_gpu_primitives = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], UInt32, UInt32, UInt32, UInt32) -> NoneType]("SDL_DrawGPUPrimitives")
        self._draw_gpu_primitives_indirect = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32, UInt32) -> NoneType]("SDL_DrawGPUPrimitivesIndirect")
        self._draw_gpu_indexed_primitives_indirect = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32, UInt32) -> NoneType]("SDL_DrawGPUIndexedPrimitivesIndirect")
        self._end_gpu_render_pass = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderPass, MutExternalOrigin]) -> NoneType]("SDL_EndGPURenderPass")
        self._begin_gpu_compute_pass = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUStorageTextureReadWriteBinding, ImmutExternalOrigin], UInt32, Ptr[GPUStorageBufferReadWriteBinding, ImmutExternalOrigin], UInt32) -> Ptr[GPUComputePass, MutExternalOrigin]]("SDL_BeginGPUComputePass")
        self._bind_gpu_compute_pipeline = self._dynamic_library_handle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], Ptr[GPUComputePipeline, MutExternalOrigin]) -> NoneType]("SDL_BindGPUComputePipeline")
        self._bind_gpu_compute_samplers = self._dynamic_library_handle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUComputeSamplers")
        self._bind_gpu_compute_storage_textures = self._dynamic_library_handle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUComputeStorageTextures")
        self._bind_gpu_compute_storage_buffers = self._dynamic_library_handle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> NoneType]("SDL_BindGPUComputeStorageBuffers")
        self._dispatch_gpu_compute = self._dynamic_library_handle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], UInt32, UInt32, UInt32) -> NoneType]("SDL_DispatchGPUCompute")
        self._dispatch_gpu_compute_indirect = self._dynamic_library_handle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin], Ptr[GPUBuffer, MutExternalOrigin], UInt32) -> NoneType]("SDL_DispatchGPUComputeIndirect")
        self._end_gpu_compute_pass = self._dynamic_library_handle.get_function[fn(Ptr[GPUComputePass, MutExternalOrigin]) -> NoneType]("SDL_EndGPUComputePass")
        self._map_gpu_transfer_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin], Bool) -> Ptr[NoneType, MutExternalOrigin]]("SDL_MapGPUTransferBuffer")
        self._unmap_gpu_transfer_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUTransferBuffer, MutExternalOrigin]) -> NoneType]("SDL_UnmapGPUTransferBuffer")
        self._begin_gpu_copy_pass = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Ptr[GPUCopyPass, MutExternalOrigin]]("SDL_BeginGPUCopyPass")
        self._upload_to_gpu_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureTransferInfo, ImmutExternalOrigin], Ptr[GPUTextureRegion, ImmutExternalOrigin], Bool) -> NoneType]("SDL_UploadToGPUTexture")
        self._upload_to_gpu_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTransferBufferLocation, ImmutExternalOrigin], Ptr[GPUBufferRegion, ImmutExternalOrigin], Bool) -> NoneType]("SDL_UploadToGPUBuffer")
        self._copy_gpu_texture_to_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureLocation, ImmutExternalOrigin], Ptr[GPUTextureLocation, ImmutExternalOrigin], UInt32, UInt32, UInt32, Bool) -> NoneType]("SDL_CopyGPUTextureToTexture")
        self._copy_gpu_buffer_to_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUBufferLocation, ImmutExternalOrigin], Ptr[GPUBufferLocation, ImmutExternalOrigin], UInt32, Bool) -> NoneType]("SDL_CopyGPUBufferToBuffer")
        self._download_from_gpu_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUTextureRegion, ImmutExternalOrigin], Ptr[GPUTextureTransferInfo, ImmutExternalOrigin]) -> NoneType]("SDL_DownloadFromGPUTexture")
        self._download_from_gpu_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin], Ptr[GPUBufferRegion, ImmutExternalOrigin], Ptr[GPUTransferBufferLocation, ImmutExternalOrigin]) -> NoneType]("SDL_DownloadFromGPUBuffer")
        self._end_gpu_copy_pass = self._dynamic_library_handle.get_function[fn(Ptr[GPUCopyPass, MutExternalOrigin]) -> NoneType]("SDL_EndGPUCopyPass")
        self._generate_mipmaps_for_gpu_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUTexture, MutExternalOrigin]) -> NoneType]("SDL_GenerateMipmapsForGPUTexture")
        self._blit_gpu_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[GPUBlitInfo, ImmutExternalOrigin]) -> NoneType]("SDL_BlitGPUTexture")
        self._window_supports_gpu_swapchain_composition = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUSwapchainComposition) -> Bool]("SDL_WindowSupportsGPUSwapchainComposition")
        self._window_supports_gpu_present_mode = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUPresentMode) -> Bool]("SDL_WindowSupportsGPUPresentMode")
        self._claim_window_for_gpu_device = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_ClaimWindowForGPUDevice")
        self._release_window_from_gpu_device = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> NoneType]("SDL_ReleaseWindowFromGPUDevice")
        self._set_gpu_swapchain_parameters = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin], GPUSwapchainComposition, GPUPresentMode) -> Bool]("SDL_SetGPUSwapchainParameters")
        self._set_gpu_allowed_frames_in_flight = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], UInt32) -> Bool]("SDL_SetGPUAllowedFramesInFlight")
        self._get_gpu_swapchain_texture_format = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> GPUTextureFormat]("SDL_GetGPUSwapchainTextureFormat")
        self._acquire_gpu_swapchain_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[Window, MutExternalOrigin], Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_AcquireGPUSwapchainTexture")
        self._wait_for_gpu_swapchain = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_WaitForGPUSwapchain")
        self._wait_and_acquire_gpu_swapchain_texture = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin], Ptr[Window, MutExternalOrigin], Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_WaitAndAcquireGPUSwapchainTexture")
        self._submit_gpu_command_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Bool]("SDL_SubmitGPUCommandBuffer")
        self._submit_gpu_command_buffer_and_acquire_fence = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Ptr[GPUFence, MutExternalOrigin]]("SDL_SubmitGPUCommandBufferAndAcquireFence")
        self._cancel_gpu_command_buffer = self._dynamic_library_handle.get_function[fn(Ptr[GPUCommandBuffer, MutExternalOrigin]) -> Bool]("SDL_CancelGPUCommandBuffer")
        self._wait_for_gpu_idle = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin]) -> Bool]("SDL_WaitForGPUIdle")
        self._wait_for_gpu_fences = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Bool, Ptr[Ptr[GPUFence, MutExternalOrigin], ImmutExternalOrigin], UInt32) -> Bool]("SDL_WaitForGPUFences")
        self._query_gpu_fence = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUFence, MutExternalOrigin]) -> Bool]("SDL_QueryGPUFence")
        self._release_gpu_fence = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[GPUFence, MutExternalOrigin]) -> NoneType]("SDL_ReleaseGPUFence")
        self._gpu_texture_format_texel_block_size = self._dynamic_library_handle.get_function[fn(GPUTextureFormat) -> UInt32]("SDL_GPUTextureFormatTexelBlockSize")
        self._gpu_texture_supports_format = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], GPUTextureFormat, GPUTextureType, GPUTextureUsageFlags) -> Bool]("SDL_GPUTextureSupportsFormat")
        self._gpu_texture_supports_sample_count = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], GPUTextureFormat, GPUSampleCount) -> Bool]("SDL_GPUTextureSupportsSampleCount")
        self._calculate_gpu_texture_format_size = self._dynamic_library_handle.get_function[fn(GPUTextureFormat, UInt32, UInt32, UInt32) -> UInt32]("SDL_CalculateGPUTextureFormatSize")
        self._get_pixel_format_from_gpu_texture_format = self._dynamic_library_handle.get_function[fn(GPUTextureFormat) -> PixelFormat]("SDL_GetPixelFormatFromGPUTextureFormat")
        self._get_gpu_texture_format_from_pixel_format = self._dynamic_library_handle.get_function[fn(PixelFormat) -> GPUTextureFormat]("SDL_GetGPUTextureFormatFromPixelFormat")
        self._guid_to_string = self._dynamic_library_handle.get_function[fn(GUID, Ptr[c_char, MutExternalOrigin], Int32) -> NoneType]("SDL_GUIDToString")
        self._string_to_guid = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> GUID]("SDL_StringToGUID")
        self._get_haptics = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[HapticID, MutExternalOrigin]]("SDL_GetHaptics")
        self._get_haptic_name_for_id = self._dynamic_library_handle.get_function[fn(HapticID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetHapticNameForID")
        self._open_haptic = self._dynamic_library_handle.get_function[fn(HapticID) -> Ptr[Haptic, MutExternalOrigin]]("SDL_OpenHaptic")
        self._get_haptic_from_id = self._dynamic_library_handle.get_function[fn(HapticID) -> Ptr[Haptic, MutExternalOrigin]]("SDL_GetHapticFromID")
        self._get_haptic_id = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> HapticID]("SDL_GetHapticID")
        self._get_haptic_name = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetHapticName")
        self._is_mouse_haptic = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_IsMouseHaptic")
        self._open_haptic_from_mouse = self._dynamic_library_handle.get_function[fn() -> Ptr[Haptic, MutExternalOrigin]]("SDL_OpenHapticFromMouse")
        self._is_joystick_haptic = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Bool]("SDL_IsJoystickHaptic")
        self._open_haptic_from_joystick = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Ptr[Haptic, MutExternalOrigin]]("SDL_OpenHapticFromJoystick")
        self._close_haptic = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> NoneType]("SDL_CloseHaptic")
        self._get_max_haptic_effects = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Int32]("SDL_GetMaxHapticEffects")
        self._get_max_haptic_effects_playing = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Int32]("SDL_GetMaxHapticEffectsPlaying")
        self._get_haptic_features = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> UInt32]("SDL_GetHapticFeatures")
        self._get_num_haptic_axes = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Int32]("SDL_GetNumHapticAxes")
        self._haptic_effect_supported = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Ptr[HapticEffect, ImmutExternalOrigin]) -> Bool]("SDL_HapticEffectSupported")
        self._create_haptic_effect = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Ptr[HapticEffect, ImmutExternalOrigin]) -> HapticEffectID]("SDL_CreateHapticEffect")
        self._update_haptic_effect = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID, Ptr[HapticEffect, ImmutExternalOrigin]) -> Bool]("SDL_UpdateHapticEffect")
        self._run_haptic_effect = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID, UInt32) -> Bool]("SDL_RunHapticEffect")
        self._stop_haptic_effect = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> Bool]("SDL_StopHapticEffect")
        self._destroy_haptic_effect = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> NoneType]("SDL_DestroyHapticEffect")
        self._get_haptic_effect_status = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], HapticEffectID) -> Bool]("SDL_GetHapticEffectStatus")
        self._set_haptic_gain = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Int32) -> Bool]("SDL_SetHapticGain")
        self._set_haptic_autocenter = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Int32) -> Bool]("SDL_SetHapticAutocenter")
        self._pause_haptic = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_PauseHaptic")
        self._resume_haptic = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_ResumeHaptic")
        self._stop_haptic_effects = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_StopHapticEffects")
        self._haptic_rumble_supported = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_HapticRumbleSupported")
        self._init_haptic_rumble = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_InitHapticRumble")
        self._play_haptic_rumble = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin], Float32, UInt32) -> Bool]("SDL_PlayHapticRumble")
        self._stop_haptic_rumble = self._dynamic_library_handle.get_function[fn(Ptr[Haptic, MutExternalOrigin]) -> Bool]("SDL_StopHapticRumble")
        self._set_hint_with_priority = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], HintPriority) -> Bool]("SDL_SetHintWithPriority")
        self._set_hint = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetHint")
        self._reset_hint = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_ResetHint")
        self._reset_hints = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_ResetHints")
        self._get_hint = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetHint")
        self._get_hint_boolean = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool]("SDL_GetHintBoolean")
        self._add_hint_callback = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], HintCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_AddHintCallback")
        self._remove_hint_callback = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], HintCallback, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_RemoveHintCallback")
        self._init = self._dynamic_library_handle.get_function[fn(InitFlags) -> Bool]("SDL_Init")
        self._init_sub_system = self._dynamic_library_handle.get_function[fn(InitFlags) -> Bool]("SDL_InitSubSystem")
        self._quit_sub_system = self._dynamic_library_handle.get_function[fn(InitFlags) -> NoneType]("SDL_QuitSubSystem")
        self._was_init = self._dynamic_library_handle.get_function[fn(InitFlags) -> InitFlags]("SDL_WasInit")
        self._quit = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_Quit")
        self._is_main_thread = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_IsMainThread")
        self._run_on_main_thread = self._dynamic_library_handle.get_function[fn(MainThreadCallback, Ptr[NoneType, MutExternalOrigin], Bool) -> Bool]("SDL_RunOnMainThread")
        self._set_app_metadata = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetAppMetadata")
        self._set_app_metadata_property = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetAppMetadataProperty")
        self._get_app_metadata_property = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetAppMetadataProperty")
        self._io_from_file = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[IOStream, MutExternalOrigin]]("SDL_IOFromFile")
        self._io_from_mem = self._dynamic_library_handle.get_function[fn(Ptr[NoneType, MutExternalOrigin], Int32) -> Ptr[IOStream, MutExternalOrigin]]("SDL_IOFromMem")
        self._io_from_const_mem = self._dynamic_library_handle.get_function[fn(Ptr[NoneType, ImmutExternalOrigin], Int32) -> Ptr[IOStream, MutExternalOrigin]]("SDL_IOFromConstMem")
        self._io_from_dynamic_mem = self._dynamic_library_handle.get_function[fn() -> Ptr[IOStream, MutExternalOrigin]]("SDL_IOFromDynamicMem")
        self._open_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStreamInterface, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[IOStream, MutExternalOrigin]]("SDL_OpenIO")
        self._close_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("SDL_CloseIO")
        self._get_io_properties = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> PropertiesID]("SDL_GetIOProperties")
        self._get_io_status = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> IOStatus]("SDL_GetIOStatus")
        self._get_io_size = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Int64]("SDL_GetIOSize")
        self._seek_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int64, IOWhence) -> Int64]("SDL_SeekIO")
        self._tell_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Int64]("SDL_TellIO")
        self._read_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Int32]("SDL_ReadIO")
        self._write_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Int32]("SDL_WriteIO")
        self._i_oprintf = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Int32]("SDL_IOprintf")
        self._i_ovprintf = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int32) -> Int32]("SDL_IOvprintf")
        self._flush_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin]) -> Bool]("SDL_FlushIO")
        self._load_file_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Bool) -> Ptr[NoneType, MutExternalOrigin]]("SDL_LoadFile_IO")
        self._load_file = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_LoadFile")
        self._save_file_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Bool) -> Bool]("SDL_SaveFile_IO")
        self._save_file = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_SaveFile")
        self._read_u8 = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_ReadU8")
        self._read_s8 = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int8, MutExternalOrigin]) -> Bool]("SDL_ReadS8")
        self._read_u16_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> Bool]("SDL_ReadU16LE")
        self._read_s16_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int16, MutExternalOrigin]) -> Bool]("SDL_ReadS16LE")
        self._read_u16_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> Bool]("SDL_ReadU16BE")
        self._read_s16_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int16, MutExternalOrigin]) -> Bool]("SDL_ReadS16BE")
        self._read_u32_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_ReadU32LE")
        self._read_s32_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_ReadS32LE")
        self._read_u32_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_ReadU32BE")
        self._read_s32_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_ReadS32BE")
        self._read_u64_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool]("SDL_ReadU64LE")
        self._read_s64_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int64, MutExternalOrigin]) -> Bool]("SDL_ReadS64LE")
        self._read_u64_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool]("SDL_ReadU64BE")
        self._read_s64_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Ptr[Int64, MutExternalOrigin]) -> Bool]("SDL_ReadS64BE")
        self._write_u8 = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt8) -> Bool]("SDL_WriteU8")
        self._write_s8 = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int8) -> Bool]("SDL_WriteS8")
        self._write_u16_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt16) -> Bool]("SDL_WriteU16LE")
        self._write_s16_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int16) -> Bool]("SDL_WriteS16LE")
        self._write_u16_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt16) -> Bool]("SDL_WriteU16BE")
        self._write_s16_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int16) -> Bool]("SDL_WriteS16BE")
        self._write_u32_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt32) -> Bool]("SDL_WriteU32LE")
        self._write_s32_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int32) -> Bool]("SDL_WriteS32LE")
        self._write_u32_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt32) -> Bool]("SDL_WriteU32BE")
        self._write_s32_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int32) -> Bool]("SDL_WriteS32BE")
        self._write_u64_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt64) -> Bool]("SDL_WriteU64LE")
        self._write_s64_le = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int64) -> Bool]("SDL_WriteS64LE")
        self._write_u64_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], UInt64) -> Bool]("SDL_WriteU64BE")
        self._write_s64_be = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Int64) -> Bool]("SDL_WriteS64BE")
        self._lock_joysticks = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_LockJoysticks")
        self._unlock_joysticks = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_UnlockJoysticks")
        self._has_joystick = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_HasJoystick")
        self._get_joysticks = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[JoystickID, MutExternalOrigin]]("SDL_GetJoysticks")
        self._get_joystick_name_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickNameForID")
        self._get_joystick_path_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickPathForID")
        self._get_joystick_player_index_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> Int32]("SDL_GetJoystickPlayerIndexForID")
        self._get_joystick_guid_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> GUID]("SDL_GetJoystickGUIDForID")
        self._get_joystick_vendor_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> UInt16]("SDL_GetJoystickVendorForID")
        self._get_joystick_product_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> UInt16]("SDL_GetJoystickProductForID")
        self._get_joystick_product_version_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> UInt16]("SDL_GetJoystickProductVersionForID")
        self._get_joystick_type_for_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> JoystickType]("SDL_GetJoystickTypeForID")
        self._open_joystick = self._dynamic_library_handle.get_function[fn(JoystickID) -> Ptr[Joystick, MutExternalOrigin]]("SDL_OpenJoystick")
        self._get_joystick_from_id = self._dynamic_library_handle.get_function[fn(JoystickID) -> Ptr[Joystick, MutExternalOrigin]]("SDL_GetJoystickFromID")
        self._get_joystick_from_player_index = self._dynamic_library_handle.get_function[fn(Int32) -> Ptr[Joystick, MutExternalOrigin]]("SDL_GetJoystickFromPlayerIndex")
        self._attach_virtual_joystick = self._dynamic_library_handle.get_function[fn(Ptr[VirtualJoystickDesc, ImmutExternalOrigin]) -> JoystickID]("SDL_AttachVirtualJoystick")
        self._detach_virtual_joystick = self._dynamic_library_handle.get_function[fn(JoystickID) -> Bool]("SDL_DetachVirtualJoystick")
        self._is_joystick_virtual = self._dynamic_library_handle.get_function[fn(JoystickID) -> Bool]("SDL_IsJoystickVirtual")
        self._set_joystick_virtual_axis = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Int16) -> Bool]("SDL_SetJoystickVirtualAxis")
        self._set_joystick_virtual_ball = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Int16, Int16) -> Bool]("SDL_SetJoystickVirtualBall")
        self._set_joystick_virtual_button = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Bool) -> Bool]("SDL_SetJoystickVirtualButton")
        self._set_joystick_virtual_hat = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, UInt8) -> Bool]("SDL_SetJoystickVirtualHat")
        self._set_joystick_virtual_touchpad = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Int32, Bool, Float32, Float32, Float32) -> Bool]("SDL_SetJoystickVirtualTouchpad")
        self._send_joystick_virtual_sensor_data = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], SensorType, UInt64, Ptr[Float32, ImmutExternalOrigin], Int32) -> Bool]("SDL_SendJoystickVirtualSensorData")
        self._get_joystick_properties = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> PropertiesID]("SDL_GetJoystickProperties")
        self._get_joystick_name = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickName")
        self._get_joystick_path = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickPath")
        self._get_joystick_player_index = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetJoystickPlayerIndex")
        self._set_joystick_player_index = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Bool]("SDL_SetJoystickPlayerIndex")
        self._get_joystick_guid = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> GUID]("SDL_GetJoystickGUID")
        self._get_joystick_vendor = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16]("SDL_GetJoystickVendor")
        self._get_joystick_product = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16]("SDL_GetJoystickProduct")
        self._get_joystick_product_version = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16]("SDL_GetJoystickProductVersion")
        self._get_joystick_firmware_version = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> UInt16]("SDL_GetJoystickFirmwareVersion")
        self._get_joystick_serial = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetJoystickSerial")
        self._get_joystick_type = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickType]("SDL_GetJoystickType")
        self._get_joystick_guid_info = self._dynamic_library_handle.get_function[fn(GUID, Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin], Ptr[UInt16, MutExternalOrigin]) -> NoneType]("SDL_GetJoystickGUIDInfo")
        self._joystick_connected = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Bool]("SDL_JoystickConnected")
        self._get_joystick_id = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickID]("SDL_GetJoystickID")
        self._get_num_joystick_axes = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetNumJoystickAxes")
        self._get_num_joystick_balls = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetNumJoystickBalls")
        self._get_num_joystick_hats = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetNumJoystickHats")
        self._get_num_joystick_buttons = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> Int32]("SDL_GetNumJoystickButtons")
        self._set_joystick_events_enabled = self._dynamic_library_handle.get_function[fn(Bool) -> NoneType]("SDL_SetJoystickEventsEnabled")
        self._joystick_events_enabled = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_JoystickEventsEnabled")
        self._update_joysticks = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_UpdateJoysticks")
        self._get_joystick_axis = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Int16]("SDL_GetJoystickAxis")
        self._get_joystick_axis_initial_state = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Ptr[Int16, MutExternalOrigin]) -> Bool]("SDL_GetJoystickAxisInitialState")
        self._get_joystick_ball = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32, Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetJoystickBall")
        self._get_joystick_hat = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32) -> UInt8]("SDL_GetJoystickHat")
        self._get_joystick_button = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Int32) -> Bool]("SDL_GetJoystickButton")
        self._rumble_joystick = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool]("SDL_RumbleJoystick")
        self._rumble_joystick_triggers = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], UInt16, UInt16, UInt32) -> Bool]("SDL_RumbleJoystickTriggers")
        self._set_joystick_led = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool]("SDL_SetJoystickLED")
        self._send_joystick_effect = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_SendJoystickEffect")
        self._close_joystick = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> NoneType]("SDL_CloseJoystick")
        self._get_joystick_connection_state = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin]) -> JoystickConnectionState]("SDL_GetJoystickConnectionState")
        self._get_joystick_power_info = self._dynamic_library_handle.get_function[fn(Ptr[Joystick, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState]("SDL_GetJoystickPowerInfo")
        self._has_keyboard = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_HasKeyboard")
        self._get_keyboards = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[KeyboardID, MutExternalOrigin]]("SDL_GetKeyboards")
        self._get_keyboard_name_for_id = self._dynamic_library_handle.get_function[fn(KeyboardID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetKeyboardNameForID")
        self._get_keyboard_focus = self._dynamic_library_handle.get_function[fn() -> Ptr[Window, MutExternalOrigin]]("SDL_GetKeyboardFocus")
        self._get_keyboard_state = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Bool, ImmutExternalOrigin]]("SDL_GetKeyboardState")
        self._reset_keyboard = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_ResetKeyboard")
        self._get_mod_state = self._dynamic_library_handle.get_function[fn() -> Keymod]("SDL_GetModState")
        self._set_mod_state = self._dynamic_library_handle.get_function[fn(Keymod) -> NoneType]("SDL_SetModState")
        self._get_key_from_scancode = self._dynamic_library_handle.get_function[fn(Scancode, Keymod, Bool) -> Keycode]("SDL_GetKeyFromScancode")
        self._get_scancode_from_key = self._dynamic_library_handle.get_function[fn(Keycode, Ptr[Keymod, MutExternalOrigin]) -> Scancode]("SDL_GetScancodeFromKey")
        self._set_scancode_name = self._dynamic_library_handle.get_function[fn(Scancode, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetScancodeName")
        self._get_scancode_name = self._dynamic_library_handle.get_function[fn(Scancode) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetScancodeName")
        self._get_scancode_from_name = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Scancode]("SDL_GetScancodeFromName")
        self._get_key_name = self._dynamic_library_handle.get_function[fn(Keycode) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetKeyName")
        self._get_key_from_name = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Keycode]("SDL_GetKeyFromName")
        self._start_text_input = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_StartTextInput")
        self._start_text_input_with_properties = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], PropertiesID) -> Bool]("SDL_StartTextInputWithProperties")
        self._text_input_active = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_TextInputActive")
        self._stop_text_input = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_StopTextInput")
        self._clear_composition = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_ClearComposition")
        self._set_text_input_area = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32) -> Bool]("SDL_SetTextInputArea")
        self._get_text_input_area = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetTextInputArea")
        self._has_screen_keyboard_support = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_HasScreenKeyboardSupport")
        self._screen_keyboard_shown = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_ScreenKeyboardShown")
        self._set_log_priorities = self._dynamic_library_handle.get_function[fn(LogPriority) -> NoneType]("SDL_SetLogPriorities")
        self._set_log_priority = self._dynamic_library_handle.get_function[fn(Int32, LogPriority) -> NoneType]("SDL_SetLogPriority")
        self._get_log_priority = self._dynamic_library_handle.get_function[fn(Int32) -> LogPriority]("SDL_GetLogPriority")
        self._reset_log_priorities = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_ResetLogPriorities")
        self._set_log_priority_prefix = self._dynamic_library_handle.get_function[fn(LogPriority, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetLogPriorityPrefix")
        self._log = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_Log")
        self._log_trace = self._dynamic_library_handle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogTrace")
        self._log_verbose = self._dynamic_library_handle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogVerbose")
        self._log_debug = self._dynamic_library_handle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogDebug")
        self._log_info = self._dynamic_library_handle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogInfo")
        self._log_warn = self._dynamic_library_handle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogWarn")
        self._log_error = self._dynamic_library_handle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogError")
        self._log_critical = self._dynamic_library_handle.get_function[fn(Int32, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogCritical")
        self._log_message = self._dynamic_library_handle.get_function[fn(Int32, LogPriority, Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("SDL_LogMessage")
        self._log_message_v = self._dynamic_library_handle.get_function[fn(Int32, LogPriority, Ptr[c_char, ImmutExternalOrigin], Int32) -> NoneType]("SDL_LogMessageV")
        self._get_default_log_output_function = self._dynamic_library_handle.get_function[fn() -> LogOutputFunction]("SDL_GetDefaultLogOutputFunction")
        self._get_log_output_function = self._dynamic_library_handle.get_function[fn(Ptr[LogOutputFunction, MutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]) -> NoneType]("SDL_GetLogOutputFunction")
        self._set_log_output_function = self._dynamic_library_handle.get_function[fn(LogOutputFunction, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_SetLogOutputFunction")
        self._has_mouse = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_HasMouse")
        self._get_mice = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[MouseID, MutExternalOrigin]]("SDL_GetMice")
        self._get_mouse_name_for_id = self._dynamic_library_handle.get_function[fn(MouseID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetMouseNameForID")
        self._get_mouse_focus = self._dynamic_library_handle.get_function[fn() -> Ptr[Window, MutExternalOrigin]]("SDL_GetMouseFocus")
        self._get_mouse_state = self._dynamic_library_handle.get_function[fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags]("SDL_GetMouseState")
        self._get_global_mouse_state = self._dynamic_library_handle.get_function[fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags]("SDL_GetGlobalMouseState")
        self._get_relative_mouse_state = self._dynamic_library_handle.get_function[fn(Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> MouseButtonFlags]("SDL_GetRelativeMouseState")
        self._warp_mouse_in_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Float32, Float32) -> NoneType]("SDL_WarpMouseInWindow")
        self._warp_mouse_global = self._dynamic_library_handle.get_function[fn(Float32, Float32) -> Bool]("SDL_WarpMouseGlobal")
        self._set_relative_mouse_transform = self._dynamic_library_handle.get_function[fn(MouseMotionTransformCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetRelativeMouseTransform")
        self._set_window_relative_mouse_mode = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowRelativeMouseMode")
        self._get_window_relative_mouse_mode = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_GetWindowRelativeMouseMode")
        self._capture_mouse = self._dynamic_library_handle.get_function[fn(Bool) -> Bool]("SDL_CaptureMouse")
        self._create_cursor = self._dynamic_library_handle.get_function[fn(Ptr[UInt8, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Int32, Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]]("SDL_CreateCursor")
        self._create_color_cursor = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]]("SDL_CreateColorCursor")
        self._create_animated_cursor = self._dynamic_library_handle.get_function[fn(Ptr[CursorFrameInfo, MutExternalOrigin], Int32, Int32, Int32) -> Ptr[Cursor, MutExternalOrigin]]("SDL_CreateAnimatedCursor")
        self._create_system_cursor = self._dynamic_library_handle.get_function[fn(SystemCursor) -> Ptr[Cursor, MutExternalOrigin]]("SDL_CreateSystemCursor")
        self._set_cursor = self._dynamic_library_handle.get_function[fn(Ptr[Cursor, MutExternalOrigin]) -> Bool]("SDL_SetCursor")
        self._get_cursor = self._dynamic_library_handle.get_function[fn() -> Ptr[Cursor, MutExternalOrigin]]("SDL_GetCursor")
        self._get_default_cursor = self._dynamic_library_handle.get_function[fn() -> Ptr[Cursor, MutExternalOrigin]]("SDL_GetDefaultCursor")
        self._destroy_cursor = self._dynamic_library_handle.get_function[fn(Ptr[Cursor, MutExternalOrigin]) -> NoneType]("SDL_DestroyCursor")
        self._show_cursor = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_ShowCursor")
        self._hide_cursor = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_HideCursor")
        self._cursor_visible = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_CursorVisible")
        self._get_pen_device_type = self._dynamic_library_handle.get_function[fn(PenID) -> PenDeviceType]("SDL_GetPenDeviceType")
        self._get_pixel_format_name = self._dynamic_library_handle.get_function[fn(PixelFormat) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetPixelFormatName")
        self._get_masks_for_pixel_format = self._dynamic_library_handle.get_function[fn(PixelFormat, Ptr[Int32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_GetMasksForPixelFormat")
        self._get_pixel_format_for_masks = self._dynamic_library_handle.get_function[fn(Int32, UInt32, UInt32, UInt32, UInt32) -> PixelFormat]("SDL_GetPixelFormatForMasks")
        self._get_pixel_format_details = self._dynamic_library_handle.get_function[fn(PixelFormat) -> Ptr[PixelFormatDetails, ImmutExternalOrigin]]("SDL_GetPixelFormatDetails")
        self._create_palette = self._dynamic_library_handle.get_function[fn(Int32) -> Ptr[Palette, MutExternalOrigin]]("SDL_CreatePalette")
        self._set_palette_colors = self._dynamic_library_handle.get_function[fn(Ptr[Palette, MutExternalOrigin], Ptr[Color, ImmutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetPaletteColors")
        self._destroy_palette = self._dynamic_library_handle.get_function[fn(Ptr[Palette, MutExternalOrigin]) -> NoneType]("SDL_DestroyPalette")
        self._map_rgb = self._dynamic_library_handle.get_function[fn(Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], UInt8, UInt8, UInt8) -> UInt32]("SDL_MapRGB")
        self._map_rgba = self._dynamic_library_handle.get_function[fn(Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> UInt32]("SDL_MapRGBA")
        self._get_rgb = self._dynamic_library_handle.get_function[fn(UInt32, Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> NoneType]("SDL_GetRGB")
        self._get_rgba = self._dynamic_library_handle.get_function[fn(UInt32, Ptr[PixelFormatDetails, ImmutExternalOrigin], Ptr[Palette, ImmutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> NoneType]("SDL_GetRGBA")
        self._get_power_info = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> PowerState]("SDL_GetPowerInfo")
        self._get_global_properties = self._dynamic_library_handle.get_function[fn() -> PropertiesID]("SDL_GetGlobalProperties")
        self._create_properties = self._dynamic_library_handle.get_function[fn() -> PropertiesID]("SDL_CreateProperties")
        self._copy_properties = self._dynamic_library_handle.get_function[fn(PropertiesID, PropertiesID) -> Bool]("SDL_CopyProperties")
        self._lock_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Bool]("SDL_LockProperties")
        self._unlock_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> NoneType]("SDL_UnlockProperties")
        self._set_pointer_property_with_cleanup = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin], CleanupPropertyCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetPointerPropertyWithCleanup")
        self._set_pointer_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetPointerProperty")
        self._set_string_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetStringProperty")
        self._set_number_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool]("SDL_SetNumberProperty")
        self._set_float_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool]("SDL_SetFloatProperty")
        self._set_boolean_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool]("SDL_SetBooleanProperty")
        self._has_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_HasProperty")
        self._get_property_type = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> PropertyType]("SDL_GetPropertyType")
        self._get_pointer_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetPointerProperty")
        self._get_string_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetStringProperty")
        self._get_number_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Int64) -> Int64]("SDL_GetNumberProperty")
        self._get_float_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Float32) -> Float32]("SDL_GetFloatProperty")
        self._get_boolean_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin], Bool) -> Bool]("SDL_GetBooleanProperty")
        self._clear_property = self._dynamic_library_handle.get_function[fn(PropertiesID, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_ClearProperty")
        self._enumerate_properties = self._dynamic_library_handle.get_function[fn(PropertiesID, EnumeratePropertiesCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_EnumerateProperties")
        self._destroy_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> NoneType]("SDL_DestroyProperties")
        self._has_rect_intersection = self._dynamic_library_handle.get_function[fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_HasRectIntersection")
        self._get_rect_intersection = self._dynamic_library_handle.get_function[fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRectIntersection")
        self._get_rect_union = self._dynamic_library_handle.get_function[fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRectUnion")
        self._get_rect_enclosing_points = self._dynamic_library_handle.get_function[fn(Ptr[Point, ImmutExternalOrigin], Int32, Ptr[Rect, ImmutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRectEnclosingPoints")
        self._get_rect_and_line_intersection = self._dynamic_library_handle.get_function[fn(Ptr[Rect, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetRectAndLineIntersection")
        self._has_rect_intersection_float = self._dynamic_library_handle.get_function[fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_HasRectIntersectionFloat")
        self._get_rect_intersection_float = self._dynamic_library_handle.get_function[fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool]("SDL_GetRectIntersectionFloat")
        self._get_rect_union_float = self._dynamic_library_handle.get_function[fn(Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool]("SDL_GetRectUnionFloat")
        self._get_rect_enclosing_points_float = self._dynamic_library_handle.get_function[fn(Ptr[FPoint, ImmutExternalOrigin], Int32, Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool]("SDL_GetRectEnclosingPointsFloat")
        self._get_rect_and_line_intersection_float = self._dynamic_library_handle.get_function[fn(Ptr[FRect, ImmutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetRectAndLineIntersectionFloat")
        self._get_num_render_drivers = self._dynamic_library_handle.get_function[fn() -> Int32]("SDL_GetNumRenderDrivers")
        self._get_render_driver = self._dynamic_library_handle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetRenderDriver")
        self._create_window_and_renderer = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Int32, Int32, WindowFlags, Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin], Ptr[Ptr[Renderer, MutExternalOrigin], MutExternalOrigin]) -> Bool]("SDL_CreateWindowAndRenderer")
        self._create_renderer = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_CreateRenderer")
        self._create_renderer_with_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[Renderer, MutExternalOrigin]]("SDL_CreateRendererWithProperties")
        self._create_gpu_renderer = self._dynamic_library_handle.get_function[fn(Ptr[GPUDevice, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_CreateGPURenderer")
        self._get_gpu_renderer_device = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[GPUDevice, MutExternalOrigin]]("SDL_GetGPURendererDevice")
        self._create_software_renderer = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_CreateSoftwareRenderer")
        self._get_renderer = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_GetRenderer")
        self._get_render_window = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]]("SDL_GetRenderWindow")
        self._get_renderer_name = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetRendererName")
        self._get_renderer_properties = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> PropertiesID]("SDL_GetRendererProperties")
        self._get_render_output_size = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetRenderOutputSize")
        self._get_current_render_output_size = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetCurrentRenderOutputSize")
        self._create_texture = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], PixelFormat, TextureAccess, Int32, Int32) -> Ptr[Texture, MutExternalOrigin]]("SDL_CreateTexture")
        self._create_texture_from_surface = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]]("SDL_CreateTextureFromSurface")
        self._create_texture_with_properties = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], PropertiesID) -> Ptr[Texture, MutExternalOrigin]]("SDL_CreateTextureWithProperties")
        self._get_texture_properties = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> PropertiesID]("SDL_GetTextureProperties")
        self._get_renderer_from_texture = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> Ptr[Renderer, MutExternalOrigin]]("SDL_GetRendererFromTexture")
        self._get_texture_size = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetTextureSize")
        self._set_texture_palette = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Palette, MutExternalOrigin]) -> Bool]("SDL_SetTexturePalette")
        self._get_texture_palette = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]]("SDL_GetTexturePalette")
        self._set_texture_color_mod = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool]("SDL_SetTextureColorMod")
        self._set_texture_color_mod_float = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Float32, Float32, Float32) -> Bool]("SDL_SetTextureColorModFloat")
        self._get_texture_color_mod = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetTextureColorMod")
        self._get_texture_color_mod_float = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetTextureColorModFloat")
        self._set_texture_alpha_mod = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], UInt8) -> Bool]("SDL_SetTextureAlphaMod")
        self._set_texture_alpha_mod_float = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Float32) -> Bool]("SDL_SetTextureAlphaModFloat")
        self._get_texture_alpha_mod = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetTextureAlphaMod")
        self._get_texture_alpha_mod_float = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetTextureAlphaModFloat")
        self._set_texture_blend_mode = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], BlendMode) -> Bool]("SDL_SetTextureBlendMode")
        self._get_texture_blend_mode = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool]("SDL_GetTextureBlendMode")
        self._set_texture_scale_mode = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], ScaleMode) -> Bool]("SDL_SetTextureScaleMode")
        self._get_texture_scale_mode = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[ScaleMode, MutExternalOrigin]) -> Bool]("SDL_GetTextureScaleMode")
        self._update_texture = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32) -> Bool]("SDL_UpdateTexture")
        self._update_yuv_texture = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32) -> Bool]("SDL_UpdateYUVTexture")
        self._update_nv_texture = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[UInt8, ImmutExternalOrigin], Int32, Ptr[UInt8, ImmutExternalOrigin], Int32) -> Bool]("SDL_UpdateNVTexture")
        self._lock_texture = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_LockTexture")
        self._lock_texture_to_surface = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]) -> Bool]("SDL_LockTextureToSurface")
        self._unlock_texture = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> NoneType]("SDL_UnlockTexture")
        self._set_render_target = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin]) -> Bool]("SDL_SetRenderTarget")
        self._get_render_target = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[Texture, MutExternalOrigin]]("SDL_GetRenderTarget")
        self._set_render_logical_presentation = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Int32, Int32, RendererLogicalPresentation) -> Bool]("SDL_SetRenderLogicalPresentation")
        self._get_render_logical_presentation = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[RendererLogicalPresentation, MutExternalOrigin]) -> Bool]("SDL_GetRenderLogicalPresentation")
        self._get_render_logical_presentation_rect = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, MutExternalOrigin]) -> Bool]("SDL_GetRenderLogicalPresentationRect")
        self._render_coordinates_from_window = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_RenderCoordinatesFromWindow")
        self._render_coordinates_to_window = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_RenderCoordinatesToWindow")
        self._convert_event_to_render_coordinates = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Event, MutExternalOrigin]) -> Bool]("SDL_ConvertEventToRenderCoordinates")
        self._set_render_viewport = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_SetRenderViewport")
        self._get_render_viewport = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRenderViewport")
        self._render_viewport_set = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_RenderViewportSet")
        self._get_render_safe_area = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRenderSafeArea")
        self._set_render_clip_rect = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_SetRenderClipRect")
        self._get_render_clip_rect = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetRenderClipRect")
        self._render_clip_enabled = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_RenderClipEnabled")
        self._set_render_scale = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32) -> Bool]("SDL_SetRenderScale")
        self._get_render_scale = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetRenderScale")
        self._set_render_draw_color = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> Bool]("SDL_SetRenderDrawColor")
        self._set_render_draw_color_float = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool]("SDL_SetRenderDrawColorFloat")
        self._get_render_draw_color = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetRenderDrawColor")
        self._get_render_draw_color_float = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetRenderDrawColorFloat")
        self._set_render_color_scale = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32) -> Bool]("SDL_SetRenderColorScale")
        self._get_render_color_scale = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetRenderColorScale")
        self._set_render_draw_blend_mode = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], BlendMode) -> Bool]("SDL_SetRenderDrawBlendMode")
        self._get_render_draw_blend_mode = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool]("SDL_GetRenderDrawBlendMode")
        self._render_clear = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_RenderClear")
        self._render_point = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32) -> Bool]("SDL_RenderPoint")
        self._render_points = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderPoints")
        self._render_line = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool]("SDL_RenderLine")
        self._render_lines = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderLines")
        self._render_rect = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderRect")
        self._render_rects = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderRects")
        self._render_fill_rect = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderFillRect")
        self._render_fill_rects = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderFillRects")
        self._render_texture = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderTexture")
        self._render_texture_rotated = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float64, Ptr[FPoint, ImmutExternalOrigin], FlipMode) -> Bool]("SDL_RenderTextureRotated")
        self._render_texture_affine = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin], Ptr[FPoint, ImmutExternalOrigin]) -> Bool]("SDL_RenderTextureAffine")
        self._render_texture_tiled = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderTextureTiled")
        self._render_texture9_grid = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Float32, Float32, Float32, Float32, Ptr[FRect, ImmutExternalOrigin]) -> Bool]("SDL_RenderTexture9Grid")
        self._render_texture9_grid_tiled = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[FRect, ImmutExternalOrigin], Float32, Float32, Float32, Float32, Float32, Ptr[FRect, ImmutExternalOrigin], Float32) -> Bool]("SDL_RenderTexture9GridTiled")
        self._render_geometry = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[Vertex, ImmutExternalOrigin], Int32, Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool]("SDL_RenderGeometry")
        self._render_geometry_raw = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Texture, MutExternalOrigin], Ptr[Float32, ImmutExternalOrigin], Int32, Ptr[FColor, ImmutExternalOrigin], Int32, Ptr[Float32, ImmutExternalOrigin], Int32, Int32, Ptr[NoneType, ImmutExternalOrigin], Int32, Int32) -> Bool]("SDL_RenderGeometryRaw")
        self._set_render_texture_address_mode = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], TextureAddressMode, TextureAddressMode) -> Bool]("SDL_SetRenderTextureAddressMode")
        self._get_render_texture_address_mode = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[TextureAddressMode, MutExternalOrigin], Ptr[TextureAddressMode, MutExternalOrigin]) -> Bool]("SDL_GetRenderTextureAddressMode")
        self._render_read_pixels = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_RenderReadPixels")
        self._render_present = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_RenderPresent")
        self._destroy_texture = self._dynamic_library_handle.get_function[fn(Ptr[Texture, MutExternalOrigin]) -> NoneType]("SDL_DestroyTexture")
        self._destroy_renderer = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> NoneType]("SDL_DestroyRenderer")
        self._flush_renderer = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Bool]("SDL_FlushRenderer")
        self._get_render_metal_layer = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetRenderMetalLayer")
        self._get_render_metal_command_encoder = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetRenderMetalCommandEncoder")
        self._add_vulkan_render_semaphores = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], UInt32, Int64, Int64) -> Bool]("SDL_AddVulkanRenderSemaphores")
        self._set_render_v_sync = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Int32) -> Bool]("SDL_SetRenderVSync")
        self._get_render_v_sync = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetRenderVSync")
        self._render_debug_text = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RenderDebugText")
        self._render_debug_text_format = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Float32, Float32, Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RenderDebugTextFormat")
        self._set_default_texture_scale_mode = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], ScaleMode) -> Bool]("SDL_SetDefaultTextureScaleMode")
        self._get_default_texture_scale_mode = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[ScaleMode, MutExternalOrigin]) -> Bool]("SDL_GetDefaultTextureScaleMode")
        self._create_gpu_render_state = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[GPURenderStateCreateInfo, ImmutExternalOrigin]) -> Ptr[GPURenderState, MutExternalOrigin]]("SDL_CreateGPURenderState")
        self._set_gpu_render_state_fragment_uniforms = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderState, MutExternalOrigin], UInt32, Ptr[NoneType, ImmutExternalOrigin], UInt32) -> Bool]("SDL_SetGPURenderStateFragmentUniforms")
        self._set_gpu_render_state = self._dynamic_library_handle.get_function[fn(Ptr[Renderer, MutExternalOrigin], Ptr[GPURenderState, MutExternalOrigin]) -> Bool]("SDL_SetGPURenderState")
        self._destroy_gpu_render_state = self._dynamic_library_handle.get_function[fn(Ptr[GPURenderState, MutExternalOrigin]) -> NoneType]("SDL_DestroyGPURenderState")
        self._get_sensors = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[SensorID, MutExternalOrigin]]("SDL_GetSensors")
        self._get_sensor_name_for_id = self._dynamic_library_handle.get_function[fn(SensorID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetSensorNameForID")
        self._get_sensor_type_for_id = self._dynamic_library_handle.get_function[fn(SensorID) -> SensorType]("SDL_GetSensorTypeForID")
        self._get_sensor_non_portable_type_for_id = self._dynamic_library_handle.get_function[fn(SensorID) -> Int32]("SDL_GetSensorNonPortableTypeForID")
        self._open_sensor = self._dynamic_library_handle.get_function[fn(SensorID) -> Ptr[Sensor, MutExternalOrigin]]("SDL_OpenSensor")
        self._get_sensor_from_id = self._dynamic_library_handle.get_function[fn(SensorID) -> Ptr[Sensor, MutExternalOrigin]]("SDL_GetSensorFromID")
        self._get_sensor_properties = self._dynamic_library_handle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> PropertiesID]("SDL_GetSensorProperties")
        self._get_sensor_name = self._dynamic_library_handle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetSensorName")
        self._get_sensor_type = self._dynamic_library_handle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> SensorType]("SDL_GetSensorType")
        self._get_sensor_non_portable_type = self._dynamic_library_handle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> Int32]("SDL_GetSensorNonPortableType")
        self._get_sensor_id = self._dynamic_library_handle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> SensorID]("SDL_GetSensorID")
        self._get_sensor_data = self._dynamic_library_handle.get_function[fn(Ptr[Sensor, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Int32) -> Bool]("SDL_GetSensorData")
        self._close_sensor = self._dynamic_library_handle.get_function[fn(Ptr[Sensor, MutExternalOrigin]) -> NoneType]("SDL_CloseSensor")
        self._update_sensors = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_UpdateSensors")
        self._open_title_storage = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[Storage, MutExternalOrigin]]("SDL_OpenTitleStorage")
        self._open_user_storage = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[Storage, MutExternalOrigin]]("SDL_OpenUserStorage")
        self._open_file_storage = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Storage, MutExternalOrigin]]("SDL_OpenFileStorage")
        self._open_storage = self._dynamic_library_handle.get_function[fn(Ptr[StorageInterface, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin]) -> Ptr[Storage, MutExternalOrigin]]("SDL_OpenStorage")
        self._close_storage = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin]) -> Bool]("SDL_CloseStorage")
        self._storage_ready = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin]) -> Bool]("SDL_StorageReady")
        self._get_storage_file_size = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[UInt64, MutExternalOrigin]) -> Bool]("SDL_GetStorageFileSize")
        self._read_storage_file = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, MutExternalOrigin], UInt64) -> Bool]("SDL_ReadStorageFile")
        self._write_storage_file = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], UInt64) -> Bool]("SDL_WriteStorageFile")
        self._create_storage_directory = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_CreateStorageDirectory")
        self._enumerate_storage_directory = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], EnumerateDirectoryCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_EnumerateStorageDirectory")
        self._remove_storage_path = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RemoveStoragePath")
        self._rename_storage_path = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_RenameStoragePath")
        self._copy_storage_file = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_CopyStorageFile")
        self._get_storage_path_info = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[PathInfo, MutExternalOrigin]) -> Bool]("SDL_GetStoragePathInfo")
        self._get_storage_space_remaining = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin]) -> UInt64]("SDL_GetStorageSpaceRemaining")
        self._glob_storage_directory = self._dynamic_library_handle.get_function[fn(Ptr[Storage, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], GlobFlags, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("SDL_GlobStorageDirectory")
        self._create_surface = self._dynamic_library_handle.get_function[fn(Int32, Int32, PixelFormat) -> Ptr[Surface, MutExternalOrigin]]("SDL_CreateSurface")
        self._create_surface_from = self._dynamic_library_handle.get_function[fn(Int32, Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32) -> Ptr[Surface, MutExternalOrigin]]("SDL_CreateSurfaceFrom")
        self._destroy_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> NoneType]("SDL_DestroySurface")
        self._get_surface_properties = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> PropertiesID]("SDL_GetSurfaceProperties")
        self._set_surface_colorspace = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Colorspace) -> Bool]("SDL_SetSurfaceColorspace")
        self._get_surface_colorspace = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Colorspace]("SDL_GetSurfaceColorspace")
        self._create_surface_palette = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]]("SDL_CreateSurfacePalette")
        self._set_surface_palette = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Palette, MutExternalOrigin]) -> Bool]("SDL_SetSurfacePalette")
        self._get_surface_palette = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Palette, MutExternalOrigin]]("SDL_GetSurfacePalette")
        self._add_surface_alternate_image = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_AddSurfaceAlternateImage")
        self._surface_has_alternate_images = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SurfaceHasAlternateImages")
        self._get_surface_images = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]]("SDL_GetSurfaceImages")
        self._remove_surface_alternate_images = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> NoneType]("SDL_RemoveSurfaceAlternateImages")
        self._lock_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_LockSurface")
        self._unlock_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> NoneType]("SDL_UnlockSurface")
        self._load_surface_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadSurface_IO")
        self._load_surface = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadSurface")
        self._load_bmp_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadBMP_IO")
        self._load_bmp = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadBMP")
        self._save_bmp_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("SDL_SaveBMP_IO")
        self._save_bmp = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SaveBMP")
        self._load_png_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadPNG_IO")
        self._load_png = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_LoadPNG")
        self._save_png_io = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("SDL_SavePNG_IO")
        self._save_png = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SavePNG")
        self._set_surface_rle = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Bool) -> Bool]("SDL_SetSurfaceRLE")
        self._surface_has_rle = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SurfaceHasRLE")
        self._set_surface_color_key = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Bool, UInt32) -> Bool]("SDL_SetSurfaceColorKey")
        self._surface_has_color_key = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SurfaceHasColorKey")
        self._get_surface_color_key = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceColorKey")
        self._set_surface_color_mod = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8) -> Bool]("SDL_SetSurfaceColorMod")
        self._get_surface_color_mod = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceColorMod")
        self._set_surface_alpha_mod = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], UInt8) -> Bool]("SDL_SetSurfaceAlphaMod")
        self._get_surface_alpha_mod = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceAlphaMod")
        self._set_surface_blend_mode = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], BlendMode) -> Bool]("SDL_SetSurfaceBlendMode")
        self._get_surface_blend_mode = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[BlendMode, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceBlendMode")
        self._set_surface_clip_rect = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_SetSurfaceClipRect")
        self._get_surface_clip_rect = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetSurfaceClipRect")
        self._flip_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], FlipMode) -> Bool]("SDL_FlipSurface")
        self._rotate_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Float32) -> Ptr[Surface, MutExternalOrigin]]("SDL_RotateSurface")
        self._duplicate_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_DuplicateSurface")
        self._scale_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, ScaleMode) -> Ptr[Surface, MutExternalOrigin]]("SDL_ScaleSurface")
        self._convert_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], PixelFormat) -> Ptr[Surface, MutExternalOrigin]]("SDL_ConvertSurface")
        self._convert_surface_and_colorspace = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], PixelFormat, Ptr[Palette, MutExternalOrigin], Colorspace, PropertiesID) -> Ptr[Surface, MutExternalOrigin]]("SDL_ConvertSurfaceAndColorspace")
        self._convert_pixels = self._dynamic_library_handle.get_function[fn(Int32, Int32, PixelFormat, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32) -> Bool]("SDL_ConvertPixels")
        self._convert_pixels_and_colorspace = self._dynamic_library_handle.get_function[fn(Int32, Int32, PixelFormat, Colorspace, PropertiesID, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Colorspace, PropertiesID, Ptr[NoneType, MutExternalOrigin], Int32) -> Bool]("SDL_ConvertPixelsAndColorspace")
        self._premultiply_alpha = self._dynamic_library_handle.get_function[fn(Int32, Int32, PixelFormat, Ptr[NoneType, ImmutExternalOrigin], Int32, PixelFormat, Ptr[NoneType, MutExternalOrigin], Int32, Bool) -> Bool]("SDL_PremultiplyAlpha")
        self._premultiply_surface_alpha = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Bool) -> Bool]("SDL_PremultiplySurfaceAlpha")
        self._clear_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Float32, Float32, Float32, Float32) -> Bool]("SDL_ClearSurface")
        self._fill_surface_rect = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], UInt32) -> Bool]("SDL_FillSurfaceRect")
        self._fill_surface_rects = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32, UInt32) -> Bool]("SDL_FillSurfaceRects")
        self._blit_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurface")
        self._blit_surface_unchecked = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurfaceUnchecked")
        self._blit_surface_scaled = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool]("SDL_BlitSurfaceScaled")
        self._blit_surface_unchecked_scaled = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool]("SDL_BlitSurfaceUncheckedScaled")
        self._stretch_surface = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], ScaleMode) -> Bool]("SDL_StretchSurface")
        self._blit_surface_tiled = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurfaceTiled")
        self._blit_surface_tiled_with_scale = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Float32, ScaleMode, Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurfaceTiledWithScale")
        self._blit_surface9_grid = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32, Int32, Int32, Int32, Float32, ScaleMode, Ptr[Surface, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_BlitSurface9Grid")
        self._map_surface_rgb = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8) -> UInt32]("SDL_MapSurfaceRGB")
        self._map_surface_rgba = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], UInt8, UInt8, UInt8, UInt8) -> UInt32]("SDL_MapSurfaceRGBA")
        self._read_surface_pixel = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin], Ptr[UInt8, MutExternalOrigin]) -> Bool]("SDL_ReadSurfacePixel")
        self._read_surface_pixel_float = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_ReadSurfacePixelFloat")
        self._write_surface_pixel = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, UInt8, UInt8, UInt8, UInt8) -> Bool]("SDL_WriteSurfacePixel")
        self._write_surface_pixel_float = self._dynamic_library_handle.get_function[fn(Ptr[Surface, MutExternalOrigin], Int32, Int32, Float32, Float32, Float32, Float32) -> Bool]("SDL_WriteSurfacePixelFloat")
        self._get_date_time_locale_preferences = self._dynamic_library_handle.get_function[fn(Ptr[DateFormat, MutExternalOrigin], Ptr[TimeFormat, MutExternalOrigin]) -> Bool]("SDL_GetDateTimeLocalePreferences")
        self._get_current_time = self._dynamic_library_handle.get_function[fn(Ptr[Time, MutExternalOrigin]) -> Bool]("SDL_GetCurrentTime")
        self._time_to_date_time = self._dynamic_library_handle.get_function[fn(Time, Ptr[DateTime, MutExternalOrigin], Bool) -> Bool]("SDL_TimeToDateTime")
        self._date_time_to_time = self._dynamic_library_handle.get_function[fn(Ptr[DateTime, ImmutExternalOrigin], Ptr[Time, MutExternalOrigin]) -> Bool]("SDL_DateTimeToTime")
        self._time_to_windows = self._dynamic_library_handle.get_function[fn(Time, Ptr[UInt32, MutExternalOrigin], Ptr[UInt32, MutExternalOrigin]) -> NoneType]("SDL_TimeToWindows")
        self._time_from_windows = self._dynamic_library_handle.get_function[fn(UInt32, UInt32) -> Time]("SDL_TimeFromWindows")
        self._get_days_in_month = self._dynamic_library_handle.get_function[fn(Int32, Int32) -> Int32]("SDL_GetDaysInMonth")
        self._get_day_of_year = self._dynamic_library_handle.get_function[fn(Int32, Int32, Int32) -> Int32]("SDL_GetDayOfYear")
        self._get_day_of_week = self._dynamic_library_handle.get_function[fn(Int32, Int32, Int32) -> Int32]("SDL_GetDayOfWeek")
        self._get_ticks = self._dynamic_library_handle.get_function[fn() -> UInt64]("SDL_GetTicks")
        self._get_ticks_ns = self._dynamic_library_handle.get_function[fn() -> UInt64]("SDL_GetTicksNS")
        self._get_performance_counter = self._dynamic_library_handle.get_function[fn() -> UInt64]("SDL_GetPerformanceCounter")
        self._get_performance_frequency = self._dynamic_library_handle.get_function[fn() -> UInt64]("SDL_GetPerformanceFrequency")
        self._delay = self._dynamic_library_handle.get_function[fn(UInt32) -> NoneType]("SDL_Delay")
        self._delay_ns = self._dynamic_library_handle.get_function[fn(UInt64) -> NoneType]("SDL_DelayNS")
        self._delay_precise = self._dynamic_library_handle.get_function[fn(UInt64) -> NoneType]("SDL_DelayPrecise")
        self._add_timer = self._dynamic_library_handle.get_function[fn(UInt32, TimerCallback, Ptr[NoneType, MutExternalOrigin]) -> TimerID]("SDL_AddTimer")
        self._add_timer_ns = self._dynamic_library_handle.get_function[fn(UInt64, NSTimerCallback, Ptr[NoneType, MutExternalOrigin]) -> TimerID]("SDL_AddTimerNS")
        self._remove_timer = self._dynamic_library_handle.get_function[fn(TimerID) -> Bool]("SDL_RemoveTimer")
        self._get_touch_devices = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[TouchID, MutExternalOrigin]]("SDL_GetTouchDevices")
        self._get_touch_device_name = self._dynamic_library_handle.get_function[fn(TouchID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetTouchDeviceName")
        self._get_touch_device_type = self._dynamic_library_handle.get_function[fn(TouchID) -> TouchDeviceType]("SDL_GetTouchDeviceType")
        self._get_touch_fingers = self._dynamic_library_handle.get_function[fn(TouchID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Finger, MutExternalOrigin], MutExternalOrigin]]("SDL_GetTouchFingers")
        self._get_version = self._dynamic_library_handle.get_function[fn() -> Int32]("SDL_GetVersion")
        self._get_revision = self._dynamic_library_handle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetRevision")
        self._get_num_video_drivers = self._dynamic_library_handle.get_function[fn() -> Int32]("SDL_GetNumVideoDrivers")
        self._get_video_driver = self._dynamic_library_handle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetVideoDriver")
        self._get_current_video_driver = self._dynamic_library_handle.get_function[fn() -> CStringSlice[ImmutExternalOrigin]]("SDL_GetCurrentVideoDriver")
        self._get_system_theme = self._dynamic_library_handle.get_function[fn() -> SystemTheme]("SDL_GetSystemTheme")
        self._get_displays = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[DisplayID, MutExternalOrigin]]("SDL_GetDisplays")
        self._get_primary_display = self._dynamic_library_handle.get_function[fn() -> DisplayID]("SDL_GetPrimaryDisplay")
        self._get_display_properties = self._dynamic_library_handle.get_function[fn(DisplayID) -> PropertiesID]("SDL_GetDisplayProperties")
        self._get_display_name = self._dynamic_library_handle.get_function[fn(DisplayID) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetDisplayName")
        self._get_display_bounds = self._dynamic_library_handle.get_function[fn(DisplayID, Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetDisplayBounds")
        self._get_display_usable_bounds = self._dynamic_library_handle.get_function[fn(DisplayID, Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetDisplayUsableBounds")
        self._get_natural_display_orientation = self._dynamic_library_handle.get_function[fn(DisplayID) -> DisplayOrientation]("SDL_GetNaturalDisplayOrientation")
        self._get_current_display_orientation = self._dynamic_library_handle.get_function[fn(DisplayID) -> DisplayOrientation]("SDL_GetCurrentDisplayOrientation")
        self._get_display_content_scale = self._dynamic_library_handle.get_function[fn(DisplayID) -> Float32]("SDL_GetDisplayContentScale")
        self._get_fullscreen_display_modes = self._dynamic_library_handle.get_function[fn(DisplayID, Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[DisplayMode, MutExternalOrigin], MutExternalOrigin]]("SDL_GetFullscreenDisplayModes")
        self._get_closest_fullscreen_display_mode = self._dynamic_library_handle.get_function[fn(DisplayID, Int32, Int32, Float32, Bool, Ptr[DisplayMode, MutExternalOrigin]) -> Bool]("SDL_GetClosestFullscreenDisplayMode")
        self._get_desktop_display_mode = self._dynamic_library_handle.get_function[fn(DisplayID) -> Ptr[DisplayMode, ImmutExternalOrigin]]("SDL_GetDesktopDisplayMode")
        self._get_current_display_mode = self._dynamic_library_handle.get_function[fn(DisplayID) -> Ptr[DisplayMode, ImmutExternalOrigin]]("SDL_GetCurrentDisplayMode")
        self._get_display_for_point = self._dynamic_library_handle.get_function[fn(Ptr[Point, ImmutExternalOrigin]) -> DisplayID]("SDL_GetDisplayForPoint")
        self._get_display_for_rect = self._dynamic_library_handle.get_function[fn(Ptr[Rect, ImmutExternalOrigin]) -> DisplayID]("SDL_GetDisplayForRect")
        self._get_display_for_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> DisplayID]("SDL_GetDisplayForWindow")
        self._get_window_pixel_density = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Float32]("SDL_GetWindowPixelDensity")
        self._get_window_display_scale = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Float32]("SDL_GetWindowDisplayScale")
        self._set_window_fullscreen_mode = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[DisplayMode, ImmutExternalOrigin]) -> Bool]("SDL_SetWindowFullscreenMode")
        self._get_window_fullscreen_mode = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[DisplayMode, ImmutExternalOrigin]]("SDL_GetWindowFullscreenMode")
        self._get_window_icc_profile = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[NoneType, MutExternalOrigin]]("SDL_GetWindowICCProfile")
        self._get_window_pixel_format = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> PixelFormat]("SDL_GetWindowPixelFormat")
        self._get_windows = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin]]("SDL_GetWindows")
        self._create_window = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], Int32, Int32, WindowFlags) -> Ptr[Window, MutExternalOrigin]]("SDL_CreateWindow")
        self._create_popup_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32, Int32, Int32, WindowFlags) -> Ptr[Window, MutExternalOrigin]]("SDL_CreatePopupWindow")
        self._create_window_with_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[Window, MutExternalOrigin]]("SDL_CreateWindowWithProperties")
        self._get_window_id = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> WindowID]("SDL_GetWindowID")
        self._get_window_from_id = self._dynamic_library_handle.get_function[fn(WindowID) -> Ptr[Window, MutExternalOrigin]]("SDL_GetWindowFromID")
        self._get_window_parent = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Window, MutExternalOrigin]]("SDL_GetWindowParent")
        self._get_window_properties = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> PropertiesID]("SDL_GetWindowProperties")
        self._get_window_flags = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> WindowFlags]("SDL_GetWindowFlags")
        self._set_window_title = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_SetWindowTitle")
        self._get_window_title = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> CStringSlice[ImmutExternalOrigin]]("SDL_GetWindowTitle")
        self._set_window_icon = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SetWindowIcon")
        self._set_window_position = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetWindowPosition")
        self._get_window_position = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowPosition")
        self._set_window_size = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetWindowSize")
        self._get_window_size = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowSize")
        self._get_window_safe_area = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, MutExternalOrigin]) -> Bool]("SDL_GetWindowSafeArea")
        self._set_window_aspect_ratio = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Float32, Float32) -> Bool]("SDL_SetWindowAspectRatio")
        self._get_window_aspect_ratio = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Float32, MutExternalOrigin], Ptr[Float32, MutExternalOrigin]) -> Bool]("SDL_GetWindowAspectRatio")
        self._get_window_borders_size = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowBordersSize")
        self._get_window_size_in_pixels = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowSizeInPixels")
        self._set_window_minimum_size = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetWindowMinimumSize")
        self._get_window_minimum_size = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowMinimumSize")
        self._set_window_maximum_size = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_SetWindowMaximumSize")
        self._get_window_maximum_size = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowMaximumSize")
        self._set_window_bordered = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowBordered")
        self._set_window_resizable = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowResizable")
        self._set_window_always_on_top = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowAlwaysOnTop")
        self._set_window_fill_document = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowFillDocument")
        self._show_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_ShowWindow")
        self._hide_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_HideWindow")
        self._raise_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_RaiseWindow")
        self._maximize_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_MaximizeWindow")
        self._minimize_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_MinimizeWindow")
        self._restore_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_RestoreWindow")
        self._set_window_fullscreen = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowFullscreen")
        self._sync_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_SyncWindow")
        self._window_has_surface = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_WindowHasSurface")
        self._get_window_surface = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Surface, MutExternalOrigin]]("SDL_GetWindowSurface")
        self._set_window_surface_v_sync = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32) -> Bool]("SDL_SetWindowSurfaceVSync")
        self._get_window_surface_v_sync = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GetWindowSurfaceVSync")
        self._update_window_surface = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_UpdateWindowSurface")
        self._update_window_surface_rects = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin], Int32) -> Bool]("SDL_UpdateWindowSurfaceRects")
        self._destroy_window_surface = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_DestroyWindowSurface")
        self._set_window_keyboard_grab = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowKeyboardGrab")
        self._set_window_mouse_grab = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowMouseGrab")
        self._get_window_keyboard_grab = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_GetWindowKeyboardGrab")
        self._get_window_mouse_grab = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_GetWindowMouseGrab")
        self._get_grabbed_window = self._dynamic_library_handle.get_function[fn() -> Ptr[Window, MutExternalOrigin]]("SDL_GetGrabbedWindow")
        self._set_window_mouse_rect = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Rect, ImmutExternalOrigin]) -> Bool]("SDL_SetWindowMouseRect")
        self._get_window_mouse_rect = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Ptr[Rect, ImmutExternalOrigin]]("SDL_GetWindowMouseRect")
        self._set_window_opacity = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Float32) -> Bool]("SDL_SetWindowOpacity")
        self._get_window_opacity = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Float32]("SDL_GetWindowOpacity")
        self._set_window_parent = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_SetWindowParent")
        self._set_window_modal = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowModal")
        self._set_window_focusable = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Bool) -> Bool]("SDL_SetWindowFocusable")
        self._show_window_system_menu = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Int32, Int32) -> Bool]("SDL_ShowWindowSystemMenu")
        self._set_window_hit_test = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], HitTest, Ptr[NoneType, MutExternalOrigin]) -> Bool]("SDL_SetWindowHitTest")
        self._set_window_shape = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Ptr[Surface, MutExternalOrigin]) -> Bool]("SDL_SetWindowShape")
        self._flash_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], FlashOperation) -> Bool]("SDL_FlashWindow")
        self._set_window_progress_state = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], ProgressState) -> Bool]("SDL_SetWindowProgressState")
        self._get_window_progress_state = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> ProgressState]("SDL_GetWindowProgressState")
        self._set_window_progress_value = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], Float32) -> Bool]("SDL_SetWindowProgressValue")
        self._get_window_progress_value = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Float32]("SDL_GetWindowProgressValue")
        self._destroy_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> NoneType]("SDL_DestroyWindow")
        self._screen_saver_enabled = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_ScreenSaverEnabled")
        self._enable_screen_saver = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_EnableScreenSaver")
        self._disable_screen_saver = self._dynamic_library_handle.get_function[fn() -> Bool]("SDL_DisableScreenSaver")
        self._gl_load_library = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_GL_LoadLibrary")
        self._gl_get_proc_address = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> FunctionPointer]("SDL_GL_GetProcAddress")
        self._egl_get_proc_address = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> FunctionPointer]("SDL_EGL_GetProcAddress")
        self._gl_unload_library = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_GL_UnloadLibrary")
        self._gl_extension_supported = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_GL_ExtensionSupported")
        self._gl_reset_attributes = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_GL_ResetAttributes")
        self._gl_set_attribute = self._dynamic_library_handle.get_function[fn(GLAttr, Int32) -> Bool]("SDL_GL_SetAttribute")
        self._gl_get_attribute = self._dynamic_library_handle.get_function[fn(GLAttr, Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GL_GetAttribute")
        self._gl_create_context = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> GLContext]("SDL_GL_CreateContext")
        self._gl_make_current = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], GLContext) -> Bool]("SDL_GL_MakeCurrent")
        self._gl_get_current_window = self._dynamic_library_handle.get_function[fn() -> Ptr[Window, MutExternalOrigin]]("SDL_GL_GetCurrentWindow")
        self._gl_get_current_context = self._dynamic_library_handle.get_function[fn() -> GLContext]("SDL_GL_GetCurrentContext")
        self._egl_get_current_display = self._dynamic_library_handle.get_function[fn() -> EGLDisplay]("SDL_EGL_GetCurrentDisplay")
        self._egl_get_current_config = self._dynamic_library_handle.get_function[fn() -> EGLConfig]("SDL_EGL_GetCurrentConfig")
        self._egl_get_window_surface = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> EGLSurface]("SDL_EGL_GetWindowSurface")
        self._egl_set_attribute_callbacks = self._dynamic_library_handle.get_function[fn(EGLAttribArrayCallback, EGLIntArrayCallback, EGLIntArrayCallback, Ptr[NoneType, MutExternalOrigin]) -> NoneType]("SDL_EGL_SetAttributeCallbacks")
        self._gl_set_swap_interval = self._dynamic_library_handle.get_function[fn(Int32) -> Bool]("SDL_GL_SetSwapInterval")
        self._gl_get_swap_interval = self._dynamic_library_handle.get_function[fn(Ptr[Int32, MutExternalOrigin]) -> Bool]("SDL_GL_GetSwapInterval")
        self._gl_swap_window = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin]) -> Bool]("SDL_GL_SwapWindow")
        self._gl_destroy_context = self._dynamic_library_handle.get_function[fn(GLContext) -> Bool]("SDL_GL_DestroyContext")
        self._vulkan_load_library = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin]) -> Bool]("SDL_Vulkan_LoadLibrary")
        self._vulkan_get_vk_get_instance_proc_addr = self._dynamic_library_handle.get_function[fn() -> FunctionPointer]("SDL_Vulkan_GetVkGetInstanceProcAddr")
        self._vulkan_unload_library = self._dynamic_library_handle.get_function[fn() -> NoneType]("SDL_Vulkan_UnloadLibrary")
        self._vulkan_get_instance_extensions = self._dynamic_library_handle.get_function[fn(Ptr[UInt32, MutExternalOrigin]) -> Ptr[CStringSlice[ImmutExternalOrigin], ImmutExternalOrigin]]("SDL_Vulkan_GetInstanceExtensions")
        self._vulkan_create_surface = self._dynamic_library_handle.get_function[fn(Ptr[Window, MutExternalOrigin], VkInstance, Ptr[VkAllocationCallbacks, ImmutExternalOrigin], Ptr[VkSurfaceKHR, MutExternalOrigin]) -> Bool]("SDL_Vulkan_CreateSurface")
        self._vulkan_destroy_surface = self._dynamic_library_handle.get_function[fn(VkInstance, VkSurfaceKHR, Ptr[VkAllocationCallbacks, ImmutExternalOrigin]) -> NoneType]("SDL_Vulkan_DestroySurface")
        self._vulkan_get_presentation_support = self._dynamic_library_handle.get_function[fn(VkInstance, VkPhysicalDevice, UInt32) -> Bool]("SDL_Vulkan_GetPresentationSupport")

    fn get_num_audio_drivers(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumAudioDrivers
        """
        return self._get_num_audio_drivers()

    fn get_audio_driver(self, index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioDriver
        """
        var c_string = self._get_audio_driver(Ptr(to=index).bitcast[Int32]()[])
        if not c_string.unsafe_ptr():
            raise "Error in get_audio_driver call. See official documentation for details."
        return c_string

    fn get_current_audio_driver(self) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCurrentAudioDriver
        """
        var c_string = self._get_current_audio_driver()
        if not c_string.unsafe_ptr():
            raise "Error in get_current_audio_driver call. See official documentation for details."
        return c_string

    fn get_audio_playback_devices(
        self, count: Ptr[Int32]
    ) raises -> Ptr[AudioDeviceID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioPlaybackDevices
        """
        var result_pointer = self._get_audio_playback_devices(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_audio_recording_devices(
        self, count: Ptr[Int32]
    ) raises -> Ptr[AudioDeviceID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioRecordingDevices
        """
        var result_pointer = self._get_audio_recording_devices(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_audio_device_name(
        self, devid: AudioDeviceID
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceName
        """
        var c_string = self._get_audio_device_name(Ptr(to=devid).bitcast[AudioDeviceID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_audio_device_format(
        self, devid: AudioDeviceID, spec: Ptr[AudioSpec], sample_frames: Ptr[Int32]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceFormat
        """
        var success_status = self._get_audio_device_format(
            Ptr(to=devid).bitcast[AudioDeviceID]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
            Ptr(to=sample_frames).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_audio_device_channel_map(
        self, devid: AudioDeviceID, count: Ptr[Int32]
    ) raises -> Ptr[Int32, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceChannelMap
        """
        var result_pointer = self._get_audio_device_channel_map(
            Ptr(to=devid).bitcast[AudioDeviceID]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise "Error in get_audio_device_channel_map call. See official documentation for details."
        return result_pointer

    fn open_audio_device(self, devid: AudioDeviceID, spec: Ptr[AudioSpec]) -> AudioDeviceID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenAudioDevice
        """
        return self._open_audio_device(
            Ptr(to=devid).bitcast[AudioDeviceID]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        )

    fn is_audio_device_physical(self, devid: AudioDeviceID) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IsAudioDevicePhysical
        """
        return self._is_audio_device_physical(Ptr(to=devid).bitcast[AudioDeviceID]()[])

    fn is_audio_device_playback(self, devid: AudioDeviceID) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IsAudioDevicePlayback
        """
        return self._is_audio_device_playback(Ptr(to=devid).bitcast[AudioDeviceID]()[])

    fn pause_audio_device(self, devid: AudioDeviceID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PauseAudioDevice
        """
        var success_status = self._pause_audio_device(Ptr(to=devid).bitcast[AudioDeviceID]()[])
        if not success_status:
            raise self._get_error()

    fn resume_audio_device(self, devid: AudioDeviceID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ResumeAudioDevice
        """
        var success_status = self._resume_audio_device(Ptr(to=devid).bitcast[AudioDeviceID]()[])
        if not success_status:
            raise self._get_error()

    fn audio_device_paused(self, devid: AudioDeviceID) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AudioDevicePaused
        """
        return self._audio_device_paused(Ptr(to=devid).bitcast[AudioDeviceID]()[])

    fn get_audio_device_gain(self, devid: AudioDeviceID) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceGain
        """
        return self._get_audio_device_gain(Ptr(to=devid).bitcast[AudioDeviceID]()[])

    fn set_audio_device_gain(self, devid: AudioDeviceID, gain: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAudioDeviceGain
        """
        var success_status = self._set_audio_device_gain(
            Ptr(to=devid).bitcast[AudioDeviceID]()[], Ptr(to=gain).bitcast[Float32]()[]
        )
        if not success_status:
            raise self._get_error()

    fn close_audio_device(self, devid: AudioDeviceID):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CloseAudioDevice
        """
        self._close_audio_device(Ptr(to=devid).bitcast[AudioDeviceID]()[])

    fn bind_audio_streams(
        self,
        devid: AudioDeviceID,
        streams: Ptr[Ptr[AudioStream, MutExternalOrigin]],
        num_streams: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindAudioStreams
        """
        var success_status = self._bind_audio_streams(
            Ptr(to=devid).bitcast[AudioDeviceID]()[],
            Ptr(to=streams).bitcast[Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_streams).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn bind_audio_stream(self, devid: AudioDeviceID, stream: Ptr[AudioStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindAudioStream
        """
        var success_status = self._bind_audio_stream(
            Ptr(to=devid).bitcast[AudioDeviceID]()[],
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn unbind_audio_streams(
        self, streams: Ptr[Ptr[AudioStream, MutExternalOrigin]], num_streams: Int32
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UnbindAudioStreams
        """
        self._unbind_audio_streams(
            Ptr(to=streams).bitcast[Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_streams).bitcast[Int32]()[],
        )

    fn unbind_audio_stream(self, stream: Ptr[AudioStream]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UnbindAudioStream
        """
        self._unbind_audio_stream(Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[])

    fn get_audio_stream_device(self, stream: Ptr[AudioStream]) -> AudioDeviceID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamDevice
        """
        return self._get_audio_stream_device(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )

    fn create_audio_stream(
        self, src_spec: Ptr[AudioSpec], dst_spec: Ptr[AudioSpec]
    ) raises -> Ptr[AudioStream, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateAudioStream
        """
        var result_pointer = self._create_audio_stream(
            Ptr(to=src_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=dst_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_audio_stream_properties(self, stream: Ptr[AudioStream]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamProperties
        """
        return self._get_audio_stream_properties(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )

    fn get_audio_stream_format(
        self, stream: Ptr[AudioStream], src_spec: Ptr[AudioSpec], dst_spec: Ptr[AudioSpec]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamFormat
        """
        var success_status = self._get_audio_stream_format(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=src_spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
            Ptr(to=dst_spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_audio_stream_format(
        self, stream: Ptr[AudioStream], src_spec: Ptr[AudioSpec], dst_spec: Ptr[AudioSpec]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamFormat
        """
        var success_status = self._set_audio_stream_format(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=src_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=dst_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_audio_stream_frequency_ratio(self, stream: Ptr[AudioStream]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamFrequencyRatio
        """
        return self._get_audio_stream_frequency_ratio(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )

    fn set_audio_stream_frequency_ratio(self, stream: Ptr[AudioStream], ratio: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamFrequencyRatio
        """
        var success_status = self._set_audio_stream_frequency_ratio(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=ratio).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_audio_stream_gain(self, stream: Ptr[AudioStream]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamGain
        """
        return self._get_audio_stream_gain(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )

    fn set_audio_stream_gain(self, stream: Ptr[AudioStream], gain: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamGain
        """
        var success_status = self._set_audio_stream_gain(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=gain).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_audio_stream_input_channel_map(
        self, stream: Ptr[AudioStream], count: Ptr[Int32]
    ) raises -> Ptr[Int32, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamInputChannelMap
        """
        var result_pointer = self._get_audio_stream_input_channel_map(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise "Error in get_audio_stream_input_channel_map call. See official documentation for details."
        return result_pointer

    fn get_audio_stream_output_channel_map(
        self, stream: Ptr[AudioStream], count: Ptr[Int32]
    ) raises -> Ptr[Int32, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamOutputChannelMap
        """
        var result_pointer = self._get_audio_stream_output_channel_map(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise "Error in get_audio_stream_output_channel_map call. See official documentation for details."
        return result_pointer

    fn set_audio_stream_input_channel_map(
        self, stream: Ptr[AudioStream], chmap: Ptr[Int32], count: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamInputChannelMap
        """
        var success_status = self._set_audio_stream_input_channel_map(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=chmap).bitcast[Ptr[Int32, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_audio_stream_output_channel_map(
        self, stream: Ptr[AudioStream], chmap: Ptr[Int32], count: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamOutputChannelMap
        """
        var success_status = self._set_audio_stream_output_channel_map(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=chmap).bitcast[Ptr[Int32, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn put_audio_stream_data(
        self, stream: Ptr[AudioStream], buf: Ptr[NoneType], len: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamData
        """
        var success_status = self._put_audio_stream_data(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=buf).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=len).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn put_audio_stream_data_no_copy(
        self,
        stream: Ptr[AudioStream],
        buf: Ptr[NoneType],
        len: Int32,
        callback: AudioStreamDataCompleteCallback,
        userdata: Ptr[NoneType],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamDataNoCopy
        """
        var success_status = self._put_audio_stream_data_no_copy(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=buf).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=len).bitcast[Int32]()[],
            Ptr(to=callback).bitcast[AudioStreamDataCompleteCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn put_audio_stream_planar_data(
        self,
        stream: Ptr[AudioStream],
        channel_buffers: Ptr[Ptr[NoneType, ImmutExternalOrigin]],
        num_channels: Int32,
        num_samples: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamPlanarData
        """
        var success_status = self._put_audio_stream_planar_data(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=channel_buffers).bitcast[Ptr[Ptr[NoneType, ImmutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_channels).bitcast[Int32]()[],
            Ptr(to=num_samples).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_audio_stream_data(
        self, stream: Ptr[AudioStream], buf: Ptr[NoneType], len: Int32
    ) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamData
        """
        return self._get_audio_stream_data(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=buf).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=len).bitcast[Int32]()[],
        )

    fn get_audio_stream_available(self, stream: Ptr[AudioStream]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamAvailable
        """
        return self._get_audio_stream_available(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )

    fn get_audio_stream_queued(self, stream: Ptr[AudioStream]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamQueued
        """
        return self._get_audio_stream_queued(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )

    fn flush_audio_stream(self, stream: Ptr[AudioStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FlushAudioStream
        """
        var success_status = self._flush_audio_stream(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn clear_audio_stream(self, stream: Ptr[AudioStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ClearAudioStream
        """
        var success_status = self._clear_audio_stream(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn pause_audio_stream_device(self, stream: Ptr[AudioStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PauseAudioStreamDevice
        """
        var success_status = self._pause_audio_stream_device(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn resume_audio_stream_device(self, stream: Ptr[AudioStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ResumeAudioStreamDevice
        """
        var success_status = self._resume_audio_stream_device(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn audio_stream_device_paused(self, stream: Ptr[AudioStream]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AudioStreamDevicePaused
        """
        return self._audio_stream_device_paused(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )

    fn lock_audio_stream(self, stream: Ptr[AudioStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LockAudioStream
        """
        var success_status = self._lock_audio_stream(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn unlock_audio_stream(self, stream: Ptr[AudioStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UnlockAudioStream
        """
        var success_status = self._unlock_audio_stream(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn set_audio_stream_get_callback(
        self, stream: Ptr[AudioStream], callback: AudioStreamCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamGetCallback
        """
        var success_status = self._set_audio_stream_get_callback(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=callback).bitcast[AudioStreamCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_audio_stream_put_callback(
        self, stream: Ptr[AudioStream], callback: AudioStreamCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamPutCallback
        """
        var success_status = self._set_audio_stream_put_callback(
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
            Ptr(to=callback).bitcast[AudioStreamCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn destroy_audio_stream(self, stream: Ptr[AudioStream]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyAudioStream
        """
        self._destroy_audio_stream(Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[])

    fn open_audio_device_stream(
        self,
        devid: AudioDeviceID,
        spec: Ptr[AudioSpec],
        callback: AudioStreamCallback,
        userdata: Ptr[NoneType],
    ) raises -> Ptr[AudioStream, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenAudioDeviceStream
        """
        var result_pointer = self._open_audio_device_stream(
            Ptr(to=devid).bitcast[AudioDeviceID]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=callback).bitcast[AudioStreamCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_audio_postmix_callback(
        self, devid: AudioDeviceID, callback: AudioPostmixCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAudioPostmixCallback
        """
        var success_status = self._set_audio_postmix_callback(
            Ptr(to=devid).bitcast[AudioDeviceID]()[],
            Ptr(to=callback).bitcast[AudioPostmixCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn load_wav_io(
        self,
        src: Ptr[IOStream],
        closeio: Bool,
        spec: Ptr[AudioSpec],
        audio_buf: Ptr[Ptr[UInt8, MutExternalOrigin]],
        audio_len: Ptr[UInt32],
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadWAV_IO
        """
        return self._load_wav_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
            Ptr(to=audio_buf).bitcast[Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin]]()[],
            Ptr(to=audio_len).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        )

    fn load_wav(
        self,
        path: CStringSlice,
        spec: Ptr[AudioSpec],
        audio_buf: Ptr[Ptr[UInt8, MutExternalOrigin]],
        audio_len: Ptr[UInt32],
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadWAV
        """
        return self._load_wav(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
            Ptr(to=audio_buf).bitcast[Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin]]()[],
            Ptr(to=audio_len).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        )

    fn mix_audio(
        self, dst: Ptr[UInt8], src: Ptr[UInt8], format: AudioFormat, len: UInt32, volume: Float32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_MixAudio
        """
        var success_status = self._mix_audio(
            Ptr(to=dst).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=src).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
            Ptr(to=format).bitcast[AudioFormat]()[],
            Ptr(to=len).bitcast[UInt32]()[],
            Ptr(to=volume).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn convert_audio_samples(
        self,
        src_spec: Ptr[AudioSpec],
        src_data: Ptr[UInt8],
        src_len: Int32,
        dst_spec: Ptr[AudioSpec],
        dst_data: Ptr[Ptr[UInt8, MutExternalOrigin]],
        dst_len: Ptr[Int32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ConvertAudioSamples
        """
        var success_status = self._convert_audio_samples(
            Ptr(to=src_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=src_data).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
            Ptr(to=src_len).bitcast[Int32]()[],
            Ptr(to=dst_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=dst_data).bitcast[Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin]]()[],
            Ptr(to=dst_len).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_audio_format_name(self, format: AudioFormat) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAudioFormatName
        """
        var c_string = self._get_audio_format_name(Ptr(to=format).bitcast[AudioFormat]()[])
        return c_string

    fn get_silence_value_for_format(self, format: AudioFormat) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSilenceValueForFormat
        """
        return self._get_silence_value_for_format(Ptr(to=format).bitcast[AudioFormat]()[])

    fn compose_custom_blend_mode(
        self,
        srcColorFactor: BlendFactor,
        dstColorFactor: BlendFactor,
        colorOperation: BlendOperation,
        srcAlphaFactor: BlendFactor,
        dstAlphaFactor: BlendFactor,
        alphaOperation: BlendOperation,
    ) -> BlendMode:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ComposeCustomBlendMode
        """
        return self._compose_custom_blend_mode(
            Ptr(to=srcColorFactor).bitcast[BlendFactor]()[],
            Ptr(to=dstColorFactor).bitcast[BlendFactor]()[],
            Ptr(to=colorOperation).bitcast[BlendOperation]()[],
            Ptr(to=srcAlphaFactor).bitcast[BlendFactor]()[],
            Ptr(to=dstAlphaFactor).bitcast[BlendFactor]()[],
            Ptr(to=alphaOperation).bitcast[BlendOperation]()[],
        )

    fn get_num_camera_drivers(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumCameraDrivers
        """
        return self._get_num_camera_drivers()

    fn get_camera_driver(self, index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCameraDriver
        """
        var c_string = self._get_camera_driver(Ptr(to=index).bitcast[Int32]()[])
        if not c_string.unsafe_ptr():
            raise "Error in get_camera_driver call. See official documentation for details."
        return c_string

    fn get_current_camera_driver(self) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCurrentCameraDriver
        """
        var c_string = self._get_current_camera_driver()
        if not c_string.unsafe_ptr():
            raise "Error in get_current_camera_driver call. See official documentation for details."
        return c_string

    fn get_cameras(self, count: Ptr[Int32]) raises -> Ptr[CameraID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCameras
        """
        var result_pointer = self._get_cameras(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_camera_supported_formats(
        self, instance_id: CameraID, count: Ptr[Int32]
    ) raises -> Ptr[Ptr[CameraSpec, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCameraSupportedFormats
        """
        var result_pointer = self._get_camera_supported_formats(
            Ptr(to=instance_id).bitcast[CameraID]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_camera_name(self, instance_id: CameraID) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCameraName
        """
        var c_string = self._get_camera_name(Ptr(to=instance_id).bitcast[CameraID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_camera_position(self, instance_id: CameraID) -> CameraPosition:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCameraPosition
        """
        return self._get_camera_position(Ptr(to=instance_id).bitcast[CameraID]()[])

    fn open_camera(
        self, instance_id: CameraID, spec: Ptr[CameraSpec]
    ) raises -> Ptr[Camera, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenCamera
        """
        var result_pointer = self._open_camera(
            Ptr(to=instance_id).bitcast[CameraID]()[],
            Ptr(to=spec).bitcast[Ptr[CameraSpec, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_camera_permission_state(self, camera: Ptr[Camera]) -> CameraPermissionState:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCameraPermissionState
        """
        return self._get_camera_permission_state(
            Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[]
        )

    fn get_camera_id(self, camera: Ptr[Camera]) -> CameraID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCameraID
        """
        return self._get_camera_id(Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[])

    fn get_camera_properties(self, camera: Ptr[Camera]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCameraProperties
        """
        return self._get_camera_properties(
            Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[]
        )

    fn get_camera_format(self, camera: Ptr[Camera], spec: Ptr[CameraSpec]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCameraFormat
        """
        var success_status = self._get_camera_format(
            Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[CameraSpec, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn acquire_camera_frame(
        self, camera: Ptr[Camera], timestampNS: Ptr[UInt64]
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AcquireCameraFrame
        """
        var result_pointer = self._acquire_camera_frame(
            Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[],
            Ptr(to=timestampNS).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise "Error in acquire_camera_frame call. See official documentation for details."
        return result_pointer

    fn release_camera_frame(self, camera: Ptr[Camera], frame: Ptr[Surface]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseCameraFrame
        """
        self._release_camera_frame(
            Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[],
            Ptr(to=frame).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        )

    fn close_camera(self, camera: Ptr[Camera]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CloseCamera
        """
        self._close_camera(Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[])

    fn set_clipboard_text(self, text: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetClipboardText
        """
        var success_status = self._set_clipboard_text(
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not success_status:
            raise self._get_error()

    fn get_clipboard_text(self) -> Ptr[c_char, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetClipboardText
        """
        return self._get_clipboard_text()

    fn has_clipboard_text(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasClipboardText
        """
        return self._has_clipboard_text()

    fn set_primary_selection_text(self, text: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetPrimarySelectionText
        """
        var success_status = self._set_primary_selection_text(
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not success_status:
            raise self._get_error()

    fn get_primary_selection_text(self) -> Ptr[c_char, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPrimarySelectionText
        """
        return self._get_primary_selection_text()

    fn has_primary_selection_text(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasPrimarySelectionText
        """
        return self._has_primary_selection_text()

    fn set_clipboard_data(
        self,
        callback: ClipboardDataCallback,
        cleanup: ClipboardCleanupCallback,
        userdata: Ptr[NoneType],
        mime_types: Ptr[CStringSlice[ImmutExternalOrigin]],
        num_mime_types: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetClipboardData
        """
        var success_status = self._set_clipboard_data(
            Ptr(to=callback).bitcast[ClipboardDataCallback]()[],
            Ptr(to=cleanup).bitcast[ClipboardCleanupCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=mime_types).bitcast[Ptr[CStringSlice[ImmutExternalOrigin], MutExternalOrigin]]()[],
            Ptr(to=num_mime_types).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn clear_clipboard_data(self) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ClearClipboardData
        """
        var success_status = self._clear_clipboard_data()
        if not success_status:
            raise self._get_error()

    fn get_clipboard_data(
        self, mime_type: CStringSlice, size: Ptr[Int32]
    ) raises -> Ptr[NoneType, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetClipboardData
        """
        var result_pointer = self._get_clipboard_data(
            mime_type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=size).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn has_clipboard_data(self, mime_type: CStringSlice) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasClipboardData
        """
        return self._has_clipboard_data(
            mime_type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn get_clipboard_mime_types(
        self, num_mime_types: Ptr[Int32]
    ) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetClipboardMimeTypes
        """
        var result_pointer = self._get_clipboard_mime_types(
            Ptr(to=num_mime_types).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_error(self, fmt: CStringSlice) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetError
        """
        return self._set_error(fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]())

    fn set_error_v(self, fmt: CStringSlice, ap: Int32) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetErrorV
        """
        return self._set_error_v(
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=ap).bitcast[Int32]()[],
        )

    fn out_of_memory(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OutOfMemory
        """
        return self._out_of_memory()

    fn get_error(self) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetError
        """
        var c_string = self._get_error()
        return c_string

    fn clear_error(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ClearError
        """
        return self._clear_error()

    fn pump_events(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PumpEvents
        """
        self._pump_events()

    fn peep_events(
        self,
        events: Ptr[Event],
        numevents: Int32,
        action: EventAction,
        minType: UInt32,
        maxType: UInt32,
    ) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PeepEvents
        """
        return self._peep_events(
            Ptr(to=events).bitcast[Ptr[Event, MutExternalOrigin]]()[],
            Ptr(to=numevents).bitcast[Int32]()[],
            Ptr(to=action).bitcast[EventAction]()[],
            Ptr(to=minType).bitcast[UInt32]()[],
            Ptr(to=maxType).bitcast[UInt32]()[],
        )

    fn has_event(self, type: UInt32) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasEvent
        """
        return self._has_event(Ptr(to=type).bitcast[UInt32]()[])

    fn has_events(self, minType: UInt32, maxType: UInt32) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasEvents
        """
        return self._has_events(
            Ptr(to=minType).bitcast[UInt32]()[], Ptr(to=maxType).bitcast[UInt32]()[]
        )

    fn flush_event(self, type: UInt32):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FlushEvent
        """
        self._flush_event(Ptr(to=type).bitcast[UInt32]()[])

    fn flush_events(self, minType: UInt32, maxType: UInt32):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FlushEvents
        """
        self._flush_events(
            Ptr(to=minType).bitcast[UInt32]()[], Ptr(to=maxType).bitcast[UInt32]()[]
        )

    fn poll_event(self, event: Ptr[Event]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PollEvent
        """
        return self._poll_event(Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[])

    fn wait_event(self, event: Ptr[Event]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WaitEvent
        """
        return self._wait_event(Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[])

    fn wait_event_timeout(self, event: Ptr[Event], timeoutMS: Int32) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WaitEventTimeout
        """
        return self._wait_event_timeout(
            Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[],
            Ptr(to=timeoutMS).bitcast[Int32]()[],
        )

    fn push_event(self, event: Ptr[Event]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PushEvent
        """
        return self._push_event(Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[])

    fn set_event_filter(self, filter: EventFilter, userdata: Ptr[NoneType]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetEventFilter
        """
        self._set_event_filter(
            Ptr(to=filter).bitcast[EventFilter]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )

    fn get_event_filter(
        self, filter: Ptr[EventFilter], userdata: Ptr[Ptr[NoneType, MutExternalOrigin]]
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetEventFilter
        """
        return self._get_event_filter(
            Ptr(to=filter).bitcast[Ptr[EventFilter, MutExternalOrigin]]()[],
            Ptr(to=userdata).bitcast[Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]]()[],
        )

    fn add_event_watch(self, filter: EventFilter, userdata: Ptr[NoneType]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AddEventWatch
        """
        var success_status = self._add_event_watch(
            Ptr(to=filter).bitcast[EventFilter]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn remove_event_watch(self, filter: EventFilter, userdata: Ptr[NoneType]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RemoveEventWatch
        """
        self._remove_event_watch(
            Ptr(to=filter).bitcast[EventFilter]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )

    fn filter_events(self, filter: EventFilter, userdata: Ptr[NoneType]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FilterEvents
        """
        self._filter_events(
            Ptr(to=filter).bitcast[EventFilter]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )

    fn set_event_enabled(self, type: UInt32, enabled: Bool):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetEventEnabled
        """
        self._set_event_enabled(
            Ptr(to=type).bitcast[UInt32]()[], Ptr(to=enabled).bitcast[Bool]()[]
        )

    fn event_enabled(self, type: UInt32) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EventEnabled
        """
        return self._event_enabled(Ptr(to=type).bitcast[UInt32]()[])

    fn register_events(self, numevents: Int32) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RegisterEvents
        """
        return self._register_events(Ptr(to=numevents).bitcast[Int32]()[])

    fn get_window_from_event(self, event: Ptr[Event]) raises -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowFromEvent
        """
        var result_pointer = self._get_window_from_event(
            Ptr(to=event).bitcast[Ptr[Event, ImmutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_window_from_event call. See official documentation for details."
        return result_pointer

    fn get_event_description(self, event: Ptr[Event], buf: Ptr[c_char], buflen: Int32) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetEventDescription
        """
        return self._get_event_description(
            Ptr(to=event).bitcast[Ptr[Event, ImmutExternalOrigin]]()[],
            Ptr(to=buf).bitcast[Ptr[c_char, MutExternalOrigin]]()[],
            Ptr(to=buflen).bitcast[Int32]()[],
        )

    fn get_base_path(self) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetBasePath
        """
        var c_string = self._get_base_path()
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_pref_path(
        self, org: CStringSlice, app: CStringSlice
    ) raises -> Ptr[c_char, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPrefPath
        """
        var result_pointer = self._get_pref_path(
            org.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            app.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise "Error in get_pref_path call. See official documentation for details."
        return result_pointer

    fn get_user_folder(self, folder: Folder) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetUserFolder
        """
        var c_string = self._get_user_folder(Ptr(to=folder).bitcast[Folder]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn create_directory(self, path: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateDirectory
        """
        var success_status = self._create_directory(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not success_status:
            raise self._get_error()

    fn enumerate_directory(
        self, path: CStringSlice, callback: EnumerateDirectoryCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EnumerateDirectory
        """
        var success_status = self._enumerate_directory(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=callback).bitcast[EnumerateDirectoryCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn remove_path(self, path: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RemovePath
        """
        var success_status = self._remove_path(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not success_status:
            raise self._get_error()

    fn rename_path(self, oldpath: CStringSlice, newpath: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenamePath
        """
        var success_status = self._rename_path(
            oldpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            newpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn copy_file(self, oldpath: CStringSlice, newpath: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CopyFile
        """
        var success_status = self._copy_file(
            oldpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            newpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn get_path_info(self, path: CStringSlice, info: Ptr[PathInfo]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPathInfo
        """
        return self._get_path_info(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=info).bitcast[Ptr[PathInfo, MutExternalOrigin]]()[],
        )

    fn glob_directory(
        self, path: CStringSlice, pattern: CStringSlice, flags: GlobFlags, count: Ptr[Int32]
    ) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GlobDirectory
        """
        var result_pointer = self._glob_directory(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            pattern.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=flags).bitcast[GlobFlags]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_current_directory(self) raises -> Ptr[c_char, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCurrentDirectory
        """
        var result_pointer = self._get_current_directory()
        if not result_pointer:
            raise "Error in get_current_directory call. See official documentation for details."
        return result_pointer

    fn add_gamepad_mapping(self, mapping: CStringSlice) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AddGamepadMapping
        """
        return self._add_gamepad_mapping(
            mapping.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn add_gamepad_mappings_from_io(self, src: Ptr[IOStream], closeio: Bool) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AddGamepadMappingsFromIO
        """
        return self._add_gamepad_mappings_from_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )

    fn add_gamepad_mappings_from_file(self, file: CStringSlice) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AddGamepadMappingsFromFile
        """
        return self._add_gamepad_mappings_from_file(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn reload_gamepad_mappings(self) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReloadGamepadMappings
        """
        var success_status = self._reload_gamepad_mappings()
        if not success_status:
            raise self._get_error()

    fn get_gamepad_mappings(
        self, count: Ptr[Int32]
    ) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappings
        """
        var result_pointer = self._get_gamepad_mappings(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_gamepad_mapping_for_guid(self, guid: GUID) raises -> Ptr[c_char, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappingForGUID
        """
        var result_pointer = self._get_gamepad_mapping_for_guid(Ptr(to=guid).bitcast[GUID]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_gamepad_mapping(self, gamepad: Ptr[Gamepad]) raises -> Ptr[c_char, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadMapping
        """
        var result_pointer = self._get_gamepad_mapping(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_gamepad_mapping(self, instance_id: JoystickID, mapping: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGamepadMapping
        """
        var success_status = self._set_gamepad_mapping(
            Ptr(to=instance_id).bitcast[JoystickID]()[],
            mapping.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn has_gamepad(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasGamepad
        """
        return self._has_gamepad()

    fn get_gamepads(self, count: Ptr[Int32]) raises -> Ptr[JoystickID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepads
        """
        var result_pointer = self._get_gamepads(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn is_gamepad(self, instance_id: JoystickID) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IsGamepad
        """
        return self._is_gamepad(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_gamepad_name_for_id(
        self, instance_id: JoystickID
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadNameForID
        """
        var c_string = self._get_gamepad_name_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_gamepad_path_for_id(
        self, instance_id: JoystickID
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadPathForID
        """
        var c_string = self._get_gamepad_path_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_gamepad_player_index_for_id(self, instance_id: JoystickID) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadPlayerIndexForID
        """
        return self._get_gamepad_player_index_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_gamepad_guid_for_id(self, instance_id: JoystickID) -> GUID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadGUIDForID
        """
        return self._get_gamepad_guid_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_gamepad_vendor_for_id(self, instance_id: JoystickID) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadVendorForID
        """
        return self._get_gamepad_vendor_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_gamepad_product_for_id(self, instance_id: JoystickID) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductForID
        """
        return self._get_gamepad_product_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_gamepad_product_version_for_id(self, instance_id: JoystickID) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductVersionForID
        """
        return self._get_gamepad_product_version_for_id(
            Ptr(to=instance_id).bitcast[JoystickID]()[]
        )

    fn get_gamepad_type_for_id(self, instance_id: JoystickID) -> GamepadType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadTypeForID
        """
        return self._get_gamepad_type_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_real_gamepad_type_for_id(self, instance_id: JoystickID) -> GamepadType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRealGamepadTypeForID
        """
        return self._get_real_gamepad_type_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_gamepad_mapping_for_id(
        self, instance_id: JoystickID
    ) raises -> Ptr[c_char, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappingForID
        """
        var result_pointer = self._get_gamepad_mapping_for_id(
            Ptr(to=instance_id).bitcast[JoystickID]()[]
        )
        if not result_pointer:
            raise "Error in get_gamepad_mapping_for_id call. See official documentation for details."
        return result_pointer

    fn open_gamepad(self, instance_id: JoystickID) raises -> Ptr[Gamepad, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenGamepad
        """
        var result_pointer = self._open_gamepad(Ptr(to=instance_id).bitcast[JoystickID]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_gamepad_from_id(
        self, instance_id: JoystickID
    ) raises -> Ptr[Gamepad, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadFromID
        """
        var result_pointer = self._get_gamepad_from_id(Ptr(to=instance_id).bitcast[JoystickID]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_gamepad_from_player_index(self, player_index: Int32) -> Ptr[Gamepad, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadFromPlayerIndex
        """
        return self._get_gamepad_from_player_index(Ptr(to=player_index).bitcast[Int32]()[])

    fn get_gamepad_properties(self, gamepad: Ptr[Gamepad]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadProperties
        """
        return self._get_gamepad_properties(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_gamepad_id(self, gamepad: Ptr[Gamepad]) -> JoystickID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadID
        """
        return self._get_gamepad_id(Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[])

    fn get_gamepad_name(self, gamepad: Ptr[Gamepad]) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadName
        """
        var c_string = self._get_gamepad_name(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise "Error in get_gamepad_name call. See official documentation for details."
        return c_string

    fn get_gamepad_path(self, gamepad: Ptr[Gamepad]) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadPath
        """
        var c_string = self._get_gamepad_path(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise "Error in get_gamepad_path call. See official documentation for details."
        return c_string

    fn get_gamepad_type(self, gamepad: Ptr[Gamepad]) -> GamepadType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadType
        """
        return self._get_gamepad_type(Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[])

    fn get_real_gamepad_type(self, gamepad: Ptr[Gamepad]) -> GamepadType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRealGamepadType
        """
        return self._get_real_gamepad_type(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_gamepad_player_index(self, gamepad: Ptr[Gamepad]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadPlayerIndex
        """
        return self._get_gamepad_player_index(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn set_gamepad_player_index(self, gamepad: Ptr[Gamepad], player_index: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGamepadPlayerIndex
        """
        var success_status = self._set_gamepad_player_index(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=player_index).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_gamepad_vendor(self, gamepad: Ptr[Gamepad]) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadVendor
        """
        return self._get_gamepad_vendor(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_gamepad_product(self, gamepad: Ptr[Gamepad]) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadProduct
        """
        return self._get_gamepad_product(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_gamepad_product_version(self, gamepad: Ptr[Gamepad]) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductVersion
        """
        return self._get_gamepad_product_version(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_gamepad_firmware_version(self, gamepad: Ptr[Gamepad]) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadFirmwareVersion
        """
        return self._get_gamepad_firmware_version(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_gamepad_serial(self, gamepad: Ptr[Gamepad]) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadSerial
        """
        var c_string = self._get_gamepad_serial(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise "Error in get_gamepad_serial call. See official documentation for details."
        return c_string

    fn get_gamepad_steam_handle(self, gamepad: Ptr[Gamepad]) -> UInt64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadSteamHandle
        """
        return self._get_gamepad_steam_handle(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_gamepad_connection_state(self, gamepad: Ptr[Gamepad]) -> JoystickConnectionState:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadConnectionState
        """
        return self._get_gamepad_connection_state(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_gamepad_power_info(self, gamepad: Ptr[Gamepad], percent: Ptr[Int32]) -> PowerState:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadPowerInfo
        """
        return self._get_gamepad_power_info(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=percent).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )

    fn gamepad_connected(self, gamepad: Ptr[Gamepad]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GamepadConnected
        """
        return self._gamepad_connected(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_gamepad_joystick(
        self, gamepad: Ptr[Gamepad]
    ) raises -> Ptr[Joystick, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadJoystick
        """
        var result_pointer = self._get_gamepad_joystick(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_gamepad_events_enabled(self, enabled: Bool):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGamepadEventsEnabled
        """
        self._set_gamepad_events_enabled(Ptr(to=enabled).bitcast[Bool]()[])

    fn gamepad_events_enabled(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GamepadEventsEnabled
        """
        return self._gamepad_events_enabled()

    fn get_gamepad_bindings(
        self, gamepad: Ptr[Gamepad], count: Ptr[Int32]
    ) raises -> Ptr[Ptr[GamepadBinding, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadBindings
        """
        var result_pointer = self._get_gamepad_bindings(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn update_gamepads(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UpdateGamepads
        """
        self._update_gamepads()

    fn get_gamepad_type_from_string(self, str: CStringSlice) -> GamepadType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadTypeFromString
        """
        return self._get_gamepad_type_from_string(
            str.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn get_gamepad_string_for_type(
        self, type: GamepadType
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForType
        """
        var c_string = self._get_gamepad_string_for_type(Ptr(to=type).bitcast[GamepadType]()[])
        if not c_string.unsafe_ptr():
            raise "Error in get_gamepad_string_for_type call. See official documentation for details."
        return c_string

    fn get_gamepad_axis_from_string(self, str: CStringSlice) -> GamepadAxis:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadAxisFromString
        """
        return self._get_gamepad_axis_from_string(
            str.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn get_gamepad_string_for_axis(
        self, axis: GamepadAxis
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForAxis
        """
        var c_string = self._get_gamepad_string_for_axis(Ptr(to=axis).bitcast[GamepadAxis]()[])
        if not c_string.unsafe_ptr():
            raise "Error in get_gamepad_string_for_axis call. See official documentation for details."
        return c_string

    fn gamepad_has_axis(self, gamepad: Ptr[Gamepad], axis: GamepadAxis) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GamepadHasAxis
        """
        return self._gamepad_has_axis(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=axis).bitcast[GamepadAxis]()[],
        )

    fn get_gamepad_axis(self, gamepad: Ptr[Gamepad], axis: GamepadAxis) -> Int16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadAxis
        """
        return self._get_gamepad_axis(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=axis).bitcast[GamepadAxis]()[],
        )

    fn get_gamepad_button_from_string(self, str: CStringSlice) -> GamepadButton:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonFromString
        """
        return self._get_gamepad_button_from_string(
            str.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn get_gamepad_string_for_button(
        self, button: GamepadButton
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForButton
        """
        var c_string = self._get_gamepad_string_for_button(
            Ptr(to=button).bitcast[GamepadButton]()[]
        )
        if not c_string.unsafe_ptr():
            raise "Error in get_gamepad_string_for_button call. See official documentation for details."
        return c_string

    fn gamepad_has_button(self, gamepad: Ptr[Gamepad], button: GamepadButton) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GamepadHasButton
        """
        return self._gamepad_has_button(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=button).bitcast[GamepadButton]()[],
        )

    fn get_gamepad_button(self, gamepad: Ptr[Gamepad], button: GamepadButton) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadButton
        """
        return self._get_gamepad_button(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=button).bitcast[GamepadButton]()[],
        )

    fn get_gamepad_button_label_for_type(
        self, type: GamepadType, button: GamepadButton
    ) -> GamepadButtonLabel:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonLabelForType
        """
        return self._get_gamepad_button_label_for_type(
            Ptr(to=type).bitcast[GamepadType]()[], Ptr(to=button).bitcast[GamepadButton]()[]
        )

    fn get_gamepad_button_label(
        self, gamepad: Ptr[Gamepad], button: GamepadButton
    ) -> GamepadButtonLabel:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonLabel
        """
        return self._get_gamepad_button_label(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=button).bitcast[GamepadButton]()[],
        )

    fn get_num_gamepad_touchpads(self, gamepad: Ptr[Gamepad]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumGamepadTouchpads
        """
        return self._get_num_gamepad_touchpads(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
        )

    fn get_num_gamepad_touchpad_fingers(self, gamepad: Ptr[Gamepad], touchpad: Int32) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumGamepadTouchpadFingers
        """
        return self._get_num_gamepad_touchpad_fingers(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=touchpad).bitcast[Int32]()[],
        )

    fn get_gamepad_touchpad_finger(
        self,
        gamepad: Ptr[Gamepad],
        touchpad: Int32,
        finger: Int32,
        down: Ptr[Bool],
        x: Ptr[Float32],
        y: Ptr[Float32],
        pressure: Ptr[Float32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadTouchpadFinger
        """
        var success_status = self._get_gamepad_touchpad_finger(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=touchpad).bitcast[Int32]()[],
            Ptr(to=finger).bitcast[Int32]()[],
            Ptr(to=down).bitcast[Ptr[Bool, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=pressure).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn gamepad_has_sensor(self, gamepad: Ptr[Gamepad], type: SensorType) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GamepadHasSensor
        """
        return self._gamepad_has_sensor(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=type).bitcast[SensorType]()[],
        )

    fn set_gamepad_sensor_enabled(
        self, gamepad: Ptr[Gamepad], type: SensorType, enabled: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGamepadSensorEnabled
        """
        var success_status = self._set_gamepad_sensor_enabled(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=type).bitcast[SensorType]()[],
            Ptr(to=enabled).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn gamepad_sensor_enabled(self, gamepad: Ptr[Gamepad], type: SensorType) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GamepadSensorEnabled
        """
        return self._gamepad_sensor_enabled(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=type).bitcast[SensorType]()[],
        )

    fn get_gamepad_sensor_data_rate(self, gamepad: Ptr[Gamepad], type: SensorType) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadSensorDataRate
        """
        return self._get_gamepad_sensor_data_rate(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=type).bitcast[SensorType]()[],
        )

    fn get_gamepad_sensor_data(
        self, gamepad: Ptr[Gamepad], type: SensorType, data: Ptr[Float32], num_values: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadSensorData
        """
        var success_status = self._get_gamepad_sensor_data(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=type).bitcast[SensorType]()[],
            Ptr(to=data).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=num_values).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn rumble_gamepad(
        self,
        gamepad: Ptr[Gamepad],
        low_frequency_rumble: UInt16,
        high_frequency_rumble: UInt16,
        duration_ms: UInt32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RumbleGamepad
        """
        var success_status = self._rumble_gamepad(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=low_frequency_rumble).bitcast[UInt16]()[],
            Ptr(to=high_frequency_rumble).bitcast[UInt16]()[],
            Ptr(to=duration_ms).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn rumble_gamepad_triggers(
        self, gamepad: Ptr[Gamepad], left_rumble: UInt16, right_rumble: UInt16, duration_ms: UInt32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RumbleGamepadTriggers
        """
        var success_status = self._rumble_gamepad_triggers(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=left_rumble).bitcast[UInt16]()[],
            Ptr(to=right_rumble).bitcast[UInt16]()[],
            Ptr(to=duration_ms).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_gamepad_led(self, gamepad: Ptr[Gamepad], red: UInt8, green: UInt8, blue: UInt8) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGamepadLED
        """
        var success_status = self._set_gamepad_led(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=red).bitcast[UInt8]()[],
            Ptr(to=green).bitcast[UInt8]()[],
            Ptr(to=blue).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn send_gamepad_effect(self, gamepad: Ptr[Gamepad], data: Ptr[NoneType], size: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SendGamepadEffect
        """
        var success_status = self._send_gamepad_effect(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=size).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn close_gamepad(self, gamepad: Ptr[Gamepad]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CloseGamepad
        """
        self._close_gamepad(Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[])

    fn get_gamepad_apple_sf_symbols_name_for_button(
        self, gamepad: Ptr[Gamepad], button: GamepadButton
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadAppleSFSymbolsNameForButton
        """
        var c_string = self._get_gamepad_apple_sf_symbols_name_for_button(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=button).bitcast[GamepadButton]()[],
        )
        if not c_string.unsafe_ptr():
            raise "Error in get_gamepad_apple_sf_symbols_name_for_button call. See official documentation for details."
        return c_string

    fn get_gamepad_apple_sf_symbols_name_for_axis(
        self, gamepad: Ptr[Gamepad], axis: GamepadAxis
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGamepadAppleSFSymbolsNameForAxis
        """
        var c_string = self._get_gamepad_apple_sf_symbols_name_for_axis(
            Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
            Ptr(to=axis).bitcast[GamepadAxis]()[],
        )
        if not c_string.unsafe_ptr():
            raise "Error in get_gamepad_apple_sf_symbols_name_for_axis call. See official documentation for details."
        return c_string

    fn gpu_supports_shader_formats(
        self, format_flags: GPUShaderFormat, name: CStringSlice
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GPUSupportsShaderFormats
        """
        return self._gpu_supports_shader_formats(
            Ptr(to=format_flags).bitcast[GPUShaderFormat]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn gpu_supports_properties(self, props: PropertiesID) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GPUSupportsProperties
        """
        return self._gpu_supports_properties(Ptr(to=props).bitcast[PropertiesID]()[])

    fn create_gpu_device(
        self, format_flags: GPUShaderFormat, debug_mode: Bool, name: CStringSlice
    ) raises -> Ptr[GPUDevice, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPUDevice
        """
        var result_pointer = self._create_gpu_device(
            Ptr(to=format_flags).bitcast[GPUShaderFormat]()[],
            Ptr(to=debug_mode).bitcast[Bool]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_gpu_device_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[GPUDevice, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPUDeviceWithProperties
        """
        var result_pointer = self._create_gpu_device_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn destroy_gpu_device(self, device: Ptr[GPUDevice]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyGPUDevice
        """
        self._destroy_gpu_device(Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[])

    fn get_num_gpu_drivers(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumGPUDrivers
        """
        return self._get_num_gpu_drivers()

    fn get_gpu_driver(self, index: Int32) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGPUDriver
        """
        var c_string = self._get_gpu_driver(Ptr(to=index).bitcast[Int32]()[])
        return c_string

    fn get_gpu_device_driver(
        self, device: Ptr[GPUDevice]
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGPUDeviceDriver
        """
        var c_string = self._get_gpu_device_driver(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise "Error in get_gpu_device_driver call. See official documentation for details."
        return c_string

    fn get_gpu_shader_formats(self, device: Ptr[GPUDevice]) -> GPUShaderFormat:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGPUShaderFormats
        """
        return self._get_gpu_shader_formats(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
        )

    fn get_gpu_device_properties(self, device: Ptr[GPUDevice]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGPUDeviceProperties
        """
        return self._get_gpu_device_properties(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
        )

    fn create_gpu_compute_pipeline(
        self, device: Ptr[GPUDevice], createinfo: Ptr[GPUComputePipelineCreateInfo]
    ) raises -> Ptr[GPUComputePipeline, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPUComputePipeline
        """
        var result_pointer = self._create_gpu_compute_pipeline(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=createinfo).bitcast[Ptr[GPUComputePipelineCreateInfo, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_gpu_graphics_pipeline(
        self, device: Ptr[GPUDevice], createinfo: Ptr[GPUGraphicsPipelineCreateInfo]
    ) raises -> Ptr[GPUGraphicsPipeline, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPUGraphicsPipeline
        """
        var result_pointer = self._create_gpu_graphics_pipeline(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=createinfo).bitcast[Ptr[GPUGraphicsPipelineCreateInfo, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_gpu_sampler(
        self, device: Ptr[GPUDevice], createinfo: Ptr[GPUSamplerCreateInfo]
    ) raises -> Ptr[GPUSampler, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPUSampler
        """
        var result_pointer = self._create_gpu_sampler(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=createinfo).bitcast[Ptr[GPUSamplerCreateInfo, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_gpu_shader(
        self, device: Ptr[GPUDevice], createinfo: Ptr[GPUShaderCreateInfo]
    ) raises -> Ptr[GPUShader, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPUShader
        """
        var result_pointer = self._create_gpu_shader(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=createinfo).bitcast[Ptr[GPUShaderCreateInfo, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_gpu_texture(
        self, device: Ptr[GPUDevice], createinfo: Ptr[GPUTextureCreateInfo]
    ) raises -> Ptr[GPUTexture, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPUTexture
        """
        var result_pointer = self._create_gpu_texture(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=createinfo).bitcast[Ptr[GPUTextureCreateInfo, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_gpu_buffer(
        self, device: Ptr[GPUDevice], createinfo: Ptr[GPUBufferCreateInfo]
    ) raises -> Ptr[GPUBuffer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPUBuffer
        """
        var result_pointer = self._create_gpu_buffer(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=createinfo).bitcast[Ptr[GPUBufferCreateInfo, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_gpu_transfer_buffer(
        self, device: Ptr[GPUDevice], createinfo: Ptr[GPUTransferBufferCreateInfo]
    ) raises -> Ptr[GPUTransferBuffer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPUTransferBuffer
        """
        var result_pointer = self._create_gpu_transfer_buffer(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=createinfo).bitcast[Ptr[GPUTransferBufferCreateInfo, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_gpu_buffer_name(
        self, device: Ptr[GPUDevice], buffer: Ptr[GPUBuffer], text: CStringSlice
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPUBufferName
        """
        self._set_gpu_buffer_name(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn set_gpu_texture_name(
        self, device: Ptr[GPUDevice], texture: Ptr[GPUTexture], text: CStringSlice
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPUTextureName
        """
        self._set_gpu_texture_name(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[GPUTexture, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn insert_gpu_debug_label(self, command_buffer: Ptr[GPUCommandBuffer], text: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_InsertGPUDebugLabel
        """
        self._insert_gpu_debug_label(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn push_gpu_debug_group(self, command_buffer: Ptr[GPUCommandBuffer], name: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PushGPUDebugGroup
        """
        self._push_gpu_debug_group(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn pop_gpu_debug_group(self, command_buffer: Ptr[GPUCommandBuffer]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PopGPUDebugGroup
        """
        self._pop_gpu_debug_group(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
        )

    fn release_gpu_texture(self, device: Ptr[GPUDevice], texture: Ptr[GPUTexture]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTexture
        """
        self._release_gpu_texture(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[GPUTexture, MutExternalOrigin]]()[],
        )

    fn release_gpu_sampler(self, device: Ptr[GPUDevice], sampler: Ptr[GPUSampler]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUSampler
        """
        self._release_gpu_sampler(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=sampler).bitcast[Ptr[GPUSampler, MutExternalOrigin]]()[],
        )

    fn release_gpu_buffer(self, device: Ptr[GPUDevice], buffer: Ptr[GPUBuffer]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUBuffer
        """
        self._release_gpu_buffer(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
        )

    fn release_gpu_transfer_buffer(
        self, device: Ptr[GPUDevice], transfer_buffer: Ptr[GPUTransferBuffer]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTransferBuffer
        """
        self._release_gpu_transfer_buffer(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=transfer_buffer).bitcast[Ptr[GPUTransferBuffer, MutExternalOrigin]]()[],
        )

    fn release_gpu_compute_pipeline(
        self, device: Ptr[GPUDevice], compute_pipeline: Ptr[GPUComputePipeline]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUComputePipeline
        """
        self._release_gpu_compute_pipeline(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=compute_pipeline).bitcast[Ptr[GPUComputePipeline, MutExternalOrigin]]()[],
        )

    fn release_gpu_shader(self, device: Ptr[GPUDevice], shader: Ptr[GPUShader]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUShader
        """
        self._release_gpu_shader(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=shader).bitcast[Ptr[GPUShader, MutExternalOrigin]]()[],
        )

    fn release_gpu_graphics_pipeline(
        self, device: Ptr[GPUDevice], graphics_pipeline: Ptr[GPUGraphicsPipeline]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUGraphicsPipeline
        """
        self._release_gpu_graphics_pipeline(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=graphics_pipeline).bitcast[Ptr[GPUGraphicsPipeline, MutExternalOrigin]]()[],
        )

    fn acquire_gpu_command_buffer(
        self, device: Ptr[GPUDevice]
    ) raises -> Ptr[GPUCommandBuffer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AcquireGPUCommandBuffer
        """
        var result_pointer = self._acquire_gpu_command_buffer(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn push_gpu_vertex_uniform_data(
        self,
        command_buffer: Ptr[GPUCommandBuffer],
        slot_index: UInt32,
        data: Ptr[NoneType],
        length: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PushGPUVertexUniformData
        """
        self._push_gpu_vertex_uniform_data(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            Ptr(to=slot_index).bitcast[UInt32]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=length).bitcast[UInt32]()[],
        )

    fn push_gpu_fragment_uniform_data(
        self,
        command_buffer: Ptr[GPUCommandBuffer],
        slot_index: UInt32,
        data: Ptr[NoneType],
        length: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PushGPUFragmentUniformData
        """
        self._push_gpu_fragment_uniform_data(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            Ptr(to=slot_index).bitcast[UInt32]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=length).bitcast[UInt32]()[],
        )

    fn push_gpu_compute_uniform_data(
        self,
        command_buffer: Ptr[GPUCommandBuffer],
        slot_index: UInt32,
        data: Ptr[NoneType],
        length: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PushGPUComputeUniformData
        """
        self._push_gpu_compute_uniform_data(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            Ptr(to=slot_index).bitcast[UInt32]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=length).bitcast[UInt32]()[],
        )

    fn begin_gpu_render_pass(
        self,
        command_buffer: Ptr[GPUCommandBuffer],
        color_target_infos: Ptr[GPUColorTargetInfo],
        num_color_targets: UInt32,
        depth_stencil_target_info: Ptr[GPUDepthStencilTargetInfo],
    ) raises -> Ptr[GPURenderPass, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BeginGPURenderPass
        """
        var result_pointer = self._begin_gpu_render_pass(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            Ptr(to=color_target_infos).bitcast[Ptr[GPUColorTargetInfo, ImmutExternalOrigin]]()[],
            Ptr(to=num_color_targets).bitcast[UInt32]()[],
            Ptr(to=depth_stencil_target_info).bitcast[Ptr[GPUDepthStencilTargetInfo, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise "Error in begin_gpu_render_pass call. See official documentation for details."
        return result_pointer

    fn bind_gpu_graphics_pipeline(
        self, render_pass: Ptr[GPURenderPass], graphics_pipeline: Ptr[GPUGraphicsPipeline]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUGraphicsPipeline
        """
        self._bind_gpu_graphics_pipeline(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=graphics_pipeline).bitcast[Ptr[GPUGraphicsPipeline, MutExternalOrigin]]()[],
        )

    fn set_gpu_viewport(self, render_pass: Ptr[GPURenderPass], viewport: Ptr[GPUViewport]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPUViewport
        """
        self._set_gpu_viewport(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=viewport).bitcast[Ptr[GPUViewport, ImmutExternalOrigin]]()[],
        )

    fn set_gpu_scissor(self, render_pass: Ptr[GPURenderPass], scissor: Ptr[Rect]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPUScissor
        """
        self._set_gpu_scissor(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=scissor).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )

    fn set_gpu_blend_constants(self, render_pass: Ptr[GPURenderPass], blend_constants: FColor):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPUBlendConstants
        """
        self._set_gpu_blend_constants(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=blend_constants).bitcast[FColor]()[],
        )

    fn set_gpu_stencil_reference(self, render_pass: Ptr[GPURenderPass], reference: UInt8):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPUStencilReference
        """
        self._set_gpu_stencil_reference(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=reference).bitcast[UInt8]()[],
        )

    fn bind_gpu_vertex_buffers(
        self,
        render_pass: Ptr[GPURenderPass],
        first_slot: UInt32,
        bindings: Ptr[GPUBufferBinding],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexBuffers
        """
        self._bind_gpu_vertex_buffers(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=bindings).bitcast[Ptr[GPUBufferBinding, ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn bind_gpu_index_buffer(
        self,
        render_pass: Ptr[GPURenderPass],
        binding: Ptr[GPUBufferBinding],
        index_element_size: GPUIndexElementSize,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUIndexBuffer
        """
        self._bind_gpu_index_buffer(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=binding).bitcast[Ptr[GPUBufferBinding, ImmutExternalOrigin]]()[],
            Ptr(to=index_element_size).bitcast[GPUIndexElementSize]()[],
        )

    fn bind_gpu_vertex_samplers(
        self,
        render_pass: Ptr[GPURenderPass],
        first_slot: UInt32,
        texture_sampler_bindings: Ptr[GPUTextureSamplerBinding],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexSamplers
        """
        self._bind_gpu_vertex_samplers(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=texture_sampler_bindings).bitcast[Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn bind_gpu_vertex_storage_textures(
        self,
        render_pass: Ptr[GPURenderPass],
        first_slot: UInt32,
        storage_textures: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageTextures
        """
        self._bind_gpu_vertex_storage_textures(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=storage_textures).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn bind_gpu_vertex_storage_buffers(
        self,
        render_pass: Ptr[GPURenderPass],
        first_slot: UInt32,
        storage_buffers: Ptr[Ptr[GPUBuffer, MutExternalOrigin]],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageBuffers
        """
        self._bind_gpu_vertex_storage_buffers(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=storage_buffers).bitcast[Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn bind_gpu_fragment_samplers(
        self,
        render_pass: Ptr[GPURenderPass],
        first_slot: UInt32,
        texture_sampler_bindings: Ptr[GPUTextureSamplerBinding],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentSamplers
        """
        self._bind_gpu_fragment_samplers(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=texture_sampler_bindings).bitcast[Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn bind_gpu_fragment_storage_textures(
        self,
        render_pass: Ptr[GPURenderPass],
        first_slot: UInt32,
        storage_textures: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageTextures
        """
        self._bind_gpu_fragment_storage_textures(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=storage_textures).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn bind_gpu_fragment_storage_buffers(
        self,
        render_pass: Ptr[GPURenderPass],
        first_slot: UInt32,
        storage_buffers: Ptr[Ptr[GPUBuffer, MutExternalOrigin]],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageBuffers
        """
        self._bind_gpu_fragment_storage_buffers(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=storage_buffers).bitcast[Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn draw_gpu_indexed_primitives(
        self,
        render_pass: Ptr[GPURenderPass],
        num_indices: UInt32,
        num_instances: UInt32,
        first_index: UInt32,
        vertex_offset: Int32,
        first_instance: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DrawGPUIndexedPrimitives
        """
        self._draw_gpu_indexed_primitives(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=num_indices).bitcast[UInt32]()[],
            Ptr(to=num_instances).bitcast[UInt32]()[],
            Ptr(to=first_index).bitcast[UInt32]()[],
            Ptr(to=vertex_offset).bitcast[Int32]()[],
            Ptr(to=first_instance).bitcast[UInt32]()[],
        )

    fn draw_gpu_primitives(
        self,
        render_pass: Ptr[GPURenderPass],
        num_vertices: UInt32,
        num_instances: UInt32,
        first_vertex: UInt32,
        first_instance: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DrawGPUPrimitives
        """
        self._draw_gpu_primitives(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=num_vertices).bitcast[UInt32]()[],
            Ptr(to=num_instances).bitcast[UInt32]()[],
            Ptr(to=first_vertex).bitcast[UInt32]()[],
            Ptr(to=first_instance).bitcast[UInt32]()[],
        )

    fn draw_gpu_primitives_indirect(
        self,
        render_pass: Ptr[GPURenderPass],
        buffer: Ptr[GPUBuffer],
        offset: UInt32,
        draw_count: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DrawGPUPrimitivesIndirect
        """
        self._draw_gpu_primitives_indirect(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
            Ptr(to=offset).bitcast[UInt32]()[],
            Ptr(to=draw_count).bitcast[UInt32]()[],
        )

    fn draw_gpu_indexed_primitives_indirect(
        self,
        render_pass: Ptr[GPURenderPass],
        buffer: Ptr[GPUBuffer],
        offset: UInt32,
        draw_count: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DrawGPUIndexedPrimitivesIndirect
        """
        self._draw_gpu_indexed_primitives_indirect(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
            Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
            Ptr(to=offset).bitcast[UInt32]()[],
            Ptr(to=draw_count).bitcast[UInt32]()[],
        )

    fn end_gpu_render_pass(self, render_pass: Ptr[GPURenderPass]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EndGPURenderPass
        """
        self._end_gpu_render_pass(
            Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[]
        )

    fn begin_gpu_compute_pass(
        self,
        command_buffer: Ptr[GPUCommandBuffer],
        storage_texture_bindings: Ptr[GPUStorageTextureReadWriteBinding],
        num_storage_texture_bindings: UInt32,
        storage_buffer_bindings: Ptr[GPUStorageBufferReadWriteBinding],
        num_storage_buffer_bindings: UInt32,
    ) -> Ptr[GPUComputePass, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BeginGPUComputePass
        """
        return self._begin_gpu_compute_pass(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            Ptr(to=storage_texture_bindings).bitcast[Ptr[GPUStorageTextureReadWriteBinding, ImmutExternalOrigin]]()[],
            Ptr(to=num_storage_texture_bindings).bitcast[UInt32]()[],
            Ptr(to=storage_buffer_bindings).bitcast[Ptr[GPUStorageBufferReadWriteBinding, ImmutExternalOrigin]]()[],
            Ptr(to=num_storage_buffer_bindings).bitcast[UInt32]()[],
        )

    fn bind_gpu_compute_pipeline(
        self, compute_pass: Ptr[GPUComputePass], compute_pipeline: Ptr[GPUComputePipeline]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUComputePipeline
        """
        self._bind_gpu_compute_pipeline(
            Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
            Ptr(to=compute_pipeline).bitcast[Ptr[GPUComputePipeline, MutExternalOrigin]]()[],
        )

    fn bind_gpu_compute_samplers(
        self,
        compute_pass: Ptr[GPUComputePass],
        first_slot: UInt32,
        texture_sampler_bindings: Ptr[GPUTextureSamplerBinding],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeSamplers
        """
        self._bind_gpu_compute_samplers(
            Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=texture_sampler_bindings).bitcast[Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn bind_gpu_compute_storage_textures(
        self,
        compute_pass: Ptr[GPUComputePass],
        first_slot: UInt32,
        storage_textures: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageTextures
        """
        self._bind_gpu_compute_storage_textures(
            Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=storage_textures).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn bind_gpu_compute_storage_buffers(
        self,
        compute_pass: Ptr[GPUComputePass],
        first_slot: UInt32,
        storage_buffers: Ptr[Ptr[GPUBuffer, MutExternalOrigin]],
        num_bindings: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageBuffers
        """
        self._bind_gpu_compute_storage_buffers(
            Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
            Ptr(to=first_slot).bitcast[UInt32]()[],
            Ptr(to=storage_buffers).bitcast[Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_bindings).bitcast[UInt32]()[],
        )

    fn dispatch_gpu_compute(
        self,
        compute_pass: Ptr[GPUComputePass],
        groupcount_x: UInt32,
        groupcount_y: UInt32,
        groupcount_z: UInt32,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DispatchGPUCompute
        """
        self._dispatch_gpu_compute(
            Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
            Ptr(to=groupcount_x).bitcast[UInt32]()[],
            Ptr(to=groupcount_y).bitcast[UInt32]()[],
            Ptr(to=groupcount_z).bitcast[UInt32]()[],
        )

    fn dispatch_gpu_compute_indirect(
        self, compute_pass: Ptr[GPUComputePass], buffer: Ptr[GPUBuffer], offset: UInt32
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DispatchGPUComputeIndirect
        """
        self._dispatch_gpu_compute_indirect(
            Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
            Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
            Ptr(to=offset).bitcast[UInt32]()[],
        )

    fn end_gpu_compute_pass(self, compute_pass: Ptr[GPUComputePass]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EndGPUComputePass
        """
        self._end_gpu_compute_pass(
            Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[]
        )

    fn map_gpu_transfer_buffer(
        self, device: Ptr[GPUDevice], transfer_buffer: Ptr[GPUTransferBuffer], cycle: Bool
    ) raises -> Ptr[NoneType, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_MapGPUTransferBuffer
        """
        var result_pointer = self._map_gpu_transfer_buffer(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=transfer_buffer).bitcast[Ptr[GPUTransferBuffer, MutExternalOrigin]]()[],
            Ptr(to=cycle).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn unmap_gpu_transfer_buffer(
        self, device: Ptr[GPUDevice], transfer_buffer: Ptr[GPUTransferBuffer]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UnmapGPUTransferBuffer
        """
        self._unmap_gpu_transfer_buffer(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=transfer_buffer).bitcast[Ptr[GPUTransferBuffer, MutExternalOrigin]]()[],
        )

    fn begin_gpu_copy_pass(
        self, command_buffer: Ptr[GPUCommandBuffer]
    ) -> Ptr[GPUCopyPass, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BeginGPUCopyPass
        """
        return self._begin_gpu_copy_pass(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
        )

    fn upload_to_gpu_texture(
        self,
        copy_pass: Ptr[GPUCopyPass],
        source: Ptr[GPUTextureTransferInfo],
        destination: Ptr[GPUTextureRegion],
        cycle: Bool,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UploadToGPUTexture
        """
        self._upload_to_gpu_texture(
            Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
            Ptr(to=source).bitcast[Ptr[GPUTextureTransferInfo, ImmutExternalOrigin]]()[],
            Ptr(to=destination).bitcast[Ptr[GPUTextureRegion, ImmutExternalOrigin]]()[],
            Ptr(to=cycle).bitcast[Bool]()[],
        )

    fn upload_to_gpu_buffer(
        self,
        copy_pass: Ptr[GPUCopyPass],
        source: Ptr[GPUTransferBufferLocation],
        destination: Ptr[GPUBufferRegion],
        cycle: Bool,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UploadToGPUBuffer
        """
        self._upload_to_gpu_buffer(
            Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
            Ptr(to=source).bitcast[Ptr[GPUTransferBufferLocation, ImmutExternalOrigin]]()[],
            Ptr(to=destination).bitcast[Ptr[GPUBufferRegion, ImmutExternalOrigin]]()[],
            Ptr(to=cycle).bitcast[Bool]()[],
        )

    fn copy_gpu_texture_to_texture(
        self,
        copy_pass: Ptr[GPUCopyPass],
        source: Ptr[GPUTextureLocation],
        destination: Ptr[GPUTextureLocation],
        w: UInt32,
        h: UInt32,
        d: UInt32,
        cycle: Bool,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CopyGPUTextureToTexture
        """
        self._copy_gpu_texture_to_texture(
            Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
            Ptr(to=source).bitcast[Ptr[GPUTextureLocation, ImmutExternalOrigin]]()[],
            Ptr(to=destination).bitcast[Ptr[GPUTextureLocation, ImmutExternalOrigin]]()[],
            Ptr(to=w).bitcast[UInt32]()[],
            Ptr(to=h).bitcast[UInt32]()[],
            Ptr(to=d).bitcast[UInt32]()[],
            Ptr(to=cycle).bitcast[Bool]()[],
        )

    fn copy_gpu_buffer_to_buffer(
        self,
        copy_pass: Ptr[GPUCopyPass],
        source: Ptr[GPUBufferLocation],
        destination: Ptr[GPUBufferLocation],
        size: UInt32,
        cycle: Bool,
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CopyGPUBufferToBuffer
        """
        self._copy_gpu_buffer_to_buffer(
            Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
            Ptr(to=source).bitcast[Ptr[GPUBufferLocation, ImmutExternalOrigin]]()[],
            Ptr(to=destination).bitcast[Ptr[GPUBufferLocation, ImmutExternalOrigin]]()[],
            Ptr(to=size).bitcast[UInt32]()[],
            Ptr(to=cycle).bitcast[Bool]()[],
        )

    fn download_from_gpu_texture(
        self,
        copy_pass: Ptr[GPUCopyPass],
        source: Ptr[GPUTextureRegion],
        destination: Ptr[GPUTextureTransferInfo],
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUTexture
        """
        self._download_from_gpu_texture(
            Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
            Ptr(to=source).bitcast[Ptr[GPUTextureRegion, ImmutExternalOrigin]]()[],
            Ptr(to=destination).bitcast[Ptr[GPUTextureTransferInfo, ImmutExternalOrigin]]()[],
        )

    fn download_from_gpu_buffer(
        self,
        copy_pass: Ptr[GPUCopyPass],
        source: Ptr[GPUBufferRegion],
        destination: Ptr[GPUTransferBufferLocation],
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUBuffer
        """
        self._download_from_gpu_buffer(
            Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
            Ptr(to=source).bitcast[Ptr[GPUBufferRegion, ImmutExternalOrigin]]()[],
            Ptr(to=destination).bitcast[Ptr[GPUTransferBufferLocation, ImmutExternalOrigin]]()[],
        )

    fn end_gpu_copy_pass(self, copy_pass: Ptr[GPUCopyPass]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EndGPUCopyPass
        """
        self._end_gpu_copy_pass(Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[])

    fn generate_mipmaps_for_gpu_texture(
        self, command_buffer: Ptr[GPUCommandBuffer], texture: Ptr[GPUTexture]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GenerateMipmapsForGPUTexture
        """
        self._generate_mipmaps_for_gpu_texture(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[GPUTexture, MutExternalOrigin]]()[],
        )

    fn blit_gpu_texture(self, command_buffer: Ptr[GPUCommandBuffer], info: Ptr[GPUBlitInfo]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BlitGPUTexture
        """
        self._blit_gpu_texture(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            Ptr(to=info).bitcast[Ptr[GPUBlitInfo, ImmutExternalOrigin]]()[],
        )

    fn window_supports_gpu_swapchain_composition(
        self,
        device: Ptr[GPUDevice],
        window: Ptr[Window],
        swapchain_composition: GPUSwapchainComposition,
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUSwapchainComposition
        """
        return self._window_supports_gpu_swapchain_composition(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=swapchain_composition).bitcast[GPUSwapchainComposition]()[],
        )

    fn window_supports_gpu_present_mode(
        self, device: Ptr[GPUDevice], window: Ptr[Window], present_mode: GPUPresentMode
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUPresentMode
        """
        return self._window_supports_gpu_present_mode(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=present_mode).bitcast[GPUPresentMode]()[],
        )

    fn claim_window_for_gpu_device(self, device: Ptr[GPUDevice], window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ClaimWindowForGPUDevice
        """
        var success_status = self._claim_window_for_gpu_device(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn release_window_from_gpu_device(self, device: Ptr[GPUDevice], window: Ptr[Window]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseWindowFromGPUDevice
        """
        self._release_window_from_gpu_device(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        )

    fn set_gpu_swapchain_parameters(
        self,
        device: Ptr[GPUDevice],
        window: Ptr[Window],
        swapchain_composition: GPUSwapchainComposition,
        present_mode: GPUPresentMode,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPUSwapchainParameters
        """
        var success_status = self._set_gpu_swapchain_parameters(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=swapchain_composition).bitcast[GPUSwapchainComposition]()[],
            Ptr(to=present_mode).bitcast[GPUPresentMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_gpu_allowed_frames_in_flight(
        self, device: Ptr[GPUDevice], allowed_frames_in_flight: UInt32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPUAllowedFramesInFlight
        """
        var success_status = self._set_gpu_allowed_frames_in_flight(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=allowed_frames_in_flight).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_gpu_swapchain_texture_format(
        self, device: Ptr[GPUDevice], window: Ptr[Window]
    ) -> GPUTextureFormat:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGPUSwapchainTextureFormat
        """
        return self._get_gpu_swapchain_texture_format(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        )

    fn acquire_gpu_swapchain_texture(
        self,
        command_buffer: Ptr[GPUCommandBuffer],
        window: Ptr[Window],
        swapchain_texture: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
        swapchain_texture_width: Ptr[UInt32],
        swapchain_texture_height: Ptr[UInt32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AcquireGPUSwapchainTexture
        """
        var success_status = self._acquire_gpu_swapchain_texture(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=swapchain_texture).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin]]()[],
            Ptr(to=swapchain_texture_width).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
            Ptr(to=swapchain_texture_height).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn wait_for_gpu_swapchain(self, device: Ptr[GPUDevice], window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WaitForGPUSwapchain
        """
        var success_status = self._wait_for_gpu_swapchain(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn wait_and_acquire_gpu_swapchain_texture(
        self,
        command_buffer: Ptr[GPUCommandBuffer],
        window: Ptr[Window],
        swapchain_texture: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
        swapchain_texture_width: Ptr[UInt32],
        swapchain_texture_height: Ptr[UInt32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WaitAndAcquireGPUSwapchainTexture
        """
        var success_status = self._wait_and_acquire_gpu_swapchain_texture(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=swapchain_texture).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin]]()[],
            Ptr(to=swapchain_texture_width).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
            Ptr(to=swapchain_texture_height).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn submit_gpu_command_buffer(self, command_buffer: Ptr[GPUCommandBuffer]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SubmitGPUCommandBuffer
        """
        var success_status = self._submit_gpu_command_buffer(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn submit_gpu_command_buffer_and_acquire_fence(
        self, command_buffer: Ptr[GPUCommandBuffer]
    ) raises -> Ptr[GPUFence, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SubmitGPUCommandBufferAndAcquireFence
        """
        var result_pointer = self._submit_gpu_command_buffer_and_acquire_fence(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn cancel_gpu_command_buffer(self, command_buffer: Ptr[GPUCommandBuffer]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CancelGPUCommandBuffer
        """
        var success_status = self._cancel_gpu_command_buffer(
            Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn wait_for_gpu_idle(self, device: Ptr[GPUDevice]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WaitForGPUIdle
        """
        var success_status = self._wait_for_gpu_idle(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn wait_for_gpu_fences(
        self,
        device: Ptr[GPUDevice],
        wait_all: Bool,
        fences: Ptr[Ptr[GPUFence, MutExternalOrigin]],
        num_fences: UInt32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WaitForGPUFences
        """
        var success_status = self._wait_for_gpu_fences(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=wait_all).bitcast[Bool]()[],
            Ptr(to=fences).bitcast[Ptr[Ptr[GPUFence, MutExternalOrigin], ImmutExternalOrigin]]()[],
            Ptr(to=num_fences).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn query_gpu_fence(self, device: Ptr[GPUDevice], fence: Ptr[GPUFence]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_QueryGPUFence
        """
        return self._query_gpu_fence(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=fence).bitcast[Ptr[GPUFence, MutExternalOrigin]]()[],
        )

    fn release_gpu_fence(self, device: Ptr[GPUDevice], fence: Ptr[GPUFence]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUFence
        """
        self._release_gpu_fence(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=fence).bitcast[Ptr[GPUFence, MutExternalOrigin]]()[],
        )

    fn gpu_texture_format_texel_block_size(self, format: GPUTextureFormat) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GPUTextureFormatTexelBlockSize
        """
        return self._gpu_texture_format_texel_block_size(
            Ptr(to=format).bitcast[GPUTextureFormat]()[]
        )

    fn gpu_texture_supports_format(
        self,
        device: Ptr[GPUDevice],
        format: GPUTextureFormat,
        type: GPUTextureType,
        usage: GPUTextureUsageFlags,
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsFormat
        """
        return self._gpu_texture_supports_format(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=format).bitcast[GPUTextureFormat]()[],
            Ptr(to=type).bitcast[GPUTextureType]()[],
            Ptr(to=usage).bitcast[GPUTextureUsageFlags]()[],
        )

    fn gpu_texture_supports_sample_count(
        self, device: Ptr[GPUDevice], format: GPUTextureFormat, sample_count: GPUSampleCount
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsSampleCount
        """
        return self._gpu_texture_supports_sample_count(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=format).bitcast[GPUTextureFormat]()[],
            Ptr(to=sample_count).bitcast[GPUSampleCount]()[],
        )

    fn calculate_gpu_texture_format_size(
        self, format: GPUTextureFormat, width: UInt32, height: UInt32, depth_or_layer_count: UInt32
    ) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CalculateGPUTextureFormatSize
        """
        return self._calculate_gpu_texture_format_size(
            Ptr(to=format).bitcast[GPUTextureFormat]()[],
            Ptr(to=width).bitcast[UInt32]()[],
            Ptr(to=height).bitcast[UInt32]()[],
            Ptr(to=depth_or_layer_count).bitcast[UInt32]()[],
        )

    fn get_pixel_format_from_gpu_texture_format(self, format: GPUTextureFormat) -> PixelFormat:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatFromGPUTextureFormat
        """
        return self._get_pixel_format_from_gpu_texture_format(
            Ptr(to=format).bitcast[GPUTextureFormat]()[]
        )

    fn get_gpu_texture_format_from_pixel_format(self, format: PixelFormat) -> GPUTextureFormat:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGPUTextureFormatFromPixelFormat
        """
        return self._get_gpu_texture_format_from_pixel_format(
            Ptr(to=format).bitcast[PixelFormat]()[]
        )

    fn guid_to_string(self, guid: GUID, pszGUID: Ptr[c_char], cbGUID: Int32):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GUIDToString
        """
        self._guid_to_string(
            Ptr(to=guid).bitcast[GUID]()[],
            Ptr(to=pszGUID).bitcast[Ptr[c_char, MutExternalOrigin]]()[],
            Ptr(to=cbGUID).bitcast[Int32]()[],
        )

    fn string_to_guid(self, pchGUID: CStringSlice) -> GUID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_StringToGUID
        """
        return self._string_to_guid(pchGUID.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]())

    fn get_haptics(self, count: Ptr[Int32]) raises -> Ptr[HapticID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetHaptics
        """
        var result_pointer = self._get_haptics(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_haptic_name_for_id(
        self, instance_id: HapticID
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetHapticNameForID
        """
        var c_string = self._get_haptic_name_for_id(Ptr(to=instance_id).bitcast[HapticID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn open_haptic(self, instance_id: HapticID) raises -> Ptr[Haptic, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenHaptic
        """
        var result_pointer = self._open_haptic(Ptr(to=instance_id).bitcast[HapticID]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_haptic_from_id(self, instance_id: HapticID) raises -> Ptr[Haptic, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetHapticFromID
        """
        var result_pointer = self._get_haptic_from_id(Ptr(to=instance_id).bitcast[HapticID]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_haptic_id(self, haptic: Ptr[Haptic]) -> HapticID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetHapticID
        """
        return self._get_haptic_id(Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[])

    fn get_haptic_name(self, haptic: Ptr[Haptic]) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetHapticName
        """
        var c_string = self._get_haptic_name(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn is_mouse_haptic(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IsMouseHaptic
        """
        return self._is_mouse_haptic()

    fn open_haptic_from_mouse(self) raises -> Ptr[Haptic, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenHapticFromMouse
        """
        var result_pointer = self._open_haptic_from_mouse()
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn is_joystick_haptic(self, joystick: Ptr[Joystick]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IsJoystickHaptic
        """
        return self._is_joystick_haptic(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn open_haptic_from_joystick(
        self, joystick: Ptr[Joystick]
    ) raises -> Ptr[Haptic, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenHapticFromJoystick
        """
        var result_pointer = self._open_haptic_from_joystick(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn close_haptic(self, haptic: Ptr[Haptic]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CloseHaptic
        """
        self._close_haptic(Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[])

    fn get_max_haptic_effects(self, haptic: Ptr[Haptic]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetMaxHapticEffects
        """
        return self._get_max_haptic_effects(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )

    fn get_max_haptic_effects_playing(self, haptic: Ptr[Haptic]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetMaxHapticEffectsPlaying
        """
        return self._get_max_haptic_effects_playing(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )

    fn get_haptic_features(self, haptic: Ptr[Haptic]) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetHapticFeatures
        """
        return self._get_haptic_features(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )

    fn get_num_haptic_axes(self, haptic: Ptr[Haptic]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumHapticAxes
        """
        return self._get_num_haptic_axes(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )

    fn haptic_effect_supported(self, haptic: Ptr[Haptic], effect: Ptr[HapticEffect]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HapticEffectSupported
        """
        return self._haptic_effect_supported(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=effect).bitcast[Ptr[HapticEffect, ImmutExternalOrigin]]()[],
        )

    fn create_haptic_effect(
        self, haptic: Ptr[Haptic], effect: Ptr[HapticEffect]
    ) -> HapticEffectID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateHapticEffect
        """
        return self._create_haptic_effect(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=effect).bitcast[Ptr[HapticEffect, ImmutExternalOrigin]]()[],
        )

    fn update_haptic_effect(
        self, haptic: Ptr[Haptic], effect: HapticEffectID, data: Ptr[HapticEffect]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UpdateHapticEffect
        """
        var success_status = self._update_haptic_effect(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=effect).bitcast[HapticEffectID]()[],
            Ptr(to=data).bitcast[Ptr[HapticEffect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn run_haptic_effect(
        self, haptic: Ptr[Haptic], effect: HapticEffectID, iterations: UInt32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RunHapticEffect
        """
        var success_status = self._run_haptic_effect(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=effect).bitcast[HapticEffectID]()[],
            Ptr(to=iterations).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn stop_haptic_effect(self, haptic: Ptr[Haptic], effect: HapticEffectID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_StopHapticEffect
        """
        var success_status = self._stop_haptic_effect(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=effect).bitcast[HapticEffectID]()[],
        )
        if not success_status:
            raise self._get_error()

    fn destroy_haptic_effect(self, haptic: Ptr[Haptic], effect: HapticEffectID):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyHapticEffect
        """
        self._destroy_haptic_effect(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=effect).bitcast[HapticEffectID]()[],
        )

    fn get_haptic_effect_status(self, haptic: Ptr[Haptic], effect: HapticEffectID) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetHapticEffectStatus
        """
        return self._get_haptic_effect_status(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=effect).bitcast[HapticEffectID]()[],
        )

    fn set_haptic_gain(self, haptic: Ptr[Haptic], gain: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetHapticGain
        """
        var success_status = self._set_haptic_gain(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=gain).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_haptic_autocenter(self, haptic: Ptr[Haptic], autocenter: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetHapticAutocenter
        """
        var success_status = self._set_haptic_autocenter(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=autocenter).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn pause_haptic(self, haptic: Ptr[Haptic]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PauseHaptic
        """
        var success_status = self._pause_haptic(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn resume_haptic(self, haptic: Ptr[Haptic]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ResumeHaptic
        """
        var success_status = self._resume_haptic(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn stop_haptic_effects(self, haptic: Ptr[Haptic]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_StopHapticEffects
        """
        var success_status = self._stop_haptic_effects(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn haptic_rumble_supported(self, haptic: Ptr[Haptic]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HapticRumbleSupported
        """
        return self._haptic_rumble_supported(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )

    fn init_haptic_rumble(self, haptic: Ptr[Haptic]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_InitHapticRumble
        """
        var success_status = self._init_haptic_rumble(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn play_haptic_rumble(self, haptic: Ptr[Haptic], strength: Float32, length: UInt32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PlayHapticRumble
        """
        var success_status = self._play_haptic_rumble(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
            Ptr(to=strength).bitcast[Float32]()[],
            Ptr(to=length).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn stop_haptic_rumble(self, haptic: Ptr[Haptic]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_StopHapticRumble
        """
        var success_status = self._stop_haptic_rumble(
            Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn set_hint_with_priority(
        self, name: CStringSlice, value: CStringSlice, priority: HintPriority
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetHintWithPriority
        """
        var success_status = self._set_hint_with_priority(
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=priority).bitcast[HintPriority]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_hint(self, name: CStringSlice, value: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetHint
        """
        var success_status = self._set_hint(
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn reset_hint(self, name: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ResetHint
        """
        var success_status = self._reset_hint(
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not success_status:
            raise self._get_error()

    fn reset_hints(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ResetHints
        """
        self._reset_hints()

    fn get_hint(self, name: CStringSlice) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetHint
        """
        var c_string = self._get_hint(name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]())
        if not c_string.unsafe_ptr():
            raise "Error in get_hint call. See official documentation for details."
        return c_string

    fn get_hint_boolean(self, name: CStringSlice, default_value: Bool) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetHintBoolean
        """
        return self._get_hint_boolean(
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=default_value).bitcast[Bool]()[],
        )

    fn add_hint_callback(
        self, name: CStringSlice, callback: HintCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AddHintCallback
        """
        var success_status = self._add_hint_callback(
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=callback).bitcast[HintCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn remove_hint_callback(
        self, name: CStringSlice, callback: HintCallback, userdata: Ptr[NoneType]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RemoveHintCallback
        """
        self._remove_hint_callback(
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=callback).bitcast[HintCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )

    fn init(self, flags: InitFlags) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Init
        """
        var success_status = self._init(Ptr(to=flags).bitcast[InitFlags]()[])
        if not success_status:
            raise self._get_error()

    fn init_sub_system(self, flags: InitFlags) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_InitSubSystem
        """
        var success_status = self._init_sub_system(Ptr(to=flags).bitcast[InitFlags]()[])
        if not success_status:
            raise self._get_error()

    fn quit_sub_system(self, flags: InitFlags):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_QuitSubSystem
        """
        self._quit_sub_system(Ptr(to=flags).bitcast[InitFlags]()[])

    fn was_init(self, flags: InitFlags) -> InitFlags:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WasInit
        """
        return self._was_init(Ptr(to=flags).bitcast[InitFlags]()[])

    fn quit(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Quit
        """
        self._quit()

    fn is_main_thread(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IsMainThread
        """
        return self._is_main_thread()

    fn run_on_main_thread(
        self, callback: MainThreadCallback, userdata: Ptr[NoneType], wait_complete: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RunOnMainThread
        """
        var success_status = self._run_on_main_thread(
            Ptr(to=callback).bitcast[MainThreadCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=wait_complete).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_app_metadata(
        self, appname: CStringSlice, appversion: CStringSlice, appidentifier: CStringSlice
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAppMetadata
        """
        var success_status = self._set_app_metadata(
            appname.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            appversion.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            appidentifier.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn set_app_metadata_property(self, name: CStringSlice, value: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetAppMetadataProperty
        """
        var success_status = self._set_app_metadata_property(
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn get_app_metadata_property(
        self, name: CStringSlice
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetAppMetadataProperty
        """
        var c_string = self._get_app_metadata_property(
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not c_string.unsafe_ptr():
            raise "Error in get_app_metadata_property call. See official documentation for details."
        return c_string

    fn io_from_file(
        self, file: CStringSlice, mode: CStringSlice
    ) raises -> Ptr[IOStream, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IOFromFile
        """
        var result_pointer = self._io_from_file(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            mode.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn io_from_mem(
        self, mem: Ptr[NoneType], size: Int32
    ) raises -> Ptr[IOStream, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IOFromMem
        """
        var result_pointer = self._io_from_mem(
            Ptr(to=mem).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=size).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn io_from_const_mem(
        self, mem: Ptr[NoneType], size: Int32
    ) raises -> Ptr[IOStream, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IOFromConstMem
        """
        var result_pointer = self._io_from_const_mem(
            Ptr(to=mem).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=size).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn io_from_dynamic_mem(self) raises -> Ptr[IOStream, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IOFromDynamicMem
        """
        var result_pointer = self._io_from_dynamic_mem()
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn open_io(
        self, iface: Ptr[IOStreamInterface], userdata: Ptr[NoneType]
    ) raises -> Ptr[IOStream, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenIO
        """
        var result_pointer = self._open_io(
            Ptr(to=iface).bitcast[Ptr[IOStreamInterface, ImmutExternalOrigin]]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn close_io(self, context: Ptr[IOStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CloseIO
        """
        var success_status = self._close_io(
            Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn get_io_properties(self, context: Ptr[IOStream]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetIOProperties
        """
        return self._get_io_properties(
            Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )

    fn get_io_status(self, context: Ptr[IOStream]) -> IOStatus:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetIOStatus
        """
        return self._get_io_status(Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn get_io_size(self, context: Ptr[IOStream]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetIOSize
        """
        return self._get_io_size(Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn seek_io(self, context: Ptr[IOStream], offset: Int64, whence: IOWhence) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SeekIO
        """
        return self._seek_io(
            Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=offset).bitcast[Int64]()[],
            Ptr(to=whence).bitcast[IOWhence]()[],
        )

    fn tell_io(self, context: Ptr[IOStream]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_TellIO
        """
        return self._tell_io(Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[])

    fn read_io(self, context: Ptr[IOStream], ptr: Ptr[NoneType], size: Int32) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadIO
        """
        return self._read_io(
            Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=ptr).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=size).bitcast[Int32]()[],
        )

    fn write_io(self, context: Ptr[IOStream], ptr: Ptr[NoneType], size: Int32) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteIO
        """
        return self._write_io(
            Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=ptr).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=size).bitcast[Int32]()[],
        )

    fn i_oprintf(self, context: Ptr[IOStream], fmt: CStringSlice) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IOprintf
        """
        return self._i_oprintf(
            Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn i_ovprintf(self, context: Ptr[IOStream], fmt: CStringSlice, ap: Int32) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IOvprintf
        """
        return self._i_ovprintf(
            Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=ap).bitcast[Int32]()[],
        )

    fn flush_io(self, context: Ptr[IOStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FlushIO
        """
        var success_status = self._flush_io(
            Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn load_file_io(
        self, src: Ptr[IOStream], datasize: Ptr[Int32], closeio: Bool
    ) raises -> Ptr[NoneType, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadFile_IO
        """
        var result_pointer = self._load_file_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=datasize).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_file(
        self, file: CStringSlice, datasize: Ptr[Int32]
    ) raises -> Ptr[NoneType, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadFile
        """
        var result_pointer = self._load_file(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=datasize).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn save_file_io(
        self, src: Ptr[IOStream], data: Ptr[NoneType], datasize: Int32, closeio: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SaveFile_IO
        """
        var success_status = self._save_file_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=datasize).bitcast[Int32]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_file(self, file: CStringSlice, data: Ptr[NoneType], datasize: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SaveFile
        """
        var success_status = self._save_file(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=datasize).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_u8(self, src: Ptr[IOStream], value: Ptr[UInt8]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadU8
        """
        var success_status = self._read_u8(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_s8(self, src: Ptr[IOStream], value: Ptr[Int8]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadS8
        """
        var success_status = self._read_s8(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[Int8, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_u16_le(self, src: Ptr[IOStream], value: Ptr[UInt16]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadU16LE
        """
        var success_status = self._read_u16_le(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_s16_le(self, src: Ptr[IOStream], value: Ptr[Int16]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadS16LE
        """
        var success_status = self._read_s16_le(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[Int16, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_u16_be(self, src: Ptr[IOStream], value: Ptr[UInt16]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadU16BE
        """
        var success_status = self._read_u16_be(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_s16_be(self, src: Ptr[IOStream], value: Ptr[Int16]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadS16BE
        """
        var success_status = self._read_s16_be(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[Int16, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_u32_le(self, src: Ptr[IOStream], value: Ptr[UInt32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadU32LE
        """
        var success_status = self._read_u32_le(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_s32_le(self, src: Ptr[IOStream], value: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadS32LE
        """
        var success_status = self._read_s32_le(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_u32_be(self, src: Ptr[IOStream], value: Ptr[UInt32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadU32BE
        """
        var success_status = self._read_u32_be(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_s32_be(self, src: Ptr[IOStream], value: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadS32BE
        """
        var success_status = self._read_s32_be(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_u64_le(self, src: Ptr[IOStream], value: Ptr[UInt64]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadU64LE
        """
        var success_status = self._read_u64_le(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_s64_le(self, src: Ptr[IOStream], value: Ptr[Int64]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadS64LE
        """
        var success_status = self._read_s64_le(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[Int64, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_u64_be(self, src: Ptr[IOStream], value: Ptr[UInt64]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadU64BE
        """
        var success_status = self._read_u64_be(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_s64_be(self, src: Ptr[IOStream], value: Ptr[Int64]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadS64BE
        """
        var success_status = self._read_s64_be(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Ptr[Int64, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_u8(self, dst: Ptr[IOStream], value: UInt8) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteU8
        """
        var success_status = self._write_u8(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_s8(self, dst: Ptr[IOStream], value: Int8) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteS8
        """
        var success_status = self._write_s8(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Int8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_u16_le(self, dst: Ptr[IOStream], value: UInt16) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteU16LE
        """
        var success_status = self._write_u16_le(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[UInt16]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_s16_le(self, dst: Ptr[IOStream], value: Int16) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteS16LE
        """
        var success_status = self._write_s16_le(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Int16]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_u16_be(self, dst: Ptr[IOStream], value: UInt16) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteU16BE
        """
        var success_status = self._write_u16_be(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[UInt16]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_s16_be(self, dst: Ptr[IOStream], value: Int16) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteS16BE
        """
        var success_status = self._write_s16_be(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Int16]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_u32_le(self, dst: Ptr[IOStream], value: UInt32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteU32LE
        """
        var success_status = self._write_u32_le(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_s32_le(self, dst: Ptr[IOStream], value: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteS32LE
        """
        var success_status = self._write_s32_le(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_u32_be(self, dst: Ptr[IOStream], value: UInt32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteU32BE
        """
        var success_status = self._write_u32_be(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_s32_be(self, dst: Ptr[IOStream], value: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteS32BE
        """
        var success_status = self._write_s32_be(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_u64_le(self, dst: Ptr[IOStream], value: UInt64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteU64LE
        """
        var success_status = self._write_u64_le(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[UInt64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_s64_le(self, dst: Ptr[IOStream], value: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteS64LE
        """
        var success_status = self._write_s64_le(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Int64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_u64_be(self, dst: Ptr[IOStream], value: UInt64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteU64BE
        """
        var success_status = self._write_u64_be(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[UInt64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_s64_be(self, dst: Ptr[IOStream], value: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteS64BE
        """
        var success_status = self._write_s64_be(
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Int64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn lock_joysticks(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LockJoysticks
        """
        self._lock_joysticks()

    fn unlock_joysticks(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UnlockJoysticks
        """
        self._unlock_joysticks()

    fn has_joystick(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasJoystick
        """
        return self._has_joystick()

    fn get_joysticks(self, count: Ptr[Int32]) raises -> Ptr[JoystickID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoysticks
        """
        var result_pointer = self._get_joysticks(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_joystick_name_for_id(
        self, instance_id: JoystickID
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickNameForID
        """
        var c_string = self._get_joystick_name_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_joystick_path_for_id(
        self, instance_id: JoystickID
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickPathForID
        """
        var c_string = self._get_joystick_path_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_joystick_player_index_for_id(self, instance_id: JoystickID) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickPlayerIndexForID
        """
        return self._get_joystick_player_index_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_joystick_guid_for_id(self, instance_id: JoystickID) -> GUID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUIDForID
        """
        return self._get_joystick_guid_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_joystick_vendor_for_id(self, instance_id: JoystickID) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickVendorForID
        """
        return self._get_joystick_vendor_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_joystick_product_for_id(self, instance_id: JoystickID) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductForID
        """
        return self._get_joystick_product_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn get_joystick_product_version_for_id(self, instance_id: JoystickID) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductVersionForID
        """
        return self._get_joystick_product_version_for_id(
            Ptr(to=instance_id).bitcast[JoystickID]()[]
        )

    fn get_joystick_type_for_id(self, instance_id: JoystickID) -> JoystickType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickTypeForID
        """
        return self._get_joystick_type_for_id(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn open_joystick(self, instance_id: JoystickID) raises -> Ptr[Joystick, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenJoystick
        """
        var result_pointer = self._open_joystick(Ptr(to=instance_id).bitcast[JoystickID]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_joystick_from_id(
        self, instance_id: JoystickID
    ) raises -> Ptr[Joystick, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickFromID
        """
        var result_pointer = self._get_joystick_from_id(
            Ptr(to=instance_id).bitcast[JoystickID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_joystick_from_player_index(
        self, player_index: Int32
    ) raises -> Ptr[Joystick, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickFromPlayerIndex
        """
        var result_pointer = self._get_joystick_from_player_index(
            Ptr(to=player_index).bitcast[Int32]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn attach_virtual_joystick(self, desc: Ptr[VirtualJoystickDesc]) -> JoystickID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AttachVirtualJoystick
        """
        return self._attach_virtual_joystick(
            Ptr(to=desc).bitcast[Ptr[VirtualJoystickDesc, ImmutExternalOrigin]]()[]
        )

    fn detach_virtual_joystick(self, instance_id: JoystickID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DetachVirtualJoystick
        """
        var success_status = self._detach_virtual_joystick(
            Ptr(to=instance_id).bitcast[JoystickID]()[]
        )
        if not success_status:
            raise self._get_error()

    fn is_joystick_virtual(self, instance_id: JoystickID) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_IsJoystickVirtual
        """
        return self._is_joystick_virtual(Ptr(to=instance_id).bitcast[JoystickID]()[])

    fn set_joystick_virtual_axis(self, joystick: Ptr[Joystick], axis: Int32, value: Int16) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualAxis
        """
        var success_status = self._set_joystick_virtual_axis(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=axis).bitcast[Int32]()[],
            Ptr(to=value).bitcast[Int16]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_joystick_virtual_ball(
        self, joystick: Ptr[Joystick], ball: Int32, xrel: Int16, yrel: Int16
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualBall
        """
        var success_status = self._set_joystick_virtual_ball(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=ball).bitcast[Int32]()[],
            Ptr(to=xrel).bitcast[Int16]()[],
            Ptr(to=yrel).bitcast[Int16]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_joystick_virtual_button(
        self, joystick: Ptr[Joystick], button: Int32, down: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualButton
        """
        var success_status = self._set_joystick_virtual_button(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=button).bitcast[Int32]()[],
            Ptr(to=down).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_joystick_virtual_hat(self, joystick: Ptr[Joystick], hat: Int32, value: UInt8) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualHat
        """
        var success_status = self._set_joystick_virtual_hat(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=hat).bitcast[Int32]()[],
            Ptr(to=value).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_joystick_virtual_touchpad(
        self,
        joystick: Ptr[Joystick],
        touchpad: Int32,
        finger: Int32,
        down: Bool,
        x: Float32,
        y: Float32,
        pressure: Float32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualTouchpad
        """
        var success_status = self._set_joystick_virtual_touchpad(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=touchpad).bitcast[Int32]()[],
            Ptr(to=finger).bitcast[Int32]()[],
            Ptr(to=down).bitcast[Bool]()[],
            Ptr(to=x).bitcast[Float32]()[],
            Ptr(to=y).bitcast[Float32]()[],
            Ptr(to=pressure).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn send_joystick_virtual_sensor_data(
        self,
        joystick: Ptr[Joystick],
        type: SensorType,
        sensor_timestamp: UInt64,
        data: Ptr[Float32],
        num_values: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SendJoystickVirtualSensorData
        """
        var success_status = self._send_joystick_virtual_sensor_data(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=type).bitcast[SensorType]()[],
            Ptr(to=sensor_timestamp).bitcast[UInt64]()[],
            Ptr(to=data).bitcast[Ptr[Float32, ImmutExternalOrigin]]()[],
            Ptr(to=num_values).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_joystick_properties(self, joystick: Ptr[Joystick]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickProperties
        """
        return self._get_joystick_properties(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_joystick_name(
        self, joystick: Ptr[Joystick]
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickName
        """
        var c_string = self._get_joystick_name(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_joystick_path(
        self, joystick: Ptr[Joystick]
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickPath
        """
        var c_string = self._get_joystick_path(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_joystick_player_index(self, joystick: Ptr[Joystick]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickPlayerIndex
        """
        return self._get_joystick_player_index(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn set_joystick_player_index(self, joystick: Ptr[Joystick], player_index: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetJoystickPlayerIndex
        """
        var success_status = self._set_joystick_player_index(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=player_index).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_joystick_guid(self, joystick: Ptr[Joystick]) -> GUID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUID
        """
        return self._get_joystick_guid(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_joystick_vendor(self, joystick: Ptr[Joystick]) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickVendor
        """
        return self._get_joystick_vendor(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_joystick_product(self, joystick: Ptr[Joystick]) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickProduct
        """
        return self._get_joystick_product(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_joystick_product_version(self, joystick: Ptr[Joystick]) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductVersion
        """
        return self._get_joystick_product_version(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_joystick_firmware_version(self, joystick: Ptr[Joystick]) -> UInt16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickFirmwareVersion
        """
        return self._get_joystick_firmware_version(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_joystick_serial(
        self, joystick: Ptr[Joystick]
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickSerial
        """
        var c_string = self._get_joystick_serial(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise "Error in get_joystick_serial call. See official documentation for details."
        return c_string

    fn get_joystick_type(self, joystick: Ptr[Joystick]) -> JoystickType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickType
        """
        return self._get_joystick_type(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_joystick_guid_info(
        self,
        guid: GUID,
        vendor: Ptr[UInt16],
        product: Ptr[UInt16],
        version: Ptr[UInt16],
        crc16: Ptr[UInt16],
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUIDInfo
        """
        self._get_joystick_guid_info(
            Ptr(to=guid).bitcast[GUID]()[],
            Ptr(to=vendor).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
            Ptr(to=product).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
            Ptr(to=version).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
            Ptr(to=crc16).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
        )

    fn joystick_connected(self, joystick: Ptr[Joystick]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_JoystickConnected
        """
        return self._joystick_connected(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_joystick_id(self, joystick: Ptr[Joystick]) -> JoystickID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickID
        """
        return self._get_joystick_id(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_num_joystick_axes(self, joystick: Ptr[Joystick]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickAxes
        """
        return self._get_num_joystick_axes(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_num_joystick_balls(self, joystick: Ptr[Joystick]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickBalls
        """
        return self._get_num_joystick_balls(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_num_joystick_hats(self, joystick: Ptr[Joystick]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickHats
        """
        return self._get_num_joystick_hats(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_num_joystick_buttons(self, joystick: Ptr[Joystick]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickButtons
        """
        return self._get_num_joystick_buttons(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn set_joystick_events_enabled(self, enabled: Bool):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetJoystickEventsEnabled
        """
        self._set_joystick_events_enabled(Ptr(to=enabled).bitcast[Bool]()[])

    fn joystick_events_enabled(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_JoystickEventsEnabled
        """
        return self._joystick_events_enabled()

    fn update_joysticks(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UpdateJoysticks
        """
        self._update_joysticks()

    fn get_joystick_axis(self, joystick: Ptr[Joystick], axis: Int32) -> Int16:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickAxis
        """
        return self._get_joystick_axis(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=axis).bitcast[Int32]()[],
        )

    fn get_joystick_axis_initial_state(
        self, joystick: Ptr[Joystick], axis: Int32, state: Ptr[Int16]
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickAxisInitialState
        """
        return self._get_joystick_axis_initial_state(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=axis).bitcast[Int32]()[],
            Ptr(to=state).bitcast[Ptr[Int16, MutExternalOrigin]]()[],
        )

    fn get_joystick_ball(
        self, joystick: Ptr[Joystick], ball: Int32, dx: Ptr[Int32], dy: Ptr[Int32]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickBall
        """
        var success_status = self._get_joystick_ball(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=ball).bitcast[Int32]()[],
            Ptr(to=dx).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=dy).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_joystick_hat(self, joystick: Ptr[Joystick], hat: Int32) -> UInt8:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickHat
        """
        return self._get_joystick_hat(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=hat).bitcast[Int32]()[],
        )

    fn get_joystick_button(self, joystick: Ptr[Joystick], button: Int32) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickButton
        """
        return self._get_joystick_button(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=button).bitcast[Int32]()[],
        )

    fn rumble_joystick(
        self,
        joystick: Ptr[Joystick],
        low_frequency_rumble: UInt16,
        high_frequency_rumble: UInt16,
        duration_ms: UInt32,
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RumbleJoystick
        """
        return self._rumble_joystick(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=low_frequency_rumble).bitcast[UInt16]()[],
            Ptr(to=high_frequency_rumble).bitcast[UInt16]()[],
            Ptr(to=duration_ms).bitcast[UInt32]()[],
        )

    fn rumble_joystick_triggers(
        self,
        joystick: Ptr[Joystick],
        left_rumble: UInt16,
        right_rumble: UInt16,
        duration_ms: UInt32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RumbleJoystickTriggers
        """
        var success_status = self._rumble_joystick_triggers(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=left_rumble).bitcast[UInt16]()[],
            Ptr(to=right_rumble).bitcast[UInt16]()[],
            Ptr(to=duration_ms).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_joystick_led(
        self, joystick: Ptr[Joystick], red: UInt8, green: UInt8, blue: UInt8
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetJoystickLED
        """
        var success_status = self._set_joystick_led(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=red).bitcast[UInt8]()[],
            Ptr(to=green).bitcast[UInt8]()[],
            Ptr(to=blue).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn send_joystick_effect(
        self, joystick: Ptr[Joystick], data: Ptr[NoneType], size: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SendJoystickEffect
        """
        var success_status = self._send_joystick_effect(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=size).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn close_joystick(self, joystick: Ptr[Joystick]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CloseJoystick
        """
        self._close_joystick(Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[])

    fn get_joystick_connection_state(self, joystick: Ptr[Joystick]) -> JoystickConnectionState:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickConnectionState
        """
        return self._get_joystick_connection_state(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
        )

    fn get_joystick_power_info(self, joystick: Ptr[Joystick], percent: Ptr[Int32]) -> PowerState:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetJoystickPowerInfo
        """
        return self._get_joystick_power_info(
            Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
            Ptr(to=percent).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )

    fn has_keyboard(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasKeyboard
        """
        return self._has_keyboard()

    fn get_keyboards(self, count: Ptr[Int32]) raises -> Ptr[KeyboardID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetKeyboards
        """
        var result_pointer = self._get_keyboards(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_keyboard_name_for_id(
        self, instance_id: KeyboardID
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetKeyboardNameForID
        """
        var c_string = self._get_keyboard_name_for_id(Ptr(to=instance_id).bitcast[KeyboardID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_keyboard_focus(self) -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetKeyboardFocus
        """
        return self._get_keyboard_focus()

    fn get_keyboard_state(self, numkeys: Ptr[Int32]) raises -> Ptr[Bool, ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetKeyboardState
        """
        var result_pointer = self._get_keyboard_state(
            Ptr(to=numkeys).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_keyboard_state call. See official documentation for details."
        return result_pointer

    fn reset_keyboard(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ResetKeyboard
        """
        self._reset_keyboard()

    fn get_mod_state(self) -> Keymod:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetModState
        """
        return self._get_mod_state()

    fn set_mod_state(self, modstate: Keymod):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetModState
        """
        self._set_mod_state(Ptr(to=modstate).bitcast[Keymod]()[])

    fn get_key_from_scancode(
        self, scancode: Scancode, modstate: Keymod, key_event: Bool
    ) -> Keycode:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetKeyFromScancode
        """
        return self._get_key_from_scancode(
            Ptr(to=scancode).bitcast[Scancode]()[],
            Ptr(to=modstate).bitcast[Keymod]()[],
            Ptr(to=key_event).bitcast[Bool]()[],
        )

    fn get_scancode_from_key(self, key: Keycode, modstate: Ptr[Keymod]) -> Scancode:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetScancodeFromKey
        """
        return self._get_scancode_from_key(
            Ptr(to=key).bitcast[Keycode]()[],
            Ptr(to=modstate).bitcast[Ptr[Keymod, MutExternalOrigin]]()[],
        )

    fn set_scancode_name(self, scancode: Scancode, name: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetScancodeName
        """
        var success_status = self._set_scancode_name(
            Ptr(to=scancode).bitcast[Scancode]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn get_scancode_name(self, scancode: Scancode) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetScancodeName
        """
        var c_string = self._get_scancode_name(Ptr(to=scancode).bitcast[Scancode]()[])
        return c_string

    fn get_scancode_from_name(self, name: CStringSlice) -> Scancode:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetScancodeFromName
        """
        return self._get_scancode_from_name(
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn get_key_name(self, key: Keycode) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetKeyName
        """
        var c_string = self._get_key_name(Ptr(to=key).bitcast[Keycode]()[])
        return c_string

    fn get_key_from_name(self, name: CStringSlice) -> Keycode:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetKeyFromName
        """
        return self._get_key_from_name(name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]())

    fn start_text_input(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_StartTextInput
        """
        var success_status = self._start_text_input(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn start_text_input_with_properties(self, window: Ptr[Window], props: PropertiesID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_StartTextInputWithProperties
        """
        var success_status = self._start_text_input_with_properties(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=props).bitcast[PropertiesID]()[],
        )
        if not success_status:
            raise self._get_error()

    fn text_input_active(self, window: Ptr[Window]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_TextInputActive
        """
        return self._text_input_active(Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[])

    fn stop_text_input(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_StopTextInput
        """
        var success_status = self._stop_text_input(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn clear_composition(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ClearComposition
        """
        var success_status = self._clear_composition(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn set_text_input_area(self, window: Ptr[Window], rect: Ptr[Rect], cursor: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetTextInputArea
        """
        var success_status = self._set_text_input_area(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=cursor).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_text_input_area(self, window: Ptr[Window], rect: Ptr[Rect], cursor: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTextInputArea
        """
        var success_status = self._get_text_input_area(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
            Ptr(to=cursor).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn has_screen_keyboard_support(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasScreenKeyboardSupport
        """
        return self._has_screen_keyboard_support()

    fn screen_keyboard_shown(self, window: Ptr[Window]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ScreenKeyboardShown
        """
        return self._screen_keyboard_shown(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn set_log_priorities(self, priority: LogPriority):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetLogPriorities
        """
        self._set_log_priorities(Ptr(to=priority).bitcast[LogPriority]()[])

    fn set_log_priority(self, category: Int32, priority: LogPriority):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetLogPriority
        """
        self._set_log_priority(
            Ptr(to=category).bitcast[Int32]()[], Ptr(to=priority).bitcast[LogPriority]()[]
        )

    fn get_log_priority(self, category: Int32) -> LogPriority:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetLogPriority
        """
        return self._get_log_priority(Ptr(to=category).bitcast[Int32]()[])

    fn reset_log_priorities(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ResetLogPriorities
        """
        self._reset_log_priorities()

    fn set_log_priority_prefix(self, priority: LogPriority, prefix: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetLogPriorityPrefix
        """
        var success_status = self._set_log_priority_prefix(
            Ptr(to=priority).bitcast[LogPriority]()[],
            prefix.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn log(self, fmt: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Log
        """
        self._log(fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]())

    fn log_trace(self, category: Int32, fmt: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LogTrace
        """
        self._log_trace(
            Ptr(to=category).bitcast[Int32]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn log_verbose(self, category: Int32, fmt: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LogVerbose
        """
        self._log_verbose(
            Ptr(to=category).bitcast[Int32]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn log_debug(self, category: Int32, fmt: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LogDebug
        """
        self._log_debug(
            Ptr(to=category).bitcast[Int32]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn log_info(self, category: Int32, fmt: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LogInfo
        """
        self._log_info(
            Ptr(to=category).bitcast[Int32]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn log_warn(self, category: Int32, fmt: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LogWarn
        """
        self._log_warn(
            Ptr(to=category).bitcast[Int32]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn log_error(self, category: Int32, fmt: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LogError
        """
        self._log_error(
            Ptr(to=category).bitcast[Int32]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn log_critical(self, category: Int32, fmt: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LogCritical
        """
        self._log_critical(
            Ptr(to=category).bitcast[Int32]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn log_message(self, category: Int32, priority: LogPriority, fmt: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LogMessage
        """
        self._log_message(
            Ptr(to=category).bitcast[Int32]()[],
            Ptr(to=priority).bitcast[LogPriority]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn log_message_v(self, category: Int32, priority: LogPriority, fmt: CStringSlice, ap: Int32):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LogMessageV
        """
        self._log_message_v(
            Ptr(to=category).bitcast[Int32]()[],
            Ptr(to=priority).bitcast[LogPriority]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=ap).bitcast[Int32]()[],
        )

    fn get_default_log_output_function(self) -> LogOutputFunction:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDefaultLogOutputFunction
        """
        return self._get_default_log_output_function()

    fn get_log_output_function(
        self, callback: Ptr[LogOutputFunction], userdata: Ptr[Ptr[NoneType, MutExternalOrigin]]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetLogOutputFunction
        """
        self._get_log_output_function(
            Ptr(to=callback).bitcast[Ptr[LogOutputFunction, MutExternalOrigin]]()[],
            Ptr(to=userdata).bitcast[Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]]()[],
        )

    fn set_log_output_function(self, callback: LogOutputFunction, userdata: Ptr[NoneType]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetLogOutputFunction
        """
        self._set_log_output_function(
            Ptr(to=callback).bitcast[LogOutputFunction]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )

    fn has_mouse(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasMouse
        """
        return self._has_mouse()

    fn get_mice(self, count: Ptr[Int32]) raises -> Ptr[MouseID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetMice
        """
        var result_pointer = self._get_mice(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_mouse_name_for_id(
        self, instance_id: MouseID
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetMouseNameForID
        """
        var c_string = self._get_mouse_name_for_id(Ptr(to=instance_id).bitcast[MouseID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_mouse_focus(self) -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetMouseFocus
        """
        return self._get_mouse_focus()

    fn get_mouse_state(self, x: Ptr[Float32], y: Ptr[Float32]) -> MouseButtonFlags:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetMouseState
        """
        return self._get_mouse_state(
            Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )

    fn get_global_mouse_state(self, x: Ptr[Float32], y: Ptr[Float32]) -> MouseButtonFlags:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGlobalMouseState
        """
        return self._get_global_mouse_state(
            Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )

    fn get_relative_mouse_state(self, x: Ptr[Float32], y: Ptr[Float32]) -> MouseButtonFlags:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRelativeMouseState
        """
        return self._get_relative_mouse_state(
            Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )

    fn warp_mouse_in_window(self, window: Ptr[Window], x: Float32, y: Float32):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WarpMouseInWindow
        """
        self._warp_mouse_in_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Float32]()[],
            Ptr(to=y).bitcast[Float32]()[],
        )

    fn warp_mouse_global(self, x: Float32, y: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WarpMouseGlobal
        """
        var success_status = self._warp_mouse_global(
            Ptr(to=x).bitcast[Float32]()[], Ptr(to=y).bitcast[Float32]()[]
        )
        if not success_status:
            raise self._get_error()

    fn set_relative_mouse_transform(
        self, callback: MouseMotionTransformCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRelativeMouseTransform
        """
        var success_status = self._set_relative_mouse_transform(
            Ptr(to=callback).bitcast[MouseMotionTransformCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_relative_mouse_mode(self, window: Ptr[Window], enabled: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowRelativeMouseMode
        """
        var success_status = self._set_window_relative_mouse_mode(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=enabled).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_relative_mouse_mode(self, window: Ptr[Window]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowRelativeMouseMode
        """
        return self._get_window_relative_mouse_mode(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn capture_mouse(self, enabled: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CaptureMouse
        """
        var success_status = self._capture_mouse(Ptr(to=enabled).bitcast[Bool]()[])
        if not success_status:
            raise self._get_error()

    fn create_cursor(
        self, data: Ptr[UInt8], mask: Ptr[UInt8], w: Int32, h: Int32, hot_x: Int32, hot_y: Int32
    ) raises -> Ptr[Cursor, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateCursor
        """
        var result_pointer = self._create_cursor(
            Ptr(to=data).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
            Ptr(to=mask).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Int32]()[],
            Ptr(to=h).bitcast[Int32]()[],
            Ptr(to=hot_x).bitcast[Int32]()[],
            Ptr(to=hot_y).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_color_cursor(
        self, surface: Ptr[Surface], hot_x: Int32, hot_y: Int32
    ) raises -> Ptr[Cursor, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateColorCursor
        """
        var result_pointer = self._create_color_cursor(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=hot_x).bitcast[Int32]()[],
            Ptr(to=hot_y).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_animated_cursor(
        self, frames: Ptr[CursorFrameInfo], frame_count: Int32, hot_x: Int32, hot_y: Int32
    ) raises -> Ptr[Cursor, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateAnimatedCursor
        """
        var result_pointer = self._create_animated_cursor(
            Ptr(to=frames).bitcast[Ptr[CursorFrameInfo, MutExternalOrigin]]()[],
            Ptr(to=frame_count).bitcast[Int32]()[],
            Ptr(to=hot_x).bitcast[Int32]()[],
            Ptr(to=hot_y).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_system_cursor(self, id: SystemCursor) raises -> Ptr[Cursor, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateSystemCursor
        """
        var result_pointer = self._create_system_cursor(Ptr(to=id).bitcast[SystemCursor]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_cursor(self, cursor: Ptr[Cursor]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetCursor
        """
        var success_status = self._set_cursor(
            Ptr(to=cursor).bitcast[Ptr[Cursor, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn get_cursor(self) raises -> Ptr[Cursor, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCursor
        """
        var result_pointer = self._get_cursor()
        if not result_pointer:
            raise "Error in get_cursor call. See official documentation for details."
        return result_pointer

    fn get_default_cursor(self) raises -> Ptr[Cursor, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDefaultCursor
        """
        var result_pointer = self._get_default_cursor()
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn destroy_cursor(self, cursor: Ptr[Cursor]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyCursor
        """
        self._destroy_cursor(Ptr(to=cursor).bitcast[Ptr[Cursor, MutExternalOrigin]]()[])

    fn show_cursor(self) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ShowCursor
        """
        var success_status = self._show_cursor()
        if not success_status:
            raise self._get_error()

    fn hide_cursor(self) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HideCursor
        """
        var success_status = self._hide_cursor()
        if not success_status:
            raise self._get_error()

    fn cursor_visible(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CursorVisible
        """
        return self._cursor_visible()

    fn get_pen_device_type(self, instance_id: PenID) -> PenDeviceType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPenDeviceType
        """
        return self._get_pen_device_type(Ptr(to=instance_id).bitcast[PenID]()[])

    fn get_pixel_format_name(self, format: PixelFormat) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatName
        """
        var c_string = self._get_pixel_format_name(Ptr(to=format).bitcast[PixelFormat]()[])
        return c_string

    fn get_masks_for_pixel_format(
        self,
        format: PixelFormat,
        bpp: Ptr[Int32],
        Rmask: Ptr[UInt32],
        Gmask: Ptr[UInt32],
        Bmask: Ptr[UInt32],
        Amask: Ptr[UInt32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetMasksForPixelFormat
        """
        var success_status = self._get_masks_for_pixel_format(
            Ptr(to=format).bitcast[PixelFormat]()[],
            Ptr(to=bpp).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=Rmask).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
            Ptr(to=Gmask).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
            Ptr(to=Bmask).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
            Ptr(to=Amask).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_pixel_format_for_masks(
        self, bpp: Int32, Rmask: UInt32, Gmask: UInt32, Bmask: UInt32, Amask: UInt32
    ) -> PixelFormat:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatForMasks
        """
        return self._get_pixel_format_for_masks(
            Ptr(to=bpp).bitcast[Int32]()[],
            Ptr(to=Rmask).bitcast[UInt32]()[],
            Ptr(to=Gmask).bitcast[UInt32]()[],
            Ptr(to=Bmask).bitcast[UInt32]()[],
            Ptr(to=Amask).bitcast[UInt32]()[],
        )

    fn get_pixel_format_details(
        self, format: PixelFormat
    ) raises -> Ptr[PixelFormatDetails, ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatDetails
        """
        var result_pointer = self._get_pixel_format_details(
            Ptr(to=format).bitcast[PixelFormat]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_palette(self, ncolors: Int32) raises -> Ptr[Palette, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreatePalette
        """
        var result_pointer = self._create_palette(Ptr(to=ncolors).bitcast[Int32]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_palette_colors(
        self, palette: Ptr[Palette], colors: Ptr[Color], firstcolor: Int32, ncolors: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetPaletteColors
        """
        var success_status = self._set_palette_colors(
            Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[],
            Ptr(to=colors).bitcast[Ptr[Color, ImmutExternalOrigin]]()[],
            Ptr(to=firstcolor).bitcast[Int32]()[],
            Ptr(to=ncolors).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn destroy_palette(self, palette: Ptr[Palette]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyPalette
        """
        self._destroy_palette(Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[])

    fn map_rgb(
        self, format: Ptr[PixelFormatDetails], palette: Ptr[Palette], r: UInt8, g: UInt8, b: UInt8
    ) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_MapRGB
        """
        return self._map_rgb(
            Ptr(to=format).bitcast[Ptr[PixelFormatDetails, ImmutExternalOrigin]]()[],
            Ptr(to=palette).bitcast[Ptr[Palette, ImmutExternalOrigin]]()[],
            Ptr(to=r).bitcast[UInt8]()[],
            Ptr(to=g).bitcast[UInt8]()[],
            Ptr(to=b).bitcast[UInt8]()[],
        )

    fn map_rgba(
        self,
        format: Ptr[PixelFormatDetails],
        palette: Ptr[Palette],
        r: UInt8,
        g: UInt8,
        b: UInt8,
        a: UInt8,
    ) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_MapRGBA
        """
        return self._map_rgba(
            Ptr(to=format).bitcast[Ptr[PixelFormatDetails, ImmutExternalOrigin]]()[],
            Ptr(to=palette).bitcast[Ptr[Palette, ImmutExternalOrigin]]()[],
            Ptr(to=r).bitcast[UInt8]()[],
            Ptr(to=g).bitcast[UInt8]()[],
            Ptr(to=b).bitcast[UInt8]()[],
            Ptr(to=a).bitcast[UInt8]()[],
        )

    fn get_rgb(
        self,
        pixelvalue: UInt32,
        format: Ptr[PixelFormatDetails],
        palette: Ptr[Palette],
        r: Ptr[UInt8],
        g: Ptr[UInt8],
        b: Ptr[UInt8],
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRGB
        """
        self._get_rgb(
            Ptr(to=pixelvalue).bitcast[UInt32]()[],
            Ptr(to=format).bitcast[Ptr[PixelFormatDetails, ImmutExternalOrigin]]()[],
            Ptr(to=palette).bitcast[Ptr[Palette, ImmutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )

    fn get_rgba(
        self,
        pixelvalue: UInt32,
        format: Ptr[PixelFormatDetails],
        palette: Ptr[Palette],
        r: Ptr[UInt8],
        g: Ptr[UInt8],
        b: Ptr[UInt8],
        a: Ptr[UInt8],
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRGBA
        """
        self._get_rgba(
            Ptr(to=pixelvalue).bitcast[UInt32]()[],
            Ptr(to=format).bitcast[Ptr[PixelFormatDetails, ImmutExternalOrigin]]()[],
            Ptr(to=palette).bitcast[Ptr[Palette, ImmutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=a).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )

    fn get_power_info(self, seconds: Ptr[Int32], percent: Ptr[Int32]) -> PowerState:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPowerInfo
        """
        return self._get_power_info(
            Ptr(to=seconds).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=percent).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )

    fn get_global_properties(self) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGlobalProperties
        """
        return self._get_global_properties()

    fn create_properties(self) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateProperties
        """
        return self._create_properties()

    fn copy_properties(self, src: PropertiesID, dst: PropertiesID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CopyProperties
        """
        var success_status = self._copy_properties(
            Ptr(to=src).bitcast[PropertiesID]()[], Ptr(to=dst).bitcast[PropertiesID]()[]
        )
        if not success_status:
            raise self._get_error()

    fn lock_properties(self, props: PropertiesID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LockProperties
        """
        var success_status = self._lock_properties(Ptr(to=props).bitcast[PropertiesID]()[])
        if not success_status:
            raise self._get_error()

    fn unlock_properties(self, props: PropertiesID):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UnlockProperties
        """
        self._unlock_properties(Ptr(to=props).bitcast[PropertiesID]()[])

    fn set_pointer_property_with_cleanup(
        self,
        props: PropertiesID,
        name: CStringSlice,
        value: Ptr[NoneType],
        cleanup: CleanupPropertyCallback,
        userdata: Ptr[NoneType],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetPointerPropertyWithCleanup
        """
        var success_status = self._set_pointer_property_with_cleanup(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=value).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=cleanup).bitcast[CleanupPropertyCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_pointer_property(
        self, props: PropertiesID, name: CStringSlice, value: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetPointerProperty
        """
        var success_status = self._set_pointer_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=value).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_string_property(
        self, props: PropertiesID, name: CStringSlice, value: CStringSlice
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetStringProperty
        """
        var success_status = self._set_string_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn set_number_property(self, props: PropertiesID, name: CStringSlice, value: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetNumberProperty
        """
        var success_status = self._set_number_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=value).bitcast[Int64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_float_property(self, props: PropertiesID, name: CStringSlice, value: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetFloatProperty
        """
        var success_status = self._set_float_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=value).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_boolean_property(self, props: PropertiesID, name: CStringSlice, value: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetBooleanProperty
        """
        var success_status = self._set_boolean_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=value).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn has_property(self, props: PropertiesID, name: CStringSlice) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasProperty
        """
        return self._has_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn get_property_type(self, props: PropertiesID, name: CStringSlice) -> PropertyType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPropertyType
        """
        return self._get_property_type(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn get_pointer_property(
        self, props: PropertiesID, name: CStringSlice, default_value: Ptr[NoneType]
    ) -> Ptr[NoneType, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPointerProperty
        """
        return self._get_pointer_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=default_value).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )

    fn get_string_property(
        self, props: PropertiesID, name: CStringSlice, default_value: CStringSlice
    ) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetStringProperty
        """
        var c_string = self._get_string_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            default_value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        return c_string

    fn get_number_property(
        self, props: PropertiesID, name: CStringSlice, default_value: Int64
    ) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumberProperty
        """
        return self._get_number_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=default_value).bitcast[Int64]()[],
        )

    fn get_float_property(
        self, props: PropertiesID, name: CStringSlice, default_value: Float32
    ) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetFloatProperty
        """
        return self._get_float_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=default_value).bitcast[Float32]()[],
        )

    fn get_boolean_property(
        self, props: PropertiesID, name: CStringSlice, default_value: Bool
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetBooleanProperty
        """
        return self._get_boolean_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=default_value).bitcast[Bool]()[],
        )

    fn clear_property(self, props: PropertiesID, name: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ClearProperty
        """
        var success_status = self._clear_property(
            Ptr(to=props).bitcast[PropertiesID]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn enumerate_properties(
        self, props: PropertiesID, callback: EnumeratePropertiesCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EnumerateProperties
        """
        var success_status = self._enumerate_properties(
            Ptr(to=props).bitcast[PropertiesID]()[],
            Ptr(to=callback).bitcast[EnumeratePropertiesCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn destroy_properties(self, props: PropertiesID):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyProperties
        """
        self._destroy_properties(Ptr(to=props).bitcast[PropertiesID]()[])

    fn has_rect_intersection(self, A: Ptr[Rect], B: Ptr[Rect]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasRectIntersection
        """
        return self._has_rect_intersection(
            Ptr(to=A).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=B).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )

    fn get_rect_intersection(self, A: Ptr[Rect], B: Ptr[Rect], result: Ptr[Rect]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRectIntersection
        """
        return self._get_rect_intersection(
            Ptr(to=A).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=B).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=result).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )

    fn get_rect_union(self, A: Ptr[Rect], B: Ptr[Rect], result: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRectUnion
        """
        var success_status = self._get_rect_union(
            Ptr(to=A).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=B).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=result).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_rect_enclosing_points(
        self, points: Ptr[Point], count: Int32, clip: Ptr[Rect], result: Ptr[Rect]
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPoints
        """
        return self._get_rect_enclosing_points(
            Ptr(to=points).bitcast[Ptr[Point, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
            Ptr(to=clip).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=result).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )

    fn get_rect_and_line_intersection(
        self, rect: Ptr[Rect], X1: Ptr[Int32], Y1: Ptr[Int32], X2: Ptr[Int32], Y2: Ptr[Int32]
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersection
        """
        return self._get_rect_and_line_intersection(
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=X1).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=Y1).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=X2).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=Y2).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )

    fn has_rect_intersection_float(self, A: Ptr[FRect], B: Ptr[FRect]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HasRectIntersectionFloat
        """
        return self._has_rect_intersection_float(
            Ptr(to=A).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=B).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        )

    fn get_rect_intersection_float(self, A: Ptr[FRect], B: Ptr[FRect], result: Ptr[FRect]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRectIntersectionFloat
        """
        return self._get_rect_intersection_float(
            Ptr(to=A).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=B).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=result).bitcast[Ptr[FRect, MutExternalOrigin]]()[],
        )

    fn get_rect_union_float(self, A: Ptr[FRect], B: Ptr[FRect], result: Ptr[FRect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRectUnionFloat
        """
        var success_status = self._get_rect_union_float(
            Ptr(to=A).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=B).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=result).bitcast[Ptr[FRect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_rect_enclosing_points_float(
        self, points: Ptr[FPoint], count: Int32, clip: Ptr[FRect], result: Ptr[FRect]
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPointsFloat
        """
        return self._get_rect_enclosing_points_float(
            Ptr(to=points).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
            Ptr(to=clip).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=result).bitcast[Ptr[FRect, MutExternalOrigin]]()[],
        )

    fn get_rect_and_line_intersection_float(
        self,
        rect: Ptr[FRect],
        X1: Ptr[Float32],
        Y1: Ptr[Float32],
        X2: Ptr[Float32],
        Y2: Ptr[Float32],
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersectionFloat
        """
        return self._get_rect_and_line_intersection_float(
            Ptr(to=rect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=X1).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=Y1).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=X2).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=Y2).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )

    fn get_num_render_drivers(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumRenderDrivers
        """
        return self._get_num_render_drivers()

    fn get_render_driver(self, index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderDriver
        """
        var c_string = self._get_render_driver(Ptr(to=index).bitcast[Int32]()[])
        if not c_string.unsafe_ptr():
            raise "Error in get_render_driver call. See official documentation for details."
        return c_string

    fn create_window_and_renderer(
        self,
        title: CStringSlice,
        width: Int32,
        height: Int32,
        window_flags: WindowFlags,
        window: Ptr[Ptr[Window, MutExternalOrigin]],
        renderer: Ptr[Ptr[Renderer, MutExternalOrigin]],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateWindowAndRenderer
        """
        var success_status = self._create_window_and_renderer(
            title.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=width).bitcast[Int32]()[],
            Ptr(to=height).bitcast[Int32]()[],
            Ptr(to=window_flags).bitcast[WindowFlags]()[],
            Ptr(to=window).bitcast[Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin]]()[],
            Ptr(to=renderer).bitcast[Ptr[Ptr[Renderer, MutExternalOrigin], MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn create_renderer(
        self, window: Ptr[Window], name: CStringSlice
    ) raises -> Ptr[Renderer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateRenderer
        """
        var result_pointer = self._create_renderer(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_renderer_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[Renderer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateRendererWithProperties
        """
        var result_pointer = self._create_renderer_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_gpu_renderer(
        self, device: Ptr[GPUDevice], window: Ptr[Window]
    ) raises -> Ptr[Renderer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPURenderer
        """
        var result_pointer = self._create_gpu_renderer(
            Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_gpu_renderer_device(
        self, renderer: Ptr[Renderer]
    ) raises -> Ptr[GPUDevice, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGPURendererDevice
        """
        var result_pointer = self._get_gpu_renderer_device(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_software_renderer(
        self, surface: Ptr[Surface]
    ) raises -> Ptr[Renderer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateSoftwareRenderer
        """
        var result_pointer = self._create_software_renderer(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_renderer(self, window: Ptr[Window]) raises -> Ptr[Renderer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderer
        """
        var result_pointer = self._get_renderer(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_render_window(self, renderer: Ptr[Renderer]) raises -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderWindow
        """
        var result_pointer = self._get_render_window(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_renderer_name(
        self, renderer: Ptr[Renderer]
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRendererName
        """
        var c_string = self._get_renderer_name(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_renderer_properties(self, renderer: Ptr[Renderer]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRendererProperties
        """
        return self._get_renderer_properties(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )

    fn get_render_output_size(self, renderer: Ptr[Renderer], w: Ptr[Int32], h: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderOutputSize
        """
        var success_status = self._get_render_output_size(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_current_render_output_size(
        self, renderer: Ptr[Renderer], w: Ptr[Int32], h: Ptr[Int32]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCurrentRenderOutputSize
        """
        var success_status = self._get_current_render_output_size(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn create_texture(
        self,
        renderer: Ptr[Renderer],
        format: PixelFormat,
        access: TextureAccess,
        w: Int32,
        h: Int32,
    ) raises -> Ptr[Texture, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateTexture
        """
        var result_pointer = self._create_texture(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=format).bitcast[PixelFormat]()[],
            Ptr(to=access).bitcast[TextureAccess]()[],
            Ptr(to=w).bitcast[Int32]()[],
            Ptr(to=h).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_texture_from_surface(
        self, renderer: Ptr[Renderer], surface: Ptr[Surface]
    ) raises -> Ptr[Texture, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateTextureFromSurface
        """
        var result_pointer = self._create_texture_from_surface(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_texture_with_properties(
        self, renderer: Ptr[Renderer], props: PropertiesID
    ) raises -> Ptr[Texture, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateTextureWithProperties
        """
        var result_pointer = self._create_texture_with_properties(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=props).bitcast[PropertiesID]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_texture_properties(self, texture: Ptr[Texture]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTextureProperties
        """
        return self._get_texture_properties(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[]
        )

    fn get_renderer_from_texture(
        self, texture: Ptr[Texture]
    ) raises -> Ptr[Renderer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRendererFromTexture
        """
        var result_pointer = self._get_renderer_from_texture(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_texture_size(self, texture: Ptr[Texture], w: Ptr[Float32], h: Ptr[Float32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTextureSize
        """
        var success_status = self._get_texture_size(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_texture_palette(self, texture: Ptr[Texture], palette: Ptr[Palette]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetTexturePalette
        """
        var success_status = self._set_texture_palette(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_texture_palette(self, texture: Ptr[Texture]) raises -> Ptr[Palette, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTexturePalette
        """
        var result_pointer = self._get_texture_palette(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_texture_palette call. See official documentation for details."
        return result_pointer

    fn set_texture_color_mod(self, texture: Ptr[Texture], r: UInt8, g: UInt8, b: UInt8) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetTextureColorMod
        """
        var success_status = self._set_texture_color_mod(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[UInt8]()[],
            Ptr(to=g).bitcast[UInt8]()[],
            Ptr(to=b).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_texture_color_mod_float(
        self, texture: Ptr[Texture], r: Float32, g: Float32, b: Float32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetTextureColorModFloat
        """
        var success_status = self._set_texture_color_mod_float(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Float32]()[],
            Ptr(to=g).bitcast[Float32]()[],
            Ptr(to=b).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_texture_color_mod(
        self, texture: Ptr[Texture], r: Ptr[UInt8], g: Ptr[UInt8], b: Ptr[UInt8]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTextureColorMod
        """
        var success_status = self._get_texture_color_mod(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_texture_color_mod_float(
        self, texture: Ptr[Texture], r: Ptr[Float32], g: Ptr[Float32], b: Ptr[Float32]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTextureColorModFloat
        """
        var success_status = self._get_texture_color_mod_float(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_texture_alpha_mod(self, texture: Ptr[Texture], alpha: UInt8) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetTextureAlphaMod
        """
        var success_status = self._set_texture_alpha_mod(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=alpha).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_texture_alpha_mod_float(self, texture: Ptr[Texture], alpha: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetTextureAlphaModFloat
        """
        var success_status = self._set_texture_alpha_mod_float(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=alpha).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_texture_alpha_mod(self, texture: Ptr[Texture], alpha: Ptr[UInt8]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaMod
        """
        var success_status = self._get_texture_alpha_mod(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=alpha).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_texture_alpha_mod_float(self, texture: Ptr[Texture], alpha: Ptr[Float32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaModFloat
        """
        var success_status = self._get_texture_alpha_mod_float(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=alpha).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_texture_blend_mode(self, texture: Ptr[Texture], blendMode: BlendMode) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetTextureBlendMode
        """
        var success_status = self._set_texture_blend_mode(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=blendMode).bitcast[BlendMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_texture_blend_mode(self, texture: Ptr[Texture], blendMode: Ptr[BlendMode]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTextureBlendMode
        """
        var success_status = self._get_texture_blend_mode(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=blendMode).bitcast[Ptr[BlendMode, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_texture_scale_mode(self, texture: Ptr[Texture], scaleMode: ScaleMode) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetTextureScaleMode
        """
        var success_status = self._set_texture_scale_mode(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=scaleMode).bitcast[ScaleMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_texture_scale_mode(self, texture: Ptr[Texture], scaleMode: Ptr[ScaleMode]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTextureScaleMode
        """
        var success_status = self._get_texture_scale_mode(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=scaleMode).bitcast[Ptr[ScaleMode, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn update_texture(
        self, texture: Ptr[Texture], rect: Ptr[Rect], pixels: Ptr[NoneType], pitch: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UpdateTexture
        """
        var success_status = self._update_texture(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=pixels).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=pitch).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn update_yuv_texture(
        self,
        texture: Ptr[Texture],
        rect: Ptr[Rect],
        Yplane: Ptr[UInt8],
        Ypitch: Int32,
        Uplane: Ptr[UInt8],
        Upitch: Int32,
        Vplane: Ptr[UInt8],
        Vpitch: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UpdateYUVTexture
        """
        var success_status = self._update_yuv_texture(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=Yplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
            Ptr(to=Ypitch).bitcast[Int32]()[],
            Ptr(to=Uplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
            Ptr(to=Upitch).bitcast[Int32]()[],
            Ptr(to=Vplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
            Ptr(to=Vpitch).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn update_nv_texture(
        self,
        texture: Ptr[Texture],
        rect: Ptr[Rect],
        Yplane: Ptr[UInt8],
        Ypitch: Int32,
        UVplane: Ptr[UInt8],
        UVpitch: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UpdateNVTexture
        """
        var success_status = self._update_nv_texture(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=Yplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
            Ptr(to=Ypitch).bitcast[Int32]()[],
            Ptr(to=UVplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
            Ptr(to=UVpitch).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn lock_texture(
        self,
        texture: Ptr[Texture],
        rect: Ptr[Rect],
        pixels: Ptr[Ptr[NoneType, MutExternalOrigin]],
        pitch: Ptr[Int32],
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LockTexture
        """
        return self._lock_texture(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=pixels).bitcast[Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]]()[],
            Ptr(to=pitch).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )

    fn lock_texture_to_surface(
        self, texture: Ptr[Texture], rect: Ptr[Rect], surface: Ptr[Ptr[Surface, MutExternalOrigin]]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LockTextureToSurface
        """
        var success_status = self._lock_texture_to_surface(
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=surface).bitcast[Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn unlock_texture(self, texture: Ptr[Texture]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UnlockTexture
        """
        self._unlock_texture(Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[])

    fn set_render_target(self, renderer: Ptr[Renderer], texture: Ptr[Texture]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderTarget
        """
        var success_status = self._set_render_target(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_target(self, renderer: Ptr[Renderer]) raises -> Ptr[Texture, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderTarget
        """
        var result_pointer = self._get_render_target(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_render_target call. See official documentation for details."
        return result_pointer

    fn set_render_logical_presentation(
        self, renderer: Ptr[Renderer], w: Int32, h: Int32, mode: RendererLogicalPresentation
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderLogicalPresentation
        """
        var success_status = self._set_render_logical_presentation(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Int32]()[],
            Ptr(to=h).bitcast[Int32]()[],
            Ptr(to=mode).bitcast[RendererLogicalPresentation]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_logical_presentation(
        self,
        renderer: Ptr[Renderer],
        w: Ptr[Int32],
        h: Ptr[Int32],
        mode: Ptr[RendererLogicalPresentation],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentation
        """
        var success_status = self._get_render_logical_presentation(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=mode).bitcast[Ptr[RendererLogicalPresentation, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_logical_presentation_rect(
        self, renderer: Ptr[Renderer], rect: Ptr[FRect]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentationRect
        """
        var success_status = self._get_render_logical_presentation_rect(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[FRect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_coordinates_from_window(
        self,
        renderer: Ptr[Renderer],
        window_x: Float32,
        window_y: Float32,
        x: Ptr[Float32],
        y: Ptr[Float32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesFromWindow
        """
        var success_status = self._render_coordinates_from_window(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=window_x).bitcast[Float32]()[],
            Ptr(to=window_y).bitcast[Float32]()[],
            Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_coordinates_to_window(
        self,
        renderer: Ptr[Renderer],
        x: Float32,
        y: Float32,
        window_x: Ptr[Float32],
        window_y: Ptr[Float32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesToWindow
        """
        var success_status = self._render_coordinates_to_window(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Float32]()[],
            Ptr(to=y).bitcast[Float32]()[],
            Ptr(to=window_x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=window_y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn convert_event_to_render_coordinates(
        self, renderer: Ptr[Renderer], event: Ptr[Event]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ConvertEventToRenderCoordinates
        """
        var success_status = self._convert_event_to_render_coordinates(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_render_viewport(self, renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderViewport
        """
        var success_status = self._set_render_viewport(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_viewport(self, renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderViewport
        """
        var success_status = self._get_render_viewport(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_viewport_set(self, renderer: Ptr[Renderer]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderViewportSet
        """
        return self._render_viewport_set(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )

    fn get_render_safe_area(self, renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderSafeArea
        """
        var success_status = self._get_render_safe_area(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_render_clip_rect(self, renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderClipRect
        """
        var success_status = self._set_render_clip_rect(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_clip_rect(self, renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderClipRect
        """
        var success_status = self._get_render_clip_rect(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_clip_enabled(self, renderer: Ptr[Renderer]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderClipEnabled
        """
        return self._render_clip_enabled(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )

    fn set_render_scale(self, renderer: Ptr[Renderer], scaleX: Float32, scaleY: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderScale
        """
        var success_status = self._set_render_scale(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=scaleX).bitcast[Float32]()[],
            Ptr(to=scaleY).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_scale(
        self, renderer: Ptr[Renderer], scaleX: Ptr[Float32], scaleY: Ptr[Float32]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderScale
        """
        var success_status = self._get_render_scale(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=scaleX).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=scaleY).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_render_draw_color(
        self, renderer: Ptr[Renderer], r: UInt8, g: UInt8, b: UInt8, a: UInt8
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor
        """
        var success_status = self._set_render_draw_color(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[UInt8]()[],
            Ptr(to=g).bitcast[UInt8]()[],
            Ptr(to=b).bitcast[UInt8]()[],
            Ptr(to=a).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_render_draw_color_float(
        self, renderer: Ptr[Renderer], r: Float32, g: Float32, b: Float32, a: Float32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColorFloat
        """
        var success_status = self._set_render_draw_color_float(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Float32]()[],
            Ptr(to=g).bitcast[Float32]()[],
            Ptr(to=b).bitcast[Float32]()[],
            Ptr(to=a).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_draw_color(
        self, renderer: Ptr[Renderer], r: Ptr[UInt8], g: Ptr[UInt8], b: Ptr[UInt8], a: Ptr[UInt8]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColor
        """
        var success_status = self._get_render_draw_color(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=a).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_draw_color_float(
        self,
        renderer: Ptr[Renderer],
        r: Ptr[Float32],
        g: Ptr[Float32],
        b: Ptr[Float32],
        a: Ptr[Float32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColorFloat
        """
        var success_status = self._get_render_draw_color_float(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=a).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_render_color_scale(self, renderer: Ptr[Renderer], scale: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderColorScale
        """
        var success_status = self._set_render_color_scale(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=scale).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_color_scale(self, renderer: Ptr[Renderer], scale: Ptr[Float32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderColorScale
        """
        var success_status = self._get_render_color_scale(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=scale).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_render_draw_blend_mode(self, renderer: Ptr[Renderer], blendMode: BlendMode) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawBlendMode
        """
        var success_status = self._set_render_draw_blend_mode(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=blendMode).bitcast[BlendMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_draw_blend_mode(self, renderer: Ptr[Renderer], blendMode: Ptr[BlendMode]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawBlendMode
        """
        var success_status = self._get_render_draw_blend_mode(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=blendMode).bitcast[Ptr[BlendMode, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_clear(self, renderer: Ptr[Renderer]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderClear
        """
        var success_status = self._render_clear(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn render_point(self, renderer: Ptr[Renderer], x: Float32, y: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderPoint
        """
        var success_status = self._render_point(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Float32]()[],
            Ptr(to=y).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_points(self, renderer: Ptr[Renderer], points: Ptr[FPoint], count: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderPoints
        """
        var success_status = self._render_points(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=points).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_line(
        self, renderer: Ptr[Renderer], x1: Float32, y1: Float32, x2: Float32, y2: Float32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderLine
        """
        var success_status = self._render_line(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=x1).bitcast[Float32]()[],
            Ptr(to=y1).bitcast[Float32]()[],
            Ptr(to=x2).bitcast[Float32]()[],
            Ptr(to=y2).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_lines(self, renderer: Ptr[Renderer], points: Ptr[FPoint], count: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderLines
        """
        var success_status = self._render_lines(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=points).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_rect(self, renderer: Ptr[Renderer], rect: Ptr[FRect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderRect
        """
        var success_status = self._render_rect(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_rects(self, renderer: Ptr[Renderer], rects: Ptr[FRect], count: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderRects
        """
        var success_status = self._render_rects(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rects).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_fill_rect(self, renderer: Ptr[Renderer], rect: Ptr[FRect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderFillRect
        """
        var success_status = self._render_fill_rect(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_fill_rects(self, renderer: Ptr[Renderer], rects: Ptr[FRect], count: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderFillRects
        """
        var success_status = self._render_fill_rects(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rects).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_texture(
        self,
        renderer: Ptr[Renderer],
        texture: Ptr[Texture],
        srcrect: Ptr[FRect],
        dstrect: Ptr[FRect],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderTexture
        """
        var success_status = self._render_texture(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_texture_rotated(
        self,
        renderer: Ptr[Renderer],
        texture: Ptr[Texture],
        srcrect: Ptr[FRect],
        dstrect: Ptr[FRect],
        angle: Float64,
        center: Ptr[FPoint],
        flip: FlipMode,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderTextureRotated
        """
        var success_status = self._render_texture_rotated(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=angle).bitcast[Float64]()[],
            Ptr(to=center).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
            Ptr(to=flip).bitcast[FlipMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_texture_affine(
        self,
        renderer: Ptr[Renderer],
        texture: Ptr[Texture],
        srcrect: Ptr[FRect],
        origin: Ptr[FPoint],
        right: Ptr[FPoint],
        down: Ptr[FPoint],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderTextureAffine
        """
        var success_status = self._render_texture_affine(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=origin).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
            Ptr(to=right).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
            Ptr(to=down).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_texture_tiled(
        self,
        renderer: Ptr[Renderer],
        texture: Ptr[Texture],
        srcrect: Ptr[FRect],
        scale: Float32,
        dstrect: Ptr[FRect],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderTextureTiled
        """
        var success_status = self._render_texture_tiled(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=scale).bitcast[Float32]()[],
            Ptr(to=dstrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_texture9_grid(
        self,
        renderer: Ptr[Renderer],
        texture: Ptr[Texture],
        srcrect: Ptr[FRect],
        left_width: Float32,
        right_width: Float32,
        top_height: Float32,
        bottom_height: Float32,
        scale: Float32,
        dstrect: Ptr[FRect],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderTexture9Grid
        """
        var success_status = self._render_texture9_grid(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=left_width).bitcast[Float32]()[],
            Ptr(to=right_width).bitcast[Float32]()[],
            Ptr(to=top_height).bitcast[Float32]()[],
            Ptr(to=bottom_height).bitcast[Float32]()[],
            Ptr(to=scale).bitcast[Float32]()[],
            Ptr(to=dstrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_texture9_grid_tiled(
        self,
        renderer: Ptr[Renderer],
        texture: Ptr[Texture],
        srcrect: Ptr[FRect],
        left_width: Float32,
        right_width: Float32,
        top_height: Float32,
        bottom_height: Float32,
        scale: Float32,
        dstrect: Ptr[FRect],
        tileScale: Float32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderTexture9GridTiled
        """
        var success_status = self._render_texture9_grid_tiled(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=left_width).bitcast[Float32]()[],
            Ptr(to=right_width).bitcast[Float32]()[],
            Ptr(to=top_height).bitcast[Float32]()[],
            Ptr(to=bottom_height).bitcast[Float32]()[],
            Ptr(to=scale).bitcast[Float32]()[],
            Ptr(to=dstrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
            Ptr(to=tileScale).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_geometry(
        self,
        renderer: Ptr[Renderer],
        texture: Ptr[Texture],
        vertices: Ptr[Vertex],
        num_vertices: Int32,
        indices: Ptr[Int32],
        num_indices: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderGeometry
        """
        var success_status = self._render_geometry(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=vertices).bitcast[Ptr[Vertex, ImmutExternalOrigin]]()[],
            Ptr(to=num_vertices).bitcast[Int32]()[],
            Ptr(to=indices).bitcast[Ptr[Int32, ImmutExternalOrigin]]()[],
            Ptr(to=num_indices).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_geometry_raw(
        self,
        renderer: Ptr[Renderer],
        texture: Ptr[Texture],
        xy: Ptr[Float32],
        xy_stride: Int32,
        color: Ptr[FColor],
        color_stride: Int32,
        uv: Ptr[Float32],
        uv_stride: Int32,
        num_vertices: Int32,
        indices: Ptr[NoneType],
        num_indices: Int32,
        size_indices: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderGeometryRaw
        """
        var success_status = self._render_geometry_raw(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
            Ptr(to=xy).bitcast[Ptr[Float32, ImmutExternalOrigin]]()[],
            Ptr(to=xy_stride).bitcast[Int32]()[],
            Ptr(to=color).bitcast[Ptr[FColor, ImmutExternalOrigin]]()[],
            Ptr(to=color_stride).bitcast[Int32]()[],
            Ptr(to=uv).bitcast[Ptr[Float32, ImmutExternalOrigin]]()[],
            Ptr(to=uv_stride).bitcast[Int32]()[],
            Ptr(to=num_vertices).bitcast[Int32]()[],
            Ptr(to=indices).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=num_indices).bitcast[Int32]()[],
            Ptr(to=size_indices).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_render_texture_address_mode(
        self, renderer: Ptr[Renderer], u_mode: TextureAddressMode, v_mode: TextureAddressMode
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderTextureAddressMode
        """
        var success_status = self._set_render_texture_address_mode(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=u_mode).bitcast[TextureAddressMode]()[],
            Ptr(to=v_mode).bitcast[TextureAddressMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_texture_address_mode(
        self,
        renderer: Ptr[Renderer],
        u_mode: Ptr[TextureAddressMode],
        v_mode: Ptr[TextureAddressMode],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderTextureAddressMode
        """
        var success_status = self._get_render_texture_address_mode(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=u_mode).bitcast[Ptr[TextureAddressMode, MutExternalOrigin]]()[],
            Ptr(to=v_mode).bitcast[Ptr[TextureAddressMode, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_read_pixels(
        self, renderer: Ptr[Renderer], rect: Ptr[Rect]
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderReadPixels
        """
        var result_pointer = self._render_read_pixels(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn render_present(self, renderer: Ptr[Renderer]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderPresent
        """
        var success_status = self._render_present(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn destroy_texture(self, texture: Ptr[Texture]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyTexture
        """
        self._destroy_texture(Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[])

    fn destroy_renderer(self, renderer: Ptr[Renderer]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyRenderer
        """
        self._destroy_renderer(Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[])

    fn flush_renderer(self, renderer: Ptr[Renderer]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FlushRenderer
        """
        var success_status = self._flush_renderer(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn get_render_metal_layer(
        self, renderer: Ptr[Renderer]
    ) raises -> Ptr[NoneType, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderMetalLayer
        """
        var result_pointer = self._get_render_metal_layer(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_render_metal_layer call. See official documentation for details."
        return result_pointer

    fn get_render_metal_command_encoder(
        self, renderer: Ptr[Renderer]
    ) raises -> Ptr[NoneType, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderMetalCommandEncoder
        """
        var result_pointer = self._get_render_metal_command_encoder(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_render_metal_command_encoder call. See official documentation for details."
        return result_pointer

    fn add_vulkan_render_semaphores(
        self,
        renderer: Ptr[Renderer],
        wait_stage_mask: UInt32,
        wait_semaphore: Int64,
        signal_semaphore: Int64,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AddVulkanRenderSemaphores
        """
        var success_status = self._add_vulkan_render_semaphores(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=wait_stage_mask).bitcast[UInt32]()[],
            Ptr(to=wait_semaphore).bitcast[Int64]()[],
            Ptr(to=signal_semaphore).bitcast[Int64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_render_v_sync(self, renderer: Ptr[Renderer], vsync: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetRenderVSync
        """
        var success_status = self._set_render_v_sync(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=vsync).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_render_v_sync(self, renderer: Ptr[Renderer], vsync: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRenderVSync
        """
        var success_status = self._get_render_v_sync(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=vsync).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn render_debug_text(
        self, renderer: Ptr[Renderer], x: Float32, y: Float32, str: CStringSlice
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderDebugText
        """
        var success_status = self._render_debug_text(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Float32]()[],
            Ptr(to=y).bitcast[Float32]()[],
            str.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn render_debug_text_format(
        self, renderer: Ptr[Renderer], x: Float32, y: Float32, fmt: CStringSlice
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenderDebugTextFormat
        """
        var success_status = self._render_debug_text_format(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Float32]()[],
            Ptr(to=y).bitcast[Float32]()[],
            fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn set_default_texture_scale_mode(self, renderer: Ptr[Renderer], scale_mode: ScaleMode) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetDefaultTextureScaleMode
        """
        var success_status = self._set_default_texture_scale_mode(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=scale_mode).bitcast[ScaleMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_default_texture_scale_mode(
        self, renderer: Ptr[Renderer], scale_mode: Ptr[ScaleMode]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDefaultTextureScaleMode
        """
        var success_status = self._get_default_texture_scale_mode(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=scale_mode).bitcast[Ptr[ScaleMode, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn create_gpu_render_state(
        self, renderer: Ptr[Renderer], createinfo: Ptr[GPURenderStateCreateInfo]
    ) raises -> Ptr[GPURenderState, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateGPURenderState
        """
        var result_pointer = self._create_gpu_render_state(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=createinfo).bitcast[Ptr[GPURenderStateCreateInfo, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_gpu_render_state_fragment_uniforms(
        self, state: Ptr[GPURenderState], slot_index: UInt32, data: Ptr[NoneType], length: UInt32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateFragmentUniforms
        """
        var success_status = self._set_gpu_render_state_fragment_uniforms(
            Ptr(to=state).bitcast[Ptr[GPURenderState, MutExternalOrigin]]()[],
            Ptr(to=slot_index).bitcast[UInt32]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=length).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_gpu_render_state(self, renderer: Ptr[Renderer], state: Ptr[GPURenderState]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetGPURenderState
        """
        var success_status = self._set_gpu_render_state(
            Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
            Ptr(to=state).bitcast[Ptr[GPURenderState, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn destroy_gpu_render_state(self, state: Ptr[GPURenderState]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyGPURenderState
        """
        self._destroy_gpu_render_state(
            Ptr(to=state).bitcast[Ptr[GPURenderState, MutExternalOrigin]]()[]
        )

    fn get_sensors(self, count: Ptr[Int32]) raises -> Ptr[SensorID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensors
        """
        var result_pointer = self._get_sensors(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_sensor_name_for_id(
        self, instance_id: SensorID
    ) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorNameForID
        """
        var c_string = self._get_sensor_name_for_id(Ptr(to=instance_id).bitcast[SensorID]()[])
        if not c_string.unsafe_ptr():
            raise "Error in get_sensor_name_for_id call. See official documentation for details."
        return c_string

    fn get_sensor_type_for_id(self, instance_id: SensorID) -> SensorType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorTypeForID
        """
        return self._get_sensor_type_for_id(Ptr(to=instance_id).bitcast[SensorID]()[])

    fn get_sensor_non_portable_type_for_id(self, instance_id: SensorID) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorNonPortableTypeForID
        """
        return self._get_sensor_non_portable_type_for_id(Ptr(to=instance_id).bitcast[SensorID]()[])

    fn open_sensor(self, instance_id: SensorID) raises -> Ptr[Sensor, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenSensor
        """
        var result_pointer = self._open_sensor(Ptr(to=instance_id).bitcast[SensorID]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_sensor_from_id(self, instance_id: SensorID) raises -> Ptr[Sensor, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorFromID
        """
        var result_pointer = self._get_sensor_from_id(Ptr(to=instance_id).bitcast[SensorID]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_sensor_properties(self, sensor: Ptr[Sensor]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorProperties
        """
        return self._get_sensor_properties(
            Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[]
        )

    fn get_sensor_name(self, sensor: Ptr[Sensor]) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorName
        """
        var c_string = self._get_sensor_name(
            Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[]
        )
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_sensor_type(self, sensor: Ptr[Sensor]) -> SensorType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorType
        """
        return self._get_sensor_type(Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[])

    fn get_sensor_non_portable_type(self, sensor: Ptr[Sensor]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorNonPortableType
        """
        return self._get_sensor_non_portable_type(
            Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[]
        )

    fn get_sensor_id(self, sensor: Ptr[Sensor]) -> SensorID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorID
        """
        return self._get_sensor_id(Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[])

    fn get_sensor_data(self, sensor: Ptr[Sensor], data: Ptr[Float32], num_values: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSensorData
        """
        var success_status = self._get_sensor_data(
            Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[],
            Ptr(to=data).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=num_values).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn close_sensor(self, sensor: Ptr[Sensor]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CloseSensor
        """
        self._close_sensor(Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[])

    fn update_sensors(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UpdateSensors
        """
        self._update_sensors()

    fn open_title_storage(
        self, override: CStringSlice, props: PropertiesID
    ) raises -> Ptr[Storage, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenTitleStorage
        """
        var result_pointer = self._open_title_storage(
            override.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=props).bitcast[PropertiesID]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn open_user_storage(
        self, org: CStringSlice, app: CStringSlice, props: PropertiesID
    ) raises -> Ptr[Storage, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenUserStorage
        """
        var result_pointer = self._open_user_storage(
            org.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            app.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=props).bitcast[PropertiesID]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn open_file_storage(self, path: CStringSlice) raises -> Ptr[Storage, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenFileStorage
        """
        var result_pointer = self._open_file_storage(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn open_storage(
        self, iface: Ptr[StorageInterface], userdata: Ptr[NoneType]
    ) raises -> Ptr[Storage, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_OpenStorage
        """
        var result_pointer = self._open_storage(
            Ptr(to=iface).bitcast[Ptr[StorageInterface, ImmutExternalOrigin]]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn close_storage(self, storage: Ptr[Storage]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CloseStorage
        """
        return self._close_storage(Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[])

    fn storage_ready(self, storage: Ptr[Storage]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_StorageReady
        """
        return self._storage_ready(Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[])

    fn get_storage_file_size(
        self, storage: Ptr[Storage], path: CStringSlice, length: Ptr[UInt64]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetStorageFileSize
        """
        var success_status = self._get_storage_file_size(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=length).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_storage_file(
        self, storage: Ptr[Storage], path: CStringSlice, destination: Ptr[NoneType], length: UInt64
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadStorageFile
        """
        var success_status = self._read_storage_file(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=destination).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=length).bitcast[UInt64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_storage_file(
        self, storage: Ptr[Storage], path: CStringSlice, source: Ptr[NoneType], length: UInt64
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteStorageFile
        """
        var success_status = self._write_storage_file(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=source).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=length).bitcast[UInt64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn create_storage_directory(self, storage: Ptr[Storage], path: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateStorageDirectory
        """
        var success_status = self._create_storage_directory(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn enumerate_storage_directory(
        self,
        storage: Ptr[Storage],
        path: CStringSlice,
        callback: EnumerateDirectoryCallback,
        userdata: Ptr[NoneType],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EnumerateStorageDirectory
        """
        var success_status = self._enumerate_storage_directory(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=callback).bitcast[EnumerateDirectoryCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn remove_storage_path(self, storage: Ptr[Storage], path: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RemoveStoragePath
        """
        var success_status = self._remove_storage_path(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn rename_storage_path(
        self, storage: Ptr[Storage], oldpath: CStringSlice, newpath: CStringSlice
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RenameStoragePath
        """
        var success_status = self._rename_storage_path(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            oldpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            newpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn copy_storage_file(
        self, storage: Ptr[Storage], oldpath: CStringSlice, newpath: CStringSlice
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CopyStorageFile
        """
        var success_status = self._copy_storage_file(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            oldpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            newpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn get_storage_path_info(
        self, storage: Ptr[Storage], path: CStringSlice, info: Ptr[PathInfo]
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetStoragePathInfo
        """
        return self._get_storage_path_info(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=info).bitcast[Ptr[PathInfo, MutExternalOrigin]]()[],
        )

    fn get_storage_space_remaining(self, storage: Ptr[Storage]) -> UInt64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetStorageSpaceRemaining
        """
        return self._get_storage_space_remaining(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[]
        )

    fn glob_storage_directory(
        self,
        storage: Ptr[Storage],
        path: CStringSlice,
        pattern: CStringSlice,
        flags: GlobFlags,
        count: Ptr[Int32],
    ) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GlobStorageDirectory
        """
        var result_pointer = self._glob_storage_directory(
            Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            pattern.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=flags).bitcast[GlobFlags]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_surface(
        self, width: Int32, height: Int32, format: PixelFormat
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateSurface
        """
        var result_pointer = self._create_surface(
            Ptr(to=width).bitcast[Int32]()[],
            Ptr(to=height).bitcast[Int32]()[],
            Ptr(to=format).bitcast[PixelFormat]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_surface_from(
        self, width: Int32, height: Int32, format: PixelFormat, pixels: Ptr[NoneType], pitch: Int32
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateSurfaceFrom
        """
        var result_pointer = self._create_surface_from(
            Ptr(to=width).bitcast[Int32]()[],
            Ptr(to=height).bitcast[Int32]()[],
            Ptr(to=format).bitcast[PixelFormat]()[],
            Ptr(to=pixels).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=pitch).bitcast[Int32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn destroy_surface(self, surface: Ptr[Surface]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroySurface
        """
        self._destroy_surface(Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[])

    fn get_surface_properties(self, surface: Ptr[Surface]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSurfaceProperties
        """
        return self._get_surface_properties(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )

    fn set_surface_colorspace(self, surface: Ptr[Surface], colorspace: Colorspace) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorspace
        """
        var success_status = self._set_surface_colorspace(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=colorspace).bitcast[Colorspace]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_surface_colorspace(self, surface: Ptr[Surface]) -> Colorspace:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorspace
        """
        return self._get_surface_colorspace(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )

    fn create_surface_palette(
        self, surface: Ptr[Surface]
    ) raises -> Ptr[Palette, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateSurfacePalette
        """
        var result_pointer = self._create_surface_palette(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_surface_palette(self, surface: Ptr[Surface], palette: Ptr[Palette]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetSurfacePalette
        """
        var success_status = self._set_surface_palette(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_surface_palette(self, surface: Ptr[Surface]) raises -> Ptr[Palette, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSurfacePalette
        """
        var result_pointer = self._get_surface_palette(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_surface_palette call. See official documentation for details."
        return result_pointer

    fn add_surface_alternate_image(self, surface: Ptr[Surface], image: Ptr[Surface]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AddSurfaceAlternateImage
        """
        var success_status = self._add_surface_alternate_image(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=image).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn surface_has_alternate_images(self, surface: Ptr[Surface]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SurfaceHasAlternateImages
        """
        return self._surface_has_alternate_images(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )

    fn get_surface_images(
        self, surface: Ptr[Surface], count: Ptr[Int32]
    ) raises -> Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSurfaceImages
        """
        var result_pointer = self._get_surface_images(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn remove_surface_alternate_images(self, surface: Ptr[Surface]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RemoveSurfaceAlternateImages
        """
        self._remove_surface_alternate_images(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )

    fn lock_surface(self, surface: Ptr[Surface]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LockSurface
        """
        var success_status = self._lock_surface(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn unlock_surface(self, surface: Ptr[Surface]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UnlockSurface
        """
        self._unlock_surface(Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[])

    fn load_surface_io(
        self, src: Ptr[IOStream], closeio: Bool
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadSurface_IO
        """
        var result_pointer = self._load_surface_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_surface(self, file: CStringSlice) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadSurface
        """
        var result_pointer = self._load_surface(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_bmp_io(
        self, src: Ptr[IOStream], closeio: Bool
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadBMP_IO
        """
        var result_pointer = self._load_bmp_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_bmp(self, file: CStringSlice) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadBMP
        """
        var result_pointer = self._load_bmp(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn save_bmp_io(self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SaveBMP_IO
        """
        var success_status = self._save_bmp_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_bmp(self, surface: Ptr[Surface], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SaveBMP
        """
        var success_status = self._save_bmp(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn load_png_io(
        self, src: Ptr[IOStream], closeio: Bool
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadPNG_IO
        """
        var result_pointer = self._load_png_io(
            Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_png(self, file: CStringSlice) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_LoadPNG
        """
        var result_pointer = self._load_png(
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn save_png_io(self, surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SavePNG_IO
        """
        var success_status = self._save_png_io(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn save_png(self, surface: Ptr[Surface], file: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SavePNG
        """
        var success_status = self._save_png(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn set_surface_rle(self, surface: Ptr[Surface], enabled: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetSurfaceRLE
        """
        var success_status = self._set_surface_rle(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=enabled).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn surface_has_rle(self, surface: Ptr[Surface]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SurfaceHasRLE
        """
        return self._surface_has_rle(Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[])

    fn set_surface_color_key(self, surface: Ptr[Surface], enabled: Bool, key: UInt32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorKey
        """
        var success_status = self._set_surface_color_key(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=enabled).bitcast[Bool]()[],
            Ptr(to=key).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn surface_has_color_key(self, surface: Ptr[Surface]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SurfaceHasColorKey
        """
        return self._surface_has_color_key(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )

    fn get_surface_color_key(self, surface: Ptr[Surface], key: Ptr[UInt32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorKey
        """
        var success_status = self._get_surface_color_key(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=key).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_surface_color_mod(self, surface: Ptr[Surface], r: UInt8, g: UInt8, b: UInt8) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorMod
        """
        var success_status = self._set_surface_color_mod(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[UInt8]()[],
            Ptr(to=g).bitcast[UInt8]()[],
            Ptr(to=b).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_surface_color_mod(
        self, surface: Ptr[Surface], r: Ptr[UInt8], g: Ptr[UInt8], b: Ptr[UInt8]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorMod
        """
        var success_status = self._get_surface_color_mod(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_surface_alpha_mod(self, surface: Ptr[Surface], alpha: UInt8) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetSurfaceAlphaMod
        """
        var success_status = self._set_surface_alpha_mod(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=alpha).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_surface_alpha_mod(self, surface: Ptr[Surface], alpha: Ptr[UInt8]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSurfaceAlphaMod
        """
        var success_status = self._get_surface_alpha_mod(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=alpha).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_surface_blend_mode(self, surface: Ptr[Surface], blendMode: BlendMode) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetSurfaceBlendMode
        """
        var success_status = self._set_surface_blend_mode(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=blendMode).bitcast[BlendMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_surface_blend_mode(self, surface: Ptr[Surface], blendMode: Ptr[BlendMode]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSurfaceBlendMode
        """
        var success_status = self._get_surface_blend_mode(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=blendMode).bitcast[Ptr[BlendMode, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_surface_clip_rect(self, surface: Ptr[Surface], rect: Ptr[Rect]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetSurfaceClipRect
        """
        return self._set_surface_clip_rect(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )

    fn get_surface_clip_rect(self, surface: Ptr[Surface], rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSurfaceClipRect
        """
        var success_status = self._get_surface_clip_rect(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn flip_surface(self, surface: Ptr[Surface], flip: FlipMode) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FlipSurface
        """
        var success_status = self._flip_surface(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=flip).bitcast[FlipMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn rotate_surface(
        self, surface: Ptr[Surface], angle: Float32
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RotateSurface
        """
        var result_pointer = self._rotate_surface(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=angle).bitcast[Float32]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn duplicate_surface(self, surface: Ptr[Surface]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DuplicateSurface
        """
        var result_pointer = self._duplicate_surface(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn scale_surface(
        self, surface: Ptr[Surface], width: Int32, height: Int32, scaleMode: ScaleMode
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ScaleSurface
        """
        var result_pointer = self._scale_surface(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=width).bitcast[Int32]()[],
            Ptr(to=height).bitcast[Int32]()[],
            Ptr(to=scaleMode).bitcast[ScaleMode]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn convert_surface(
        self, surface: Ptr[Surface], format: PixelFormat
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ConvertSurface
        """
        var result_pointer = self._convert_surface(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=format).bitcast[PixelFormat]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn convert_surface_and_colorspace(
        self,
        surface: Ptr[Surface],
        format: PixelFormat,
        palette: Ptr[Palette],
        colorspace: Colorspace,
        props: PropertiesID,
    ) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ConvertSurfaceAndColorspace
        """
        var result_pointer = self._convert_surface_and_colorspace(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=format).bitcast[PixelFormat]()[],
            Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[],
            Ptr(to=colorspace).bitcast[Colorspace]()[],
            Ptr(to=props).bitcast[PropertiesID]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn convert_pixels(
        self,
        width: Int32,
        height: Int32,
        src_format: PixelFormat,
        src: Ptr[NoneType],
        src_pitch: Int32,
        dst_format: PixelFormat,
        dst: Ptr[NoneType],
        dst_pitch: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ConvertPixels
        """
        var success_status = self._convert_pixels(
            Ptr(to=width).bitcast[Int32]()[],
            Ptr(to=height).bitcast[Int32]()[],
            Ptr(to=src_format).bitcast[PixelFormat]()[],
            Ptr(to=src).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=src_pitch).bitcast[Int32]()[],
            Ptr(to=dst_format).bitcast[PixelFormat]()[],
            Ptr(to=dst).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=dst_pitch).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn convert_pixels_and_colorspace(
        self,
        width: Int32,
        height: Int32,
        src_format: PixelFormat,
        src_colorspace: Colorspace,
        src_properties: PropertiesID,
        src: Ptr[NoneType],
        src_pitch: Int32,
        dst_format: PixelFormat,
        dst_colorspace: Colorspace,
        dst_properties: PropertiesID,
        dst: Ptr[NoneType],
        dst_pitch: Int32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ConvertPixelsAndColorspace
        """
        var success_status = self._convert_pixels_and_colorspace(
            Ptr(to=width).bitcast[Int32]()[],
            Ptr(to=height).bitcast[Int32]()[],
            Ptr(to=src_format).bitcast[PixelFormat]()[],
            Ptr(to=src_colorspace).bitcast[Colorspace]()[],
            Ptr(to=src_properties).bitcast[PropertiesID]()[],
            Ptr(to=src).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=src_pitch).bitcast[Int32]()[],
            Ptr(to=dst_format).bitcast[PixelFormat]()[],
            Ptr(to=dst_colorspace).bitcast[Colorspace]()[],
            Ptr(to=dst_properties).bitcast[PropertiesID]()[],
            Ptr(to=dst).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=dst_pitch).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn premultiply_alpha(
        self,
        width: Int32,
        height: Int32,
        src_format: PixelFormat,
        src: Ptr[NoneType],
        src_pitch: Int32,
        dst_format: PixelFormat,
        dst: Ptr[NoneType],
        dst_pitch: Int32,
        linear: Bool,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PremultiplyAlpha
        """
        var success_status = self._premultiply_alpha(
            Ptr(to=width).bitcast[Int32]()[],
            Ptr(to=height).bitcast[Int32]()[],
            Ptr(to=src_format).bitcast[PixelFormat]()[],
            Ptr(to=src).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=src_pitch).bitcast[Int32]()[],
            Ptr(to=dst_format).bitcast[PixelFormat]()[],
            Ptr(to=dst).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=dst_pitch).bitcast[Int32]()[],
            Ptr(to=linear).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn premultiply_surface_alpha(self, surface: Ptr[Surface], linear: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_PremultiplySurfaceAlpha
        """
        var success_status = self._premultiply_surface_alpha(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=linear).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn clear_surface(
        self, surface: Ptr[Surface], r: Float32, g: Float32, b: Float32, a: Float32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ClearSurface
        """
        var success_status = self._clear_surface(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[Float32]()[],
            Ptr(to=g).bitcast[Float32]()[],
            Ptr(to=b).bitcast[Float32]()[],
            Ptr(to=a).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn fill_surface_rect(self, dst: Ptr[Surface], rect: Ptr[Rect], color: UInt32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FillSurfaceRect
        """
        var success_status = self._fill_surface_rect(
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=color).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn fill_surface_rects(
        self, dst: Ptr[Surface], rects: Ptr[Rect], count: Int32, color: UInt32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FillSurfaceRects
        """
        var success_status = self._fill_surface_rects(
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=rects).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
            Ptr(to=color).bitcast[UInt32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn blit_surface(
        self, src: Ptr[Surface], srcrect: Ptr[Rect], dst: Ptr[Surface], dstrect: Ptr[Rect]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BlitSurface
        """
        var success_status = self._blit_surface(
            Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn blit_surface_unchecked(
        self, src: Ptr[Surface], srcrect: Ptr[Rect], dst: Ptr[Surface], dstrect: Ptr[Rect]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceUnchecked
        """
        var success_status = self._blit_surface_unchecked(
            Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn blit_surface_scaled(
        self,
        src: Ptr[Surface],
        srcrect: Ptr[Rect],
        dst: Ptr[Surface],
        dstrect: Ptr[Rect],
        scaleMode: ScaleMode,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceScaled
        """
        var success_status = self._blit_surface_scaled(
            Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=scaleMode).bitcast[ScaleMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn blit_surface_unchecked_scaled(
        self,
        src: Ptr[Surface],
        srcrect: Ptr[Rect],
        dst: Ptr[Surface],
        dstrect: Ptr[Rect],
        scaleMode: ScaleMode,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceUncheckedScaled
        """
        var success_status = self._blit_surface_unchecked_scaled(
            Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=scaleMode).bitcast[ScaleMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn stretch_surface(
        self,
        src: Ptr[Surface],
        srcrect: Ptr[Rect],
        dst: Ptr[Surface],
        dstrect: Ptr[Rect],
        scaleMode: ScaleMode,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_StretchSurface
        """
        var success_status = self._stretch_surface(
            Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=scaleMode).bitcast[ScaleMode]()[],
        )
        if not success_status:
            raise self._get_error()

    fn blit_surface_tiled(
        self, src: Ptr[Surface], srcrect: Ptr[Rect], dst: Ptr[Surface], dstrect: Ptr[Rect]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceTiled
        """
        var success_status = self._blit_surface_tiled(
            Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn blit_surface_tiled_with_scale(
        self,
        src: Ptr[Surface],
        srcrect: Ptr[Rect],
        scale: Float32,
        scaleMode: ScaleMode,
        dst: Ptr[Surface],
        dstrect: Ptr[Rect],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceTiledWithScale
        """
        var success_status = self._blit_surface_tiled_with_scale(
            Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=scale).bitcast[Float32]()[],
            Ptr(to=scaleMode).bitcast[ScaleMode]()[],
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn blit_surface9_grid(
        self,
        src: Ptr[Surface],
        srcrect: Ptr[Rect],
        left_width: Int32,
        right_width: Int32,
        top_height: Int32,
        bottom_height: Int32,
        scale: Float32,
        scaleMode: ScaleMode,
        dst: Ptr[Surface],
        dstrect: Ptr[Rect],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_BlitSurface9Grid
        """
        var success_status = self._blit_surface9_grid(
            Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=left_width).bitcast[Int32]()[],
            Ptr(to=right_width).bitcast[Int32]()[],
            Ptr(to=top_height).bitcast[Int32]()[],
            Ptr(to=bottom_height).bitcast[Int32]()[],
            Ptr(to=scale).bitcast[Float32]()[],
            Ptr(to=scaleMode).bitcast[ScaleMode]()[],
            Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn map_surface_rgb(self, surface: Ptr[Surface], r: UInt8, g: UInt8, b: UInt8) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_MapSurfaceRGB
        """
        return self._map_surface_rgb(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[UInt8]()[],
            Ptr(to=g).bitcast[UInt8]()[],
            Ptr(to=b).bitcast[UInt8]()[],
        )

    fn map_surface_rgba(
        self, surface: Ptr[Surface], r: UInt8, g: UInt8, b: UInt8, a: UInt8
    ) -> UInt32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_MapSurfaceRGBA
        """
        return self._map_surface_rgba(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=r).bitcast[UInt8]()[],
            Ptr(to=g).bitcast[UInt8]()[],
            Ptr(to=b).bitcast[UInt8]()[],
            Ptr(to=a).bitcast[UInt8]()[],
        )

    fn read_surface_pixel(
        self,
        surface: Ptr[Surface],
        x: Int32,
        y: Int32,
        r: Ptr[UInt8],
        g: Ptr[UInt8],
        b: Ptr[UInt8],
        a: Ptr[UInt8],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadSurfacePixel
        """
        var success_status = self._read_surface_pixel(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Int32]()[],
            Ptr(to=y).bitcast[Int32]()[],
            Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
            Ptr(to=a).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn read_surface_pixel_float(
        self,
        surface: Ptr[Surface],
        x: Int32,
        y: Int32,
        r: Ptr[Float32],
        g: Ptr[Float32],
        b: Ptr[Float32],
        a: Ptr[Float32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ReadSurfacePixelFloat
        """
        var success_status = self._read_surface_pixel_float(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Int32]()[],
            Ptr(to=y).bitcast[Int32]()[],
            Ptr(to=r).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=g).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=b).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=a).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_surface_pixel(
        self, surface: Ptr[Surface], x: Int32, y: Int32, r: UInt8, g: UInt8, b: UInt8, a: UInt8
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteSurfacePixel
        """
        var success_status = self._write_surface_pixel(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Int32]()[],
            Ptr(to=y).bitcast[Int32]()[],
            Ptr(to=r).bitcast[UInt8]()[],
            Ptr(to=g).bitcast[UInt8]()[],
            Ptr(to=b).bitcast[UInt8]()[],
            Ptr(to=a).bitcast[UInt8]()[],
        )
        if not success_status:
            raise self._get_error()

    fn write_surface_pixel_float(
        self,
        surface: Ptr[Surface],
        x: Int32,
        y: Int32,
        r: Float32,
        g: Float32,
        b: Float32,
        a: Float32,
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WriteSurfacePixelFloat
        """
        var success_status = self._write_surface_pixel_float(
            Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Int32]()[],
            Ptr(to=y).bitcast[Int32]()[],
            Ptr(to=r).bitcast[Float32]()[],
            Ptr(to=g).bitcast[Float32]()[],
            Ptr(to=b).bitcast[Float32]()[],
            Ptr(to=a).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_date_time_locale_preferences(
        self, dateFormat: Ptr[DateFormat], timeFormat: Ptr[TimeFormat]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDateTimeLocalePreferences
        """
        var success_status = self._get_date_time_locale_preferences(
            Ptr(to=dateFormat).bitcast[Ptr[DateFormat, MutExternalOrigin]]()[],
            Ptr(to=timeFormat).bitcast[Ptr[TimeFormat, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_current_time(self, ticks: Ptr[Time]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCurrentTime
        """
        var success_status = self._get_current_time(
            Ptr(to=ticks).bitcast[Ptr[Time, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn time_to_date_time(self, ticks: Time, dt: Ptr[DateTime], localTime: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_TimeToDateTime
        """
        var success_status = self._time_to_date_time(
            Ptr(to=ticks).bitcast[Time]()[],
            Ptr(to=dt).bitcast[Ptr[DateTime, MutExternalOrigin]]()[],
            Ptr(to=localTime).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn date_time_to_time(self, dt: Ptr[DateTime], ticks: Ptr[Time]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DateTimeToTime
        """
        var success_status = self._date_time_to_time(
            Ptr(to=dt).bitcast[Ptr[DateTime, ImmutExternalOrigin]]()[],
            Ptr(to=ticks).bitcast[Ptr[Time, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn time_to_windows(self, ticks: Time, dwLowDateTime: Ptr[UInt32], dwHighDateTime: Ptr[UInt32]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_TimeToWindows
        """
        self._time_to_windows(
            Ptr(to=ticks).bitcast[Time]()[],
            Ptr(to=dwLowDateTime).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
            Ptr(to=dwHighDateTime).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        )

    fn time_from_windows(self, dwLowDateTime: UInt32, dwHighDateTime: UInt32) -> Time:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_TimeFromWindows
        """
        return self._time_from_windows(
            Ptr(to=dwLowDateTime).bitcast[UInt32]()[], Ptr(to=dwHighDateTime).bitcast[UInt32]()[]
        )

    fn get_days_in_month(self, year: Int32, month: Int32) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDaysInMonth
        """
        return self._get_days_in_month(
            Ptr(to=year).bitcast[Int32]()[], Ptr(to=month).bitcast[Int32]()[]
        )

    fn get_day_of_year(self, year: Int32, month: Int32, day: Int32) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDayOfYear
        """
        return self._get_day_of_year(
            Ptr(to=year).bitcast[Int32]()[],
            Ptr(to=month).bitcast[Int32]()[],
            Ptr(to=day).bitcast[Int32]()[],
        )

    fn get_day_of_week(self, year: Int32, month: Int32, day: Int32) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDayOfWeek
        """
        return self._get_day_of_week(
            Ptr(to=year).bitcast[Int32]()[],
            Ptr(to=month).bitcast[Int32]()[],
            Ptr(to=day).bitcast[Int32]()[],
        )

    fn get_ticks(self) -> UInt64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTicks
        """
        return self._get_ticks()

    fn get_ticks_ns(self) -> UInt64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTicksNS
        """
        return self._get_ticks_ns()

    fn get_performance_counter(self) -> UInt64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPerformanceCounter
        """
        return self._get_performance_counter()

    fn get_performance_frequency(self) -> UInt64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPerformanceFrequency
        """
        return self._get_performance_frequency()

    fn delay(self, ms: UInt32):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Delay
        """
        self._delay(Ptr(to=ms).bitcast[UInt32]()[])

    fn delay_ns(self, ns: UInt64):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DelayNS
        """
        self._delay_ns(Ptr(to=ns).bitcast[UInt64]()[])

    fn delay_precise(self, ns: UInt64):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DelayPrecise
        """
        self._delay_precise(Ptr(to=ns).bitcast[UInt64]()[])

    fn add_timer(
        self, interval: UInt32, callback: TimerCallback, userdata: Ptr[NoneType]
    ) -> TimerID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AddTimer
        """
        return self._add_timer(
            Ptr(to=interval).bitcast[UInt32]()[],
            Ptr(to=callback).bitcast[TimerCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )

    fn add_timer_ns(
        self, interval: UInt64, callback: NSTimerCallback, userdata: Ptr[NoneType]
    ) -> TimerID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_AddTimerNS
        """
        return self._add_timer_ns(
            Ptr(to=interval).bitcast[UInt64]()[],
            Ptr(to=callback).bitcast[NSTimerCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )

    fn remove_timer(self, id: TimerID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RemoveTimer
        """
        var success_status = self._remove_timer(Ptr(to=id).bitcast[TimerID]()[])
        if not success_status:
            raise self._get_error()

    fn get_touch_devices(self, count: Ptr[Int32]) raises -> Ptr[TouchID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTouchDevices
        """
        var result_pointer = self._get_touch_devices(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_touch_device_name(self, touchID: TouchID) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTouchDeviceName
        """
        var c_string = self._get_touch_device_name(Ptr(to=touchID).bitcast[TouchID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_touch_device_type(self, touchID: TouchID) -> TouchDeviceType:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTouchDeviceType
        """
        return self._get_touch_device_type(Ptr(to=touchID).bitcast[TouchID]()[])

    fn get_touch_fingers(
        self, touchID: TouchID, count: Ptr[Int32]
    ) raises -> Ptr[Ptr[Finger, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetTouchFingers
        """
        var result_pointer = self._get_touch_fingers(
            Ptr(to=touchID).bitcast[TouchID]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_version(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetVersion
        """
        return self._get_version()

    fn get_revision(self) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetRevision
        """
        var c_string = self._get_revision()
        return c_string

    fn get_num_video_drivers(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNumVideoDrivers
        """
        return self._get_num_video_drivers()

    fn get_video_driver(self, index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetVideoDriver
        """
        var c_string = self._get_video_driver(Ptr(to=index).bitcast[Int32]()[])
        if not c_string.unsafe_ptr():
            raise "Error in get_video_driver call. See official documentation for details."
        return c_string

    fn get_current_video_driver(self) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCurrentVideoDriver
        """
        var c_string = self._get_current_video_driver()
        if not c_string.unsafe_ptr():
            raise "Error in get_current_video_driver call. See official documentation for details."
        return c_string

    fn get_system_theme(self) -> SystemTheme:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetSystemTheme
        """
        return self._get_system_theme()

    fn get_displays(self, count: Ptr[Int32]) raises -> Ptr[DisplayID, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDisplays
        """
        var result_pointer = self._get_displays(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_primary_display(self) -> DisplayID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetPrimaryDisplay
        """
        return self._get_primary_display()

    fn get_display_properties(self, displayID: DisplayID) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDisplayProperties
        """
        return self._get_display_properties(Ptr(to=displayID).bitcast[DisplayID]()[])

    fn get_display_name(self, displayID: DisplayID) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDisplayName
        """
        var c_string = self._get_display_name(Ptr(to=displayID).bitcast[DisplayID]()[])
        if not c_string.unsafe_ptr():
            raise self._get_error()
        return c_string

    fn get_display_bounds(self, displayID: DisplayID, rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDisplayBounds
        """
        var success_status = self._get_display_bounds(
            Ptr(to=displayID).bitcast[DisplayID]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_display_usable_bounds(self, displayID: DisplayID, rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDisplayUsableBounds
        """
        var success_status = self._get_display_usable_bounds(
            Ptr(to=displayID).bitcast[DisplayID]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_natural_display_orientation(self, displayID: DisplayID) -> DisplayOrientation:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetNaturalDisplayOrientation
        """
        return self._get_natural_display_orientation(Ptr(to=displayID).bitcast[DisplayID]()[])

    fn get_current_display_orientation(self, displayID: DisplayID) -> DisplayOrientation:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCurrentDisplayOrientation
        """
        return self._get_current_display_orientation(Ptr(to=displayID).bitcast[DisplayID]()[])

    fn get_display_content_scale(self, displayID: DisplayID) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDisplayContentScale
        """
        return self._get_display_content_scale(Ptr(to=displayID).bitcast[DisplayID]()[])

    fn get_fullscreen_display_modes(
        self, displayID: DisplayID, count: Ptr[Int32]
    ) raises -> Ptr[Ptr[DisplayMode, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetFullscreenDisplayModes
        """
        var result_pointer = self._get_fullscreen_display_modes(
            Ptr(to=displayID).bitcast[DisplayID]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_closest_fullscreen_display_mode(
        self,
        displayID: DisplayID,
        w: Int32,
        h: Int32,
        refresh_rate: Float32,
        include_high_density_modes: Bool,
        closest: Ptr[DisplayMode],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetClosestFullscreenDisplayMode
        """
        var success_status = self._get_closest_fullscreen_display_mode(
            Ptr(to=displayID).bitcast[DisplayID]()[],
            Ptr(to=w).bitcast[Int32]()[],
            Ptr(to=h).bitcast[Int32]()[],
            Ptr(to=refresh_rate).bitcast[Float32]()[],
            Ptr(to=include_high_density_modes).bitcast[Bool]()[],
            Ptr(to=closest).bitcast[Ptr[DisplayMode, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_desktop_display_mode(
        self, displayID: DisplayID
    ) raises -> Ptr[DisplayMode, ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDesktopDisplayMode
        """
        var result_pointer = self._get_desktop_display_mode(
            Ptr(to=displayID).bitcast[DisplayID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_current_display_mode(
        self, displayID: DisplayID
    ) raises -> Ptr[DisplayMode, ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetCurrentDisplayMode
        """
        var result_pointer = self._get_current_display_mode(
            Ptr(to=displayID).bitcast[DisplayID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_display_for_point(self, point: Ptr[Point]) -> DisplayID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDisplayForPoint
        """
        return self._get_display_for_point(
            Ptr(to=point).bitcast[Ptr[Point, ImmutExternalOrigin]]()[]
        )

    fn get_display_for_rect(self, rect: Ptr[Rect]) -> DisplayID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDisplayForRect
        """
        return self._get_display_for_rect(Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[])

    fn get_display_for_window(self, window: Ptr[Window]) -> DisplayID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetDisplayForWindow
        """
        return self._get_display_for_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn get_window_pixel_density(self, window: Ptr[Window]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowPixelDensity
        """
        return self._get_window_pixel_density(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn get_window_display_scale(self, window: Ptr[Window]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowDisplayScale
        """
        return self._get_window_display_scale(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn set_window_fullscreen_mode(self, window: Ptr[Window], mode: Ptr[DisplayMode]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowFullscreenMode
        """
        var success_status = self._set_window_fullscreen_mode(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=mode).bitcast[Ptr[DisplayMode, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_fullscreen_mode(
        self, window: Ptr[Window]
    ) raises -> Ptr[DisplayMode, ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowFullscreenMode
        """
        var result_pointer = self._get_window_fullscreen_mode(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_window_fullscreen_mode call. See official documentation for details."
        return result_pointer

    fn get_window_icc_profile(
        self, window: Ptr[Window], size: Ptr[Int32]
    ) raises -> Ptr[NoneType, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowICCProfile
        """
        var result_pointer = self._get_window_icc_profile(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=size).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_window_pixel_format(self, window: Ptr[Window]) -> PixelFormat:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowPixelFormat
        """
        return self._get_window_pixel_format(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn get_windows(
        self, count: Ptr[Int32]
    ) raises -> Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindows
        """
        var result_pointer = self._get_windows(
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_window(
        self, title: CStringSlice, w: Int32, h: Int32, flags: WindowFlags
    ) raises -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateWindow
        """
        var result_pointer = self._create_window(
            title.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=w).bitcast[Int32]()[],
            Ptr(to=h).bitcast[Int32]()[],
            Ptr(to=flags).bitcast[WindowFlags]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_popup_window(
        self,
        parent: Ptr[Window],
        offset_x: Int32,
        offset_y: Int32,
        w: Int32,
        h: Int32,
        flags: WindowFlags,
    ) raises -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreatePopupWindow
        """
        var result_pointer = self._create_popup_window(
            Ptr(to=parent).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=offset_x).bitcast[Int32]()[],
            Ptr(to=offset_y).bitcast[Int32]()[],
            Ptr(to=w).bitcast[Int32]()[],
            Ptr(to=h).bitcast[Int32]()[],
            Ptr(to=flags).bitcast[WindowFlags]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_window_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_CreateWindowWithProperties
        """
        var result_pointer = self._create_window_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_window_id(self, window: Ptr[Window]) -> WindowID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowID
        """
        return self._get_window_id(Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[])

    fn get_window_from_id(self, id: WindowID) raises -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowFromID
        """
        var result_pointer = self._get_window_from_id(Ptr(to=id).bitcast[WindowID]()[])
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_window_parent(self, window: Ptr[Window]) raises -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowParent
        """
        var result_pointer = self._get_window_parent(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_window_parent call. See official documentation for details."
        return result_pointer

    fn get_window_properties(self, window: Ptr[Window]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowProperties
        """
        return self._get_window_properties(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn get_window_flags(self, window: Ptr[Window]) -> WindowFlags:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowFlags
        """
        return self._get_window_flags(Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[])

    fn set_window_title(self, window: Ptr[Window], title: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowTitle
        """
        var success_status = self._set_window_title(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            title.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn get_window_title(self, window: Ptr[Window]) -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowTitle
        """
        var c_string = self._get_window_title(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        return c_string

    fn set_window_icon(self, window: Ptr[Window], icon: Ptr[Surface]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowIcon
        """
        var success_status = self._set_window_icon(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=icon).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_position(self, window: Ptr[Window], x: Int32, y: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowPosition
        """
        var success_status = self._set_window_position(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Int32]()[],
            Ptr(to=y).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_position(self, window: Ptr[Window], x: Ptr[Int32], y: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowPosition
        """
        var success_status = self._get_window_position(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=y).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_size(self, window: Ptr[Window], w: Int32, h: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowSize
        """
        var success_status = self._set_window_size(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Int32]()[],
            Ptr(to=h).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_size(self, window: Ptr[Window], w: Ptr[Int32], h: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowSize
        """
        var success_status = self._get_window_size(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_safe_area(self, window: Ptr[Window], rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowSafeArea
        """
        var success_status = self._get_window_safe_area(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_aspect_ratio(
        self, window: Ptr[Window], min_aspect: Float32, max_aspect: Float32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowAspectRatio
        """
        var success_status = self._set_window_aspect_ratio(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=min_aspect).bitcast[Float32]()[],
            Ptr(to=max_aspect).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_aspect_ratio(
        self, window: Ptr[Window], min_aspect: Ptr[Float32], max_aspect: Ptr[Float32]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowAspectRatio
        """
        var success_status = self._get_window_aspect_ratio(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=min_aspect).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
            Ptr(to=max_aspect).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_borders_size(
        self,
        window: Ptr[Window],
        top: Ptr[Int32],
        left: Ptr[Int32],
        bottom: Ptr[Int32],
        right: Ptr[Int32],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowBordersSize
        """
        var success_status = self._get_window_borders_size(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=top).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=left).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=bottom).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=right).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_size_in_pixels(self, window: Ptr[Window], w: Ptr[Int32], h: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowSizeInPixels
        """
        var success_status = self._get_window_size_in_pixels(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_minimum_size(self, window: Ptr[Window], min_w: Int32, min_h: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowMinimumSize
        """
        var success_status = self._set_window_minimum_size(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=min_w).bitcast[Int32]()[],
            Ptr(to=min_h).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_minimum_size(self, window: Ptr[Window], w: Ptr[Int32], h: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowMinimumSize
        """
        var success_status = self._get_window_minimum_size(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_maximum_size(self, window: Ptr[Window], max_w: Int32, max_h: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowMaximumSize
        """
        var success_status = self._set_window_maximum_size(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=max_w).bitcast[Int32]()[],
            Ptr(to=max_h).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_maximum_size(self, window: Ptr[Window], w: Ptr[Int32], h: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowMaximumSize
        """
        var success_status = self._get_window_maximum_size(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
            Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_bordered(self, window: Ptr[Window], bordered: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowBordered
        """
        var success_status = self._set_window_bordered(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=bordered).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_resizable(self, window: Ptr[Window], resizable: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowResizable
        """
        var success_status = self._set_window_resizable(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=resizable).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_always_on_top(self, window: Ptr[Window], on_top: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowAlwaysOnTop
        """
        var success_status = self._set_window_always_on_top(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=on_top).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_fill_document(self, window: Ptr[Window], fill: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowFillDocument
        """
        var success_status = self._set_window_fill_document(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=fill).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn show_window(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ShowWindow
        """
        var success_status = self._show_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn hide_window(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_HideWindow
        """
        var success_status = self._hide_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn raise_window(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RaiseWindow
        """
        var success_status = self._raise_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn maximize_window(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_MaximizeWindow
        """
        var success_status = self._maximize_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn minimize_window(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_MinimizeWindow
        """
        var success_status = self._minimize_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn restore_window(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_RestoreWindow
        """
        var success_status = self._restore_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn set_window_fullscreen(self, window: Ptr[Window], fullscreen: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowFullscreen
        """
        var success_status = self._set_window_fullscreen(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=fullscreen).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn sync_window(self, window: Ptr[Window]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SyncWindow
        """
        return self._sync_window(Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[])

    fn window_has_surface(self, window: Ptr[Window]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_WindowHasSurface
        """
        return self._window_has_surface(Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[])

    fn get_window_surface(self, window: Ptr[Window]) raises -> Ptr[Surface, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowSurface
        """
        var result_pointer = self._get_window_surface(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_window_surface_v_sync(self, window: Ptr[Window], vsync: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowSurfaceVSync
        """
        var success_status = self._set_window_surface_v_sync(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=vsync).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_surface_v_sync(self, window: Ptr[Window], vsync: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowSurfaceVSync
        """
        var success_status = self._get_window_surface_v_sync(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=vsync).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn update_window_surface(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UpdateWindowSurface
        """
        var success_status = self._update_window_surface(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn update_window_surface_rects(
        self, window: Ptr[Window], rects: Ptr[Rect], numrects: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_UpdateWindowSurfaceRects
        """
        var success_status = self._update_window_surface_rects(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=rects).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
            Ptr(to=numrects).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn destroy_window_surface(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyWindowSurface
        """
        var success_status = self._destroy_window_surface(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn set_window_keyboard_grab(self, window: Ptr[Window], grabbed: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowKeyboardGrab
        """
        var success_status = self._set_window_keyboard_grab(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=grabbed).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_mouse_grab(self, window: Ptr[Window], grabbed: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowMouseGrab
        """
        var success_status = self._set_window_mouse_grab(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=grabbed).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_keyboard_grab(self, window: Ptr[Window]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowKeyboardGrab
        """
        return self._get_window_keyboard_grab(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn get_window_mouse_grab(self, window: Ptr[Window]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowMouseGrab
        """
        return self._get_window_mouse_grab(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn get_grabbed_window(self) raises -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetGrabbedWindow
        """
        var result_pointer = self._get_grabbed_window()
        if not result_pointer:
            raise "Error in get_grabbed_window call. See official documentation for details."
        return result_pointer

    fn set_window_mouse_rect(self, window: Ptr[Window], rect: Ptr[Rect]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowMouseRect
        """
        var success_status = self._set_window_mouse_rect(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_mouse_rect(self, window: Ptr[Window]) raises -> Ptr[Rect, ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowMouseRect
        """
        var result_pointer = self._get_window_mouse_rect(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_window_mouse_rect call. See official documentation for details."
        return result_pointer

    fn set_window_opacity(self, window: Ptr[Window], opacity: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowOpacity
        """
        var success_status = self._set_window_opacity(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=opacity).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_opacity(self, window: Ptr[Window]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowOpacity
        """
        return self._get_window_opacity(Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[])

    fn set_window_parent(self, window: Ptr[Window], parent: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowParent
        """
        var success_status = self._set_window_parent(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=parent).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_modal(self, window: Ptr[Window], modal: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowModal
        """
        var success_status = self._set_window_modal(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=modal).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_focusable(self, window: Ptr[Window], focusable: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowFocusable
        """
        var success_status = self._set_window_focusable(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=focusable).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn show_window_system_menu(self, window: Ptr[Window], x: Int32, y: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ShowWindowSystemMenu
        """
        var success_status = self._show_window_system_menu(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=x).bitcast[Int32]()[],
            Ptr(to=y).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_hit_test(
        self, window: Ptr[Window], callback: HitTest, callback_data: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowHitTest
        """
        var success_status = self._set_window_hit_test(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=callback).bitcast[HitTest]()[],
            Ptr(to=callback_data).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_shape(self, window: Ptr[Window], shape: Ptr[Surface]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowShape
        """
        var success_status = self._set_window_shape(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=shape).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn flash_window(self, window: Ptr[Window], operation: FlashOperation) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_FlashWindow
        """
        var success_status = self._flash_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=operation).bitcast[FlashOperation]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_window_progress_state(self, window: Ptr[Window], state: ProgressState) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowProgressState
        """
        var success_status = self._set_window_progress_state(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=state).bitcast[ProgressState]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_progress_state(self, window: Ptr[Window]) -> ProgressState:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowProgressState
        """
        return self._get_window_progress_state(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn set_window_progress_value(self, window: Ptr[Window], value: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_SetWindowProgressValue
        """
        var success_status = self._set_window_progress_value(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=value).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_window_progress_value(self, window: Ptr[Window]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GetWindowProgressValue
        """
        return self._get_window_progress_value(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn destroy_window(self, window: Ptr[Window]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DestroyWindow
        """
        self._destroy_window(Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[])

    fn screen_saver_enabled(self) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_ScreenSaverEnabled
        """
        return self._screen_saver_enabled()

    fn enable_screen_saver(self) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EnableScreenSaver
        """
        var success_status = self._enable_screen_saver()
        if not success_status:
            raise self._get_error()

    fn disable_screen_saver(self) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_DisableScreenSaver
        """
        var success_status = self._disable_screen_saver()
        if not success_status:
            raise self._get_error()

    fn gl_load_library(self, path: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_LoadLibrary
        """
        var success_status = self._gl_load_library(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not success_status:
            raise self._get_error()

    fn gl_get_proc_address(self, proc: CStringSlice) -> FunctionPointer:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_GetProcAddress
        """
        return self._gl_get_proc_address(
            proc.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn egl_get_proc_address(self, proc: CStringSlice) -> FunctionPointer:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EGL_GetProcAddress
        """
        return self._egl_get_proc_address(
            proc.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn gl_unload_library(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_UnloadLibrary
        """
        self._gl_unload_library()

    fn gl_extension_supported(self, extension: CStringSlice) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_ExtensionSupported
        """
        return self._gl_extension_supported(
            extension.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )

    fn gl_reset_attributes(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_ResetAttributes
        """
        self._gl_reset_attributes()

    fn gl_set_attribute(self, attr: GLAttr, value: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_SetAttribute
        """
        var success_status = self._gl_set_attribute(
            Ptr(to=attr).bitcast[GLAttr]()[], Ptr(to=value).bitcast[Int32]()[]
        )
        if not success_status:
            raise self._get_error()

    fn gl_get_attribute(self, attr: GLAttr, value: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_GetAttribute
        """
        var success_status = self._gl_get_attribute(
            Ptr(to=attr).bitcast[GLAttr]()[],
            Ptr(to=value).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn gl_create_context(self, window: Ptr[Window]) -> GLContext:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_CreateContext
        """
        return self._gl_create_context(Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[])

    fn gl_make_current(self, window: Ptr[Window], context: GLContext) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_MakeCurrent
        """
        var success_status = self._gl_make_current(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=context).bitcast[GLContext]()[],
        )
        if not success_status:
            raise self._get_error()

    fn gl_get_current_window(self) raises -> Ptr[Window, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_GetCurrentWindow
        """
        var result_pointer = self._gl_get_current_window()
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn gl_get_current_context(self) -> GLContext:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_GetCurrentContext
        """
        return self._gl_get_current_context()

    fn egl_get_current_display(self) -> EGLDisplay:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EGL_GetCurrentDisplay
        """
        return self._egl_get_current_display()

    fn egl_get_current_config(self) -> EGLConfig:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EGL_GetCurrentConfig
        """
        return self._egl_get_current_config()

    fn egl_get_window_surface(self, window: Ptr[Window]) -> EGLSurface:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EGL_GetWindowSurface
        """
        return self._egl_get_window_surface(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )

    fn egl_set_attribute_callbacks(
        self,
        platformAttribCallback: EGLAttribArrayCallback,
        surfaceAttribCallback: EGLIntArrayCallback,
        contextAttribCallback: EGLIntArrayCallback,
        userdata: Ptr[NoneType],
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_EGL_SetAttributeCallbacks
        """
        self._egl_set_attribute_callbacks(
            Ptr(to=platformAttribCallback).bitcast[EGLAttribArrayCallback]()[],
            Ptr(to=surfaceAttribCallback).bitcast[EGLIntArrayCallback]()[],
            Ptr(to=contextAttribCallback).bitcast[EGLIntArrayCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )

    fn gl_set_swap_interval(self, interval: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_SetSwapInterval
        """
        var success_status = self._gl_set_swap_interval(Ptr(to=interval).bitcast[Int32]()[])
        if not success_status:
            raise self._get_error()

    fn gl_get_swap_interval(self, interval: Ptr[Int32]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_GetSwapInterval
        """
        var success_status = self._gl_get_swap_interval(
            Ptr(to=interval).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn gl_swap_window(self, window: Ptr[Window]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_SwapWindow
        """
        var success_status = self._gl_swap_window(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn gl_destroy_context(self, context: GLContext) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_GL_DestroyContext
        """
        var success_status = self._gl_destroy_context(Ptr(to=context).bitcast[GLContext]()[])
        if not success_status:
            raise self._get_error()

    fn vulkan_load_library(self, path: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Vulkan_LoadLibrary
        """
        var success_status = self._vulkan_load_library(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
        )
        if not success_status:
            raise self._get_error()

    fn vulkan_get_vk_get_instance_proc_addr(self) -> FunctionPointer:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Vulkan_GetVkGetInstanceProcAddr
        """
        return self._vulkan_get_vk_get_instance_proc_addr()

    fn vulkan_unload_library(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Vulkan_UnloadLibrary
        """
        self._vulkan_unload_library()

    fn vulkan_get_instance_extensions(
        self, count: Ptr[UInt32]
    ) raises -> Ptr[CStringSlice[ImmutExternalOrigin], ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Vulkan_GetInstanceExtensions
        """
        var result_pointer = self._vulkan_get_instance_extensions(
            Ptr(to=count).bitcast[Ptr[UInt32, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn vulkan_create_surface(
        self,
        window: Ptr[Window],
        instance: VkInstance,
        allocator: Ptr[VkAllocationCallbacks],
        surface: Ptr[VkSurfaceKHR],
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Vulkan_CreateSurface
        """
        var success_status = self._vulkan_create_surface(
            Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
            Ptr(to=instance).bitcast[VkInstance]()[],
            Ptr(to=allocator).bitcast[Ptr[VkAllocationCallbacks, ImmutExternalOrigin]]()[],
            Ptr(to=surface).bitcast[Ptr[VkSurfaceKHR, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn vulkan_destroy_surface(
        self, instance: VkInstance, surface: VkSurfaceKHR, allocator: Ptr[VkAllocationCallbacks]
    ):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Vulkan_DestroySurface
        """
        self._vulkan_destroy_surface(
            Ptr(to=instance).bitcast[VkInstance]()[],
            Ptr(to=surface).bitcast[VkSurfaceKHR]()[],
            Ptr(to=allocator).bitcast[Ptr[VkAllocationCallbacks, ImmutExternalOrigin]]()[],
        )

    fn vulkan_get_presentation_support(
        self, instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: UInt32
    ) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL3/SDL_Vulkan_GetPresentationSupport
        """
        return self._vulkan_get_presentation_support(
            Ptr(to=instance).bitcast[VkInstance]()[],
            Ptr(to=physicalDevice).bitcast[VkPhysicalDevice]()[],
            Ptr(to=queueFamilyIndex).bitcast[UInt32]()[],
        )
