from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *
from .sdl3_function_table import get_sdl3_function_table
from sys.ffi import CStringSlice, c_char


comptime Ptr = UnsafePointer


fn get_num_audio_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumAudioDrivers
    """
    return get_sdl3_function_table().get_num_audio_drivers()


fn get_audio_driver(index: Int32) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDriver
    """
    var cstring = get_sdl3_function_table().get_audio_driver(index)
    if not cstring:
        raise "Error in get_audio_driver call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_current_audio_driver() raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentAudioDriver
    """
    var cstring = get_sdl3_function_table().get_current_audio_driver()
    if not cstring:
        raise "Error in get_current_audio_driver call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_audio_playback_devices(
    count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[AudioDeviceID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioPlaybackDevices
    """
    var result = get_sdl3_function_table().get_audio_playback_devices(count)
    if not result:
        raise get_error()
    return result


fn get_audio_recording_devices(
    count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[AudioDeviceID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioRecordingDevices
    """
    var result = get_sdl3_function_table().get_audio_recording_devices(count)
    if not result:
        raise get_error()
    return result


fn get_audio_device_name(devid: AudioDeviceID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceName
    """
    var cstring = get_sdl3_function_table().get_audio_device_name(devid)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_audio_device_format(
    devid: AudioDeviceID,
    spec: Ptr[AudioSpec, MutAnyOrigin],
    sample_frames: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceFormat
    """
    var success = get_sdl3_function_table().get_audio_device_format(devid, spec, sample_frames)
    if not success:
        raise get_error()


fn get_audio_device_channel_map(
    devid: AudioDeviceID, count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Int32, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceChannelMap
    """
    var result = get_sdl3_function_table().get_audio_device_channel_map(devid, count)
    if not result:
        raise "Error in get_audio_device_channel_map call. See official documentation for details."
    return result


fn open_audio_device(devid: AudioDeviceID, spec: Ptr[AudioSpec, ImmutAnyOrigin]) -> AudioDeviceID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenAudioDevice
    """
    return get_sdl3_function_table().open_audio_device(devid, spec)


fn is_audio_device_physical(devid: AudioDeviceID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsAudioDevicePhysical
    """
    return get_sdl3_function_table().is_audio_device_physical(devid)


fn is_audio_device_playback(devid: AudioDeviceID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsAudioDevicePlayback
    """
    return get_sdl3_function_table().is_audio_device_playback(devid)


fn pause_audio_device(devid: AudioDeviceID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PauseAudioDevice
    """
    var success = get_sdl3_function_table().pause_audio_device(devid)
    if not success:
        raise get_error()


fn resume_audio_device(devid: AudioDeviceID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResumeAudioDevice
    """
    var success = get_sdl3_function_table().resume_audio_device(devid)
    if not success:
        raise get_error()


fn audio_device_paused(devid: AudioDeviceID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AudioDevicePaused
    """
    return get_sdl3_function_table().audio_device_paused(devid)


fn get_audio_device_gain(devid: AudioDeviceID) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceGain
    """
    return get_sdl3_function_table().get_audio_device_gain(devid)


fn set_audio_device_gain(devid: AudioDeviceID, gain: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioDeviceGain
    """
    var success = get_sdl3_function_table().set_audio_device_gain(devid, gain)
    if not success:
        raise get_error()


fn close_audio_device(devid: AudioDeviceID):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseAudioDevice
    """
    get_sdl3_function_table().close_audio_device(devid)


fn bind_audio_streams(
    devid: AudioDeviceID,
    streams: Ptr[Ptr[AudioStream, MutOrigin.external], ImmutAnyOrigin],
    num_streams: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindAudioStreams
    """
    var success = get_sdl3_function_table().bind_audio_streams(devid, streams, num_streams)
    if not success:
        raise get_error()


fn bind_audio_stream(devid: AudioDeviceID, stream: Ptr[AudioStream, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindAudioStream
    """
    var success = get_sdl3_function_table().bind_audio_stream(devid, stream)
    if not success:
        raise get_error()


fn unbind_audio_streams(
    streams: Ptr[Ptr[AudioStream, MutOrigin.external], ImmutAnyOrigin], num_streams: Int32
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnbindAudioStreams
    """
    get_sdl3_function_table().unbind_audio_streams(streams, num_streams)


fn unbind_audio_stream(stream: Ptr[AudioStream, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnbindAudioStream
    """
    get_sdl3_function_table().unbind_audio_stream(stream)


fn get_audio_stream_device(stream: Ptr[AudioStream, MutAnyOrigin]) -> AudioDeviceID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamDevice
    """
    return get_sdl3_function_table().get_audio_stream_device(stream)


fn create_audio_stream(
    src_spec: Ptr[AudioSpec, ImmutAnyOrigin], dst_spec: Ptr[AudioSpec, ImmutAnyOrigin]
) raises -> Ptr[AudioStream, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateAudioStream
    """
    var result = get_sdl3_function_table().create_audio_stream(src_spec, dst_spec)
    if not result:
        raise get_error()
    return result


fn get_audio_stream_properties(stream: Ptr[AudioStream, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamProperties
    """
    return get_sdl3_function_table().get_audio_stream_properties(stream)


fn get_audio_stream_format(
    stream: Ptr[AudioStream, MutAnyOrigin],
    src_spec: Ptr[AudioSpec, MutAnyOrigin],
    dst_spec: Ptr[AudioSpec, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamFormat
    """
    var success = get_sdl3_function_table().get_audio_stream_format(stream, src_spec, dst_spec)
    if not success:
        raise get_error()


fn set_audio_stream_format(
    stream: Ptr[AudioStream, MutAnyOrigin],
    src_spec: Ptr[AudioSpec, ImmutAnyOrigin],
    dst_spec: Ptr[AudioSpec, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamFormat
    """
    var success = get_sdl3_function_table().set_audio_stream_format(stream, src_spec, dst_spec)
    if not success:
        raise get_error()


fn get_audio_stream_frequency_ratio(stream: Ptr[AudioStream, MutAnyOrigin]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamFrequencyRatio
    """
    return get_sdl3_function_table().get_audio_stream_frequency_ratio(stream)


fn set_audio_stream_frequency_ratio(stream: Ptr[AudioStream, MutAnyOrigin], ratio: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamFrequencyRatio
    """
    var success = get_sdl3_function_table().set_audio_stream_frequency_ratio(stream, ratio)
    if not success:
        raise get_error()


fn get_audio_stream_gain(stream: Ptr[AudioStream, MutAnyOrigin]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamGain
    """
    return get_sdl3_function_table().get_audio_stream_gain(stream)


fn set_audio_stream_gain(stream: Ptr[AudioStream, MutAnyOrigin], gain: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamGain
    """
    var success = get_sdl3_function_table().set_audio_stream_gain(stream, gain)
    if not success:
        raise get_error()


fn get_audio_stream_input_channel_map(
    stream: Ptr[AudioStream, MutAnyOrigin], count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Int32, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamInputChannelMap
    """
    var result = get_sdl3_function_table().get_audio_stream_input_channel_map(stream, count)
    if not result:
        raise "Error in get_audio_stream_input_channel_map call. See official documentation for details."
    return result


fn get_audio_stream_output_channel_map(
    stream: Ptr[AudioStream, MutAnyOrigin], count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Int32, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamOutputChannelMap
    """
    var result = get_sdl3_function_table().get_audio_stream_output_channel_map(stream, count)
    if not result:
        raise "Error in get_audio_stream_output_channel_map call. See official documentation for details."
    return result


fn set_audio_stream_input_channel_map(
    stream: Ptr[AudioStream, MutAnyOrigin], chmap: Ptr[Int32, ImmutAnyOrigin], count: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamInputChannelMap
    """
    var success = get_sdl3_function_table().set_audio_stream_input_channel_map(
        stream, chmap, count
    )
    if not success:
        raise get_error()


fn set_audio_stream_output_channel_map(
    stream: Ptr[AudioStream, MutAnyOrigin], chmap: Ptr[Int32, ImmutAnyOrigin], count: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamOutputChannelMap
    """
    var success = get_sdl3_function_table().set_audio_stream_output_channel_map(
        stream, chmap, count
    )
    if not success:
        raise get_error()


fn put_audio_stream_data(
    stream: Ptr[AudioStream, MutAnyOrigin], buf: Ptr[NoneType, ImmutAnyOrigin], len: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamData
    """
    var success = get_sdl3_function_table().put_audio_stream_data(stream, buf, len)
    if not success:
        raise get_error()


fn get_audio_stream_data(
    stream: Ptr[AudioStream, MutAnyOrigin], buf: Ptr[NoneType, MutAnyOrigin], len: Int32
) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamData
    """
    return get_sdl3_function_table().get_audio_stream_data(stream, buf, len)


fn get_audio_stream_available(stream: Ptr[AudioStream, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamAvailable
    """
    return get_sdl3_function_table().get_audio_stream_available(stream)


fn get_audio_stream_queued(stream: Ptr[AudioStream, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamQueued
    """
    return get_sdl3_function_table().get_audio_stream_queued(stream)


fn flush_audio_stream(stream: Ptr[AudioStream, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushAudioStream
    """
    var success = get_sdl3_function_table().flush_audio_stream(stream)
    if not success:
        raise get_error()


fn clear_audio_stream(stream: Ptr[AudioStream, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearAudioStream
    """
    var success = get_sdl3_function_table().clear_audio_stream(stream)
    if not success:
        raise get_error()


fn pause_audio_stream_device(stream: Ptr[AudioStream, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PauseAudioStreamDevice
    """
    var success = get_sdl3_function_table().pause_audio_stream_device(stream)
    if not success:
        raise get_error()


fn resume_audio_stream_device(stream: Ptr[AudioStream, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResumeAudioStreamDevice
    """
    var success = get_sdl3_function_table().resume_audio_stream_device(stream)
    if not success:
        raise get_error()


fn audio_stream_device_paused(stream: Ptr[AudioStream, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AudioStreamDevicePaused
    """
    return get_sdl3_function_table().audio_stream_device_paused(stream)


fn lock_audio_stream(stream: Ptr[AudioStream, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockAudioStream
    """
    var success = get_sdl3_function_table().lock_audio_stream(stream)
    if not success:
        raise get_error()


fn unlock_audio_stream(stream: Ptr[AudioStream, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnlockAudioStream
    """
    var success = get_sdl3_function_table().unlock_audio_stream(stream)
    if not success:
        raise get_error()


fn set_audio_stream_get_callback(
    stream: Ptr[AudioStream, MutAnyOrigin],
    callback: AudioStreamCallback,
    userdata: Ptr[NoneType, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamGetCallback
    """
    var success = get_sdl3_function_table().set_audio_stream_get_callback(
        stream, callback, userdata
    )
    if not success:
        raise get_error()


fn set_audio_stream_put_callback(
    stream: Ptr[AudioStream, MutAnyOrigin],
    callback: AudioStreamCallback,
    userdata: Ptr[NoneType, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamPutCallback
    """
    var success = get_sdl3_function_table().set_audio_stream_put_callback(
        stream, callback, userdata
    )
    if not success:
        raise get_error()


fn destroy_audio_stream(stream: Ptr[AudioStream, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyAudioStream
    """
    get_sdl3_function_table().destroy_audio_stream(stream)


fn open_audio_device_stream(
    devid: AudioDeviceID,
    spec: Ptr[AudioSpec, ImmutAnyOrigin],
    callback: AudioStreamCallback,
    userdata: Ptr[NoneType, MutAnyOrigin],
) raises -> Ptr[AudioStream, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenAudioDeviceStream
    """
    var result = get_sdl3_function_table().open_audio_device_stream(
        devid, spec, callback, userdata
    )
    if not result:
        raise get_error()
    return result


fn set_audio_postmix_callback(
    devid: AudioDeviceID, callback: AudioPostmixCallback, userdata: Ptr[NoneType, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioPostmixCallback
    """
    var success = get_sdl3_function_table().set_audio_postmix_callback(devid, callback, userdata)
    if not success:
        raise get_error()


fn load_wav_io(
    src: Ptr[IOStream, MutAnyOrigin],
    closeio: Bool,
    spec: Ptr[AudioSpec, MutAnyOrigin],
    audio_buf: Ptr[Ptr[UInt8, MutOrigin.external], MutAnyOrigin],
    audio_len: Ptr[UInt32, MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadWAV_IO
    """
    return get_sdl3_function_table().load_wav_io(src, closeio, spec, audio_buf, audio_len)


fn load_wav(
    path: CStringSlice,
    spec: Ptr[AudioSpec, MutAnyOrigin],
    audio_buf: Ptr[Ptr[UInt8, MutOrigin.external], MutAnyOrigin],
    audio_len: Ptr[UInt32, MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadWAV
    """
    return get_sdl3_function_table().load_wav(path.unsafe_ptr(), spec, audio_buf, audio_len)


fn mix_audio(
    dst: Ptr[UInt8, MutAnyOrigin],
    src: Ptr[UInt8, ImmutAnyOrigin],
    format: AudioFormat,
    len: UInt32,
    volume: Float32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MixAudio
    """
    var success = get_sdl3_function_table().mix_audio(dst, src, format, len, volume)
    if not success:
        raise get_error()


fn convert_audio_samples(
    src_spec: Ptr[AudioSpec, ImmutAnyOrigin],
    src_data: Ptr[UInt8, ImmutAnyOrigin],
    src_len: Int32,
    dst_spec: Ptr[AudioSpec, ImmutAnyOrigin],
    dst_data: Ptr[Ptr[UInt8, MutOrigin.external], MutAnyOrigin],
    dst_len: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ConvertAudioSamples
    """
    var success = get_sdl3_function_table().convert_audio_samples(
        src_spec, src_data, src_len, dst_spec, dst_data, dst_len
    )
    if not success:
        raise get_error()


fn get_audio_format_name(format: AudioFormat) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioFormatName
    """
    var cstring = get_sdl3_function_table().get_audio_format_name(format)
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_silence_value_for_format(format: AudioFormat) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSilenceValueForFormat
    """
    return get_sdl3_function_table().get_silence_value_for_format(format)


fn compose_custom_blend_mode(
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
    return get_sdl3_function_table().compose_custom_blend_mode(
        srcColorFactor,
        dstColorFactor,
        colorOperation,
        srcAlphaFactor,
        dstAlphaFactor,
        alphaOperation,
    )


fn get_num_camera_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumCameraDrivers
    """
    return get_sdl3_function_table().get_num_camera_drivers()


fn get_camera_driver(index: Int32) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraDriver
    """
    var cstring = get_sdl3_function_table().get_camera_driver(index)
    if not cstring:
        raise "Error in get_camera_driver call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_current_camera_driver() raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentCameraDriver
    """
    var cstring = get_sdl3_function_table().get_current_camera_driver()
    if not cstring:
        raise "Error in get_current_camera_driver call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_cameras(count: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[CameraID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameras
    """
    var result = get_sdl3_function_table().get_cameras(count)
    if not result:
        raise get_error()
    return result


fn get_camera_supported_formats(
    instance_id: CameraID, count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[CameraSpec, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraSupportedFormats
    """
    var result = get_sdl3_function_table().get_camera_supported_formats(instance_id, count)
    if not result:
        raise get_error()
    return result


fn get_camera_name(instance_id: CameraID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraName
    """
    var cstring = get_sdl3_function_table().get_camera_name(instance_id)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_camera_position(instance_id: CameraID) -> CameraPosition:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraPosition
    """
    return get_sdl3_function_table().get_camera_position(instance_id)


fn open_camera(
    instance_id: CameraID, spec: Ptr[CameraSpec, ImmutAnyOrigin]
) raises -> Ptr[Camera, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenCamera
    """
    var result = get_sdl3_function_table().open_camera(instance_id, spec)
    if not result:
        raise get_error()
    return result


fn get_camera_permission_state(camera: Ptr[Camera, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraPermissionState
    """
    return get_sdl3_function_table().get_camera_permission_state(camera)


fn get_camera_id(camera: Ptr[Camera, MutAnyOrigin]) -> CameraID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraID
    """
    return get_sdl3_function_table().get_camera_id(camera)


fn get_camera_properties(camera: Ptr[Camera, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraProperties
    """
    return get_sdl3_function_table().get_camera_properties(camera)


fn get_camera_format(
    camera: Ptr[Camera, MutAnyOrigin], spec: Ptr[CameraSpec, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraFormat
    """
    var success = get_sdl3_function_table().get_camera_format(camera, spec)
    if not success:
        raise get_error()


fn acquire_camera_frame(
    camera: Ptr[Camera, MutAnyOrigin], timestampNS: Ptr[UInt64, MutAnyOrigin]
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AcquireCameraFrame
    """
    var result = get_sdl3_function_table().acquire_camera_frame(camera, timestampNS)
    if not result:
        raise "Error in acquire_camera_frame call. See official documentation for details."
    return result


fn release_camera_frame(camera: Ptr[Camera, MutAnyOrigin], frame: Ptr[Surface, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseCameraFrame
    """
    get_sdl3_function_table().release_camera_frame(camera, frame)


fn close_camera(camera: Ptr[Camera, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseCamera
    """
    get_sdl3_function_table().close_camera(camera)


fn set_clipboard_text(text: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetClipboardText
    """
    var success = get_sdl3_function_table().set_clipboard_text(text.unsafe_ptr())
    if not success:
        raise get_error()


fn get_clipboard_text() -> Ptr[c_char, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetClipboardText
    """
    return get_sdl3_function_table().get_clipboard_text()


fn has_clipboard_text() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasClipboardText
    """
    return get_sdl3_function_table().has_clipboard_text()


fn set_primary_selection_text(text: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetPrimarySelectionText
    """
    var success = get_sdl3_function_table().set_primary_selection_text(text.unsafe_ptr())
    if not success:
        raise get_error()


fn get_primary_selection_text() -> Ptr[c_char, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPrimarySelectionText
    """
    return get_sdl3_function_table().get_primary_selection_text()


fn has_primary_selection_text() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasPrimarySelectionText
    """
    return get_sdl3_function_table().has_primary_selection_text()


fn set_clipboard_data(
    callback: ClipboardDataCallback,
    cleanup: ClipboardCleanupCallback,
    userdata: Ptr[NoneType, MutAnyOrigin],
    mime_types: Ptr[Ptr[c_char, ImmutOrigin.external], MutAnyOrigin],
    num_mime_types: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetClipboardData
    """
    var success = get_sdl3_function_table().set_clipboard_data(
        callback, cleanup, userdata, mime_types, num_mime_types
    )
    if not success:
        raise get_error()


fn clear_clipboard_data() raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearClipboardData
    """
    var success = get_sdl3_function_table().clear_clipboard_data()
    if not success:
        raise get_error()


fn get_clipboard_data(
    mime_type: CStringSlice, size: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[NoneType, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetClipboardData
    """
    var result = get_sdl3_function_table().get_clipboard_data(mime_type.unsafe_ptr(), size)
    if not result:
        raise get_error()
    return result


fn has_clipboard_data(mime_type: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasClipboardData
    """
    return get_sdl3_function_table().has_clipboard_data(mime_type.unsafe_ptr())


fn get_clipboard_mime_types(
    num_mime_types: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[c_char, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetClipboardMimeTypes
    """
    var result = get_sdl3_function_table().get_clipboard_mime_types(num_mime_types)
    if not result:
        raise get_error()
    return result


fn set_error(fmt: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetError
    """
    return get_sdl3_function_table().set_error(fmt.unsafe_ptr())


fn set_error_v(fmt: CStringSlice, ap: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetErrorV
    """
    return get_sdl3_function_table().set_error_v(fmt.unsafe_ptr(), ap)


fn out_of_memory() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OutOfMemory
    """
    return get_sdl3_function_table().out_of_memory()


fn get_error() -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetError
    """
    var cstring = get_sdl3_function_table().get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn clear_error() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearError
    """
    return get_sdl3_function_table().clear_error()


fn pump_events():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PumpEvents
    """
    get_sdl3_function_table().pump_events()


fn peep_events(
    events: Ptr[Event, MutAnyOrigin],
    numevents: Int32,
    action: EventAction,
    minType: UInt32,
    maxType: UInt32,
) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PeepEvents
    """
    return get_sdl3_function_table().peep_events(events, numevents, action, minType, maxType)


fn has_event(type: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasEvent
    """
    return get_sdl3_function_table().has_event(type)


fn has_events(minType: UInt32, maxType: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasEvents
    """
    return get_sdl3_function_table().has_events(minType, maxType)


fn flush_event(type: UInt32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushEvent
    """
    get_sdl3_function_table().flush_event(type)


fn flush_events(minType: UInt32, maxType: UInt32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushEvents
    """
    get_sdl3_function_table().flush_events(minType, maxType)


fn poll_event(event: Ptr[Event, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PollEvent
    """
    return get_sdl3_function_table().poll_event(event)


fn wait_event(event: Ptr[Event, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitEvent
    """
    return get_sdl3_function_table().wait_event(event)


fn wait_event_timeout(event: Ptr[Event, MutAnyOrigin], timeoutMS: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitEventTimeout
    """
    return get_sdl3_function_table().wait_event_timeout(event, timeoutMS)


fn push_event(event: Ptr[Event, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushEvent
    """
    return get_sdl3_function_table().push_event(event)


fn set_event_filter(filter: EventFilter, userdata: Ptr[NoneType, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetEventFilter
    """
    get_sdl3_function_table().set_event_filter(filter, userdata)


fn get_event_filter(
    filter: Ptr[EventFilter, MutAnyOrigin],
    userdata: Ptr[Ptr[NoneType, MutOrigin.external], MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetEventFilter
    """
    return get_sdl3_function_table().get_event_filter(filter, userdata)


fn add_event_watch(filter: EventFilter, userdata: Ptr[NoneType, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddEventWatch
    """
    var success = get_sdl3_function_table().add_event_watch(filter, userdata)
    if not success:
        raise get_error()


fn remove_event_watch(filter: EventFilter, userdata: Ptr[NoneType, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveEventWatch
    """
    get_sdl3_function_table().remove_event_watch(filter, userdata)


fn filter_events(filter: EventFilter, userdata: Ptr[NoneType, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FilterEvents
    """
    get_sdl3_function_table().filter_events(filter, userdata)


fn set_event_enabled(type: UInt32, enabled: Bool):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetEventEnabled
    """
    get_sdl3_function_table().set_event_enabled(type, enabled)


fn event_enabled(type: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EventEnabled
    """
    return get_sdl3_function_table().event_enabled(type)


fn register_events(numevents: Int32) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RegisterEvents
    """
    return get_sdl3_function_table().register_events(numevents)


fn get_window_from_event(
    event: Ptr[Event, ImmutAnyOrigin]
) raises -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowFromEvent
    """
    var result = get_sdl3_function_table().get_window_from_event(event)
    if not result:
        raise "Error in get_window_from_event call. See official documentation for details."
    return result


fn get_base_path() raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetBasePath
    """
    var cstring = get_sdl3_function_table().get_base_path()
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_pref_path(org: CStringSlice, app: CStringSlice) raises -> Ptr[c_char, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPrefPath
    """
    var result = get_sdl3_function_table().get_pref_path(org.unsafe_ptr(), app.unsafe_ptr())
    if not result:
        raise "Error in get_pref_path call. See official documentation for details."
    return result


fn get_user_folder(folder: Folder) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetUserFolder
    """
    var cstring = get_sdl3_function_table().get_user_folder(folder)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn create_directory(path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateDirectory
    """
    var success = get_sdl3_function_table().create_directory(path.unsafe_ptr())
    if not success:
        raise get_error()


fn enumerate_directory(
    path: CStringSlice, callback: EnumerateDirectoryCallback, userdata: Ptr[NoneType, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EnumerateDirectory
    """
    var success = get_sdl3_function_table().enumerate_directory(
        path.unsafe_ptr(), callback, userdata
    )
    if not success:
        raise get_error()


fn remove_path(path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemovePath
    """
    var success = get_sdl3_function_table().remove_path(path.unsafe_ptr())
    if not success:
        raise get_error()


fn rename_path(oldpath: CStringSlice, newpath: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenamePath
    """
    var success = get_sdl3_function_table().rename_path(oldpath.unsafe_ptr(), newpath.unsafe_ptr())
    if not success:
        raise get_error()


fn copy_file(oldpath: CStringSlice, newpath: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CopyFile
    """
    var success = get_sdl3_function_table().copy_file(oldpath.unsafe_ptr(), newpath.unsafe_ptr())
    if not success:
        raise get_error()


fn get_path_info(path: CStringSlice, info: Ptr[PathInfo, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPathInfo
    """
    return get_sdl3_function_table().get_path_info(path.unsafe_ptr(), info)


fn glob_directory(
    path: CStringSlice, pattern: CStringSlice, flags: GlobFlags, count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[c_char, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GlobDirectory
    """
    var result = get_sdl3_function_table().glob_directory(
        path.unsafe_ptr(), pattern.unsafe_ptr(), flags, count
    )
    if not result:
        raise get_error()
    return result


fn get_current_directory() raises -> Ptr[c_char, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentDirectory
    """
    var result = get_sdl3_function_table().get_current_directory()
    if not result:
        raise "Error in get_current_directory call. See official documentation for details."
    return result


fn add_gamepad_mapping(mapping: CStringSlice) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddGamepadMapping
    """
    return get_sdl3_function_table().add_gamepad_mapping(mapping.unsafe_ptr())


fn add_gamepad_mappings_from_io(src: Ptr[IOStream, MutAnyOrigin], closeio: Bool) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddGamepadMappingsFromIO
    """
    return get_sdl3_function_table().add_gamepad_mappings_from_io(src, closeio)


fn add_gamepad_mappings_from_file(file: CStringSlice) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddGamepadMappingsFromFile
    """
    return get_sdl3_function_table().add_gamepad_mappings_from_file(file.unsafe_ptr())


fn reload_gamepad_mappings() raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReloadGamepadMappings
    """
    var success = get_sdl3_function_table().reload_gamepad_mappings()
    if not success:
        raise get_error()


fn get_gamepad_mappings(
    count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[c_char, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappings
    """
    var result = get_sdl3_function_table().get_gamepad_mappings(count)
    if not result:
        raise get_error()
    return result


fn get_gamepad_mapping_for_guid(guid: GUID) raises -> Ptr[c_char, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappingForGUID
    """
    var result = get_sdl3_function_table().get_gamepad_mapping_for_guid(guid)
    if not result:
        raise get_error()
    return result


fn get_gamepad_mapping(
    gamepad: Ptr[Gamepad, MutAnyOrigin]
) raises -> Ptr[c_char, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadMapping
    """
    var result = get_sdl3_function_table().get_gamepad_mapping(gamepad)
    if not result:
        raise get_error()
    return result


fn set_gamepad_mapping(instance_id: JoystickID, mapping: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadMapping
    """
    var success = get_sdl3_function_table().set_gamepad_mapping(instance_id, mapping.unsafe_ptr())
    if not success:
        raise get_error()


fn has_gamepad() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasGamepad
    """
    return get_sdl3_function_table().has_gamepad()


fn get_gamepads(count: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[JoystickID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepads
    """
    var result = get_sdl3_function_table().get_gamepads(count)
    if not result:
        raise get_error()
    return result


fn is_gamepad(instance_id: JoystickID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsGamepad
    """
    return get_sdl3_function_table().is_gamepad(instance_id)


fn get_gamepad_name_for_id(instance_id: JoystickID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadNameForID
    """
    var cstring = get_sdl3_function_table().get_gamepad_name_for_id(instance_id)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_gamepad_path_for_id(instance_id: JoystickID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPathForID
    """
    var cstring = get_sdl3_function_table().get_gamepad_path_for_id(instance_id)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_gamepad_player_index_for_id(instance_id: JoystickID) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPlayerIndexForID
    """
    return get_sdl3_function_table().get_gamepad_player_index_for_id(instance_id)


fn get_gamepad_guid_for_id(instance_id: JoystickID) -> GUID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadGUIDForID
    """
    return get_sdl3_function_table().get_gamepad_guid_for_id(instance_id)


fn get_gamepad_vendor_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadVendorForID
    """
    return get_sdl3_function_table().get_gamepad_vendor_for_id(instance_id)


fn get_gamepad_product_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductForID
    """
    return get_sdl3_function_table().get_gamepad_product_for_id(instance_id)


fn get_gamepad_product_version_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductVersionForID
    """
    return get_sdl3_function_table().get_gamepad_product_version_for_id(instance_id)


fn get_gamepad_type_for_id(instance_id: JoystickID) -> GamepadType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadTypeForID
    """
    return get_sdl3_function_table().get_gamepad_type_for_id(instance_id)


fn get_real_gamepad_type_for_id(instance_id: JoystickID) -> GamepadType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRealGamepadTypeForID
    """
    return get_sdl3_function_table().get_real_gamepad_type_for_id(instance_id)


fn get_gamepad_mapping_for_id(instance_id: JoystickID) raises -> Ptr[c_char, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappingForID
    """
    var result = get_sdl3_function_table().get_gamepad_mapping_for_id(instance_id)
    if not result:
        raise "Error in get_gamepad_mapping_for_id call. See official documentation for details."
    return result


fn open_gamepad(instance_id: JoystickID) raises -> Ptr[Gamepad, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenGamepad
    """
    var result = get_sdl3_function_table().open_gamepad(instance_id)
    if not result:
        raise get_error()
    return result


fn get_gamepad_from_id(instance_id: JoystickID) raises -> Ptr[Gamepad, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadFromID
    """
    var result = get_sdl3_function_table().get_gamepad_from_id(instance_id)
    if not result:
        raise get_error()
    return result


fn get_gamepad_from_player_index(player_index: Int32) -> Ptr[Gamepad, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadFromPlayerIndex
    """
    return get_sdl3_function_table().get_gamepad_from_player_index(player_index)


fn get_gamepad_properties(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProperties
    """
    return get_sdl3_function_table().get_gamepad_properties(gamepad)


fn get_gamepad_id(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> JoystickID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadID
    """
    return get_sdl3_function_table().get_gamepad_id(gamepad)


fn get_gamepad_name(
    gamepad: Ptr[Gamepad, MutAnyOrigin]
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadName
    """
    var cstring = get_sdl3_function_table().get_gamepad_name(gamepad)
    if not cstring:
        raise "Error in get_gamepad_name call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_gamepad_path(
    gamepad: Ptr[Gamepad, MutAnyOrigin]
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPath
    """
    var cstring = get_sdl3_function_table().get_gamepad_path(gamepad)
    if not cstring:
        raise "Error in get_gamepad_path call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_gamepad_type(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> GamepadType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadType
    """
    return get_sdl3_function_table().get_gamepad_type(gamepad)


fn get_real_gamepad_type(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> GamepadType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRealGamepadType
    """
    return get_sdl3_function_table().get_real_gamepad_type(gamepad)


fn get_gamepad_player_index(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPlayerIndex
    """
    return get_sdl3_function_table().get_gamepad_player_index(gamepad)


fn set_gamepad_player_index(gamepad: Ptr[Gamepad, MutAnyOrigin], player_index: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadPlayerIndex
    """
    var success = get_sdl3_function_table().set_gamepad_player_index(gamepad, player_index)
    if not success:
        raise get_error()


fn get_gamepad_vendor(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadVendor
    """
    return get_sdl3_function_table().get_gamepad_vendor(gamepad)


fn get_gamepad_product(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProduct
    """
    return get_sdl3_function_table().get_gamepad_product(gamepad)


fn get_gamepad_product_version(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductVersion
    """
    return get_sdl3_function_table().get_gamepad_product_version(gamepad)


fn get_gamepad_firmware_version(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadFirmwareVersion
    """
    return get_sdl3_function_table().get_gamepad_firmware_version(gamepad)


fn get_gamepad_serial(
    gamepad: Ptr[Gamepad, MutAnyOrigin]
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadSerial
    """
    var cstring = get_sdl3_function_table().get_gamepad_serial(gamepad)
    if not cstring:
        raise "Error in get_gamepad_serial call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_gamepad_steam_handle(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> UInt64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadSteamHandle
    """
    return get_sdl3_function_table().get_gamepad_steam_handle(gamepad)


fn get_gamepad_connection_state(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> JoystickConnectionState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadConnectionState
    """
    return get_sdl3_function_table().get_gamepad_connection_state(gamepad)


fn get_gamepad_power_info(
    gamepad: Ptr[Gamepad, MutAnyOrigin], percent: Ptr[Int32, MutAnyOrigin]
) -> PowerState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPowerInfo
    """
    return get_sdl3_function_table().get_gamepad_power_info(gamepad, percent)


fn gamepad_connected(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadConnected
    """
    return get_sdl3_function_table().gamepad_connected(gamepad)


fn get_gamepad_joystick(
    gamepad: Ptr[Gamepad, MutAnyOrigin]
) raises -> Ptr[Joystick, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadJoystick
    """
    var result = get_sdl3_function_table().get_gamepad_joystick(gamepad)
    if not result:
        raise get_error()
    return result


fn set_gamepad_events_enabled(enabled: Bool):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadEventsEnabled
    """
    get_sdl3_function_table().set_gamepad_events_enabled(enabled)


fn gamepad_events_enabled() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadEventsEnabled
    """
    return get_sdl3_function_table().gamepad_events_enabled()


fn get_gamepad_bindings(
    gamepad: Ptr[Gamepad, MutAnyOrigin], count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[GamepadBinding, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadBindings
    """
    var result = get_sdl3_function_table().get_gamepad_bindings(gamepad, count)
    if not result:
        raise get_error()
    return result


fn update_gamepads():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateGamepads
    """
    get_sdl3_function_table().update_gamepads()


fn get_gamepad_type_from_string(str: CStringSlice) -> GamepadType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadTypeFromString
    """
    return get_sdl3_function_table().get_gamepad_type_from_string(str.unsafe_ptr())


fn get_gamepad_string_for_type(type: GamepadType) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForType
    """
    var cstring = get_sdl3_function_table().get_gamepad_string_for_type(type)
    if not cstring:
        raise "Error in get_gamepad_string_for_type call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_gamepad_axis_from_string(str: CStringSlice) -> GamepadAxis:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadAxisFromString
    """
    return get_sdl3_function_table().get_gamepad_axis_from_string(str.unsafe_ptr())


fn get_gamepad_string_for_axis(axis: GamepadAxis) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForAxis
    """
    var cstring = get_sdl3_function_table().get_gamepad_string_for_axis(axis)
    if not cstring:
        raise "Error in get_gamepad_string_for_axis call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn gamepad_has_axis(gamepad: Ptr[Gamepad, MutAnyOrigin], axis: GamepadAxis) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadHasAxis
    """
    return get_sdl3_function_table().gamepad_has_axis(gamepad, axis)


fn get_gamepad_axis(gamepad: Ptr[Gamepad, MutAnyOrigin], axis: GamepadAxis) -> Int16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadAxis
    """
    return get_sdl3_function_table().get_gamepad_axis(gamepad, axis)


fn get_gamepad_button_from_string(str: CStringSlice) -> GamepadButton:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonFromString
    """
    return get_sdl3_function_table().get_gamepad_button_from_string(str.unsafe_ptr())


fn get_gamepad_string_for_button(
    button: GamepadButton
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForButton
    """
    var cstring = get_sdl3_function_table().get_gamepad_string_for_button(button)
    if not cstring:
        raise "Error in get_gamepad_string_for_button call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn gamepad_has_button(gamepad: Ptr[Gamepad, MutAnyOrigin], button: GamepadButton) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadHasButton
    """
    return get_sdl3_function_table().gamepad_has_button(gamepad, button)


fn get_gamepad_button(gamepad: Ptr[Gamepad, MutAnyOrigin], button: GamepadButton) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadButton
    """
    return get_sdl3_function_table().get_gamepad_button(gamepad, button)


fn get_gamepad_button_label_for_type(
    type: GamepadType, button: GamepadButton
) -> GamepadButtonLabel:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonLabelForType
    """
    return get_sdl3_function_table().get_gamepad_button_label_for_type(type, button)


fn get_gamepad_button_label(
    gamepad: Ptr[Gamepad, MutAnyOrigin], button: GamepadButton
) -> GamepadButtonLabel:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonLabel
    """
    return get_sdl3_function_table().get_gamepad_button_label(gamepad, button)


fn get_num_gamepad_touchpads(gamepad: Ptr[Gamepad, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumGamepadTouchpads
    """
    return get_sdl3_function_table().get_num_gamepad_touchpads(gamepad)


fn get_num_gamepad_touchpad_fingers(gamepad: Ptr[Gamepad, MutAnyOrigin], touchpad: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumGamepadTouchpadFingers
    """
    return get_sdl3_function_table().get_num_gamepad_touchpad_fingers(gamepad, touchpad)


fn get_gamepad_touchpad_finger(
    gamepad: Ptr[Gamepad, MutAnyOrigin],
    touchpad: Int32,
    finger: Int32,
    down: Ptr[Bool, MutAnyOrigin],
    x: Ptr[Float32, MutAnyOrigin],
    y: Ptr[Float32, MutAnyOrigin],
    pressure: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadTouchpadFinger
    """
    var success = get_sdl3_function_table().get_gamepad_touchpad_finger(
        gamepad, touchpad, finger, down, x, y, pressure
    )
    if not success:
        raise get_error()


fn gamepad_has_sensor(gamepad: Ptr[Gamepad, MutAnyOrigin], type: SensorType) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadHasSensor
    """
    return get_sdl3_function_table().gamepad_has_sensor(gamepad, type)


fn set_gamepad_sensor_enabled(
    gamepad: Ptr[Gamepad, MutAnyOrigin], type: SensorType, enabled: Bool
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadSensorEnabled
    """
    var success = get_sdl3_function_table().set_gamepad_sensor_enabled(gamepad, type, enabled)
    if not success:
        raise get_error()


fn gamepad_sensor_enabled(gamepad: Ptr[Gamepad, MutAnyOrigin], type: SensorType) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadSensorEnabled
    """
    return get_sdl3_function_table().gamepad_sensor_enabled(gamepad, type)


fn get_gamepad_sensor_data_rate(gamepad: Ptr[Gamepad, MutAnyOrigin], type: SensorType) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadSensorDataRate
    """
    return get_sdl3_function_table().get_gamepad_sensor_data_rate(gamepad, type)


fn get_gamepad_sensor_data(
    gamepad: Ptr[Gamepad, MutAnyOrigin],
    type: SensorType,
    data: Ptr[Float32, MutAnyOrigin],
    num_values: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadSensorData
    """
    var success = get_sdl3_function_table().get_gamepad_sensor_data(
        gamepad, type, data, num_values
    )
    if not success:
        raise get_error()


fn rumble_gamepad(
    gamepad: Ptr[Gamepad, MutAnyOrigin],
    low_frequency_rumble: UInt16,
    high_frequency_rumble: UInt16,
    duration_ms: UInt32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RumbleGamepad
    """
    var success = get_sdl3_function_table().rumble_gamepad(
        gamepad, low_frequency_rumble, high_frequency_rumble, duration_ms
    )
    if not success:
        raise get_error()


fn rumble_gamepad_triggers(
    gamepad: Ptr[Gamepad, MutAnyOrigin],
    left_rumble: UInt16,
    right_rumble: UInt16,
    duration_ms: UInt32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RumbleGamepadTriggers
    """
    var success = get_sdl3_function_table().rumble_gamepad_triggers(
        gamepad, left_rumble, right_rumble, duration_ms
    )
    if not success:
        raise get_error()


fn set_gamepad_led(
    gamepad: Ptr[Gamepad, MutAnyOrigin], red: UInt8, green: UInt8, blue: UInt8
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadLED
    """
    var success = get_sdl3_function_table().set_gamepad_led(gamepad, red, green, blue)
    if not success:
        raise get_error()


fn send_gamepad_effect(
    gamepad: Ptr[Gamepad, MutAnyOrigin], data: Ptr[NoneType, ImmutAnyOrigin], size: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SendGamepadEffect
    """
    var success = get_sdl3_function_table().send_gamepad_effect(gamepad, data, size)
    if not success:
        raise get_error()


fn close_gamepad(gamepad: Ptr[Gamepad, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseGamepad
    """
    get_sdl3_function_table().close_gamepad(gamepad)


fn get_gamepad_apple_sf_symbols_name_for_button(
    gamepad: Ptr[Gamepad, MutAnyOrigin], button: GamepadButton
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadAppleSFSymbolsNameForButton
    """
    var cstring = get_sdl3_function_table().get_gamepad_apple_sf_symbols_name_for_button(
        gamepad, button
    )
    if not cstring:
        raise "Error in get_gamepad_apple_sf_symbols_name_for_button call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_gamepad_apple_sf_symbols_name_for_axis(
    gamepad: Ptr[Gamepad, MutAnyOrigin], axis: GamepadAxis
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadAppleSFSymbolsNameForAxis
    """
    var cstring = get_sdl3_function_table().get_gamepad_apple_sf_symbols_name_for_axis(
        gamepad, axis
    )
    if not cstring:
        raise "Error in get_gamepad_apple_sf_symbols_name_for_axis call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn gpu_supports_shader_formats(format_flags: GPUShaderFormat, name: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSupportsShaderFormats
    """
    return get_sdl3_function_table().gpu_supports_shader_formats(format_flags, name.unsafe_ptr())


fn gpu_supports_properties(props: PropertiesID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSupportsProperties
    """
    return get_sdl3_function_table().gpu_supports_properties(props)


fn create_gpu_device(
    format_flags: GPUShaderFormat, debug_mode: Bool, name: CStringSlice
) raises -> Ptr[GPUDevice, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUDevice
    """
    var result = get_sdl3_function_table().create_gpu_device(
        format_flags, debug_mode, name.unsafe_ptr()
    )
    if not result:
        raise get_error()
    return result


fn create_gpu_device_with_properties(
    props: PropertiesID
) raises -> Ptr[GPUDevice, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUDeviceWithProperties
    """
    var result = get_sdl3_function_table().create_gpu_device_with_properties(props)
    if not result:
        raise get_error()
    return result


fn destroy_gpu_device(device: Ptr[GPUDevice, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyGPUDevice
    """
    get_sdl3_function_table().destroy_gpu_device(device)


fn get_num_gpu_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumGPUDrivers
    """
    return get_sdl3_function_table().get_num_gpu_drivers()


fn get_gpu_driver(index: Int32) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUDriver
    """
    var cstring = get_sdl3_function_table().get_gpu_driver(index)
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_gpu_device_driver(
    device: Ptr[GPUDevice, MutAnyOrigin]
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUDeviceDriver
    """
    var cstring = get_sdl3_function_table().get_gpu_device_driver(device)
    if not cstring:
        raise "Error in get_gpu_device_driver call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_gpu_shader_formats(device: Ptr[GPUDevice, MutAnyOrigin]) -> GPUShaderFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUShaderFormats
    """
    return get_sdl3_function_table().get_gpu_shader_formats(device)


fn create_gpu_compute_pipeline(
    device: Ptr[GPUDevice, MutAnyOrigin],
    createinfo: Ptr[GPUComputePipelineCreateInfo, ImmutAnyOrigin],
) raises -> Ptr[GPUComputePipeline, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUComputePipeline
    """
    var result = get_sdl3_function_table().create_gpu_compute_pipeline(device, createinfo)
    if not result:
        raise get_error()
    return result


fn create_gpu_graphics_pipeline(
    device: Ptr[GPUDevice, MutAnyOrigin],
    createinfo: Ptr[GPUGraphicsPipelineCreateInfo, ImmutAnyOrigin],
) raises -> Ptr[GPUGraphicsPipeline, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUGraphicsPipeline
    """
    var result = get_sdl3_function_table().create_gpu_graphics_pipeline(device, createinfo)
    if not result:
        raise get_error()
    return result


fn create_gpu_sampler(
    device: Ptr[GPUDevice, MutAnyOrigin], createinfo: Ptr[GPUSamplerCreateInfo, ImmutAnyOrigin]
) raises -> Ptr[GPUSampler, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUSampler
    """
    var result = get_sdl3_function_table().create_gpu_sampler(device, createinfo)
    if not result:
        raise get_error()
    return result


fn create_gpu_shader(
    device: Ptr[GPUDevice, MutAnyOrigin], createinfo: Ptr[GPUShaderCreateInfo, ImmutAnyOrigin]
) raises -> Ptr[GPUShader, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUShader
    """
    var result = get_sdl3_function_table().create_gpu_shader(device, createinfo)
    if not result:
        raise get_error()
    return result


fn create_gpu_texture(
    device: Ptr[GPUDevice, MutAnyOrigin], createinfo: Ptr[GPUTextureCreateInfo, ImmutAnyOrigin]
) raises -> Ptr[GPUTexture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUTexture
    """
    var result = get_sdl3_function_table().create_gpu_texture(device, createinfo)
    if not result:
        raise get_error()
    return result


fn create_gpu_buffer(
    device: Ptr[GPUDevice, MutAnyOrigin], createinfo: Ptr[GPUBufferCreateInfo, ImmutAnyOrigin]
) raises -> Ptr[GPUBuffer, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUBuffer
    """
    var result = get_sdl3_function_table().create_gpu_buffer(device, createinfo)
    if not result:
        raise get_error()
    return result


fn create_gpu_transfer_buffer(
    device: Ptr[GPUDevice, MutAnyOrigin],
    createinfo: Ptr[GPUTransferBufferCreateInfo, ImmutAnyOrigin],
) raises -> Ptr[GPUTransferBuffer, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUTransferBuffer
    """
    var result = get_sdl3_function_table().create_gpu_transfer_buffer(device, createinfo)
    if not result:
        raise get_error()
    return result


fn set_gpu_buffer_name(
    device: Ptr[GPUDevice, MutAnyOrigin], buffer: Ptr[GPUBuffer, MutAnyOrigin], text: CStringSlice
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUBufferName
    """
    get_sdl3_function_table().set_gpu_buffer_name(device, buffer, text.unsafe_ptr())


fn set_gpu_texture_name(
    device: Ptr[GPUDevice, MutAnyOrigin], texture: Ptr[GPUTexture, MutAnyOrigin], text: CStringSlice
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUTextureName
    """
    get_sdl3_function_table().set_gpu_texture_name(device, texture, text.unsafe_ptr())


fn insert_gpu_debug_label(command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin], text: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_InsertGPUDebugLabel
    """
    get_sdl3_function_table().insert_gpu_debug_label(command_buffer, text.unsafe_ptr())


fn push_gpu_debug_group(command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin], name: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushGPUDebugGroup
    """
    get_sdl3_function_table().push_gpu_debug_group(command_buffer, name.unsafe_ptr())


fn pop_gpu_debug_group(command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PopGPUDebugGroup
    """
    get_sdl3_function_table().pop_gpu_debug_group(command_buffer)


fn release_gpu_texture(
    device: Ptr[GPUDevice, MutAnyOrigin], texture: Ptr[GPUTexture, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTexture
    """
    get_sdl3_function_table().release_gpu_texture(device, texture)


fn release_gpu_sampler(
    device: Ptr[GPUDevice, MutAnyOrigin], sampler: Ptr[GPUSampler, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUSampler
    """
    get_sdl3_function_table().release_gpu_sampler(device, sampler)


fn release_gpu_buffer(device: Ptr[GPUDevice, MutAnyOrigin], buffer: Ptr[GPUBuffer, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUBuffer
    """
    get_sdl3_function_table().release_gpu_buffer(device, buffer)


fn release_gpu_transfer_buffer(
    device: Ptr[GPUDevice, MutAnyOrigin], transfer_buffer: Ptr[GPUTransferBuffer, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTransferBuffer
    """
    get_sdl3_function_table().release_gpu_transfer_buffer(device, transfer_buffer)


fn release_gpu_compute_pipeline(
    device: Ptr[GPUDevice, MutAnyOrigin], compute_pipeline: Ptr[GPUComputePipeline, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUComputePipeline
    """
    get_sdl3_function_table().release_gpu_compute_pipeline(device, compute_pipeline)


fn release_gpu_shader(device: Ptr[GPUDevice, MutAnyOrigin], shader: Ptr[GPUShader, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUShader
    """
    get_sdl3_function_table().release_gpu_shader(device, shader)


fn release_gpu_graphics_pipeline(
    device: Ptr[GPUDevice, MutAnyOrigin], graphics_pipeline: Ptr[GPUGraphicsPipeline, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUGraphicsPipeline
    """
    get_sdl3_function_table().release_gpu_graphics_pipeline(device, graphics_pipeline)


fn acquire_gpu_command_buffer(
    device: Ptr[GPUDevice, MutAnyOrigin]
) raises -> Ptr[GPUCommandBuffer, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AcquireGPUCommandBuffer
    """
    var result = get_sdl3_function_table().acquire_gpu_command_buffer(device)
    if not result:
        raise get_error()
    return result


fn push_gpu_vertex_uniform_data(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin],
    slot_index: UInt32,
    data: Ptr[NoneType, ImmutAnyOrigin],
    length: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushGPUVertexUniformData
    """
    get_sdl3_function_table().push_gpu_vertex_uniform_data(
        command_buffer, slot_index, data, length
    )


fn push_gpu_fragment_uniform_data(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin],
    slot_index: UInt32,
    data: Ptr[NoneType, ImmutAnyOrigin],
    length: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushGPUFragmentUniformData
    """
    get_sdl3_function_table().push_gpu_fragment_uniform_data(
        command_buffer, slot_index, data, length
    )


fn push_gpu_compute_uniform_data(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin],
    slot_index: UInt32,
    data: Ptr[NoneType, ImmutAnyOrigin],
    length: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushGPUComputeUniformData
    """
    get_sdl3_function_table().push_gpu_compute_uniform_data(
        command_buffer, slot_index, data, length
    )


fn begin_gpu_render_pass(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin],
    color_target_infos: Ptr[GPUColorTargetInfo, ImmutAnyOrigin],
    num_color_targets: UInt32,
    depth_stencil_target_info: Ptr[GPUDepthStencilTargetInfo, ImmutAnyOrigin],
) raises -> Ptr[GPURenderPass, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BeginGPURenderPass
    """
    var result = get_sdl3_function_table().begin_gpu_render_pass(
        command_buffer, color_target_infos, num_color_targets, depth_stencil_target_info
    )
    if not result:
        raise "Error in begin_gpu_render_pass call. See official documentation for details."
    return result


fn bind_gpu_graphics_pipeline(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    graphics_pipeline: Ptr[GPUGraphicsPipeline, MutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUGraphicsPipeline
    """
    get_sdl3_function_table().bind_gpu_graphics_pipeline(render_pass, graphics_pipeline)


fn set_gpu_viewport(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin], viewport: Ptr[GPUViewport, ImmutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUViewport
    """
    get_sdl3_function_table().set_gpu_viewport(render_pass, viewport)


fn set_gpu_scissor(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin], scissor: Ptr[Rect, ImmutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUScissor
    """
    get_sdl3_function_table().set_gpu_scissor(render_pass, scissor)


fn set_gpu_blend_constants(render_pass: Ptr[GPURenderPass, MutAnyOrigin], blend_constants: FColor):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUBlendConstants
    """
    get_sdl3_function_table().set_gpu_blend_constants(render_pass, blend_constants)


fn set_gpu_stencil_reference(render_pass: Ptr[GPURenderPass, MutAnyOrigin], reference: UInt8):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUStencilReference
    """
    get_sdl3_function_table().set_gpu_stencil_reference(render_pass, reference)


fn bind_gpu_vertex_buffers(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    first_slot: UInt32,
    bindings: Ptr[GPUBufferBinding, ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexBuffers
    """
    get_sdl3_function_table().bind_gpu_vertex_buffers(
        render_pass, first_slot, bindings, num_bindings
    )


fn bind_gpu_index_buffer(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    binding: Ptr[GPUBufferBinding, ImmutAnyOrigin],
    index_element_size: GPUIndexElementSize,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUIndexBuffer
    """
    get_sdl3_function_table().bind_gpu_index_buffer(render_pass, binding, index_element_size)


fn bind_gpu_vertex_samplers(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    first_slot: UInt32,
    texture_sampler_bindings: Ptr[GPUTextureSamplerBinding, ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexSamplers
    """
    get_sdl3_function_table().bind_gpu_vertex_samplers(
        render_pass, first_slot, texture_sampler_bindings, num_bindings
    )


fn bind_gpu_vertex_storage_textures(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    first_slot: UInt32,
    storage_textures: Ptr[Ptr[GPUTexture, MutOrigin.external], ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageTextures
    """
    get_sdl3_function_table().bind_gpu_vertex_storage_textures(
        render_pass, first_slot, storage_textures, num_bindings
    )


fn bind_gpu_vertex_storage_buffers(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    first_slot: UInt32,
    storage_buffers: Ptr[Ptr[GPUBuffer, MutOrigin.external], ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageBuffers
    """
    get_sdl3_function_table().bind_gpu_vertex_storage_buffers(
        render_pass, first_slot, storage_buffers, num_bindings
    )


fn bind_gpu_fragment_samplers(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    first_slot: UInt32,
    texture_sampler_bindings: Ptr[GPUTextureSamplerBinding, ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentSamplers
    """
    get_sdl3_function_table().bind_gpu_fragment_samplers(
        render_pass, first_slot, texture_sampler_bindings, num_bindings
    )


fn bind_gpu_fragment_storage_textures(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    first_slot: UInt32,
    storage_textures: Ptr[Ptr[GPUTexture, MutOrigin.external], ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageTextures
    """
    get_sdl3_function_table().bind_gpu_fragment_storage_textures(
        render_pass, first_slot, storage_textures, num_bindings
    )


fn bind_gpu_fragment_storage_buffers(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    first_slot: UInt32,
    storage_buffers: Ptr[Ptr[GPUBuffer, MutOrigin.external], ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageBuffers
    """
    get_sdl3_function_table().bind_gpu_fragment_storage_buffers(
        render_pass, first_slot, storage_buffers, num_bindings
    )


fn draw_gpu_indexed_primitives(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    num_indices: UInt32,
    num_instances: UInt32,
    first_index: UInt32,
    vertex_offset: Int32,
    first_instance: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DrawGPUIndexedPrimitives
    """
    get_sdl3_function_table().draw_gpu_indexed_primitives(
        render_pass, num_indices, num_instances, first_index, vertex_offset, first_instance
    )


fn draw_gpu_primitives(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    num_vertices: UInt32,
    num_instances: UInt32,
    first_vertex: UInt32,
    first_instance: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DrawGPUPrimitives
    """
    get_sdl3_function_table().draw_gpu_primitives(
        render_pass, num_vertices, num_instances, first_vertex, first_instance
    )


fn draw_gpu_primitives_indirect(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    buffer: Ptr[GPUBuffer, MutAnyOrigin],
    offset: UInt32,
    draw_count: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DrawGPUPrimitivesIndirect
    """
    get_sdl3_function_table().draw_gpu_primitives_indirect(render_pass, buffer, offset, draw_count)


fn draw_gpu_indexed_primitives_indirect(
    render_pass: Ptr[GPURenderPass, MutAnyOrigin],
    buffer: Ptr[GPUBuffer, MutAnyOrigin],
    offset: UInt32,
    draw_count: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DrawGPUIndexedPrimitivesIndirect
    """
    get_sdl3_function_table().draw_gpu_indexed_primitives_indirect(
        render_pass, buffer, offset, draw_count
    )


fn end_gpu_render_pass(render_pass: Ptr[GPURenderPass, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EndGPURenderPass
    """
    get_sdl3_function_table().end_gpu_render_pass(render_pass)


fn begin_gpu_compute_pass(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin],
    storage_texture_bindings: Ptr[GPUStorageTextureReadWriteBinding, ImmutAnyOrigin],
    num_storage_texture_bindings: UInt32,
    storage_buffer_bindings: Ptr[GPUStorageBufferReadWriteBinding, ImmutAnyOrigin],
    num_storage_buffer_bindings: UInt32,
) -> Ptr[GPUComputePass, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BeginGPUComputePass
    """
    return get_sdl3_function_table().begin_gpu_compute_pass(
        command_buffer,
        storage_texture_bindings,
        num_storage_texture_bindings,
        storage_buffer_bindings,
        num_storage_buffer_bindings,
    )


fn bind_gpu_compute_pipeline(
    compute_pass: Ptr[GPUComputePass, MutAnyOrigin],
    compute_pipeline: Ptr[GPUComputePipeline, MutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUComputePipeline
    """
    get_sdl3_function_table().bind_gpu_compute_pipeline(compute_pass, compute_pipeline)


fn bind_gpu_compute_samplers(
    compute_pass: Ptr[GPUComputePass, MutAnyOrigin],
    first_slot: UInt32,
    texture_sampler_bindings: Ptr[GPUTextureSamplerBinding, ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeSamplers
    """
    get_sdl3_function_table().bind_gpu_compute_samplers(
        compute_pass, first_slot, texture_sampler_bindings, num_bindings
    )


fn bind_gpu_compute_storage_textures(
    compute_pass: Ptr[GPUComputePass, MutAnyOrigin],
    first_slot: UInt32,
    storage_textures: Ptr[Ptr[GPUTexture, MutOrigin.external], ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageTextures
    """
    get_sdl3_function_table().bind_gpu_compute_storage_textures(
        compute_pass, first_slot, storage_textures, num_bindings
    )


fn bind_gpu_compute_storage_buffers(
    compute_pass: Ptr[GPUComputePass, MutAnyOrigin],
    first_slot: UInt32,
    storage_buffers: Ptr[Ptr[GPUBuffer, MutOrigin.external], ImmutAnyOrigin],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageBuffers
    """
    get_sdl3_function_table().bind_gpu_compute_storage_buffers(
        compute_pass, first_slot, storage_buffers, num_bindings
    )


fn dispatch_gpu_compute(
    compute_pass: Ptr[GPUComputePass, MutAnyOrigin],
    groupcount_x: UInt32,
    groupcount_y: UInt32,
    groupcount_z: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DispatchGPUCompute
    """
    get_sdl3_function_table().dispatch_gpu_compute(
        compute_pass, groupcount_x, groupcount_y, groupcount_z
    )


fn dispatch_gpu_compute_indirect(
    compute_pass: Ptr[GPUComputePass, MutAnyOrigin],
    buffer: Ptr[GPUBuffer, MutAnyOrigin],
    offset: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DispatchGPUComputeIndirect
    """
    get_sdl3_function_table().dispatch_gpu_compute_indirect(compute_pass, buffer, offset)


fn end_gpu_compute_pass(compute_pass: Ptr[GPUComputePass, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EndGPUComputePass
    """
    get_sdl3_function_table().end_gpu_compute_pass(compute_pass)


fn map_gpu_transfer_buffer(
    device: Ptr[GPUDevice, MutAnyOrigin],
    transfer_buffer: Ptr[GPUTransferBuffer, MutAnyOrigin],
    cycle: Bool,
) raises -> Ptr[NoneType, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapGPUTransferBuffer
    """
    var result = get_sdl3_function_table().map_gpu_transfer_buffer(device, transfer_buffer, cycle)
    if not result:
        raise get_error()
    return result


fn unmap_gpu_transfer_buffer(
    device: Ptr[GPUDevice, MutAnyOrigin], transfer_buffer: Ptr[GPUTransferBuffer, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnmapGPUTransferBuffer
    """
    get_sdl3_function_table().unmap_gpu_transfer_buffer(device, transfer_buffer)


fn begin_gpu_copy_pass(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin]
) -> Ptr[GPUCopyPass, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BeginGPUCopyPass
    """
    return get_sdl3_function_table().begin_gpu_copy_pass(command_buffer)


fn upload_to_gpu_texture(
    copy_pass: Ptr[GPUCopyPass, MutAnyOrigin],
    source: Ptr[GPUTextureTransferInfo, ImmutAnyOrigin],
    destination: Ptr[GPUTextureRegion, ImmutAnyOrigin],
    cycle: Bool,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UploadToGPUTexture
    """
    get_sdl3_function_table().upload_to_gpu_texture(copy_pass, source, destination, cycle)


fn upload_to_gpu_buffer(
    copy_pass: Ptr[GPUCopyPass, MutAnyOrigin],
    source: Ptr[GPUTransferBufferLocation, ImmutAnyOrigin],
    destination: Ptr[GPUBufferRegion, ImmutAnyOrigin],
    cycle: Bool,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UploadToGPUBuffer
    """
    get_sdl3_function_table().upload_to_gpu_buffer(copy_pass, source, destination, cycle)


fn copy_gpu_texture_to_texture(
    copy_pass: Ptr[GPUCopyPass, MutAnyOrigin],
    source: Ptr[GPUTextureLocation, ImmutAnyOrigin],
    destination: Ptr[GPUTextureLocation, ImmutAnyOrigin],
    w: UInt32,
    h: UInt32,
    d: UInt32,
    cycle: Bool,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CopyGPUTextureToTexture
    """
    get_sdl3_function_table().copy_gpu_texture_to_texture(
        copy_pass, source, destination, w, h, d, cycle
    )


fn copy_gpu_buffer_to_buffer(
    copy_pass: Ptr[GPUCopyPass, MutAnyOrigin],
    source: Ptr[GPUBufferLocation, ImmutAnyOrigin],
    destination: Ptr[GPUBufferLocation, ImmutAnyOrigin],
    size: UInt32,
    cycle: Bool,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CopyGPUBufferToBuffer
    """
    get_sdl3_function_table().copy_gpu_buffer_to_buffer(
        copy_pass, source, destination, size, cycle
    )


fn download_from_gpu_texture(
    copy_pass: Ptr[GPUCopyPass, MutAnyOrigin],
    source: Ptr[GPUTextureRegion, ImmutAnyOrigin],
    destination: Ptr[GPUTextureTransferInfo, ImmutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUTexture
    """
    get_sdl3_function_table().download_from_gpu_texture(copy_pass, source, destination)


fn download_from_gpu_buffer(
    copy_pass: Ptr[GPUCopyPass, MutAnyOrigin],
    source: Ptr[GPUBufferRegion, ImmutAnyOrigin],
    destination: Ptr[GPUTransferBufferLocation, ImmutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUBuffer
    """
    get_sdl3_function_table().download_from_gpu_buffer(copy_pass, source, destination)


fn end_gpu_copy_pass(copy_pass: Ptr[GPUCopyPass, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EndGPUCopyPass
    """
    get_sdl3_function_table().end_gpu_copy_pass(copy_pass)


fn generate_mipmaps_for_gpu_texture(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin], texture: Ptr[GPUTexture, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GenerateMipmapsForGPUTexture
    """
    get_sdl3_function_table().generate_mipmaps_for_gpu_texture(command_buffer, texture)


fn blit_gpu_texture(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin], info: Ptr[GPUBlitInfo, ImmutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitGPUTexture
    """
    get_sdl3_function_table().blit_gpu_texture(command_buffer, info)


fn window_supports_gpu_swapchain_composition(
    device: Ptr[GPUDevice, MutAnyOrigin],
    window: Ptr[Window, MutAnyOrigin],
    swapchain_composition: GPUSwapchainComposition,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUSwapchainComposition
    """
    return get_sdl3_function_table().window_supports_gpu_swapchain_composition(
        device, window, swapchain_composition
    )


fn window_supports_gpu_present_mode(
    device: Ptr[GPUDevice, MutAnyOrigin],
    window: Ptr[Window, MutAnyOrigin],
    present_mode: GPUPresentMode,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUPresentMode
    """
    return get_sdl3_function_table().window_supports_gpu_present_mode(device, window, present_mode)


fn claim_window_for_gpu_device(
    device: Ptr[GPUDevice, MutAnyOrigin], window: Ptr[Window, MutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClaimWindowForGPUDevice
    """
    return get_sdl3_function_table().claim_window_for_gpu_device(device, window)


fn release_window_from_gpu_device(
    device: Ptr[GPUDevice, MutAnyOrigin], window: Ptr[Window, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseWindowFromGPUDevice
    """
    get_sdl3_function_table().release_window_from_gpu_device(device, window)


fn set_gpu_swapchain_parameters(
    device: Ptr[GPUDevice, MutAnyOrigin],
    window: Ptr[Window, MutAnyOrigin],
    swapchain_composition: GPUSwapchainComposition,
    present_mode: GPUPresentMode,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUSwapchainParameters
    """
    return get_sdl3_function_table().set_gpu_swapchain_parameters(
        device, window, swapchain_composition, present_mode
    )


fn set_gpu_allowed_frames_in_flight(
    device: Ptr[GPUDevice, MutAnyOrigin], allowed_frames_in_flight: UInt32
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUAllowedFramesInFlight
    """
    return get_sdl3_function_table().set_gpu_allowed_frames_in_flight(
        device, allowed_frames_in_flight
    )


fn get_gpu_swapchain_texture_format(
    device: Ptr[GPUDevice, MutAnyOrigin], window: Ptr[Window, MutAnyOrigin]
) -> GPUTextureFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUSwapchainTextureFormat
    """
    return get_sdl3_function_table().get_gpu_swapchain_texture_format(device, window)


fn acquire_gpu_swapchain_texture(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin],
    window: Ptr[Window, MutAnyOrigin],
    swapchain_texture: Ptr[Ptr[GPUTexture, MutOrigin.external], MutAnyOrigin],
    swapchain_texture_width: Ptr[UInt32, MutAnyOrigin],
    swapchain_texture_height: Ptr[UInt32, MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AcquireGPUSwapchainTexture
    """
    return get_sdl3_function_table().acquire_gpu_swapchain_texture(
        command_buffer, window, swapchain_texture, swapchain_texture_width, swapchain_texture_height
    )


fn wait_for_gpu_swapchain(
    device: Ptr[GPUDevice, MutAnyOrigin], window: Ptr[Window, MutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitForGPUSwapchain
    """
    return get_sdl3_function_table().wait_for_gpu_swapchain(device, window)


fn wait_and_acquire_gpu_swapchain_texture(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin],
    window: Ptr[Window, MutAnyOrigin],
    swapchain_texture: Ptr[Ptr[GPUTexture, MutOrigin.external], MutAnyOrigin],
    swapchain_texture_width: Ptr[UInt32, MutAnyOrigin],
    swapchain_texture_height: Ptr[UInt32, MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitAndAcquireGPUSwapchainTexture
    """
    return get_sdl3_function_table().wait_and_acquire_gpu_swapchain_texture(
        command_buffer, window, swapchain_texture, swapchain_texture_width, swapchain_texture_height
    )


fn submit_gpu_command_buffer(command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SubmitGPUCommandBuffer
    """
    return get_sdl3_function_table().submit_gpu_command_buffer(command_buffer)


fn submit_gpu_command_buffer_and_acquire_fence(
    command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin]
) raises -> Ptr[GPUFence, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SubmitGPUCommandBufferAndAcquireFence
    """
    var result = get_sdl3_function_table().submit_gpu_command_buffer_and_acquire_fence(
        command_buffer
    )
    if not result:
        raise get_error()
    return result


fn cancel_gpu_command_buffer(command_buffer: Ptr[GPUCommandBuffer, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CancelGPUCommandBuffer
    """
    return get_sdl3_function_table().cancel_gpu_command_buffer(command_buffer)


fn wait_for_gpu_idle(device: Ptr[GPUDevice, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitForGPUIdle
    """
    return get_sdl3_function_table().wait_for_gpu_idle(device)


fn wait_for_gpu_fences(
    device: Ptr[GPUDevice, MutAnyOrigin],
    wait_all: Bool,
    fences: Ptr[Ptr[GPUFence, MutOrigin.external], ImmutAnyOrigin],
    num_fences: UInt32,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitForGPUFences
    """
    return get_sdl3_function_table().wait_for_gpu_fences(device, wait_all, fences, num_fences)


fn query_gpu_fence(
    device: Ptr[GPUDevice, MutAnyOrigin], fence: Ptr[GPUFence, MutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_QueryGPUFence
    """
    return get_sdl3_function_table().query_gpu_fence(device, fence)


fn release_gpu_fence(device: Ptr[GPUDevice, MutAnyOrigin], fence: Ptr[GPUFence, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUFence
    """
    get_sdl3_function_table().release_gpu_fence(device, fence)


fn gpu_texture_format_texel_block_size(format: GPUTextureFormat) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureFormatTexelBlockSize
    """
    return get_sdl3_function_table().gpu_texture_format_texel_block_size(format)


fn gpu_texture_supports_format(
    device: Ptr[GPUDevice, MutAnyOrigin],
    format: GPUTextureFormat,
    type: GPUTextureType,
    usage: GPUTextureUsageFlags,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsFormat
    """
    return get_sdl3_function_table().gpu_texture_supports_format(device, format, type, usage)


fn gpu_texture_supports_sample_count(
    device: Ptr[GPUDevice, MutAnyOrigin], format: GPUTextureFormat, sample_count: GPUSampleCount
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsSampleCount
    """
    return get_sdl3_function_table().gpu_texture_supports_sample_count(
        device, format, sample_count
    )


fn calculate_gpu_texture_format_size(
    format: GPUTextureFormat, width: UInt32, height: UInt32, depth_or_layer_count: UInt32
) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CalculateGPUTextureFormatSize
    """
    return get_sdl3_function_table().calculate_gpu_texture_format_size(
        format, width, height, depth_or_layer_count
    )


fn guid_to_string(guid: GUID, pszGUID: Ptr[c_char, MutAnyOrigin], cbGUID: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GUIDToString
    """
    get_sdl3_function_table().guid_to_string(guid, pszGUID, cbGUID)


fn string_to_guid(pchGUID: CStringSlice) -> GUID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StringToGUID
    """
    return get_sdl3_function_table().string_to_guid(pchGUID.unsafe_ptr())


fn get_haptics(count: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[HapticID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHaptics
    """
    var result = get_sdl3_function_table().get_haptics(count)
    if not result:
        raise get_error()
    return result


fn get_haptic_name_for_id(instance_id: HapticID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticNameForID
    """
    var cstring = get_sdl3_function_table().get_haptic_name_for_id(instance_id)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn open_haptic(instance_id: HapticID) raises -> Ptr[Haptic, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenHaptic
    """
    var result = get_sdl3_function_table().open_haptic(instance_id)
    if not result:
        raise get_error()
    return result


fn get_haptic_from_id(instance_id: HapticID) raises -> Ptr[Haptic, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticFromID
    """
    var result = get_sdl3_function_table().get_haptic_from_id(instance_id)
    if not result:
        raise get_error()
    return result


fn get_haptic_id(haptic: Ptr[Haptic, MutAnyOrigin]) -> HapticID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticID
    """
    return get_sdl3_function_table().get_haptic_id(haptic)


fn get_haptic_name(haptic: Ptr[Haptic, MutAnyOrigin]) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticName
    """
    var cstring = get_sdl3_function_table().get_haptic_name(haptic)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn is_mouse_haptic() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsMouseHaptic
    """
    return get_sdl3_function_table().is_mouse_haptic()


fn open_haptic_from_mouse() raises -> Ptr[Haptic, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenHapticFromMouse
    """
    var result = get_sdl3_function_table().open_haptic_from_mouse()
    if not result:
        raise get_error()
    return result


fn is_joystick_haptic(joystick: Ptr[Joystick, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsJoystickHaptic
    """
    return get_sdl3_function_table().is_joystick_haptic(joystick)


fn open_haptic_from_joystick(
    joystick: Ptr[Joystick, MutAnyOrigin]
) raises -> Ptr[Haptic, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenHapticFromJoystick
    """
    var result = get_sdl3_function_table().open_haptic_from_joystick(joystick)
    if not result:
        raise get_error()
    return result


fn close_haptic(haptic: Ptr[Haptic, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseHaptic
    """
    get_sdl3_function_table().close_haptic(haptic)


fn get_max_haptic_effects(haptic: Ptr[Haptic, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMaxHapticEffects
    """
    return get_sdl3_function_table().get_max_haptic_effects(haptic)


fn get_max_haptic_effects_playing(haptic: Ptr[Haptic, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMaxHapticEffectsPlaying
    """
    return get_sdl3_function_table().get_max_haptic_effects_playing(haptic)


fn get_haptic_features(haptic: Ptr[Haptic, MutAnyOrigin]) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticFeatures
    """
    return get_sdl3_function_table().get_haptic_features(haptic)


fn get_num_haptic_axes(haptic: Ptr[Haptic, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumHapticAxes
    """
    return get_sdl3_function_table().get_num_haptic_axes(haptic)


fn haptic_effect_supported(
    haptic: Ptr[Haptic, MutAnyOrigin], effect: Ptr[HapticEffect, ImmutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticEffectSupported
    """
    return get_sdl3_function_table().haptic_effect_supported(haptic, effect)


fn create_haptic_effect(
    haptic: Ptr[Haptic, MutAnyOrigin], effect: Ptr[HapticEffect, ImmutAnyOrigin]
) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateHapticEffect
    """
    return get_sdl3_function_table().create_haptic_effect(haptic, effect)


fn update_haptic_effect(
    haptic: Ptr[Haptic, MutAnyOrigin], effect: Int32, data: Ptr[HapticEffect, ImmutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateHapticEffect
    """
    var success = get_sdl3_function_table().update_haptic_effect(haptic, effect, data)
    if not success:
        raise get_error()


fn run_haptic_effect(haptic: Ptr[Haptic, MutAnyOrigin], effect: Int32, iterations: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RunHapticEffect
    """
    var success = get_sdl3_function_table().run_haptic_effect(haptic, effect, iterations)
    if not success:
        raise get_error()


fn stop_haptic_effect(haptic: Ptr[Haptic, MutAnyOrigin], effect: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StopHapticEffect
    """
    var success = get_sdl3_function_table().stop_haptic_effect(haptic, effect)
    if not success:
        raise get_error()


fn destroy_haptic_effect(haptic: Ptr[Haptic, MutAnyOrigin], effect: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyHapticEffect
    """
    get_sdl3_function_table().destroy_haptic_effect(haptic, effect)


fn get_haptic_effect_status(haptic: Ptr[Haptic, MutAnyOrigin], effect: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticEffectStatus
    """
    return get_sdl3_function_table().get_haptic_effect_status(haptic, effect)


fn set_haptic_gain(haptic: Ptr[Haptic, MutAnyOrigin], gain: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetHapticGain
    """
    var success = get_sdl3_function_table().set_haptic_gain(haptic, gain)
    if not success:
        raise get_error()


fn set_haptic_autocenter(haptic: Ptr[Haptic, MutAnyOrigin], autocenter: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetHapticAutocenter
    """
    var success = get_sdl3_function_table().set_haptic_autocenter(haptic, autocenter)
    if not success:
        raise get_error()


fn pause_haptic(haptic: Ptr[Haptic, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PauseHaptic
    """
    var success = get_sdl3_function_table().pause_haptic(haptic)
    if not success:
        raise get_error()


fn resume_haptic(haptic: Ptr[Haptic, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResumeHaptic
    """
    var success = get_sdl3_function_table().resume_haptic(haptic)
    if not success:
        raise get_error()


fn stop_haptic_effects(haptic: Ptr[Haptic, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StopHapticEffects
    """
    var success = get_sdl3_function_table().stop_haptic_effects(haptic)
    if not success:
        raise get_error()


fn haptic_rumble_supported(haptic: Ptr[Haptic, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticRumbleSupported
    """
    return get_sdl3_function_table().haptic_rumble_supported(haptic)


fn init_haptic_rumble(haptic: Ptr[Haptic, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_InitHapticRumble
    """
    var success = get_sdl3_function_table().init_haptic_rumble(haptic)
    if not success:
        raise get_error()


fn play_haptic_rumble(haptic: Ptr[Haptic, MutAnyOrigin], strength: Float32, length: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PlayHapticRumble
    """
    var success = get_sdl3_function_table().play_haptic_rumble(haptic, strength, length)
    if not success:
        raise get_error()


fn stop_haptic_rumble(haptic: Ptr[Haptic, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StopHapticRumble
    """
    var success = get_sdl3_function_table().stop_haptic_rumble(haptic)
    if not success:
        raise get_error()


fn set_hint_with_priority(name: CStringSlice, value: CStringSlice, priority: HintPriority) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetHintWithPriority
    """
    var success = get_sdl3_function_table().set_hint_with_priority(
        name.unsafe_ptr(), value.unsafe_ptr(), priority
    )
    if not success:
        raise get_error()


fn set_hint(name: CStringSlice, value: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetHint
    """
    var success = get_sdl3_function_table().set_hint(name.unsafe_ptr(), value.unsafe_ptr())
    if not success:
        raise get_error()


fn reset_hint(name: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResetHint
    """
    var success = get_sdl3_function_table().reset_hint(name.unsafe_ptr())
    if not success:
        raise get_error()


fn reset_hints():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResetHints
    """
    get_sdl3_function_table().reset_hints()


fn get_hint(name: CStringSlice) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHint
    """
    var cstring = get_sdl3_function_table().get_hint(name.unsafe_ptr())
    if not cstring:
        raise "Error in get_hint call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_hint_boolean(name: CStringSlice, default_value: Bool) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHintBoolean
    """
    return get_sdl3_function_table().get_hint_boolean(name.unsafe_ptr(), default_value)


fn add_hint_callback(
    name: CStringSlice, callback: HintCallback, userdata: Ptr[NoneType, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddHintCallback
    """
    var success = get_sdl3_function_table().add_hint_callback(
        name.unsafe_ptr(), callback, userdata
    )
    if not success:
        raise get_error()


fn remove_hint_callback(
    name: CStringSlice, callback: HintCallback, userdata: Ptr[NoneType, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveHintCallback
    """
    get_sdl3_function_table().remove_hint_callback(name.unsafe_ptr(), callback, userdata)


fn init(flags: InitFlags) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Init
    """
    var success = get_sdl3_function_table().init(flags)
    if not success:
        raise get_error()


fn init_sub_system(flags: InitFlags) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_InitSubSystem
    """
    var success = get_sdl3_function_table().init_sub_system(flags)
    if not success:
        raise get_error()


fn quit_sub_system(flags: InitFlags):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_QuitSubSystem
    """
    get_sdl3_function_table().quit_sub_system(flags)


fn was_init(flags: InitFlags) -> InitFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WasInit
    """
    return get_sdl3_function_table().was_init(flags)


fn quit():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Quit
    """
    get_sdl3_function_table().quit()


fn is_main_thread() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsMainThread
    """
    return get_sdl3_function_table().is_main_thread()


fn run_on_main_thread(
    callback: MainThreadCallback, userdata: Ptr[NoneType, MutAnyOrigin], wait_complete: Bool
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RunOnMainThread
    """
    var success = get_sdl3_function_table().run_on_main_thread(callback, userdata, wait_complete)
    if not success:
        raise get_error()


fn set_app_metadata(
    appname: CStringSlice, appversion: CStringSlice, appidentifier: CStringSlice
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAppMetadata
    """
    var success = get_sdl3_function_table().set_app_metadata(
        appname.unsafe_ptr(), appversion.unsafe_ptr(), appidentifier.unsafe_ptr()
    )
    if not success:
        raise get_error()


fn set_app_metadata_property(name: CStringSlice, value: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAppMetadataProperty
    """
    var success = get_sdl3_function_table().set_app_metadata_property(
        name.unsafe_ptr(), value.unsafe_ptr()
    )
    if not success:
        raise get_error()


fn get_app_metadata_property(name: CStringSlice) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAppMetadataProperty
    """
    var cstring = get_sdl3_function_table().get_app_metadata_property(name.unsafe_ptr())
    if not cstring:
        raise "Error in get_app_metadata_property call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn io_from_file(
    file: CStringSlice, mode: CStringSlice
) raises -> Ptr[IOStream, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOFromFile
    """
    var result = get_sdl3_function_table().io_from_file(file.unsafe_ptr(), mode.unsafe_ptr())
    if not result:
        raise get_error()
    return result


fn io_from_mem(
    mem: Ptr[NoneType, MutAnyOrigin], size: Int32
) raises -> Ptr[IOStream, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOFromMem
    """
    var result = get_sdl3_function_table().io_from_mem(mem, size)
    if not result:
        raise get_error()
    return result


fn io_from_const_mem(
    mem: Ptr[NoneType, ImmutAnyOrigin], size: Int32
) raises -> Ptr[IOStream, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOFromConstMem
    """
    var result = get_sdl3_function_table().io_from_const_mem(mem, size)
    if not result:
        raise get_error()
    return result


fn io_from_dynamic_mem() raises -> Ptr[IOStream, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOFromDynamicMem
    """
    var result = get_sdl3_function_table().io_from_dynamic_mem()
    if not result:
        raise get_error()
    return result


fn open_io(
    iface: Ptr[IOStreamInterface, ImmutAnyOrigin], userdata: Ptr[NoneType, MutAnyOrigin]
) raises -> Ptr[IOStream, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenIO
    """
    var result = get_sdl3_function_table().open_io(iface, userdata)
    if not result:
        raise get_error()
    return result


fn close_io(context: Ptr[IOStream, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseIO
    """
    var success = get_sdl3_function_table().close_io(context)
    if not success:
        raise get_error()


fn get_io_properties(context: Ptr[IOStream, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetIOProperties
    """
    return get_sdl3_function_table().get_io_properties(context)


fn get_io_status(context: Ptr[IOStream, MutAnyOrigin]) -> IOStatus:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetIOStatus
    """
    return get_sdl3_function_table().get_io_status(context)


fn get_io_size(context: Ptr[IOStream, MutAnyOrigin]) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetIOSize
    """
    return get_sdl3_function_table().get_io_size(context)


fn seek_io(context: Ptr[IOStream, MutAnyOrigin], offset: Int64, whence: IOWhence) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SeekIO
    """
    return get_sdl3_function_table().seek_io(context, offset, whence)


fn tell_io(context: Ptr[IOStream, MutAnyOrigin]) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TellIO
    """
    return get_sdl3_function_table().tell_io(context)


fn read_io(
    context: Ptr[IOStream, MutAnyOrigin], ptr: Ptr[NoneType, MutAnyOrigin], size: Int32
) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadIO
    """
    return get_sdl3_function_table().read_io(context, ptr, size)


fn write_io(
    context: Ptr[IOStream, MutAnyOrigin], ptr: Ptr[NoneType, ImmutAnyOrigin], size: Int32
) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteIO
    """
    return get_sdl3_function_table().write_io(context, ptr, size)


fn i_oprintf(context: Ptr[IOStream, MutAnyOrigin], fmt: CStringSlice) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOprintf
    """
    return get_sdl3_function_table().i_oprintf(context, fmt.unsafe_ptr())


fn i_ovprintf(context: Ptr[IOStream, MutAnyOrigin], fmt: CStringSlice, ap: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOvprintf
    """
    return get_sdl3_function_table().i_ovprintf(context, fmt.unsafe_ptr(), ap)


fn flush_io(context: Ptr[IOStream, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushIO
    """
    var success = get_sdl3_function_table().flush_io(context)
    if not success:
        raise get_error()


fn load_file_io(
    src: Ptr[IOStream, MutAnyOrigin], datasize: Ptr[Int32, MutAnyOrigin], closeio: Bool
) raises -> Ptr[NoneType, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadFile_IO
    """
    var result = get_sdl3_function_table().load_file_io(src, datasize, closeio)
    if not result:
        raise get_error()
    return result


fn load_file(
    file: CStringSlice, datasize: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[NoneType, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadFile
    """
    var result = get_sdl3_function_table().load_file(file.unsafe_ptr(), datasize)
    if not result:
        raise get_error()
    return result


fn save_file_io(
    src: Ptr[IOStream, MutAnyOrigin],
    data: Ptr[NoneType, ImmutAnyOrigin],
    datasize: Int32,
    closeio: Bool,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SaveFile_IO
    """
    var success = get_sdl3_function_table().save_file_io(src, data, datasize, closeio)
    if not success:
        raise get_error()


fn save_file(file: CStringSlice, data: Ptr[NoneType, ImmutAnyOrigin], datasize: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SaveFile
    """
    var success = get_sdl3_function_table().save_file(file.unsafe_ptr(), data, datasize)
    if not success:
        raise get_error()


fn read_u8(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[UInt8, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU8
    """
    var success = get_sdl3_function_table().read_u8(src, value)
    if not success:
        raise get_error()


fn read_s8(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[Int8, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS8
    """
    var success = get_sdl3_function_table().read_s8(src, value)
    if not success:
        raise get_error()


fn read_u16_le(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[UInt16, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU16LE
    """
    return get_sdl3_function_table().read_u16_le(src, value)


fn read_s16_le(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[Int16, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS16LE
    """
    return get_sdl3_function_table().read_s16_le(src, value)


fn read_u16_be(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[UInt16, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU16BE
    """
    return get_sdl3_function_table().read_u16_be(src, value)


fn read_s16_be(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[Int16, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS16BE
    """
    return get_sdl3_function_table().read_s16_be(src, value)


fn read_u32_le(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[UInt32, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU32LE
    """
    return get_sdl3_function_table().read_u32_le(src, value)


fn read_s32_le(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[Int32, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS32LE
    """
    return get_sdl3_function_table().read_s32_le(src, value)


fn read_u32_be(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[UInt32, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU32BE
    """
    return get_sdl3_function_table().read_u32_be(src, value)


fn read_s32_be(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[Int32, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS32BE
    """
    return get_sdl3_function_table().read_s32_be(src, value)


fn read_u64_le(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[UInt64, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU64LE
    """
    return get_sdl3_function_table().read_u64_le(src, value)


fn read_s64_le(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[Int64, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS64LE
    """
    return get_sdl3_function_table().read_s64_le(src, value)


fn read_u64_be(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[UInt64, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU64BE
    """
    return get_sdl3_function_table().read_u64_be(src, value)


fn read_s64_be(src: Ptr[IOStream, MutAnyOrigin], value: Ptr[Int64, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS64BE
    """
    return get_sdl3_function_table().read_s64_be(src, value)


fn write_u8(dst: Ptr[IOStream, MutAnyOrigin], value: UInt8) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU8
    """
    return get_sdl3_function_table().write_u8(dst, value)


fn write_s8(dst: Ptr[IOStream, MutAnyOrigin], value: Int8) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS8
    """
    return get_sdl3_function_table().write_s8(dst, value)


fn write_u16_le(dst: Ptr[IOStream, MutAnyOrigin], value: UInt16) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU16LE
    """
    return get_sdl3_function_table().write_u16_le(dst, value)


fn write_s16_le(dst: Ptr[IOStream, MutAnyOrigin], value: Int16) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS16LE
    """
    return get_sdl3_function_table().write_s16_le(dst, value)


fn write_u16_be(dst: Ptr[IOStream, MutAnyOrigin], value: UInt16) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU16BE
    """
    return get_sdl3_function_table().write_u16_be(dst, value)


fn write_s16_be(dst: Ptr[IOStream, MutAnyOrigin], value: Int16) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS16BE
    """
    return get_sdl3_function_table().write_s16_be(dst, value)


fn write_u32_le(dst: Ptr[IOStream, MutAnyOrigin], value: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU32LE
    """
    return get_sdl3_function_table().write_u32_le(dst, value)


fn write_s32_le(dst: Ptr[IOStream, MutAnyOrigin], value: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS32LE
    """
    return get_sdl3_function_table().write_s32_le(dst, value)


fn write_u32_be(dst: Ptr[IOStream, MutAnyOrigin], value: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU32BE
    """
    return get_sdl3_function_table().write_u32_be(dst, value)


fn write_s32_be(dst: Ptr[IOStream, MutAnyOrigin], value: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS32BE
    """
    return get_sdl3_function_table().write_s32_be(dst, value)


fn write_u64_le(dst: Ptr[IOStream, MutAnyOrigin], value: UInt64) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU64LE
    """
    return get_sdl3_function_table().write_u64_le(dst, value)


fn write_s64_le(dst: Ptr[IOStream, MutAnyOrigin], value: Int64) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS64LE
    """
    return get_sdl3_function_table().write_s64_le(dst, value)


fn write_u64_be(dst: Ptr[IOStream, MutAnyOrigin], value: UInt64) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU64BE
    """
    return get_sdl3_function_table().write_u64_be(dst, value)


fn write_s64_be(dst: Ptr[IOStream, MutAnyOrigin], value: Int64) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS64BE
    """
    return get_sdl3_function_table().write_s64_be(dst, value)


fn lock_joysticks():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockJoysticks
    """
    get_sdl3_function_table().lock_joysticks()


fn unlock_joysticks():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnlockJoysticks
    """
    get_sdl3_function_table().unlock_joysticks()


fn has_joystick() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasJoystick
    """
    return get_sdl3_function_table().has_joystick()


fn get_joysticks(count: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[JoystickID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoysticks
    """
    var result = get_sdl3_function_table().get_joysticks(count)
    if not result:
        raise get_error()
    return result


fn get_joystick_name_for_id(instance_id: JoystickID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickNameForID
    """
    var cstring = get_sdl3_function_table().get_joystick_name_for_id(instance_id)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_joystick_path_for_id(instance_id: JoystickID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPathForID
    """
    var cstring = get_sdl3_function_table().get_joystick_path_for_id(instance_id)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_joystick_player_index_for_id(instance_id: JoystickID) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPlayerIndexForID
    """
    return get_sdl3_function_table().get_joystick_player_index_for_id(instance_id)


fn get_joystick_guid_for_id(instance_id: JoystickID) -> GUID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUIDForID
    """
    return get_sdl3_function_table().get_joystick_guid_for_id(instance_id)


fn get_joystick_vendor_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickVendorForID
    """
    return get_sdl3_function_table().get_joystick_vendor_for_id(instance_id)


fn get_joystick_product_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductForID
    """
    return get_sdl3_function_table().get_joystick_product_for_id(instance_id)


fn get_joystick_product_version_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductVersionForID
    """
    return get_sdl3_function_table().get_joystick_product_version_for_id(instance_id)


fn get_joystick_type_for_id(instance_id: JoystickID) -> JoystickType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickTypeForID
    """
    return get_sdl3_function_table().get_joystick_type_for_id(instance_id)


fn open_joystick(instance_id: JoystickID) raises -> Ptr[Joystick, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenJoystick
    """
    var result = get_sdl3_function_table().open_joystick(instance_id)
    if not result:
        raise get_error()
    return result


fn get_joystick_from_id(instance_id: JoystickID) raises -> Ptr[Joystick, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickFromID
    """
    var result = get_sdl3_function_table().get_joystick_from_id(instance_id)
    if not result:
        raise get_error()
    return result


fn get_joystick_from_player_index(player_index: Int32) raises -> Ptr[Joystick, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickFromPlayerIndex
    """
    var result = get_sdl3_function_table().get_joystick_from_player_index(player_index)
    if not result:
        raise get_error()
    return result


fn attach_virtual_joystick(desc: Ptr[VirtualJoystickDesc, ImmutAnyOrigin]) -> JoystickID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AttachVirtualJoystick
    """
    return get_sdl3_function_table().attach_virtual_joystick(desc)


fn detach_virtual_joystick(instance_id: JoystickID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DetachVirtualJoystick
    """
    var success = get_sdl3_function_table().detach_virtual_joystick(instance_id)
    if not success:
        raise get_error()


fn is_joystick_virtual(instance_id: JoystickID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsJoystickVirtual
    """
    return get_sdl3_function_table().is_joystick_virtual(instance_id)


fn set_joystick_virtual_axis(
    joystick: Ptr[Joystick, MutAnyOrigin], axis: Int32, value: Int16
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualAxis
    """
    var success = get_sdl3_function_table().set_joystick_virtual_axis(joystick, axis, value)
    if not success:
        raise get_error()


fn set_joystick_virtual_ball(
    joystick: Ptr[Joystick, MutAnyOrigin], ball: Int32, xrel: Int16, yrel: Int16
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualBall
    """
    var success = get_sdl3_function_table().set_joystick_virtual_ball(joystick, ball, xrel, yrel)
    if not success:
        raise get_error()


fn set_joystick_virtual_button(
    joystick: Ptr[Joystick, MutAnyOrigin], button: Int32, down: Bool
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualButton
    """
    var success = get_sdl3_function_table().set_joystick_virtual_button(joystick, button, down)
    if not success:
        raise get_error()


fn set_joystick_virtual_hat(
    joystick: Ptr[Joystick, MutAnyOrigin], hat: Int32, value: UInt8
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualHat
    """
    var success = get_sdl3_function_table().set_joystick_virtual_hat(joystick, hat, value)
    if not success:
        raise get_error()


fn set_joystick_virtual_touchpad(
    joystick: Ptr[Joystick, MutAnyOrigin],
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
    var success = get_sdl3_function_table().set_joystick_virtual_touchpad(
        joystick, touchpad, finger, down, x, y, pressure
    )
    if not success:
        raise get_error()


fn send_joystick_virtual_sensor_data(
    joystick: Ptr[Joystick, MutAnyOrigin],
    type: SensorType,
    sensor_timestamp: UInt64,
    data: Ptr[Float32, ImmutAnyOrigin],
    num_values: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SendJoystickVirtualSensorData
    """
    var success = get_sdl3_function_table().send_joystick_virtual_sensor_data(
        joystick, type, sensor_timestamp, data, num_values
    )
    if not success:
        raise get_error()


fn get_joystick_properties(joystick: Ptr[Joystick, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProperties
    """
    return get_sdl3_function_table().get_joystick_properties(joystick)


fn get_joystick_name(
    joystick: Ptr[Joystick, MutAnyOrigin]
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickName
    """
    var cstring = get_sdl3_function_table().get_joystick_name(joystick)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_joystick_path(
    joystick: Ptr[Joystick, MutAnyOrigin]
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPath
    """
    var cstring = get_sdl3_function_table().get_joystick_path(joystick)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_joystick_player_index(joystick: Ptr[Joystick, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPlayerIndex
    """
    return get_sdl3_function_table().get_joystick_player_index(joystick)


fn set_joystick_player_index(joystick: Ptr[Joystick, MutAnyOrigin], player_index: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickPlayerIndex
    """
    var success = get_sdl3_function_table().set_joystick_player_index(joystick, player_index)
    if not success:
        raise get_error()


fn get_joystick_guid(joystick: Ptr[Joystick, MutAnyOrigin]) -> GUID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUID
    """
    return get_sdl3_function_table().get_joystick_guid(joystick)


fn get_joystick_vendor(joystick: Ptr[Joystick, MutAnyOrigin]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickVendor
    """
    return get_sdl3_function_table().get_joystick_vendor(joystick)


fn get_joystick_product(joystick: Ptr[Joystick, MutAnyOrigin]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProduct
    """
    return get_sdl3_function_table().get_joystick_product(joystick)


fn get_joystick_product_version(joystick: Ptr[Joystick, MutAnyOrigin]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductVersion
    """
    return get_sdl3_function_table().get_joystick_product_version(joystick)


fn get_joystick_firmware_version(joystick: Ptr[Joystick, MutAnyOrigin]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickFirmwareVersion
    """
    return get_sdl3_function_table().get_joystick_firmware_version(joystick)


fn get_joystick_serial(
    joystick: Ptr[Joystick, MutAnyOrigin]
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickSerial
    """
    var cstring = get_sdl3_function_table().get_joystick_serial(joystick)
    if not cstring:
        raise "Error in get_joystick_serial call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_joystick_type(joystick: Ptr[Joystick, MutAnyOrigin]) -> JoystickType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickType
    """
    return get_sdl3_function_table().get_joystick_type(joystick)


fn get_joystick_guid_info(
    guid: GUID,
    vendor: Ptr[UInt16, MutAnyOrigin],
    product: Ptr[UInt16, MutAnyOrigin],
    version: Ptr[UInt16, MutAnyOrigin],
    crc16: Ptr[UInt16, MutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUIDInfo
    """
    get_sdl3_function_table().get_joystick_guid_info(guid, vendor, product, version, crc16)


fn joystick_connected(joystick: Ptr[Joystick, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoystickConnected
    """
    return get_sdl3_function_table().joystick_connected(joystick)


fn get_joystick_id(joystick: Ptr[Joystick, MutAnyOrigin]) -> JoystickID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickID
    """
    return get_sdl3_function_table().get_joystick_id(joystick)


fn get_num_joystick_axes(joystick: Ptr[Joystick, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickAxes
    """
    return get_sdl3_function_table().get_num_joystick_axes(joystick)


fn get_num_joystick_balls(joystick: Ptr[Joystick, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickBalls
    """
    return get_sdl3_function_table().get_num_joystick_balls(joystick)


fn get_num_joystick_hats(joystick: Ptr[Joystick, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickHats
    """
    return get_sdl3_function_table().get_num_joystick_hats(joystick)


fn get_num_joystick_buttons(joystick: Ptr[Joystick, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickButtons
    """
    return get_sdl3_function_table().get_num_joystick_buttons(joystick)


fn set_joystick_events_enabled(enabled: Bool):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickEventsEnabled
    """
    get_sdl3_function_table().set_joystick_events_enabled(enabled)


fn joystick_events_enabled() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoystickEventsEnabled
    """
    return get_sdl3_function_table().joystick_events_enabled()


fn update_joysticks():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateJoysticks
    """
    get_sdl3_function_table().update_joysticks()


fn get_joystick_axis(joystick: Ptr[Joystick, MutAnyOrigin], axis: Int32) -> Int16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickAxis
    """
    return get_sdl3_function_table().get_joystick_axis(joystick, axis)


fn get_joystick_axis_initial_state(
    joystick: Ptr[Joystick, MutAnyOrigin], axis: Int32, state: Ptr[Int16, MutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickAxisInitialState
    """
    return get_sdl3_function_table().get_joystick_axis_initial_state(joystick, axis, state)


fn get_joystick_ball(
    joystick: Ptr[Joystick, MutAnyOrigin],
    ball: Int32,
    dx: Ptr[Int32, MutAnyOrigin],
    dy: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickBall
    """
    var success = get_sdl3_function_table().get_joystick_ball(joystick, ball, dx, dy)
    if not success:
        raise get_error()


fn get_joystick_hat(joystick: Ptr[Joystick, MutAnyOrigin], hat: Int32) -> UInt8:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickHat
    """
    return get_sdl3_function_table().get_joystick_hat(joystick, hat)


fn get_joystick_button(joystick: Ptr[Joystick, MutAnyOrigin], button: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickButton
    """
    return get_sdl3_function_table().get_joystick_button(joystick, button)


fn rumble_joystick(
    joystick: Ptr[Joystick, MutAnyOrigin],
    low_frequency_rumble: UInt16,
    high_frequency_rumble: UInt16,
    duration_ms: UInt32,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RumbleJoystick
    """
    return get_sdl3_function_table().rumble_joystick(
        joystick, low_frequency_rumble, high_frequency_rumble, duration_ms
    )


fn rumble_joystick_triggers(
    joystick: Ptr[Joystick, MutAnyOrigin],
    left_rumble: UInt16,
    right_rumble: UInt16,
    duration_ms: UInt32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RumbleJoystickTriggers
    """
    var success = get_sdl3_function_table().rumble_joystick_triggers(
        joystick, left_rumble, right_rumble, duration_ms
    )
    if not success:
        raise get_error()


fn set_joystick_led(
    joystick: Ptr[Joystick, MutAnyOrigin], red: UInt8, green: UInt8, blue: UInt8
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickLED
    """
    var success = get_sdl3_function_table().set_joystick_led(joystick, red, green, blue)
    if not success:
        raise get_error()


fn send_joystick_effect(
    joystick: Ptr[Joystick, MutAnyOrigin], data: Ptr[NoneType, ImmutAnyOrigin], size: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SendJoystickEffect
    """
    var success = get_sdl3_function_table().send_joystick_effect(joystick, data, size)
    if not success:
        raise get_error()


fn close_joystick(joystick: Ptr[Joystick, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseJoystick
    """
    get_sdl3_function_table().close_joystick(joystick)


fn get_joystick_connection_state(joystick: Ptr[Joystick, MutAnyOrigin]) -> JoystickConnectionState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickConnectionState
    """
    return get_sdl3_function_table().get_joystick_connection_state(joystick)


fn get_joystick_power_info(
    joystick: Ptr[Joystick, MutAnyOrigin], percent: Ptr[Int32, MutAnyOrigin]
) -> PowerState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPowerInfo
    """
    return get_sdl3_function_table().get_joystick_power_info(joystick, percent)


fn has_keyboard() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasKeyboard
    """
    return get_sdl3_function_table().has_keyboard()


fn get_keyboards(count: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[KeyboardID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyboards
    """
    var result = get_sdl3_function_table().get_keyboards(count)
    if not result:
        raise get_error()
    return result


fn get_keyboard_name_for_id(instance_id: KeyboardID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyboardNameForID
    """
    var cstring = get_sdl3_function_table().get_keyboard_name_for_id(instance_id)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_keyboard_focus() -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyboardFocus
    """
    return get_sdl3_function_table().get_keyboard_focus()


fn get_keyboard_state(numkeys: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[Bool, ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyboardState
    """
    var result = get_sdl3_function_table().get_keyboard_state(numkeys)
    if not result:
        raise "Error in get_keyboard_state call. See official documentation for details."
    return result


fn reset_keyboard():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResetKeyboard
    """
    get_sdl3_function_table().reset_keyboard()


fn get_mod_state() -> Keymod:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetModState
    """
    return get_sdl3_function_table().get_mod_state()


fn set_mod_state(modstate: Keymod):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetModState
    """
    get_sdl3_function_table().set_mod_state(modstate)


fn get_key_from_scancode(scancode: Scancode, modstate: Keymod, key_event: Bool) -> Keycode:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyFromScancode
    """
    return get_sdl3_function_table().get_key_from_scancode(scancode, modstate, key_event)


fn get_scancode_from_key(key: Keycode, modstate: Ptr[Keymod, MutAnyOrigin]) -> Scancode:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetScancodeFromKey
    """
    return get_sdl3_function_table().get_scancode_from_key(key, modstate)


fn set_scancode_name(scancode: Scancode, name: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetScancodeName
    """
    var success = get_sdl3_function_table().set_scancode_name(scancode, name.unsafe_ptr())
    if not success:
        raise get_error()


fn get_scancode_name(scancode: Scancode) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetScancodeName
    """
    var cstring = get_sdl3_function_table().get_scancode_name(scancode)
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_scancode_from_name(name: CStringSlice) -> Scancode:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetScancodeFromName
    """
    return get_sdl3_function_table().get_scancode_from_name(name.unsafe_ptr())


fn get_key_name(key: Keycode) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyName
    """
    var cstring = get_sdl3_function_table().get_key_name(key)
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_key_from_name(name: CStringSlice) -> Keycode:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyFromName
    """
    return get_sdl3_function_table().get_key_from_name(name.unsafe_ptr())


fn start_text_input(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StartTextInput
    """
    var success = get_sdl3_function_table().start_text_input(window)
    if not success:
        raise get_error()


fn start_text_input_with_properties(window: Ptr[Window, MutAnyOrigin], props: PropertiesID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StartTextInputWithProperties
    """
    var success = get_sdl3_function_table().start_text_input_with_properties(window, props)
    if not success:
        raise get_error()


fn text_input_active(window: Ptr[Window, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TextInputActive
    """
    return get_sdl3_function_table().text_input_active(window)


fn stop_text_input(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StopTextInput
    """
    var success = get_sdl3_function_table().stop_text_input(window)
    if not success:
        raise get_error()


fn clear_composition(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearComposition
    """
    var success = get_sdl3_function_table().clear_composition(window)
    if not success:
        raise get_error()


fn set_text_input_area(
    window: Ptr[Window, MutAnyOrigin], rect: Ptr[Rect, ImmutAnyOrigin], cursor: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextInputArea
    """
    var success = get_sdl3_function_table().set_text_input_area(window, rect, cursor)
    if not success:
        raise get_error()


fn get_text_input_area(
    window: Ptr[Window, MutAnyOrigin],
    rect: Ptr[Rect, MutAnyOrigin],
    cursor: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextInputArea
    """
    var success = get_sdl3_function_table().get_text_input_area(window, rect, cursor)
    if not success:
        raise get_error()


fn has_screen_keyboard_support() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasScreenKeyboardSupport
    """
    return get_sdl3_function_table().has_screen_keyboard_support()


fn screen_keyboard_shown(window: Ptr[Window, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ScreenKeyboardShown
    """
    return get_sdl3_function_table().screen_keyboard_shown(window)


fn set_log_priorities(priority: LogPriority):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetLogPriorities
    """
    get_sdl3_function_table().set_log_priorities(priority)


fn set_log_priority(category: Int32, priority: LogPriority):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetLogPriority
    """
    get_sdl3_function_table().set_log_priority(category, priority)


fn get_log_priority(category: Int32) -> LogPriority:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetLogPriority
    """
    return get_sdl3_function_table().get_log_priority(category)


fn reset_log_priorities():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResetLogPriorities
    """
    get_sdl3_function_table().reset_log_priorities()


fn set_log_priority_prefix(priority: LogPriority, prefix: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetLogPriorityPrefix
    """
    var success = get_sdl3_function_table().set_log_priority_prefix(priority, prefix.unsafe_ptr())
    if not success:
        raise get_error()


fn log(fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Log
    """
    get_sdl3_function_table().log(fmt.unsafe_ptr())


fn log_trace(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogTrace
    """
    get_sdl3_function_table().log_trace(category, fmt.unsafe_ptr())


fn log_verbose(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogVerbose
    """
    get_sdl3_function_table().log_verbose(category, fmt.unsafe_ptr())


fn log_debug(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogDebug
    """
    get_sdl3_function_table().log_debug(category, fmt.unsafe_ptr())


fn log_info(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogInfo
    """
    get_sdl3_function_table().log_info(category, fmt.unsafe_ptr())


fn log_warn(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogWarn
    """
    get_sdl3_function_table().log_warn(category, fmt.unsafe_ptr())


fn log_error(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogError
    """
    get_sdl3_function_table().log_error(category, fmt.unsafe_ptr())


fn log_critical(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogCritical
    """
    get_sdl3_function_table().log_critical(category, fmt.unsafe_ptr())


fn log_message(category: Int32, priority: LogPriority, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogMessage
    """
    get_sdl3_function_table().log_message(category, priority, fmt.unsafe_ptr())


fn log_message_v(category: Int32, priority: LogPriority, fmt: CStringSlice, ap: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogMessageV
    """
    get_sdl3_function_table().log_message_v(category, priority, fmt.unsafe_ptr(), ap)


fn get_default_log_output_function() -> LogOutputFunction:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDefaultLogOutputFunction
    """
    return get_sdl3_function_table().get_default_log_output_function()


fn get_log_output_function(
    callback: Ptr[LogOutputFunction, MutAnyOrigin],
    userdata: Ptr[Ptr[NoneType, MutOrigin.external], MutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetLogOutputFunction
    """
    get_sdl3_function_table().get_log_output_function(callback, userdata)


fn set_log_output_function(callback: LogOutputFunction, userdata: Ptr[NoneType, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetLogOutputFunction
    """
    get_sdl3_function_table().set_log_output_function(callback, userdata)


fn has_mouse() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasMouse
    """
    return get_sdl3_function_table().has_mouse()


fn get_mice(count: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[MouseID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMice
    """
    var result = get_sdl3_function_table().get_mice(count)
    if not result:
        raise get_error()
    return result


fn get_mouse_name_for_id(instance_id: MouseID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMouseNameForID
    """
    var cstring = get_sdl3_function_table().get_mouse_name_for_id(instance_id)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_mouse_focus() -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMouseFocus
    """
    return get_sdl3_function_table().get_mouse_focus()


fn get_mouse_state(
    x: Ptr[Float32, MutAnyOrigin], y: Ptr[Float32, MutAnyOrigin]
) -> MouseButtonFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMouseState
    """
    return get_sdl3_function_table().get_mouse_state(x, y)


fn get_global_mouse_state(
    x: Ptr[Float32, MutAnyOrigin], y: Ptr[Float32, MutAnyOrigin]
) -> MouseButtonFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGlobalMouseState
    """
    return get_sdl3_function_table().get_global_mouse_state(x, y)


fn get_relative_mouse_state(
    x: Ptr[Float32, MutAnyOrigin], y: Ptr[Float32, MutAnyOrigin]
) -> MouseButtonFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRelativeMouseState
    """
    return get_sdl3_function_table().get_relative_mouse_state(x, y)


fn warp_mouse_in_window(window: Ptr[Window, MutAnyOrigin], x: Float32, y: Float32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WarpMouseInWindow
    """
    get_sdl3_function_table().warp_mouse_in_window(window, x, y)


fn warp_mouse_global(x: Float32, y: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WarpMouseGlobal
    """
    var success = get_sdl3_function_table().warp_mouse_global(x, y)
    if not success:
        raise get_error()


fn set_window_relative_mouse_mode(window: Ptr[Window, MutAnyOrigin], enabled: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowRelativeMouseMode
    """
    var success = get_sdl3_function_table().set_window_relative_mouse_mode(window, enabled)
    if not success:
        raise get_error()


fn get_window_relative_mouse_mode(window: Ptr[Window, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowRelativeMouseMode
    """
    return get_sdl3_function_table().get_window_relative_mouse_mode(window)


fn capture_mouse(enabled: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CaptureMouse
    """
    var success = get_sdl3_function_table().capture_mouse(enabled)
    if not success:
        raise get_error()


fn create_cursor(
    data: Ptr[UInt8, ImmutAnyOrigin],
    mask: Ptr[UInt8, ImmutAnyOrigin],
    w: Int32,
    h: Int32,
    hot_x: Int32,
    hot_y: Int32,
) raises -> Ptr[Cursor, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateCursor
    """
    var result = get_sdl3_function_table().create_cursor(data, mask, w, h, hot_x, hot_y)
    if not result:
        raise get_error()
    return result


fn create_color_cursor(
    surface: Ptr[Surface, MutAnyOrigin], hot_x: Int32, hot_y: Int32
) raises -> Ptr[Cursor, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateColorCursor
    """
    var result = get_sdl3_function_table().create_color_cursor(surface, hot_x, hot_y)
    if not result:
        raise get_error()
    return result


fn create_system_cursor(id: SystemCursor) raises -> Ptr[Cursor, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSystemCursor
    """
    var result = get_sdl3_function_table().create_system_cursor(id)
    if not result:
        raise get_error()
    return result


fn set_cursor(cursor: Ptr[Cursor, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetCursor
    """
    var success = get_sdl3_function_table().set_cursor(cursor)
    if not success:
        raise get_error()


fn get_cursor() raises -> Ptr[Cursor, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCursor
    """
    var result = get_sdl3_function_table().get_cursor()
    if not result:
        raise "Error in get_cursor call. See official documentation for details."
    return result


fn get_default_cursor() raises -> Ptr[Cursor, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDefaultCursor
    """
    var result = get_sdl3_function_table().get_default_cursor()
    if not result:
        raise get_error()
    return result


fn destroy_cursor(cursor: Ptr[Cursor, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyCursor
    """
    get_sdl3_function_table().destroy_cursor(cursor)


fn show_cursor() raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ShowCursor
    """
    var success = get_sdl3_function_table().show_cursor()
    if not success:
        raise get_error()


fn hide_cursor() raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HideCursor
    """
    var success = get_sdl3_function_table().hide_cursor()
    if not success:
        raise get_error()


fn cursor_visible() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CursorVisible
    """
    return get_sdl3_function_table().cursor_visible()


fn get_pixel_format_name(format: PixelFormat) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatName
    """
    var cstring = get_sdl3_function_table().get_pixel_format_name(format)
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_masks_for_pixel_format(
    format: PixelFormat,
    bpp: Ptr[Int32, MutAnyOrigin],
    Rmask: Ptr[UInt32, MutAnyOrigin],
    Gmask: Ptr[UInt32, MutAnyOrigin],
    Bmask: Ptr[UInt32, MutAnyOrigin],
    Amask: Ptr[UInt32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMasksForPixelFormat
    """
    var success = get_sdl3_function_table().get_masks_for_pixel_format(
        format, bpp, Rmask, Gmask, Bmask, Amask
    )
    if not success:
        raise get_error()


fn get_pixel_format_for_masks(
    bpp: Int32, Rmask: UInt32, Gmask: UInt32, Bmask: UInt32, Amask: UInt32
) -> PixelFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatForMasks
    """
    return get_sdl3_function_table().get_pixel_format_for_masks(bpp, Rmask, Gmask, Bmask, Amask)


fn get_pixel_format_details(
    format: PixelFormat
) raises -> Ptr[PixelFormatDetails, ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatDetails
    """
    var result = get_sdl3_function_table().get_pixel_format_details(format)
    if not result:
        raise get_error()
    return result


fn create_palette(ncolors: Int32) raises -> Ptr[Palette, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreatePalette
    """
    var result = get_sdl3_function_table().create_palette(ncolors)
    if not result:
        raise get_error()
    return result


fn set_palette_colors(
    palette: Ptr[Palette, MutAnyOrigin],
    colors: Ptr[Color, ImmutAnyOrigin],
    firstcolor: Int32,
    ncolors: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetPaletteColors
    """
    var success = get_sdl3_function_table().set_palette_colors(
        palette, colors, firstcolor, ncolors
    )
    if not success:
        raise get_error()


fn destroy_palette(palette: Ptr[Palette, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyPalette
    """
    get_sdl3_function_table().destroy_palette(palette)


fn map_rgb(
    format: Ptr[PixelFormatDetails, ImmutAnyOrigin],
    palette: Ptr[Palette, ImmutAnyOrigin],
    r: UInt8,
    g: UInt8,
    b: UInt8,
) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapRGB
    """
    return get_sdl3_function_table().map_rgb(format, palette, r, g, b)


fn map_rgba(
    format: Ptr[PixelFormatDetails, ImmutAnyOrigin],
    palette: Ptr[Palette, ImmutAnyOrigin],
    r: UInt8,
    g: UInt8,
    b: UInt8,
    a: UInt8,
) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapRGBA
    """
    return get_sdl3_function_table().map_rgba(format, palette, r, g, b, a)


fn get_rgb(
    pixel: UInt32,
    format: Ptr[PixelFormatDetails, ImmutAnyOrigin],
    palette: Ptr[Palette, ImmutAnyOrigin],
    r: Ptr[UInt8, MutAnyOrigin],
    g: Ptr[UInt8, MutAnyOrigin],
    b: Ptr[UInt8, MutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRGB
    """
    get_sdl3_function_table().get_rgb(pixel, format, palette, r, g, b)


fn get_rgba(
    pixel: UInt32,
    format: Ptr[PixelFormatDetails, ImmutAnyOrigin],
    palette: Ptr[Palette, ImmutAnyOrigin],
    r: Ptr[UInt8, MutAnyOrigin],
    g: Ptr[UInt8, MutAnyOrigin],
    b: Ptr[UInt8, MutAnyOrigin],
    a: Ptr[UInt8, MutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRGBA
    """
    get_sdl3_function_table().get_rgba(pixel, format, palette, r, g, b, a)


fn get_power_info(
    seconds: Ptr[Int32, MutAnyOrigin], percent: Ptr[Int32, MutAnyOrigin]
) -> PowerState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPowerInfo
    """
    return get_sdl3_function_table().get_power_info(seconds, percent)


fn get_global_properties() -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGlobalProperties
    """
    return get_sdl3_function_table().get_global_properties()


fn create_properties() -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateProperties
    """
    return get_sdl3_function_table().create_properties()


fn copy_properties(src: PropertiesID, dst: PropertiesID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CopyProperties
    """
    var success = get_sdl3_function_table().copy_properties(src, dst)
    if not success:
        raise get_error()


fn lock_properties(props: PropertiesID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockProperties
    """
    var success = get_sdl3_function_table().lock_properties(props)
    if not success:
        raise get_error()


fn unlock_properties(props: PropertiesID):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnlockProperties
    """
    get_sdl3_function_table().unlock_properties(props)


fn set_pointer_property_with_cleanup(
    props: PropertiesID,
    name: CStringSlice,
    value: Ptr[NoneType, MutAnyOrigin],
    cleanup: CleanupPropertyCallback,
    userdata: Ptr[NoneType, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetPointerPropertyWithCleanup
    """
    var success = get_sdl3_function_table().set_pointer_property_with_cleanup(
        props, name.unsafe_ptr(), value, cleanup, userdata
    )
    if not success:
        raise get_error()


fn set_pointer_property(
    props: PropertiesID, name: CStringSlice, value: Ptr[NoneType, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetPointerProperty
    """
    var success = get_sdl3_function_table().set_pointer_property(props, name.unsafe_ptr(), value)
    if not success:
        raise get_error()


fn set_string_property(props: PropertiesID, name: CStringSlice, value: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetStringProperty
    """
    var success = get_sdl3_function_table().set_string_property(
        props, name.unsafe_ptr(), value.unsafe_ptr()
    )
    if not success:
        raise get_error()


fn set_number_property(props: PropertiesID, name: CStringSlice, value: Int64) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetNumberProperty
    """
    var success = get_sdl3_function_table().set_number_property(props, name.unsafe_ptr(), value)
    if not success:
        raise get_error()


fn set_float_property(props: PropertiesID, name: CStringSlice, value: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetFloatProperty
    """
    var success = get_sdl3_function_table().set_float_property(props, name.unsafe_ptr(), value)
    if not success:
        raise get_error()


fn set_boolean_property(props: PropertiesID, name: CStringSlice, value: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetBooleanProperty
    """
    var success = get_sdl3_function_table().set_boolean_property(props, name.unsafe_ptr(), value)
    if not success:
        raise get_error()


fn has_property(props: PropertiesID, name: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasProperty
    """
    return get_sdl3_function_table().has_property(props, name.unsafe_ptr())


fn get_property_type(props: PropertiesID, name: CStringSlice) -> PropertyType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPropertyType
    """
    return get_sdl3_function_table().get_property_type(props, name.unsafe_ptr())


fn get_pointer_property(
    props: PropertiesID, name: CStringSlice, default_value: Ptr[NoneType, MutAnyOrigin]
) -> Ptr[NoneType, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPointerProperty
    """
    return get_sdl3_function_table().get_pointer_property(props, name.unsafe_ptr(), default_value)


fn get_string_property(
    props: PropertiesID, name: CStringSlice, default_value: CStringSlice
) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetStringProperty
    """
    var cstring = get_sdl3_function_table().get_string_property(
        props, name.unsafe_ptr(), default_value.unsafe_ptr()
    )
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_number_property(props: PropertiesID, name: CStringSlice, default_value: Int64) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumberProperty
    """
    return get_sdl3_function_table().get_number_property(props, name.unsafe_ptr(), default_value)


fn get_float_property(props: PropertiesID, name: CStringSlice, default_value: Float32) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetFloatProperty
    """
    return get_sdl3_function_table().get_float_property(props, name.unsafe_ptr(), default_value)


fn get_boolean_property(props: PropertiesID, name: CStringSlice, default_value: Bool) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetBooleanProperty
    """
    return get_sdl3_function_table().get_boolean_property(props, name.unsafe_ptr(), default_value)


fn clear_property(props: PropertiesID, name: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearProperty
    """
    var success = get_sdl3_function_table().clear_property(props, name.unsafe_ptr())
    if not success:
        raise get_error()


fn enumerate_properties(
    props: PropertiesID,
    callback: EnumeratePropertiesCallback,
    userdata: Ptr[NoneType, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EnumerateProperties
    """
    var success = get_sdl3_function_table().enumerate_properties(props, callback, userdata)
    if not success:
        raise get_error()


fn destroy_properties(props: PropertiesID):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyProperties
    """
    get_sdl3_function_table().destroy_properties(props)


fn has_rect_intersection(A: Ptr[Rect, ImmutAnyOrigin], B: Ptr[Rect, ImmutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasRectIntersection
    """
    return get_sdl3_function_table().has_rect_intersection(A, B)


fn get_rect_intersection(
    A: Ptr[Rect, ImmutAnyOrigin], B: Ptr[Rect, ImmutAnyOrigin], result: Ptr[Rect, MutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectIntersection
    """
    return get_sdl3_function_table().get_rect_intersection(A, B, result)


fn get_rect_union(
    A: Ptr[Rect, ImmutAnyOrigin], B: Ptr[Rect, ImmutAnyOrigin], result: Ptr[Rect, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectUnion
    """
    var success = get_sdl3_function_table().get_rect_union(A, B, result)
    if not success:
        raise get_error()


fn get_rect_enclosing_points(
    points: Ptr[Point, ImmutAnyOrigin],
    count: Int32,
    clip: Ptr[Rect, ImmutAnyOrigin],
    result: Ptr[Rect, MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPoints
    """
    return get_sdl3_function_table().get_rect_enclosing_points(points, count, clip, result)


fn get_rect_and_line_intersection(
    rect: Ptr[Rect, ImmutAnyOrigin],
    X1: Ptr[Int32, MutAnyOrigin],
    Y1: Ptr[Int32, MutAnyOrigin],
    X2: Ptr[Int32, MutAnyOrigin],
    Y2: Ptr[Int32, MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersection
    """
    return get_sdl3_function_table().get_rect_and_line_intersection(rect, X1, Y1, X2, Y2)


fn has_rect_intersection_float(
    A: Ptr[FRect, ImmutAnyOrigin], B: Ptr[FRect, ImmutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasRectIntersectionFloat
    """
    return get_sdl3_function_table().has_rect_intersection_float(A, B)


fn get_rect_intersection_float(
    A: Ptr[FRect, ImmutAnyOrigin], B: Ptr[FRect, ImmutAnyOrigin], result: Ptr[FRect, MutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectIntersectionFloat
    """
    return get_sdl3_function_table().get_rect_intersection_float(A, B, result)


fn get_rect_union_float(
    A: Ptr[FRect, ImmutAnyOrigin], B: Ptr[FRect, ImmutAnyOrigin], result: Ptr[FRect, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectUnionFloat
    """
    var success = get_sdl3_function_table().get_rect_union_float(A, B, result)
    if not success:
        raise get_error()


fn get_rect_enclosing_points_float(
    points: Ptr[FPoint, ImmutAnyOrigin],
    count: Int32,
    clip: Ptr[FRect, ImmutAnyOrigin],
    result: Ptr[FRect, MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPointsFloat
    """
    return get_sdl3_function_table().get_rect_enclosing_points_float(points, count, clip, result)


fn get_rect_and_line_intersection_float(
    rect: Ptr[FRect, ImmutAnyOrigin],
    X1: Ptr[Float32, MutAnyOrigin],
    Y1: Ptr[Float32, MutAnyOrigin],
    X2: Ptr[Float32, MutAnyOrigin],
    Y2: Ptr[Float32, MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersectionFloat
    """
    return get_sdl3_function_table().get_rect_and_line_intersection_float(rect, X1, Y1, X2, Y2)


fn get_num_render_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumRenderDrivers
    """
    return get_sdl3_function_table().get_num_render_drivers()


fn get_render_driver(index: Int32) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderDriver
    """
    var cstring = get_sdl3_function_table().get_render_driver(index)
    if not cstring:
        raise "Error in get_render_driver call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn create_window_and_renderer(
    title: CStringSlice,
    width: Int32,
    height: Int32,
    window_flags: WindowFlags,
    window: Ptr[Ptr[Window, MutOrigin.external], MutAnyOrigin],
    renderer: Ptr[Ptr[Renderer, MutOrigin.external], MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateWindowAndRenderer
    """
    var success = get_sdl3_function_table().create_window_and_renderer(
        title.unsafe_ptr(), width, height, window_flags, window, renderer
    )
    if not success:
        raise get_error()


fn create_renderer(
    window: Ptr[Window, MutAnyOrigin], name: CStringSlice
) raises -> Ptr[Renderer, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateRenderer
    """
    var result = get_sdl3_function_table().create_renderer(window, name.unsafe_ptr())
    if not result:
        raise get_error()
    return result


fn create_renderer_with_properties(
    props: PropertiesID
) raises -> Ptr[Renderer, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateRendererWithProperties
    """
    var result = get_sdl3_function_table().create_renderer_with_properties(props)
    if not result:
        raise get_error()
    return result


fn create_software_renderer(
    surface: Ptr[Surface, MutAnyOrigin]
) raises -> Ptr[Renderer, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSoftwareRenderer
    """
    var result = get_sdl3_function_table().create_software_renderer(surface)
    if not result:
        raise get_error()
    return result


fn get_renderer(window: Ptr[Window, MutAnyOrigin]) raises -> Ptr[Renderer, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderer
    """
    var result = get_sdl3_function_table().get_renderer(window)
    if not result:
        raise get_error()
    return result


fn get_render_window(
    renderer: Ptr[Renderer, MutAnyOrigin]
) raises -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderWindow
    """
    var result = get_sdl3_function_table().get_render_window(renderer)
    if not result:
        raise get_error()
    return result


fn get_renderer_name(
    renderer: Ptr[Renderer, MutAnyOrigin]
) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRendererName
    """
    var cstring = get_sdl3_function_table().get_renderer_name(renderer)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_renderer_properties(renderer: Ptr[Renderer, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRendererProperties
    """
    return get_sdl3_function_table().get_renderer_properties(renderer)


fn get_render_output_size(
    renderer: Ptr[Renderer, MutAnyOrigin], w: Ptr[Int32, MutAnyOrigin], h: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderOutputSize
    """
    var success = get_sdl3_function_table().get_render_output_size(renderer, w, h)
    if not success:
        raise get_error()


fn get_current_render_output_size(
    renderer: Ptr[Renderer, MutAnyOrigin], w: Ptr[Int32, MutAnyOrigin], h: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentRenderOutputSize
    """
    var success = get_sdl3_function_table().get_current_render_output_size(renderer, w, h)
    if not success:
        raise get_error()


fn create_texture(
    renderer: Ptr[Renderer, MutAnyOrigin],
    format: PixelFormat,
    access: TextureAccess,
    w: Int32,
    h: Int32,
) raises -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateTexture
    """
    var result = get_sdl3_function_table().create_texture(renderer, format, access, w, h)
    if not result:
        raise get_error()
    return result


fn create_texture_from_surface(
    renderer: Ptr[Renderer, MutAnyOrigin], surface: Ptr[Surface, MutAnyOrigin]
) raises -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateTextureFromSurface
    """
    var result = get_sdl3_function_table().create_texture_from_surface(renderer, surface)
    if not result:
        raise get_error()
    return result


fn create_texture_with_properties(
    renderer: Ptr[Renderer, MutAnyOrigin], props: PropertiesID
) raises -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateTextureWithProperties
    """
    var result = get_sdl3_function_table().create_texture_with_properties(renderer, props)
    if not result:
        raise get_error()
    return result


fn get_texture_properties(texture: Ptr[Texture, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureProperties
    """
    return get_sdl3_function_table().get_texture_properties(texture)


fn get_renderer_from_texture(
    texture: Ptr[Texture, MutAnyOrigin]
) raises -> Ptr[Renderer, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRendererFromTexture
    """
    var result = get_sdl3_function_table().get_renderer_from_texture(texture)
    if not result:
        raise get_error()
    return result


fn get_texture_size(
    texture: Ptr[Texture, MutAnyOrigin],
    w: Ptr[Float32, MutAnyOrigin],
    h: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureSize
    """
    var success = get_sdl3_function_table().get_texture_size(texture, w, h)
    if not success:
        raise get_error()


fn set_texture_color_mod(texture: Ptr[Texture, MutAnyOrigin], r: UInt8, g: UInt8, b: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureColorMod
    """
    var success = get_sdl3_function_table().set_texture_color_mod(texture, r, g, b)
    if not success:
        raise get_error()


fn set_texture_color_mod_float(
    texture: Ptr[Texture, MutAnyOrigin], r: Float32, g: Float32, b: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureColorModFloat
    """
    var success = get_sdl3_function_table().set_texture_color_mod_float(texture, r, g, b)
    if not success:
        raise get_error()


fn get_texture_color_mod(
    texture: Ptr[Texture, MutAnyOrigin],
    r: Ptr[UInt8, MutAnyOrigin],
    g: Ptr[UInt8, MutAnyOrigin],
    b: Ptr[UInt8, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureColorMod
    """
    var success = get_sdl3_function_table().get_texture_color_mod(texture, r, g, b)
    if not success:
        raise get_error()


fn get_texture_color_mod_float(
    texture: Ptr[Texture, MutAnyOrigin],
    r: Ptr[Float32, MutAnyOrigin],
    g: Ptr[Float32, MutAnyOrigin],
    b: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureColorModFloat
    """
    var success = get_sdl3_function_table().get_texture_color_mod_float(texture, r, g, b)
    if not success:
        raise get_error()


fn set_texture_alpha_mod(texture: Ptr[Texture, MutAnyOrigin], alpha: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureAlphaMod
    """
    var success = get_sdl3_function_table().set_texture_alpha_mod(texture, alpha)
    if not success:
        raise get_error()


fn set_texture_alpha_mod_float(texture: Ptr[Texture, MutAnyOrigin], alpha: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureAlphaModFloat
    """
    var success = get_sdl3_function_table().set_texture_alpha_mod_float(texture, alpha)
    if not success:
        raise get_error()


fn get_texture_alpha_mod(
    texture: Ptr[Texture, MutAnyOrigin], alpha: Ptr[UInt8, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaMod
    """
    var success = get_sdl3_function_table().get_texture_alpha_mod(texture, alpha)
    if not success:
        raise get_error()


fn get_texture_alpha_mod_float(
    texture: Ptr[Texture, MutAnyOrigin], alpha: Ptr[Float32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaModFloat
    """
    var success = get_sdl3_function_table().get_texture_alpha_mod_float(texture, alpha)
    if not success:
        raise get_error()


fn set_texture_blend_mode(texture: Ptr[Texture, MutAnyOrigin], blendMode: BlendMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureBlendMode
    """
    var success = get_sdl3_function_table().set_texture_blend_mode(texture, blendMode)
    if not success:
        raise get_error()


fn get_texture_blend_mode(
    texture: Ptr[Texture, MutAnyOrigin], blendMode: Ptr[BlendMode, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureBlendMode
    """
    var success = get_sdl3_function_table().get_texture_blend_mode(texture, blendMode)
    if not success:
        raise get_error()


fn set_texture_scale_mode(texture: Ptr[Texture, MutAnyOrigin], scaleMode: ScaleMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureScaleMode
    """
    var success = get_sdl3_function_table().set_texture_scale_mode(texture, scaleMode)
    if not success:
        raise get_error()


fn get_texture_scale_mode(
    texture: Ptr[Texture, MutAnyOrigin], scaleMode: Ptr[ScaleMode, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureScaleMode
    """
    var success = get_sdl3_function_table().get_texture_scale_mode(texture, scaleMode)
    if not success:
        raise get_error()


fn update_texture(
    texture: Ptr[Texture, MutAnyOrigin],
    rect: Ptr[Rect, ImmutAnyOrigin],
    pixels: Ptr[NoneType, ImmutAnyOrigin],
    pitch: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateTexture
    """
    var success = get_sdl3_function_table().update_texture(texture, rect, pixels, pitch)
    if not success:
        raise get_error()


fn update_yuv_texture(
    texture: Ptr[Texture, MutAnyOrigin],
    rect: Ptr[Rect, ImmutAnyOrigin],
    Yplane: Ptr[UInt8, ImmutAnyOrigin],
    Ypitch: Int32,
    Uplane: Ptr[UInt8, ImmutAnyOrigin],
    Upitch: Int32,
    Vplane: Ptr[UInt8, ImmutAnyOrigin],
    Vpitch: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateYUVTexture
    """
    var success = get_sdl3_function_table().update_yuv_texture(
        texture, rect, Yplane, Ypitch, Uplane, Upitch, Vplane, Vpitch
    )
    if not success:
        raise get_error()


fn update_nv_texture(
    texture: Ptr[Texture, MutAnyOrigin],
    rect: Ptr[Rect, ImmutAnyOrigin],
    Yplane: Ptr[UInt8, ImmutAnyOrigin],
    Ypitch: Int32,
    UVplane: Ptr[UInt8, ImmutAnyOrigin],
    UVpitch: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateNVTexture
    """
    var success = get_sdl3_function_table().update_nv_texture(
        texture, rect, Yplane, Ypitch, UVplane, UVpitch
    )
    if not success:
        raise get_error()


fn lock_texture(
    texture: Ptr[Texture, MutAnyOrigin],
    rect: Ptr[Rect, ImmutAnyOrigin],
    pixels: Ptr[Ptr[NoneType, MutOrigin.external], MutAnyOrigin],
    pitch: Ptr[Int32, MutAnyOrigin],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockTexture
    """
    return get_sdl3_function_table().lock_texture(texture, rect, pixels, pitch)


fn lock_texture_to_surface(
    texture: Ptr[Texture, MutAnyOrigin],
    rect: Ptr[Rect, ImmutAnyOrigin],
    surface: Ptr[Ptr[Surface, MutOrigin.external], MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockTextureToSurface
    """
    var success = get_sdl3_function_table().lock_texture_to_surface(texture, rect, surface)
    if not success:
        raise get_error()


fn unlock_texture(texture: Ptr[Texture, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnlockTexture
    """
    get_sdl3_function_table().unlock_texture(texture)


fn set_render_target(
    renderer: Ptr[Renderer, MutAnyOrigin], texture: Ptr[Texture, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderTarget
    """
    var success = get_sdl3_function_table().set_render_target(renderer, texture)
    if not success:
        raise get_error()


fn get_render_target(
    renderer: Ptr[Renderer, MutAnyOrigin]
) raises -> Ptr[Texture, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderTarget
    """
    var result = get_sdl3_function_table().get_render_target(renderer)
    if not result:
        raise "Error in get_render_target call. See official documentation for details."
    return result


fn set_render_logical_presentation(
    renderer: Ptr[Renderer, MutAnyOrigin], w: Int32, h: Int32, mode: RendererLogicalPresentation
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderLogicalPresentation
    """
    var success = get_sdl3_function_table().set_render_logical_presentation(renderer, w, h, mode)
    if not success:
        raise get_error()


fn get_render_logical_presentation(
    renderer: Ptr[Renderer, MutAnyOrigin],
    w: Ptr[Int32, MutAnyOrigin],
    h: Ptr[Int32, MutAnyOrigin],
    mode: Ptr[RendererLogicalPresentation, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentation
    """
    var success = get_sdl3_function_table().get_render_logical_presentation(renderer, w, h, mode)
    if not success:
        raise get_error()


fn get_render_logical_presentation_rect(
    renderer: Ptr[Renderer, MutAnyOrigin], rect: Ptr[FRect, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentationRect
    """
    var success = get_sdl3_function_table().get_render_logical_presentation_rect(renderer, rect)
    if not success:
        raise get_error()


fn render_coordinates_from_window(
    renderer: Ptr[Renderer, MutAnyOrigin],
    window_x: Float32,
    window_y: Float32,
    x: Ptr[Float32, MutAnyOrigin],
    y: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesFromWindow
    """
    var success = get_sdl3_function_table().render_coordinates_from_window(
        renderer, window_x, window_y, x, y
    )
    if not success:
        raise get_error()


fn render_coordinates_to_window(
    renderer: Ptr[Renderer, MutAnyOrigin],
    x: Float32,
    y: Float32,
    window_x: Ptr[Float32, MutAnyOrigin],
    window_y: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesToWindow
    """
    var success = get_sdl3_function_table().render_coordinates_to_window(
        renderer, x, y, window_x, window_y
    )
    if not success:
        raise get_error()


fn convert_event_to_render_coordinates(
    renderer: Ptr[Renderer, MutAnyOrigin], event: Ptr[Event, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ConvertEventToRenderCoordinates
    """
    var success = get_sdl3_function_table().convert_event_to_render_coordinates(renderer, event)
    if not success:
        raise get_error()


fn set_render_viewport(
    renderer: Ptr[Renderer, MutAnyOrigin], rect: Ptr[Rect, ImmutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderViewport
    """
    var success = get_sdl3_function_table().set_render_viewport(renderer, rect)
    if not success:
        raise get_error()


fn get_render_viewport(
    renderer: Ptr[Renderer, MutAnyOrigin], rect: Ptr[Rect, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderViewport
    """
    var success = get_sdl3_function_table().get_render_viewport(renderer, rect)
    if not success:
        raise get_error()


fn render_viewport_set(renderer: Ptr[Renderer, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderViewportSet
    """
    return get_sdl3_function_table().render_viewport_set(renderer)


fn get_render_safe_area(
    renderer: Ptr[Renderer, MutAnyOrigin], rect: Ptr[Rect, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderSafeArea
    """
    var success = get_sdl3_function_table().get_render_safe_area(renderer, rect)
    if not success:
        raise get_error()


fn set_render_clip_rect(
    renderer: Ptr[Renderer, MutAnyOrigin], rect: Ptr[Rect, ImmutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderClipRect
    """
    var success = get_sdl3_function_table().set_render_clip_rect(renderer, rect)
    if not success:
        raise get_error()


fn get_render_clip_rect(
    renderer: Ptr[Renderer, MutAnyOrigin], rect: Ptr[Rect, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderClipRect
    """
    var success = get_sdl3_function_table().get_render_clip_rect(renderer, rect)
    if not success:
        raise get_error()


fn render_clip_enabled(renderer: Ptr[Renderer, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderClipEnabled
    """
    return get_sdl3_function_table().render_clip_enabled(renderer)


fn set_render_scale(
    renderer: Ptr[Renderer, MutAnyOrigin], scaleX: Float32, scaleY: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderScale
    """
    var success = get_sdl3_function_table().set_render_scale(renderer, scaleX, scaleY)
    if not success:
        raise get_error()


fn get_render_scale(
    renderer: Ptr[Renderer, MutAnyOrigin],
    scaleX: Ptr[Float32, MutAnyOrigin],
    scaleY: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderScale
    """
    var success = get_sdl3_function_table().get_render_scale(renderer, scaleX, scaleY)
    if not success:
        raise get_error()


fn set_render_draw_color(
    renderer: Ptr[Renderer, MutAnyOrigin], r: UInt8, g: UInt8, b: UInt8, a: UInt8
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor
    """
    var success = get_sdl3_function_table().set_render_draw_color(renderer, r, g, b, a)
    if not success:
        raise get_error()


fn set_render_draw_color_float(
    renderer: Ptr[Renderer, MutAnyOrigin], r: Float32, g: Float32, b: Float32, a: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColorFloat
    """
    var success = get_sdl3_function_table().set_render_draw_color_float(renderer, r, g, b, a)
    if not success:
        raise get_error()


fn get_render_draw_color(
    renderer: Ptr[Renderer, MutAnyOrigin],
    r: Ptr[UInt8, MutAnyOrigin],
    g: Ptr[UInt8, MutAnyOrigin],
    b: Ptr[UInt8, MutAnyOrigin],
    a: Ptr[UInt8, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColor
    """
    var success = get_sdl3_function_table().get_render_draw_color(renderer, r, g, b, a)
    if not success:
        raise get_error()


fn get_render_draw_color_float(
    renderer: Ptr[Renderer, MutAnyOrigin],
    r: Ptr[Float32, MutAnyOrigin],
    g: Ptr[Float32, MutAnyOrigin],
    b: Ptr[Float32, MutAnyOrigin],
    a: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColorFloat
    """
    var success = get_sdl3_function_table().get_render_draw_color_float(renderer, r, g, b, a)
    if not success:
        raise get_error()


fn set_render_color_scale(renderer: Ptr[Renderer, MutAnyOrigin], scale: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderColorScale
    """
    var success = get_sdl3_function_table().set_render_color_scale(renderer, scale)
    if not success:
        raise get_error()


fn get_render_color_scale(
    renderer: Ptr[Renderer, MutAnyOrigin], scale: Ptr[Float32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderColorScale
    """
    var success = get_sdl3_function_table().get_render_color_scale(renderer, scale)
    if not success:
        raise get_error()


fn set_render_draw_blend_mode(renderer: Ptr[Renderer, MutAnyOrigin], blendMode: BlendMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawBlendMode
    """
    var success = get_sdl3_function_table().set_render_draw_blend_mode(renderer, blendMode)
    if not success:
        raise get_error()


fn get_render_draw_blend_mode(
    renderer: Ptr[Renderer, MutAnyOrigin], blendMode: Ptr[BlendMode, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawBlendMode
    """
    var success = get_sdl3_function_table().get_render_draw_blend_mode(renderer, blendMode)
    if not success:
        raise get_error()


fn render_clear(renderer: Ptr[Renderer, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderClear
    """
    var success = get_sdl3_function_table().render_clear(renderer)
    if not success:
        raise get_error()


fn render_point(renderer: Ptr[Renderer, MutAnyOrigin], x: Float32, y: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderPoint
    """
    var success = get_sdl3_function_table().render_point(renderer, x, y)
    if not success:
        raise get_error()


fn render_points(
    renderer: Ptr[Renderer, MutAnyOrigin], points: Ptr[FPoint, ImmutAnyOrigin], count: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderPoints
    """
    var success = get_sdl3_function_table().render_points(renderer, points, count)
    if not success:
        raise get_error()


fn render_line(
    renderer: Ptr[Renderer, MutAnyOrigin], x1: Float32, y1: Float32, x2: Float32, y2: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderLine
    """
    var success = get_sdl3_function_table().render_line(renderer, x1, y1, x2, y2)
    if not success:
        raise get_error()


fn render_lines(
    renderer: Ptr[Renderer, MutAnyOrigin], points: Ptr[FPoint, ImmutAnyOrigin], count: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderLines
    """
    var success = get_sdl3_function_table().render_lines(renderer, points, count)
    if not success:
        raise get_error()


fn render_rect(renderer: Ptr[Renderer, MutAnyOrigin], rect: Ptr[FRect, ImmutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderRect
    """
    var success = get_sdl3_function_table().render_rect(renderer, rect)
    if not success:
        raise get_error()


fn render_rects(
    renderer: Ptr[Renderer, MutAnyOrigin], rects: Ptr[FRect, ImmutAnyOrigin], count: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderRects
    """
    var success = get_sdl3_function_table().render_rects(renderer, rects, count)
    if not success:
        raise get_error()


fn render_fill_rect(
    renderer: Ptr[Renderer, MutAnyOrigin], rect: Ptr[FRect, ImmutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderFillRect
    """
    var success = get_sdl3_function_table().render_fill_rect(renderer, rect)
    if not success:
        raise get_error()


fn render_fill_rects(
    renderer: Ptr[Renderer, MutAnyOrigin], rects: Ptr[FRect, ImmutAnyOrigin], count: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderFillRects
    """
    var success = get_sdl3_function_table().render_fill_rects(renderer, rects, count)
    if not success:
        raise get_error()


fn render_texture(
    renderer: Ptr[Renderer, MutAnyOrigin],
    texture: Ptr[Texture, MutAnyOrigin],
    srcrect: Ptr[FRect, ImmutAnyOrigin],
    dstrect: Ptr[FRect, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderTexture
    """
    var success = get_sdl3_function_table().render_texture(renderer, texture, srcrect, dstrect)
    if not success:
        raise get_error()


fn render_texture_rotated(
    renderer: Ptr[Renderer, MutAnyOrigin],
    texture: Ptr[Texture, MutAnyOrigin],
    srcrect: Ptr[FRect, ImmutAnyOrigin],
    dstrect: Ptr[FRect, ImmutAnyOrigin],
    angle: Float64,
    center: Ptr[FPoint, ImmutAnyOrigin],
    flip: FlipMode,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderTextureRotated
    """
    var success = get_sdl3_function_table().render_texture_rotated(
        renderer, texture, srcrect, dstrect, angle, center, flip
    )
    if not success:
        raise get_error()


fn render_texture_affine(
    renderer: Ptr[Renderer, MutAnyOrigin],
    texture: Ptr[Texture, MutAnyOrigin],
    srcrect: Ptr[FRect, ImmutAnyOrigin],
    origin: Ptr[FPoint, ImmutAnyOrigin],
    right: Ptr[FPoint, ImmutAnyOrigin],
    down: Ptr[FPoint, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderTextureAffine
    """
    var success = get_sdl3_function_table().render_texture_affine(
        renderer, texture, srcrect, origin, right, down
    )
    if not success:
        raise get_error()


fn render_texture_tiled(
    renderer: Ptr[Renderer, MutAnyOrigin],
    texture: Ptr[Texture, MutAnyOrigin],
    srcrect: Ptr[FRect, ImmutAnyOrigin],
    scale: Float32,
    dstrect: Ptr[FRect, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderTextureTiled
    """
    var success = get_sdl3_function_table().render_texture_tiled(
        renderer, texture, srcrect, scale, dstrect
    )
    if not success:
        raise get_error()


fn render_texture9_grid(
    renderer: Ptr[Renderer, MutAnyOrigin],
    texture: Ptr[Texture, MutAnyOrigin],
    srcrect: Ptr[FRect, ImmutAnyOrigin],
    left_width: Float32,
    right_width: Float32,
    top_height: Float32,
    bottom_height: Float32,
    scale: Float32,
    dstrect: Ptr[FRect, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderTexture9Grid
    """
    var success = get_sdl3_function_table().render_texture9_grid(
        renderer,
        texture,
        srcrect,
        left_width,
        right_width,
        top_height,
        bottom_height,
        scale,
        dstrect,
    )
    if not success:
        raise get_error()


fn render_geometry(
    renderer: Ptr[Renderer, MutAnyOrigin],
    texture: Ptr[Texture, MutAnyOrigin],
    vertices: Ptr[Vertex, ImmutAnyOrigin],
    num_vertices: Int32,
    indices: Ptr[Int32, ImmutAnyOrigin],
    num_indices: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderGeometry
    """
    var success = get_sdl3_function_table().render_geometry(
        renderer, texture, vertices, num_vertices, indices, num_indices
    )
    if not success:
        raise get_error()


fn render_geometry_raw(
    renderer: Ptr[Renderer, MutAnyOrigin],
    texture: Ptr[Texture, MutAnyOrigin],
    xy: Ptr[Float32, ImmutAnyOrigin],
    xy_stride: Int32,
    color: Ptr[FColor, ImmutAnyOrigin],
    color_stride: Int32,
    uv: Ptr[Float32, ImmutAnyOrigin],
    uv_stride: Int32,
    num_vertices: Int32,
    indices: Ptr[NoneType, ImmutAnyOrigin],
    num_indices: Int32,
    size_indices: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderGeometryRaw
    """
    var success = get_sdl3_function_table().render_geometry_raw(
        renderer,
        texture,
        xy,
        xy_stride,
        color,
        color_stride,
        uv,
        uv_stride,
        num_vertices,
        indices,
        num_indices,
        size_indices,
    )
    if not success:
        raise get_error()


fn render_read_pixels(
    renderer: Ptr[Renderer, MutAnyOrigin], rect: Ptr[Rect, ImmutAnyOrigin]
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderReadPixels
    """
    var result = get_sdl3_function_table().render_read_pixels(renderer, rect)
    if not result:
        raise get_error()
    return result


fn render_present(renderer: Ptr[Renderer, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderPresent
    """
    var success = get_sdl3_function_table().render_present(renderer)
    if not success:
        raise get_error()


fn destroy_texture(texture: Ptr[Texture, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyTexture
    """
    get_sdl3_function_table().destroy_texture(texture)


fn destroy_renderer(renderer: Ptr[Renderer, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyRenderer
    """
    get_sdl3_function_table().destroy_renderer(renderer)


fn flush_renderer(renderer: Ptr[Renderer, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushRenderer
    """
    var success = get_sdl3_function_table().flush_renderer(renderer)
    if not success:
        raise get_error()


fn get_render_metal_layer(
    renderer: Ptr[Renderer, MutAnyOrigin]
) raises -> Ptr[NoneType, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderMetalLayer
    """
    var result = get_sdl3_function_table().get_render_metal_layer(renderer)
    if not result:
        raise "Error in get_render_metal_layer call. See official documentation for details."
    return result


fn get_render_metal_command_encoder(
    renderer: Ptr[Renderer, MutAnyOrigin]
) raises -> Ptr[NoneType, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderMetalCommandEncoder
    """
    var result = get_sdl3_function_table().get_render_metal_command_encoder(renderer)
    if not result:
        raise "Error in get_render_metal_command_encoder call. See official documentation for details."
    return result


fn add_vulkan_render_semaphores(
    renderer: Ptr[Renderer, MutAnyOrigin],
    wait_stage_mask: UInt32,
    wait_semaphore: Int64,
    signal_semaphore: Int64,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddVulkanRenderSemaphores
    """
    var success = get_sdl3_function_table().add_vulkan_render_semaphores(
        renderer, wait_stage_mask, wait_semaphore, signal_semaphore
    )
    if not success:
        raise get_error()


fn set_render_v_sync(renderer: Ptr[Renderer, MutAnyOrigin], vsync: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderVSync
    """
    var success = get_sdl3_function_table().set_render_v_sync(renderer, vsync)
    if not success:
        raise get_error()


fn get_render_v_sync(
    renderer: Ptr[Renderer, MutAnyOrigin], vsync: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderVSync
    """
    var success = get_sdl3_function_table().get_render_v_sync(renderer, vsync)
    if not success:
        raise get_error()


fn render_debug_text(
    renderer: Ptr[Renderer, MutAnyOrigin], x: Float32, y: Float32, str: CStringSlice
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderDebugText
    """
    var success = get_sdl3_function_table().render_debug_text(renderer, x, y, str.unsafe_ptr())
    if not success:
        raise get_error()


fn render_debug_text_format(
    renderer: Ptr[Renderer, MutAnyOrigin], x: Float32, y: Float32, fmt: CStringSlice
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderDebugTextFormat
    """
    var success = get_sdl3_function_table().render_debug_text_format(
        renderer, x, y, fmt.unsafe_ptr()
    )
    if not success:
        raise get_error()


fn get_sensors(count: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[SensorID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensors
    """
    var result = get_sdl3_function_table().get_sensors(count)
    if not result:
        raise get_error()
    return result


fn get_sensor_name_for_id(instance_id: SensorID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorNameForID
    """
    var cstring = get_sdl3_function_table().get_sensor_name_for_id(instance_id)
    if not cstring:
        raise "Error in get_sensor_name_for_id call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_sensor_type_for_id(instance_id: SensorID) -> SensorType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorTypeForID
    """
    return get_sdl3_function_table().get_sensor_type_for_id(instance_id)


fn get_sensor_non_portable_type_for_id(instance_id: SensorID) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorNonPortableTypeForID
    """
    return get_sdl3_function_table().get_sensor_non_portable_type_for_id(instance_id)


fn open_sensor(instance_id: SensorID) raises -> Ptr[Sensor, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenSensor
    """
    var result = get_sdl3_function_table().open_sensor(instance_id)
    if not result:
        raise get_error()
    return result


fn get_sensor_from_id(instance_id: SensorID) raises -> Ptr[Sensor, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorFromID
    """
    var result = get_sdl3_function_table().get_sensor_from_id(instance_id)
    if not result:
        raise get_error()
    return result


fn get_sensor_properties(sensor: Ptr[Sensor, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorProperties
    """
    return get_sdl3_function_table().get_sensor_properties(sensor)


fn get_sensor_name(sensor: Ptr[Sensor, MutAnyOrigin]) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorName
    """
    var cstring = get_sdl3_function_table().get_sensor_name(sensor)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_sensor_type(sensor: Ptr[Sensor, MutAnyOrigin]) -> SensorType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorType
    """
    return get_sdl3_function_table().get_sensor_type(sensor)


fn get_sensor_non_portable_type(sensor: Ptr[Sensor, MutAnyOrigin]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorNonPortableType
    """
    return get_sdl3_function_table().get_sensor_non_portable_type(sensor)


fn get_sensor_id(sensor: Ptr[Sensor, MutAnyOrigin]) -> SensorID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorID
    """
    return get_sdl3_function_table().get_sensor_id(sensor)


fn get_sensor_data(
    sensor: Ptr[Sensor, MutAnyOrigin], data: Ptr[Float32, MutAnyOrigin], num_values: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorData
    """
    var success = get_sdl3_function_table().get_sensor_data(sensor, data, num_values)
    if not success:
        raise get_error()


fn close_sensor(sensor: Ptr[Sensor, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseSensor
    """
    get_sdl3_function_table().close_sensor(sensor)


fn update_sensors():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateSensors
    """
    get_sdl3_function_table().update_sensors()


fn open_title_storage(
    override: CStringSlice, props: PropertiesID
) raises -> Ptr[Storage, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenTitleStorage
    """
    var result = get_sdl3_function_table().open_title_storage(override.unsafe_ptr(), props)
    if not result:
        raise get_error()
    return result


fn open_user_storage(
    org: CStringSlice, app: CStringSlice, props: PropertiesID
) raises -> Ptr[Storage, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenUserStorage
    """
    var result = get_sdl3_function_table().open_user_storage(
        org.unsafe_ptr(), app.unsafe_ptr(), props
    )
    if not result:
        raise get_error()
    return result


fn open_file_storage(path: CStringSlice) raises -> Ptr[Storage, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenFileStorage
    """
    var result = get_sdl3_function_table().open_file_storage(path.unsafe_ptr())
    if not result:
        raise get_error()
    return result


fn open_storage(
    iface: Ptr[StorageInterface, ImmutAnyOrigin], userdata: Ptr[NoneType, MutAnyOrigin]
) raises -> Ptr[Storage, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenStorage
    """
    var result = get_sdl3_function_table().open_storage(iface, userdata)
    if not result:
        raise get_error()
    return result


fn close_storage(storage: Ptr[Storage, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseStorage
    """
    return get_sdl3_function_table().close_storage(storage)


fn storage_ready(storage: Ptr[Storage, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StorageReady
    """
    return get_sdl3_function_table().storage_ready(storage)


fn get_storage_file_size(
    storage: Ptr[Storage, MutAnyOrigin], path: CStringSlice, length: Ptr[UInt64, MutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetStorageFileSize
    """
    return get_sdl3_function_table().get_storage_file_size(storage, path.unsafe_ptr(), length)


fn read_storage_file(
    storage: Ptr[Storage, MutAnyOrigin],
    path: CStringSlice,
    destination: Ptr[NoneType, MutAnyOrigin],
    length: UInt64,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadStorageFile
    """
    return get_sdl3_function_table().read_storage_file(
        storage, path.unsafe_ptr(), destination, length
    )


fn write_storage_file(
    storage: Ptr[Storage, MutAnyOrigin],
    path: CStringSlice,
    source: Ptr[NoneType, ImmutAnyOrigin],
    length: UInt64,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteStorageFile
    """
    return get_sdl3_function_table().write_storage_file(storage, path.unsafe_ptr(), source, length)


fn create_storage_directory(storage: Ptr[Storage, MutAnyOrigin], path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateStorageDirectory
    """
    var success = get_sdl3_function_table().create_storage_directory(storage, path.unsafe_ptr())
    if not success:
        raise get_error()


fn enumerate_storage_directory(
    storage: Ptr[Storage, MutAnyOrigin],
    path: CStringSlice,
    callback: EnumerateDirectoryCallback,
    userdata: Ptr[NoneType, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EnumerateStorageDirectory
    """
    var success = get_sdl3_function_table().enumerate_storage_directory(
        storage, path.unsafe_ptr(), callback, userdata
    )
    if not success:
        raise get_error()


fn remove_storage_path(storage: Ptr[Storage, MutAnyOrigin], path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveStoragePath
    """
    var success = get_sdl3_function_table().remove_storage_path(storage, path.unsafe_ptr())
    if not success:
        raise get_error()


fn rename_storage_path(
    storage: Ptr[Storage, MutAnyOrigin], oldpath: CStringSlice, newpath: CStringSlice
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenameStoragePath
    """
    var success = get_sdl3_function_table().rename_storage_path(
        storage, oldpath.unsafe_ptr(), newpath.unsafe_ptr()
    )
    if not success:
        raise get_error()


fn copy_storage_file(
    storage: Ptr[Storage, MutAnyOrigin], oldpath: CStringSlice, newpath: CStringSlice
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CopyStorageFile
    """
    var success = get_sdl3_function_table().copy_storage_file(
        storage, oldpath.unsafe_ptr(), newpath.unsafe_ptr()
    )
    if not success:
        raise get_error()


fn get_storage_path_info(
    storage: Ptr[Storage, MutAnyOrigin], path: CStringSlice, info: Ptr[PathInfo, MutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetStoragePathInfo
    """
    return get_sdl3_function_table().get_storage_path_info(storage, path.unsafe_ptr(), info)


fn get_storage_space_remaining(storage: Ptr[Storage, MutAnyOrigin]) -> UInt64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetStorageSpaceRemaining
    """
    return get_sdl3_function_table().get_storage_space_remaining(storage)


fn glob_storage_directory(
    storage: Ptr[Storage, MutAnyOrigin],
    path: CStringSlice,
    pattern: CStringSlice,
    flags: GlobFlags,
    count: Ptr[Int32, MutAnyOrigin],
) raises -> Ptr[Ptr[c_char, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GlobStorageDirectory
    """
    var result = get_sdl3_function_table().glob_storage_directory(
        storage, path.unsafe_ptr(), pattern.unsafe_ptr(), flags, count
    )
    if not result:
        raise get_error()
    return result


fn create_surface(
    width: Int32, height: Int32, format: PixelFormat
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSurface
    """
    var result = get_sdl3_function_table().create_surface(width, height, format)
    if not result:
        raise get_error()
    return result


fn create_surface_from(
    width: Int32,
    height: Int32,
    format: PixelFormat,
    pixels: Ptr[NoneType, MutAnyOrigin],
    pitch: Int32,
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSurfaceFrom
    """
    var result = get_sdl3_function_table().create_surface_from(
        width, height, format, pixels, pitch
    )
    if not result:
        raise get_error()
    return result


fn destroy_surface(surface: Ptr[Surface, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroySurface
    """
    get_sdl3_function_table().destroy_surface(surface)


fn get_surface_properties(surface: Ptr[Surface, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceProperties
    """
    return get_sdl3_function_table().get_surface_properties(surface)


fn set_surface_colorspace(surface: Ptr[Surface, MutAnyOrigin], colorspace: Colorspace) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorspace
    """
    var success = get_sdl3_function_table().set_surface_colorspace(surface, colorspace)
    if not success:
        raise get_error()


fn get_surface_colorspace(surface: Ptr[Surface, MutAnyOrigin]) -> Colorspace:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorspace
    """
    return get_sdl3_function_table().get_surface_colorspace(surface)


fn create_surface_palette(
    surface: Ptr[Surface, MutAnyOrigin]
) raises -> Ptr[Palette, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSurfacePalette
    """
    var result = get_sdl3_function_table().create_surface_palette(surface)
    if not result:
        raise get_error()
    return result


fn set_surface_palette(
    surface: Ptr[Surface, MutAnyOrigin], palette: Ptr[Palette, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfacePalette
    """
    var success = get_sdl3_function_table().set_surface_palette(surface, palette)
    if not success:
        raise get_error()


fn get_surface_palette(
    surface: Ptr[Surface, MutAnyOrigin]
) raises -> Ptr[Palette, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfacePalette
    """
    var result = get_sdl3_function_table().get_surface_palette(surface)
    if not result:
        raise "Error in get_surface_palette call. See official documentation for details."
    return result


fn add_surface_alternate_image(
    surface: Ptr[Surface, MutAnyOrigin], image: Ptr[Surface, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddSurfaceAlternateImage
    """
    var success = get_sdl3_function_table().add_surface_alternate_image(surface, image)
    if not success:
        raise get_error()


fn surface_has_alternate_images(surface: Ptr[Surface, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SurfaceHasAlternateImages
    """
    return get_sdl3_function_table().surface_has_alternate_images(surface)


fn get_surface_images(
    surface: Ptr[Surface, MutAnyOrigin], count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[Surface, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceImages
    """
    var result = get_sdl3_function_table().get_surface_images(surface, count)
    if not result:
        raise get_error()
    return result


fn remove_surface_alternate_images(surface: Ptr[Surface, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveSurfaceAlternateImages
    """
    get_sdl3_function_table().remove_surface_alternate_images(surface)


fn lock_surface(surface: Ptr[Surface, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockSurface
    """
    var success = get_sdl3_function_table().lock_surface(surface)
    if not success:
        raise get_error()


fn unlock_surface(surface: Ptr[Surface, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnlockSurface
    """
    get_sdl3_function_table().unlock_surface(surface)


fn load_bmp_io(
    src: Ptr[IOStream, MutAnyOrigin], closeio: Bool
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadBMP_IO
    """
    var result = get_sdl3_function_table().load_bmp_io(src, closeio)
    if not result:
        raise get_error()
    return result


fn load_bmp(file: CStringSlice) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadBMP
    """
    var result = get_sdl3_function_table().load_bmp(file.unsafe_ptr())
    if not result:
        raise get_error()
    return result


fn save_bmp_io(
    surface: Ptr[Surface, MutAnyOrigin], dst: Ptr[IOStream, MutAnyOrigin], closeio: Bool
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SaveBMP_IO
    """
    var success = get_sdl3_function_table().save_bmp_io(surface, dst, closeio)
    if not success:
        raise get_error()


fn save_bmp(surface: Ptr[Surface, MutAnyOrigin], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SaveBMP
    """
    var success = get_sdl3_function_table().save_bmp(surface, file.unsafe_ptr())
    if not success:
        raise get_error()


fn set_surface_rle(surface: Ptr[Surface, MutAnyOrigin], enabled: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceRLE
    """
    var success = get_sdl3_function_table().set_surface_rle(surface, enabled)
    if not success:
        raise get_error()


fn surface_has_rle(surface: Ptr[Surface, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SurfaceHasRLE
    """
    return get_sdl3_function_table().surface_has_rle(surface)


fn set_surface_color_key(surface: Ptr[Surface, MutAnyOrigin], enabled: Bool, key: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorKey
    """
    var success = get_sdl3_function_table().set_surface_color_key(surface, enabled, key)
    if not success:
        raise get_error()


fn surface_has_color_key(surface: Ptr[Surface, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SurfaceHasColorKey
    """
    return get_sdl3_function_table().surface_has_color_key(surface)


fn get_surface_color_key(
    surface: Ptr[Surface, MutAnyOrigin], key: Ptr[UInt32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorKey
    """
    var success = get_sdl3_function_table().get_surface_color_key(surface, key)
    if not success:
        raise get_error()


fn set_surface_color_mod(surface: Ptr[Surface, MutAnyOrigin], r: UInt8, g: UInt8, b: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorMod
    """
    var success = get_sdl3_function_table().set_surface_color_mod(surface, r, g, b)
    if not success:
        raise get_error()


fn get_surface_color_mod(
    surface: Ptr[Surface, MutAnyOrigin],
    r: Ptr[UInt8, MutAnyOrigin],
    g: Ptr[UInt8, MutAnyOrigin],
    b: Ptr[UInt8, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorMod
    """
    var success = get_sdl3_function_table().get_surface_color_mod(surface, r, g, b)
    if not success:
        raise get_error()


fn set_surface_alpha_mod(surface: Ptr[Surface, MutAnyOrigin], alpha: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceAlphaMod
    """
    var success = get_sdl3_function_table().set_surface_alpha_mod(surface, alpha)
    if not success:
        raise get_error()


fn get_surface_alpha_mod(
    surface: Ptr[Surface, MutAnyOrigin], alpha: Ptr[UInt8, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceAlphaMod
    """
    var success = get_sdl3_function_table().get_surface_alpha_mod(surface, alpha)
    if not success:
        raise get_error()


fn set_surface_blend_mode(surface: Ptr[Surface, MutAnyOrigin], blendMode: BlendMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceBlendMode
    """
    var success = get_sdl3_function_table().set_surface_blend_mode(surface, blendMode)
    if not success:
        raise get_error()


fn get_surface_blend_mode(
    surface: Ptr[Surface, MutAnyOrigin], blendMode: Ptr[BlendMode, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceBlendMode
    """
    var success = get_sdl3_function_table().get_surface_blend_mode(surface, blendMode)
    if not success:
        raise get_error()


fn set_surface_clip_rect(
    surface: Ptr[Surface, MutAnyOrigin], rect: Ptr[Rect, ImmutAnyOrigin]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceClipRect
    """
    return get_sdl3_function_table().set_surface_clip_rect(surface, rect)


fn get_surface_clip_rect(
    surface: Ptr[Surface, MutAnyOrigin], rect: Ptr[Rect, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceClipRect
    """
    var success = get_sdl3_function_table().get_surface_clip_rect(surface, rect)
    if not success:
        raise get_error()


fn flip_surface(surface: Ptr[Surface, MutAnyOrigin], flip: FlipMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlipSurface
    """
    var success = get_sdl3_function_table().flip_surface(surface, flip)
    if not success:
        raise get_error()


fn duplicate_surface(
    surface: Ptr[Surface, MutAnyOrigin]
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DuplicateSurface
    """
    var result = get_sdl3_function_table().duplicate_surface(surface)
    if not result:
        raise get_error()
    return result


fn scale_surface(
    surface: Ptr[Surface, MutAnyOrigin], width: Int32, height: Int32, scaleMode: ScaleMode
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ScaleSurface
    """
    var result = get_sdl3_function_table().scale_surface(surface, width, height, scaleMode)
    if not result:
        raise get_error()
    return result


fn convert_surface(
    surface: Ptr[Surface, MutAnyOrigin], format: PixelFormat
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ConvertSurface
    """
    var result = get_sdl3_function_table().convert_surface(surface, format)
    if not result:
        raise get_error()
    return result


fn convert_surface_and_colorspace(
    surface: Ptr[Surface, MutAnyOrigin],
    format: PixelFormat,
    palette: Ptr[Palette, MutAnyOrigin],
    colorspace: Colorspace,
    props: PropertiesID,
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ConvertSurfaceAndColorspace
    """
    var result = get_sdl3_function_table().convert_surface_and_colorspace(
        surface, format, palette, colorspace, props
    )
    if not result:
        raise get_error()
    return result


fn convert_pixels(
    width: Int32,
    height: Int32,
    src_format: PixelFormat,
    src: Ptr[NoneType, ImmutAnyOrigin],
    src_pitch: Int32,
    dst_format: PixelFormat,
    dst: Ptr[NoneType, MutAnyOrigin],
    dst_pitch: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ConvertPixels
    """
    var success = get_sdl3_function_table().convert_pixels(
        width, height, src_format, src, src_pitch, dst_format, dst, dst_pitch
    )
    if not success:
        raise get_error()


fn convert_pixels_and_colorspace(
    width: Int32,
    height: Int32,
    src_format: PixelFormat,
    src_colorspace: Colorspace,
    src_properties: PropertiesID,
    src: Ptr[NoneType, ImmutAnyOrigin],
    src_pitch: Int32,
    dst_format: PixelFormat,
    dst_colorspace: Colorspace,
    dst_properties: PropertiesID,
    dst: Ptr[NoneType, MutAnyOrigin],
    dst_pitch: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ConvertPixelsAndColorspace
    """
    var success = get_sdl3_function_table().convert_pixels_and_colorspace(
        width,
        height,
        src_format,
        src_colorspace,
        src_properties,
        src,
        src_pitch,
        dst_format,
        dst_colorspace,
        dst_properties,
        dst,
        dst_pitch,
    )
    if not success:
        raise get_error()


fn premultiply_alpha(
    width: Int32,
    height: Int32,
    src_format: PixelFormat,
    src: Ptr[NoneType, ImmutAnyOrigin],
    src_pitch: Int32,
    dst_format: PixelFormat,
    dst: Ptr[NoneType, MutAnyOrigin],
    dst_pitch: Int32,
    linear: Bool,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PremultiplyAlpha
    """
    var success = get_sdl3_function_table().premultiply_alpha(
        width, height, src_format, src, src_pitch, dst_format, dst, dst_pitch, linear
    )
    if not success:
        raise get_error()


fn premultiply_surface_alpha(surface: Ptr[Surface, MutAnyOrigin], linear: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PremultiplySurfaceAlpha
    """
    var success = get_sdl3_function_table().premultiply_surface_alpha(surface, linear)
    if not success:
        raise get_error()


fn clear_surface(
    surface: Ptr[Surface, MutAnyOrigin], r: Float32, g: Float32, b: Float32, a: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearSurface
    """
    var success = get_sdl3_function_table().clear_surface(surface, r, g, b, a)
    if not success:
        raise get_error()


fn fill_surface_rect(
    dst: Ptr[Surface, MutAnyOrigin], rect: Ptr[Rect, ImmutAnyOrigin], color: UInt32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FillSurfaceRect
    """
    var success = get_sdl3_function_table().fill_surface_rect(dst, rect, color)
    if not success:
        raise get_error()


fn fill_surface_rects(
    dst: Ptr[Surface, MutAnyOrigin], rects: Ptr[Rect, ImmutAnyOrigin], count: Int32, color: UInt32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FillSurfaceRects
    """
    var success = get_sdl3_function_table().fill_surface_rects(dst, rects, count, color)
    if not success:
        raise get_error()


fn blit_surface(
    src: Ptr[Surface, MutAnyOrigin],
    srcrect: Ptr[Rect, ImmutAnyOrigin],
    dst: Ptr[Surface, MutAnyOrigin],
    dstrect: Ptr[Rect, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurface
    """
    var success = get_sdl3_function_table().blit_surface(src, srcrect, dst, dstrect)
    if not success:
        raise get_error()


fn blit_surface_unchecked(
    src: Ptr[Surface, MutAnyOrigin],
    srcrect: Ptr[Rect, ImmutAnyOrigin],
    dst: Ptr[Surface, MutAnyOrigin],
    dstrect: Ptr[Rect, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceUnchecked
    """
    var success = get_sdl3_function_table().blit_surface_unchecked(src, srcrect, dst, dstrect)
    if not success:
        raise get_error()


fn blit_surface_scaled(
    src: Ptr[Surface, MutAnyOrigin],
    srcrect: Ptr[Rect, ImmutAnyOrigin],
    dst: Ptr[Surface, MutAnyOrigin],
    dstrect: Ptr[Rect, ImmutAnyOrigin],
    scaleMode: ScaleMode,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceScaled
    """
    var success = get_sdl3_function_table().blit_surface_scaled(
        src, srcrect, dst, dstrect, scaleMode
    )
    if not success:
        raise get_error()


fn blit_surface_unchecked_scaled(
    src: Ptr[Surface, MutAnyOrigin],
    srcrect: Ptr[Rect, ImmutAnyOrigin],
    dst: Ptr[Surface, MutAnyOrigin],
    dstrect: Ptr[Rect, ImmutAnyOrigin],
    scaleMode: ScaleMode,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceUncheckedScaled
    """
    var success = get_sdl3_function_table().blit_surface_unchecked_scaled(
        src, srcrect, dst, dstrect, scaleMode
    )
    if not success:
        raise get_error()


fn stretch_surface(
    src: Ptr[Surface, MutAnyOrigin],
    srcrect: Ptr[Rect, ImmutAnyOrigin],
    dst: Ptr[Surface, MutAnyOrigin],
    dstrect: Ptr[Rect, ImmutAnyOrigin],
    scaleMode: ScaleMode,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StretchSurface
    """
    var success = get_sdl3_function_table().stretch_surface(src, srcrect, dst, dstrect, scaleMode)
    if not success:
        raise get_error()


fn blit_surface_tiled(
    src: Ptr[Surface, MutAnyOrigin],
    srcrect: Ptr[Rect, ImmutAnyOrigin],
    dst: Ptr[Surface, MutAnyOrigin],
    dstrect: Ptr[Rect, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceTiled
    """
    var success = get_sdl3_function_table().blit_surface_tiled(src, srcrect, dst, dstrect)
    if not success:
        raise get_error()


fn blit_surface_tiled_with_scale(
    src: Ptr[Surface, MutAnyOrigin],
    srcrect: Ptr[Rect, ImmutAnyOrigin],
    scale: Float32,
    scaleMode: ScaleMode,
    dst: Ptr[Surface, MutAnyOrigin],
    dstrect: Ptr[Rect, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceTiledWithScale
    """
    var success = get_sdl3_function_table().blit_surface_tiled_with_scale(
        src, srcrect, scale, scaleMode, dst, dstrect
    )
    if not success:
        raise get_error()


fn blit_surface9_grid(
    src: Ptr[Surface, MutAnyOrigin],
    srcrect: Ptr[Rect, ImmutAnyOrigin],
    left_width: Int32,
    right_width: Int32,
    top_height: Int32,
    bottom_height: Int32,
    scale: Float32,
    scaleMode: ScaleMode,
    dst: Ptr[Surface, MutAnyOrigin],
    dstrect: Ptr[Rect, ImmutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurface9Grid
    """
    var success = get_sdl3_function_table().blit_surface9_grid(
        src,
        srcrect,
        left_width,
        right_width,
        top_height,
        bottom_height,
        scale,
        scaleMode,
        dst,
        dstrect,
    )
    if not success:
        raise get_error()


fn map_surface_rgb(surface: Ptr[Surface, MutAnyOrigin], r: UInt8, g: UInt8, b: UInt8) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapSurfaceRGB
    """
    return get_sdl3_function_table().map_surface_rgb(surface, r, g, b)


fn map_surface_rgba(
    surface: Ptr[Surface, MutAnyOrigin], r: UInt8, g: UInt8, b: UInt8, a: UInt8
) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapSurfaceRGBA
    """
    return get_sdl3_function_table().map_surface_rgba(surface, r, g, b, a)


fn read_surface_pixel(
    surface: Ptr[Surface, MutAnyOrigin],
    x: Int32,
    y: Int32,
    r: Ptr[UInt8, MutAnyOrigin],
    g: Ptr[UInt8, MutAnyOrigin],
    b: Ptr[UInt8, MutAnyOrigin],
    a: Ptr[UInt8, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadSurfacePixel
    """
    var success = get_sdl3_function_table().read_surface_pixel(surface, x, y, r, g, b, a)
    if not success:
        raise get_error()


fn read_surface_pixel_float(
    surface: Ptr[Surface, MutAnyOrigin],
    x: Int32,
    y: Int32,
    r: Ptr[Float32, MutAnyOrigin],
    g: Ptr[Float32, MutAnyOrigin],
    b: Ptr[Float32, MutAnyOrigin],
    a: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadSurfacePixelFloat
    """
    var success = get_sdl3_function_table().read_surface_pixel_float(surface, x, y, r, g, b, a)
    if not success:
        raise get_error()


fn write_surface_pixel(
    surface: Ptr[Surface, MutAnyOrigin], x: Int32, y: Int32, r: UInt8, g: UInt8, b: UInt8, a: UInt8
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteSurfacePixel
    """
    var success = get_sdl3_function_table().write_surface_pixel(surface, x, y, r, g, b, a)
    if not success:
        raise get_error()


fn write_surface_pixel_float(
    surface: Ptr[Surface, MutAnyOrigin],
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
    var success = get_sdl3_function_table().write_surface_pixel_float(surface, x, y, r, g, b, a)
    if not success:
        raise get_error()


fn get_date_time_locale_preferences(
    dateFormat: Ptr[DateFormat, MutAnyOrigin], timeFormat: Ptr[TimeFormat, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDateTimeLocalePreferences
    """
    var success = get_sdl3_function_table().get_date_time_locale_preferences(
        dateFormat, timeFormat
    )
    if not success:
        raise get_error()


fn get_current_time(ticks: Ptr[Time, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentTime
    """
    var success = get_sdl3_function_table().get_current_time(ticks)
    if not success:
        raise get_error()


fn time_to_date_time(ticks: Time, dt: Ptr[DateTime, MutAnyOrigin], localTime: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TimeToDateTime
    """
    var success = get_sdl3_function_table().time_to_date_time(ticks, dt, localTime)
    if not success:
        raise get_error()


fn date_time_to_time(dt: Ptr[DateTime, ImmutAnyOrigin], ticks: Ptr[Time, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DateTimeToTime
    """
    var success = get_sdl3_function_table().date_time_to_time(dt, ticks)
    if not success:
        raise get_error()


fn time_to_windows(
    ticks: Time, dwLowDateTime: Ptr[UInt32, MutAnyOrigin], dwHighDateTime: Ptr[UInt32, MutAnyOrigin]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TimeToWindows
    """
    get_sdl3_function_table().time_to_windows(ticks, dwLowDateTime, dwHighDateTime)


fn time_from_windows(dwLowDateTime: UInt32, dwHighDateTime: UInt32) -> Time:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TimeFromWindows
    """
    return get_sdl3_function_table().time_from_windows(dwLowDateTime, dwHighDateTime)


fn get_days_in_month(year: Int32, month: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDaysInMonth
    """
    return get_sdl3_function_table().get_days_in_month(year, month)


fn get_day_of_year(year: Int32, month: Int32, day: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDayOfYear
    """
    return get_sdl3_function_table().get_day_of_year(year, month, day)


fn get_day_of_week(year: Int32, month: Int32, day: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDayOfWeek
    """
    return get_sdl3_function_table().get_day_of_week(year, month, day)


fn get_ticks() -> UInt64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTicks
    """
    return get_sdl3_function_table().get_ticks()


fn get_ticks_ns() -> UInt64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTicksNS
    """
    return get_sdl3_function_table().get_ticks_ns()


fn get_performance_counter() -> UInt64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPerformanceCounter
    """
    return get_sdl3_function_table().get_performance_counter()


fn get_performance_frequency() -> UInt64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPerformanceFrequency
    """
    return get_sdl3_function_table().get_performance_frequency()


fn delay(ms: UInt32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Delay
    """
    get_sdl3_function_table().delay(ms)


fn delay_ns(ns: UInt64):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DelayNS
    """
    get_sdl3_function_table().delay_ns(ns)


fn delay_precise(ns: UInt64):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DelayPrecise
    """
    get_sdl3_function_table().delay_precise(ns)


fn add_timer(
    interval: UInt32, callback: TimerCallback, userdata: Ptr[NoneType, MutAnyOrigin]
) -> TimerID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddTimer
    """
    return get_sdl3_function_table().add_timer(interval, callback, userdata)


fn add_timer_ns(
    interval: UInt64, callback: NSTimerCallback, userdata: Ptr[NoneType, MutAnyOrigin]
) -> TimerID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddTimerNS
    """
    return get_sdl3_function_table().add_timer_ns(interval, callback, userdata)


fn remove_timer(id: TimerID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveTimer
    """
    var success = get_sdl3_function_table().remove_timer(id)
    if not success:
        raise get_error()


fn get_touch_devices(count: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[TouchID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTouchDevices
    """
    var result = get_sdl3_function_table().get_touch_devices(count)
    if not result:
        raise get_error()
    return result


fn get_touch_device_name(touchID: TouchID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTouchDeviceName
    """
    var cstring = get_sdl3_function_table().get_touch_device_name(touchID)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_touch_device_type(touchID: TouchID) -> TouchDeviceType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTouchDeviceType
    """
    return get_sdl3_function_table().get_touch_device_type(touchID)


fn get_touch_fingers(
    touchID: TouchID, count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[Finger, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTouchFingers
    """
    var result = get_sdl3_function_table().get_touch_fingers(touchID, count)
    if not result:
        raise get_error()
    return result


fn get_version() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetVersion
    """
    return get_sdl3_function_table().get_version()


fn get_revision() -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRevision
    """
    var cstring = get_sdl3_function_table().get_revision()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_num_video_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumVideoDrivers
    """
    return get_sdl3_function_table().get_num_video_drivers()


fn get_video_driver(index: Int32) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetVideoDriver
    """
    var cstring = get_sdl3_function_table().get_video_driver(index)
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_current_video_driver() raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentVideoDriver
    """
    var cstring = get_sdl3_function_table().get_current_video_driver()
    if not cstring:
        raise "Error in get_current_video_driver call. See official documentation for details."
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_system_theme() -> SystemTheme:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSystemTheme
    """
    return get_sdl3_function_table().get_system_theme()


fn get_displays(count: Ptr[Int32, MutAnyOrigin]) raises -> Ptr[DisplayID, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplays
    """
    var result = get_sdl3_function_table().get_displays(count)
    if not result:
        raise get_error()
    return result


fn get_primary_display() -> DisplayID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPrimaryDisplay
    """
    return get_sdl3_function_table().get_primary_display()


fn get_display_properties(displayID: DisplayID) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayProperties
    """
    return get_sdl3_function_table().get_display_properties(displayID)


fn get_display_name(displayID: DisplayID) raises -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayName
    """
    var cstring = get_sdl3_function_table().get_display_name(displayID)
    if not cstring:
        raise get_error()
    return CStringSlice(unsafe_from_ptr=cstring)


fn get_display_bounds(displayID: DisplayID, rect: Ptr[Rect, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayBounds
    """
    var success = get_sdl3_function_table().get_display_bounds(displayID, rect)
    if not success:
        raise get_error()


fn get_display_usable_bounds(displayID: DisplayID, rect: Ptr[Rect, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayUsableBounds
    """
    var success = get_sdl3_function_table().get_display_usable_bounds(displayID, rect)
    if not success:
        raise get_error()


fn get_natural_display_orientation(displayID: DisplayID) -> DisplayOrientation:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNaturalDisplayOrientation
    """
    return get_sdl3_function_table().get_natural_display_orientation(displayID)


fn get_current_display_orientation(displayID: DisplayID) -> DisplayOrientation:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentDisplayOrientation
    """
    return get_sdl3_function_table().get_current_display_orientation(displayID)


fn get_display_content_scale(displayID: DisplayID) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayContentScale
    """
    return get_sdl3_function_table().get_display_content_scale(displayID)


fn get_fullscreen_display_modes(
    displayID: DisplayID, count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[DisplayMode, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetFullscreenDisplayModes
    """
    var result = get_sdl3_function_table().get_fullscreen_display_modes(displayID, count)
    if not result:
        raise get_error()
    return result


fn get_closest_fullscreen_display_mode(
    displayID: DisplayID,
    w: Int32,
    h: Int32,
    refresh_rate: Float32,
    include_high_density_modes: Bool,
    closest: Ptr[DisplayMode, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetClosestFullscreenDisplayMode
    """
    var success = get_sdl3_function_table().get_closest_fullscreen_display_mode(
        displayID, w, h, refresh_rate, include_high_density_modes, closest
    )
    if not success:
        raise get_error()


fn get_desktop_display_mode(displayID: DisplayID) raises -> Ptr[DisplayMode, ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDesktopDisplayMode
    """
    var result = get_sdl3_function_table().get_desktop_display_mode(displayID)
    if not result:
        raise get_error()
    return result


fn get_current_display_mode(displayID: DisplayID) raises -> Ptr[DisplayMode, ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentDisplayMode
    """
    var result = get_sdl3_function_table().get_current_display_mode(displayID)
    if not result:
        raise get_error()
    return result


fn get_display_for_point(point: Ptr[Point, ImmutAnyOrigin]) -> DisplayID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayForPoint
    """
    return get_sdl3_function_table().get_display_for_point(point)


fn get_display_for_rect(rect: Ptr[Rect, ImmutAnyOrigin]) -> DisplayID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayForRect
    """
    return get_sdl3_function_table().get_display_for_rect(rect)


fn get_display_for_window(window: Ptr[Window, MutAnyOrigin]) -> DisplayID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayForWindow
    """
    return get_sdl3_function_table().get_display_for_window(window)


fn get_window_pixel_density(window: Ptr[Window, MutAnyOrigin]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowPixelDensity
    """
    return get_sdl3_function_table().get_window_pixel_density(window)


fn get_window_display_scale(window: Ptr[Window, MutAnyOrigin]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowDisplayScale
    """
    return get_sdl3_function_table().get_window_display_scale(window)


fn set_window_fullscreen_mode(
    window: Ptr[Window, MutAnyOrigin], mode: Ptr[DisplayMode, ImmutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowFullscreenMode
    """
    var success = get_sdl3_function_table().set_window_fullscreen_mode(window, mode)
    if not success:
        raise get_error()


fn get_window_fullscreen_mode(
    window: Ptr[Window, MutAnyOrigin]
) raises -> Ptr[DisplayMode, ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowFullscreenMode
    """
    var result = get_sdl3_function_table().get_window_fullscreen_mode(window)
    if not result:
        raise "Error in get_window_fullscreen_mode call. See official documentation for details."
    return result


fn get_window_icc_profile(
    window: Ptr[Window, MutAnyOrigin], size: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[NoneType, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowICCProfile
    """
    var result = get_sdl3_function_table().get_window_icc_profile(window, size)
    if not result:
        raise get_error()
    return result


fn get_window_pixel_format(window: Ptr[Window, MutAnyOrigin]) -> PixelFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowPixelFormat
    """
    return get_sdl3_function_table().get_window_pixel_format(window)


fn get_windows(
    count: Ptr[Int32, MutAnyOrigin]
) raises -> Ptr[Ptr[Window, MutOrigin.external], MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindows
    """
    var result = get_sdl3_function_table().get_windows(count)
    if not result:
        raise get_error()
    return result


fn create_window(
    title: CStringSlice, w: Int32, h: Int32, flags: WindowFlags
) raises -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateWindow
    """
    var result = get_sdl3_function_table().create_window(title.unsafe_ptr(), w, h, flags)
    if not result:
        raise get_error()
    return result


fn create_popup_window(
    parent: Ptr[Window, MutAnyOrigin],
    offset_x: Int32,
    offset_y: Int32,
    w: Int32,
    h: Int32,
    flags: WindowFlags,
) raises -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreatePopupWindow
    """
    var result = get_sdl3_function_table().create_popup_window(
        parent, offset_x, offset_y, w, h, flags
    )
    if not result:
        raise get_error()
    return result


fn create_window_with_properties(props: PropertiesID) raises -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateWindowWithProperties
    """
    var result = get_sdl3_function_table().create_window_with_properties(props)
    if not result:
        raise get_error()
    return result


fn get_window_id(window: Ptr[Window, MutAnyOrigin]) -> WindowID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowID
    """
    return get_sdl3_function_table().get_window_id(window)


fn get_window_from_id(id: WindowID) raises -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowFromID
    """
    var result = get_sdl3_function_table().get_window_from_id(id)
    if not result:
        raise get_error()
    return result


fn get_window_parent(window: Ptr[Window, MutAnyOrigin]) raises -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowParent
    """
    var result = get_sdl3_function_table().get_window_parent(window)
    if not result:
        raise "Error in get_window_parent call. See official documentation for details."
    return result


fn get_window_properties(window: Ptr[Window, MutAnyOrigin]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowProperties
    """
    return get_sdl3_function_table().get_window_properties(window)


fn get_window_flags(window: Ptr[Window, MutAnyOrigin]) -> WindowFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowFlags
    """
    return get_sdl3_function_table().get_window_flags(window)


fn set_window_title(window: Ptr[Window, MutAnyOrigin], title: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowTitle
    """
    var success = get_sdl3_function_table().set_window_title(window, title.unsafe_ptr())
    if not success:
        raise get_error()


fn get_window_title(window: Ptr[Window, MutAnyOrigin]) -> CStringSlice[ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowTitle
    """
    var cstring = get_sdl3_function_table().get_window_title(window)
    return CStringSlice(unsafe_from_ptr=cstring)


fn set_window_icon(window: Ptr[Window, MutAnyOrigin], icon: Ptr[Surface, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowIcon
    """
    var success = get_sdl3_function_table().set_window_icon(window, icon)
    if not success:
        raise get_error()


fn set_window_position(window: Ptr[Window, MutAnyOrigin], x: Int32, y: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowPosition
    """
    var success = get_sdl3_function_table().set_window_position(window, x, y)
    if not success:
        raise get_error()


fn get_window_position(
    window: Ptr[Window, MutAnyOrigin], x: Ptr[Int32, MutAnyOrigin], y: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowPosition
    """
    var success = get_sdl3_function_table().get_window_position(window, x, y)
    if not success:
        raise get_error()


fn set_window_size(window: Ptr[Window, MutAnyOrigin], w: Int32, h: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowSize
    """
    var success = get_sdl3_function_table().set_window_size(window, w, h)
    if not success:
        raise get_error()


fn get_window_size(
    window: Ptr[Window, MutAnyOrigin], w: Ptr[Int32, MutAnyOrigin], h: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSize
    """
    var success = get_sdl3_function_table().get_window_size(window, w, h)
    if not success:
        raise get_error()


fn get_window_safe_area(window: Ptr[Window, MutAnyOrigin], rect: Ptr[Rect, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSafeArea
    """
    var success = get_sdl3_function_table().get_window_safe_area(window, rect)
    if not success:
        raise get_error()


fn set_window_aspect_ratio(
    window: Ptr[Window, MutAnyOrigin], min_aspect: Float32, max_aspect: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowAspectRatio
    """
    var success = get_sdl3_function_table().set_window_aspect_ratio(window, min_aspect, max_aspect)
    if not success:
        raise get_error()


fn get_window_aspect_ratio(
    window: Ptr[Window, MutAnyOrigin],
    min_aspect: Ptr[Float32, MutAnyOrigin],
    max_aspect: Ptr[Float32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowAspectRatio
    """
    var success = get_sdl3_function_table().get_window_aspect_ratio(window, min_aspect, max_aspect)
    if not success:
        raise get_error()


fn get_window_borders_size(
    window: Ptr[Window, MutAnyOrigin],
    top: Ptr[Int32, MutAnyOrigin],
    left: Ptr[Int32, MutAnyOrigin],
    bottom: Ptr[Int32, MutAnyOrigin],
    right: Ptr[Int32, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowBordersSize
    """
    var success = get_sdl3_function_table().get_window_borders_size(
        window, top, left, bottom, right
    )
    if not success:
        raise get_error()


fn get_window_size_in_pixels(
    window: Ptr[Window, MutAnyOrigin], w: Ptr[Int32, MutAnyOrigin], h: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSizeInPixels
    """
    var success = get_sdl3_function_table().get_window_size_in_pixels(window, w, h)
    if not success:
        raise get_error()


fn set_window_minimum_size(window: Ptr[Window, MutAnyOrigin], min_w: Int32, min_h: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowMinimumSize
    """
    var success = get_sdl3_function_table().set_window_minimum_size(window, min_w, min_h)
    if not success:
        raise get_error()


fn get_window_minimum_size(
    window: Ptr[Window, MutAnyOrigin], w: Ptr[Int32, MutAnyOrigin], h: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowMinimumSize
    """
    var success = get_sdl3_function_table().get_window_minimum_size(window, w, h)
    if not success:
        raise get_error()


fn set_window_maximum_size(window: Ptr[Window, MutAnyOrigin], max_w: Int32, max_h: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowMaximumSize
    """
    var success = get_sdl3_function_table().set_window_maximum_size(window, max_w, max_h)
    if not success:
        raise get_error()


fn get_window_maximum_size(
    window: Ptr[Window, MutAnyOrigin], w: Ptr[Int32, MutAnyOrigin], h: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowMaximumSize
    """
    var success = get_sdl3_function_table().get_window_maximum_size(window, w, h)
    if not success:
        raise get_error()


fn set_window_bordered(window: Ptr[Window, MutAnyOrigin], bordered: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowBordered
    """
    var success = get_sdl3_function_table().set_window_bordered(window, bordered)
    if not success:
        raise get_error()


fn set_window_resizable(window: Ptr[Window, MutAnyOrigin], resizable: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowResizable
    """
    var success = get_sdl3_function_table().set_window_resizable(window, resizable)
    if not success:
        raise get_error()


fn set_window_always_on_top(window: Ptr[Window, MutAnyOrigin], on_top: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowAlwaysOnTop
    """
    var success = get_sdl3_function_table().set_window_always_on_top(window, on_top)
    if not success:
        raise get_error()


fn show_window(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ShowWindow
    """
    var success = get_sdl3_function_table().show_window(window)
    if not success:
        raise get_error()


fn hide_window(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HideWindow
    """
    var success = get_sdl3_function_table().hide_window(window)
    if not success:
        raise get_error()


fn raise_window(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RaiseWindow
    """
    var success = get_sdl3_function_table().raise_window(window)
    if not success:
        raise get_error()


fn maximize_window(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MaximizeWindow
    """
    var success = get_sdl3_function_table().maximize_window(window)
    if not success:
        raise get_error()


fn minimize_window(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MinimizeWindow
    """
    var success = get_sdl3_function_table().minimize_window(window)
    if not success:
        raise get_error()


fn restore_window(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RestoreWindow
    """
    var success = get_sdl3_function_table().restore_window(window)
    if not success:
        raise get_error()


fn set_window_fullscreen(window: Ptr[Window, MutAnyOrigin], fullscreen: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowFullscreen
    """
    var success = get_sdl3_function_table().set_window_fullscreen(window, fullscreen)
    if not success:
        raise get_error()


fn sync_window(window: Ptr[Window, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SyncWindow
    """
    return get_sdl3_function_table().sync_window(window)


fn window_has_surface(window: Ptr[Window, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WindowHasSurface
    """
    return get_sdl3_function_table().window_has_surface(window)


fn get_window_surface(
    window: Ptr[Window, MutAnyOrigin]
) raises -> Ptr[Surface, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSurface
    """
    var result = get_sdl3_function_table().get_window_surface(window)
    if not result:
        raise get_error()
    return result


fn set_window_surface_v_sync(window: Ptr[Window, MutAnyOrigin], vsync: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowSurfaceVSync
    """
    var success = get_sdl3_function_table().set_window_surface_v_sync(window, vsync)
    if not success:
        raise get_error()


fn get_window_surface_v_sync(
    window: Ptr[Window, MutAnyOrigin], vsync: Ptr[Int32, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSurfaceVSync
    """
    var success = get_sdl3_function_table().get_window_surface_v_sync(window, vsync)
    if not success:
        raise get_error()


fn update_window_surface(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateWindowSurface
    """
    var success = get_sdl3_function_table().update_window_surface(window)
    if not success:
        raise get_error()


fn update_window_surface_rects(
    window: Ptr[Window, MutAnyOrigin], rects: Ptr[Rect, ImmutAnyOrigin], numrects: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateWindowSurfaceRects
    """
    var success = get_sdl3_function_table().update_window_surface_rects(window, rects, numrects)
    if not success:
        raise get_error()


fn destroy_window_surface(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyWindowSurface
    """
    var success = get_sdl3_function_table().destroy_window_surface(window)
    if not success:
        raise get_error()


fn set_window_keyboard_grab(window: Ptr[Window, MutAnyOrigin], grabbed: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowKeyboardGrab
    """
    var success = get_sdl3_function_table().set_window_keyboard_grab(window, grabbed)
    if not success:
        raise get_error()


fn set_window_mouse_grab(window: Ptr[Window, MutAnyOrigin], grabbed: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowMouseGrab
    """
    var success = get_sdl3_function_table().set_window_mouse_grab(window, grabbed)
    if not success:
        raise get_error()


fn get_window_keyboard_grab(window: Ptr[Window, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowKeyboardGrab
    """
    return get_sdl3_function_table().get_window_keyboard_grab(window)


fn get_window_mouse_grab(window: Ptr[Window, MutAnyOrigin]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowMouseGrab
    """
    return get_sdl3_function_table().get_window_mouse_grab(window)


fn get_grabbed_window() raises -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGrabbedWindow
    """
    var result = get_sdl3_function_table().get_grabbed_window()
    if not result:
        raise "Error in get_grabbed_window call. See official documentation for details."
    return result


fn set_window_mouse_rect(
    window: Ptr[Window, MutAnyOrigin], rect: Ptr[Rect, ImmutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowMouseRect
    """
    var success = get_sdl3_function_table().set_window_mouse_rect(window, rect)
    if not success:
        raise get_error()


fn get_window_mouse_rect(
    window: Ptr[Window, MutAnyOrigin]
) raises -> Ptr[Rect, ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowMouseRect
    """
    var result = get_sdl3_function_table().get_window_mouse_rect(window)
    if not result:
        raise "Error in get_window_mouse_rect call. See official documentation for details."
    return result


fn set_window_opacity(window: Ptr[Window, MutAnyOrigin], opacity: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowOpacity
    """
    var success = get_sdl3_function_table().set_window_opacity(window, opacity)
    if not success:
        raise get_error()


fn get_window_opacity(window: Ptr[Window, MutAnyOrigin]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowOpacity
    """
    return get_sdl3_function_table().get_window_opacity(window)


fn set_window_parent(window: Ptr[Window, MutAnyOrigin], parent: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowParent
    """
    var success = get_sdl3_function_table().set_window_parent(window, parent)
    if not success:
        raise get_error()


fn set_window_modal(window: Ptr[Window, MutAnyOrigin], modal: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowModal
    """
    var success = get_sdl3_function_table().set_window_modal(window, modal)
    if not success:
        raise get_error()


fn set_window_focusable(window: Ptr[Window, MutAnyOrigin], focusable: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowFocusable
    """
    var success = get_sdl3_function_table().set_window_focusable(window, focusable)
    if not success:
        raise get_error()


fn show_window_system_menu(window: Ptr[Window, MutAnyOrigin], x: Int32, y: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ShowWindowSystemMenu
    """
    var success = get_sdl3_function_table().show_window_system_menu(window, x, y)
    if not success:
        raise get_error()


fn set_window_hit_test(
    window: Ptr[Window, MutAnyOrigin], callback: HitTest, callback_data: Ptr[NoneType, MutAnyOrigin]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowHitTest
    """
    var success = get_sdl3_function_table().set_window_hit_test(window, callback, callback_data)
    if not success:
        raise get_error()


fn set_window_shape(window: Ptr[Window, MutAnyOrigin], shape: Ptr[Surface, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowShape
    """
    var success = get_sdl3_function_table().set_window_shape(window, shape)
    if not success:
        raise get_error()


fn flash_window(window: Ptr[Window, MutAnyOrigin], operation: FlashOperation) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlashWindow
    """
    var success = get_sdl3_function_table().flash_window(window, operation)
    if not success:
        raise get_error()


fn destroy_window(window: Ptr[Window, MutAnyOrigin]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyWindow
    """
    get_sdl3_function_table().destroy_window(window)


fn screen_saver_enabled() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ScreenSaverEnabled
    """
    return get_sdl3_function_table().screen_saver_enabled()


fn enable_screen_saver() raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EnableScreenSaver
    """
    var success = get_sdl3_function_table().enable_screen_saver()
    if not success:
        raise get_error()


fn disable_screen_saver() raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DisableScreenSaver
    """
    var success = get_sdl3_function_table().disable_screen_saver()
    if not success:
        raise get_error()


fn gl_load_library(path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_LoadLibrary
    """
    var success = get_sdl3_function_table().gl_load_library(path.unsafe_ptr())
    if not success:
        raise get_error()


fn gl_get_proc_address(proc: CStringSlice) -> FunctionPointer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_GetProcAddress
    """
    return get_sdl3_function_table().gl_get_proc_address(proc.unsafe_ptr())


fn egl_get_proc_address(proc: CStringSlice) -> FunctionPointer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EGL_GetProcAddress
    """
    return get_sdl3_function_table().egl_get_proc_address(proc.unsafe_ptr())


fn gl_unload_library():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_UnloadLibrary
    """
    get_sdl3_function_table().gl_unload_library()


fn gl_extension_supported(extension: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_ExtensionSupported
    """
    return get_sdl3_function_table().gl_extension_supported(extension.unsafe_ptr())


fn gl_reset_attributes():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_ResetAttributes
    """
    get_sdl3_function_table().gl_reset_attributes()


fn gl_set_attribute(attr: GLAttr, value: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_SetAttribute
    """
    var success = get_sdl3_function_table().gl_set_attribute(attr, value)
    if not success:
        raise get_error()


fn gl_get_attribute(attr: GLAttr, value: Ptr[Int32, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_GetAttribute
    """
    var success = get_sdl3_function_table().gl_get_attribute(attr, value)
    if not success:
        raise get_error()


fn gl_create_context(window: Ptr[Window, MutAnyOrigin]) -> GLContext:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_CreateContext
    """
    return get_sdl3_function_table().gl_create_context(window)


fn gl_make_current(window: Ptr[Window, MutAnyOrigin], context: GLContext) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_MakeCurrent
    """
    var success = get_sdl3_function_table().gl_make_current(window, context)
    if not success:
        raise get_error()


fn gl_get_current_window() raises -> Ptr[Window, MutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_GetCurrentWindow
    """
    var result = get_sdl3_function_table().gl_get_current_window()
    if not result:
        raise get_error()
    return result


fn gl_get_current_context() -> GLContext:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_GetCurrentContext
    """
    return get_sdl3_function_table().gl_get_current_context()


fn egl_get_current_display() -> EGLDisplay:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EGL_GetCurrentDisplay
    """
    return get_sdl3_function_table().egl_get_current_display()


fn egl_get_current_config() -> EGLConfig:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EGL_GetCurrentConfig
    """
    return get_sdl3_function_table().egl_get_current_config()


fn egl_get_window_surface(window: Ptr[Window, MutAnyOrigin]) -> EGLSurface:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EGL_GetWindowSurface
    """
    return get_sdl3_function_table().egl_get_window_surface(window)


fn egl_set_attribute_callbacks(
    platformAttribCallback: EGLAttribArrayCallback,
    surfaceAttribCallback: EGLIntArrayCallback,
    contextAttribCallback: EGLIntArrayCallback,
    userdata: Ptr[NoneType, MutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EGL_SetAttributeCallbacks
    """
    get_sdl3_function_table().egl_set_attribute_callbacks(
        platformAttribCallback, surfaceAttribCallback, contextAttribCallback, userdata
    )


fn gl_set_swap_interval(interval: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_SetSwapInterval
    """
    var success = get_sdl3_function_table().gl_set_swap_interval(interval)
    if not success:
        raise get_error()


fn gl_get_swap_interval(interval: Ptr[Int32, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_GetSwapInterval
    """
    var success = get_sdl3_function_table().gl_get_swap_interval(interval)
    if not success:
        raise get_error()


fn gl_swap_window(window: Ptr[Window, MutAnyOrigin]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_SwapWindow
    """
    var success = get_sdl3_function_table().gl_swap_window(window)
    if not success:
        raise get_error()


fn gl_destroy_context(context: GLContext) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_DestroyContext
    """
    var success = get_sdl3_function_table().gl_destroy_context(context)
    if not success:
        raise get_error()


fn vulkan_load_library(path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_LoadLibrary
    """
    var success = get_sdl3_function_table().vulkan_load_library(path.unsafe_ptr())
    if not success:
        raise get_error()


fn vulkan_get_vk_get_instance_proc_addr() -> FunctionPointer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_GetVkGetInstanceProcAddr
    """
    return get_sdl3_function_table().vulkan_get_vk_get_instance_proc_addr()


fn vulkan_unload_library():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_UnloadLibrary
    """
    get_sdl3_function_table().vulkan_unload_library()


fn vulkan_get_instance_extensions(
    count: Ptr[UInt32, MutAnyOrigin]
) raises -> Ptr[Ptr[c_char, ImmutOrigin.external], ImmutOrigin.external]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_GetInstanceExtensions
    """
    var result = get_sdl3_function_table().vulkan_get_instance_extensions(count)
    if not result:
        raise get_error()
    return result


fn vulkan_create_surface(
    window: Ptr[Window, MutAnyOrigin],
    instance: VkInstance,
    allocator: Ptr[VkAllocationCallbacks, ImmutAnyOrigin],
    surface: Ptr[VkSurfaceKHR, MutAnyOrigin],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_CreateSurface
    """
    var success = get_sdl3_function_table().vulkan_create_surface(
        window, instance, allocator, surface
    )
    if not success:
        raise get_error()


fn vulkan_destroy_surface(
    instance: VkInstance,
    surface: VkSurfaceKHR,
    allocator: Ptr[VkAllocationCallbacks, ImmutAnyOrigin],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_DestroySurface
    """
    get_sdl3_function_table().vulkan_destroy_surface(instance, surface, allocator)


fn vulkan_get_presentation_support(
    instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: UInt32
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_GetPresentationSupport
    """
    return get_sdl3_function_table().vulkan_get_presentation_support(
        instance, physicalDevice, queueFamilyIndex
    )
