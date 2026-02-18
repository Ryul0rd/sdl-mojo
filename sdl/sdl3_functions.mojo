from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *
from .sdl3_function_table import get_sdl3_function_table
from ffi import CStringSlice, c_char


comptime Ptr = UnsafePointer


fn get_num_audio_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumAudioDrivers
    """
    return get_sdl3_function_table().get_num_audio_drivers()


fn get_audio_driver(index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDriver
    """
    var cstring = get_sdl3_function_table().get_audio_driver(Ptr(to=index).bitcast[Int32]()[])
    if not cstring.unsafe_ptr():
        raise "Error in get_audio_driver call. See official documentation for details."
    return cstring


fn get_current_audio_driver() raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentAudioDriver
    """
    var cstring = get_sdl3_function_table().get_current_audio_driver()
    if not cstring.unsafe_ptr():
        raise "Error in get_current_audio_driver call. See official documentation for details."
    return cstring


fn get_audio_playback_devices(count: Ptr[Int32]) raises -> Ptr[AudioDeviceID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioPlaybackDevices
    """
    var result = get_sdl3_function_table().get_audio_playback_devices(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_audio_recording_devices(count: Ptr[Int32]) raises -> Ptr[AudioDeviceID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioRecordingDevices
    """
    var result = get_sdl3_function_table().get_audio_recording_devices(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_audio_device_name(devid: AudioDeviceID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceName
    """
    var cstring = get_sdl3_function_table().get_audio_device_name(
        Ptr(to=devid).bitcast[AudioDeviceID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_audio_device_format(
    devid: AudioDeviceID, spec: Ptr[AudioSpec], sample_frames: Ptr[Int32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceFormat
    """
    var success = get_sdl3_function_table().get_audio_device_format(
        Ptr(to=devid).bitcast[AudioDeviceID]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        Ptr(to=sample_frames).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_audio_device_channel_map(
    devid: AudioDeviceID, count: Ptr[Int32]
) raises -> Ptr[Int32, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceChannelMap
    """
    var result = get_sdl3_function_table().get_audio_device_channel_map(
        Ptr(to=devid).bitcast[AudioDeviceID]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise "Error in get_audio_device_channel_map call. See official documentation for details."
    return result


fn open_audio_device(devid: AudioDeviceID, spec: Ptr[AudioSpec]) -> AudioDeviceID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenAudioDevice
    """
    return get_sdl3_function_table().open_audio_device(
        Ptr(to=devid).bitcast[AudioDeviceID]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
    )


fn is_audio_device_physical(devid: AudioDeviceID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsAudioDevicePhysical
    """
    return get_sdl3_function_table().is_audio_device_physical(
        Ptr(to=devid).bitcast[AudioDeviceID]()[]
    )


fn is_audio_device_playback(devid: AudioDeviceID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsAudioDevicePlayback
    """
    return get_sdl3_function_table().is_audio_device_playback(
        Ptr(to=devid).bitcast[AudioDeviceID]()[]
    )


fn pause_audio_device(devid: AudioDeviceID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PauseAudioDevice
    """
    var success = get_sdl3_function_table().pause_audio_device(
        Ptr(to=devid).bitcast[AudioDeviceID]()[]
    )
    if not success:
        raise get_error()


fn resume_audio_device(devid: AudioDeviceID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResumeAudioDevice
    """
    var success = get_sdl3_function_table().resume_audio_device(
        Ptr(to=devid).bitcast[AudioDeviceID]()[]
    )
    if not success:
        raise get_error()


fn audio_device_paused(devid: AudioDeviceID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AudioDevicePaused
    """
    return get_sdl3_function_table().audio_device_paused(Ptr(to=devid).bitcast[AudioDeviceID]()[])


fn get_audio_device_gain(devid: AudioDeviceID) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceGain
    """
    return get_sdl3_function_table().get_audio_device_gain(
        Ptr(to=devid).bitcast[AudioDeviceID]()[]
    )


fn set_audio_device_gain(devid: AudioDeviceID, gain: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioDeviceGain
    """
    var success = get_sdl3_function_table().set_audio_device_gain(
        Ptr(to=devid).bitcast[AudioDeviceID]()[], Ptr(to=gain).bitcast[Float32]()[]
    )
    if not success:
        raise get_error()


fn close_audio_device(devid: AudioDeviceID):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseAudioDevice
    """
    get_sdl3_function_table().close_audio_device(Ptr(to=devid).bitcast[AudioDeviceID]()[])


fn bind_audio_streams(
    devid: AudioDeviceID, streams: Ptr[Ptr[AudioStream, MutExternalOrigin]], num_streams: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindAudioStreams
    """
    var success = get_sdl3_function_table().bind_audio_streams(
        Ptr(to=devid).bitcast[AudioDeviceID]()[],
        Ptr(to=streams).bitcast[Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_streams).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn bind_audio_stream(devid: AudioDeviceID, stream: Ptr[AudioStream]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindAudioStream
    """
    var success = get_sdl3_function_table().bind_audio_stream(
        Ptr(to=devid).bitcast[AudioDeviceID]()[],
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn unbind_audio_streams(streams: Ptr[Ptr[AudioStream, MutExternalOrigin]], num_streams: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnbindAudioStreams
    """
    get_sdl3_function_table().unbind_audio_streams(
        Ptr(to=streams).bitcast[Ptr[Ptr[AudioStream, MutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_streams).bitcast[Int32]()[],
    )


fn unbind_audio_stream(stream: Ptr[AudioStream]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnbindAudioStream
    """
    get_sdl3_function_table().unbind_audio_stream(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )


fn get_audio_stream_device(stream: Ptr[AudioStream]) -> AudioDeviceID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamDevice
    """
    return get_sdl3_function_table().get_audio_stream_device(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )


fn create_audio_stream(
    src_spec: Ptr[AudioSpec], dst_spec: Ptr[AudioSpec]
) raises -> Ptr[AudioStream, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateAudioStream
    """
    var result = get_sdl3_function_table().create_audio_stream(
        Ptr(to=src_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        Ptr(to=dst_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn get_audio_stream_properties(stream: Ptr[AudioStream]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamProperties
    """
    return get_sdl3_function_table().get_audio_stream_properties(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )


fn get_audio_stream_format(
    stream: Ptr[AudioStream], src_spec: Ptr[AudioSpec], dst_spec: Ptr[AudioSpec]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamFormat
    """
    var success = get_sdl3_function_table().get_audio_stream_format(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=src_spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        Ptr(to=dst_spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_audio_stream_format(
    stream: Ptr[AudioStream], src_spec: Ptr[AudioSpec], dst_spec: Ptr[AudioSpec]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamFormat
    """
    var success = get_sdl3_function_table().set_audio_stream_format(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=src_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        Ptr(to=dst_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_audio_stream_frequency_ratio(stream: Ptr[AudioStream]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamFrequencyRatio
    """
    return get_sdl3_function_table().get_audio_stream_frequency_ratio(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )


fn set_audio_stream_frequency_ratio(stream: Ptr[AudioStream], ratio: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamFrequencyRatio
    """
    var success = get_sdl3_function_table().set_audio_stream_frequency_ratio(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=ratio).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_audio_stream_gain(stream: Ptr[AudioStream]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamGain
    """
    return get_sdl3_function_table().get_audio_stream_gain(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )


fn set_audio_stream_gain(stream: Ptr[AudioStream], gain: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamGain
    """
    var success = get_sdl3_function_table().set_audio_stream_gain(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=gain).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_audio_stream_input_channel_map(
    stream: Ptr[AudioStream], count: Ptr[Int32]
) raises -> Ptr[Int32, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamInputChannelMap
    """
    var result = get_sdl3_function_table().get_audio_stream_input_channel_map(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise "Error in get_audio_stream_input_channel_map call. See official documentation for details."
    return result


fn get_audio_stream_output_channel_map(
    stream: Ptr[AudioStream], count: Ptr[Int32]
) raises -> Ptr[Int32, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamOutputChannelMap
    """
    var result = get_sdl3_function_table().get_audio_stream_output_channel_map(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise "Error in get_audio_stream_output_channel_map call. See official documentation for details."
    return result


fn set_audio_stream_input_channel_map(
    stream: Ptr[AudioStream], chmap: Ptr[Int32], count: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamInputChannelMap
    """
    var success = get_sdl3_function_table().set_audio_stream_input_channel_map(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=chmap).bitcast[Ptr[Int32, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn set_audio_stream_output_channel_map(
    stream: Ptr[AudioStream], chmap: Ptr[Int32], count: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamOutputChannelMap
    """
    var success = get_sdl3_function_table().set_audio_stream_output_channel_map(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=chmap).bitcast[Ptr[Int32, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn put_audio_stream_data(stream: Ptr[AudioStream], buf: Ptr[NoneType], len: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamData
    """
    var success = get_sdl3_function_table().put_audio_stream_data(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=buf).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=len).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn put_audio_stream_data_no_copy(
    stream: Ptr[AudioStream],
    buf: Ptr[NoneType],
    len: Int32,
    callback: AudioStreamDataCompleteCallback,
    userdata: Ptr[NoneType],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamDataNoCopy
    """
    var success = get_sdl3_function_table().put_audio_stream_data_no_copy(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=buf).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=len).bitcast[Int32]()[],
        Ptr(to=callback).bitcast[AudioStreamDataCompleteCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn put_audio_stream_planar_data(
    stream: Ptr[AudioStream],
    channel_buffers: Ptr[Ptr[NoneType, ImmutExternalOrigin]],
    num_channels: Int32,
    num_samples: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamPlanarData
    """
    var success = get_sdl3_function_table().put_audio_stream_planar_data(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=channel_buffers).bitcast[Ptr[Ptr[NoneType, ImmutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_channels).bitcast[Int32]()[],
        Ptr(to=num_samples).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_audio_stream_data(stream: Ptr[AudioStream], buf: Ptr[NoneType], len: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamData
    """
    return get_sdl3_function_table().get_audio_stream_data(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=buf).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=len).bitcast[Int32]()[],
    )


fn get_audio_stream_available(stream: Ptr[AudioStream]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamAvailable
    """
    return get_sdl3_function_table().get_audio_stream_available(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )


fn get_audio_stream_queued(stream: Ptr[AudioStream]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamQueued
    """
    return get_sdl3_function_table().get_audio_stream_queued(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )


fn flush_audio_stream(stream: Ptr[AudioStream]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushAudioStream
    """
    var success = get_sdl3_function_table().flush_audio_stream(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn clear_audio_stream(stream: Ptr[AudioStream]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearAudioStream
    """
    var success = get_sdl3_function_table().clear_audio_stream(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn pause_audio_stream_device(stream: Ptr[AudioStream]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PauseAudioStreamDevice
    """
    var success = get_sdl3_function_table().pause_audio_stream_device(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn resume_audio_stream_device(stream: Ptr[AudioStream]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResumeAudioStreamDevice
    """
    var success = get_sdl3_function_table().resume_audio_stream_device(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn audio_stream_device_paused(stream: Ptr[AudioStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AudioStreamDevicePaused
    """
    return get_sdl3_function_table().audio_stream_device_paused(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )


fn lock_audio_stream(stream: Ptr[AudioStream]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockAudioStream
    """
    var success = get_sdl3_function_table().lock_audio_stream(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn unlock_audio_stream(stream: Ptr[AudioStream]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnlockAudioStream
    """
    var success = get_sdl3_function_table().unlock_audio_stream(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn set_audio_stream_get_callback(
    stream: Ptr[AudioStream], callback: AudioStreamCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamGetCallback
    """
    var success = get_sdl3_function_table().set_audio_stream_get_callback(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=callback).bitcast[AudioStreamCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_audio_stream_put_callback(
    stream: Ptr[AudioStream], callback: AudioStreamCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamPutCallback
    """
    var success = get_sdl3_function_table().set_audio_stream_put_callback(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        Ptr(to=callback).bitcast[AudioStreamCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn destroy_audio_stream(stream: Ptr[AudioStream]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyAudioStream
    """
    get_sdl3_function_table().destroy_audio_stream(
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[]
    )


fn open_audio_device_stream(
    devid: AudioDeviceID,
    spec: Ptr[AudioSpec],
    callback: AudioStreamCallback,
    userdata: Ptr[NoneType],
) raises -> Ptr[AudioStream, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenAudioDeviceStream
    """
    var result = get_sdl3_function_table().open_audio_device_stream(
        Ptr(to=devid).bitcast[AudioDeviceID]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        Ptr(to=callback).bitcast[AudioStreamCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn set_audio_postmix_callback(
    devid: AudioDeviceID, callback: AudioPostmixCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAudioPostmixCallback
    """
    var success = get_sdl3_function_table().set_audio_postmix_callback(
        Ptr(to=devid).bitcast[AudioDeviceID]()[],
        Ptr(to=callback).bitcast[AudioPostmixCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn load_wav_io(
    src: Ptr[IOStream],
    closeio: Bool,
    spec: Ptr[AudioSpec],
    audio_buf: Ptr[Ptr[UInt8, MutExternalOrigin]],
    audio_len: Ptr[UInt32],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadWAV_IO
    """
    return get_sdl3_function_table().load_wav_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        Ptr(to=audio_buf).bitcast[Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin]]()[],
        Ptr(to=audio_len).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
    )


fn load_wav(
    path: CStringSlice,
    spec: Ptr[AudioSpec],
    audio_buf: Ptr[Ptr[UInt8, MutExternalOrigin]],
    audio_len: Ptr[UInt32],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadWAV
    """
    return get_sdl3_function_table().load_wav(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        Ptr(to=audio_buf).bitcast[Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin]]()[],
        Ptr(to=audio_len).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
    )


fn mix_audio(
    dst: Ptr[UInt8], src: Ptr[UInt8], format: AudioFormat, len: UInt32, volume: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MixAudio
    """
    var success = get_sdl3_function_table().mix_audio(
        Ptr(to=dst).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=src).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
        Ptr(to=format).bitcast[AudioFormat]()[],
        Ptr(to=len).bitcast[UInt32]()[],
        Ptr(to=volume).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn convert_audio_samples(
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
    var success = get_sdl3_function_table().convert_audio_samples(
        Ptr(to=src_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        Ptr(to=src_data).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
        Ptr(to=src_len).bitcast[Int32]()[],
        Ptr(to=dst_spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        Ptr(to=dst_data).bitcast[Ptr[Ptr[UInt8, MutExternalOrigin], MutExternalOrigin]]()[],
        Ptr(to=dst_len).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_audio_format_name(format: AudioFormat) -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAudioFormatName
    """
    var cstring = get_sdl3_function_table().get_audio_format_name(
        Ptr(to=format).bitcast[AudioFormat]()[]
    )
    return cstring


fn get_silence_value_for_format(format: AudioFormat) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSilenceValueForFormat
    """
    return get_sdl3_function_table().get_silence_value_for_format(
        Ptr(to=format).bitcast[AudioFormat]()[]
    )


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
        Ptr(to=srcColorFactor).bitcast[BlendFactor]()[],
        Ptr(to=dstColorFactor).bitcast[BlendFactor]()[],
        Ptr(to=colorOperation).bitcast[BlendOperation]()[],
        Ptr(to=srcAlphaFactor).bitcast[BlendFactor]()[],
        Ptr(to=dstAlphaFactor).bitcast[BlendFactor]()[],
        Ptr(to=alphaOperation).bitcast[BlendOperation]()[],
    )


fn get_num_camera_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumCameraDrivers
    """
    return get_sdl3_function_table().get_num_camera_drivers()


fn get_camera_driver(index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraDriver
    """
    var cstring = get_sdl3_function_table().get_camera_driver(Ptr(to=index).bitcast[Int32]()[])
    if not cstring.unsafe_ptr():
        raise "Error in get_camera_driver call. See official documentation for details."
    return cstring


fn get_current_camera_driver() raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentCameraDriver
    """
    var cstring = get_sdl3_function_table().get_current_camera_driver()
    if not cstring.unsafe_ptr():
        raise "Error in get_current_camera_driver call. See official documentation for details."
    return cstring


fn get_cameras(count: Ptr[Int32]) raises -> Ptr[CameraID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameras
    """
    var result = get_sdl3_function_table().get_cameras(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_camera_supported_formats(
    instance_id: CameraID, count: Ptr[Int32]
) raises -> Ptr[Ptr[CameraSpec, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraSupportedFormats
    """
    var result = get_sdl3_function_table().get_camera_supported_formats(
        Ptr(to=instance_id).bitcast[CameraID]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn get_camera_name(instance_id: CameraID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraName
    """
    var cstring = get_sdl3_function_table().get_camera_name(
        Ptr(to=instance_id).bitcast[CameraID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_camera_position(instance_id: CameraID) -> CameraPosition:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraPosition
    """
    return get_sdl3_function_table().get_camera_position(Ptr(to=instance_id).bitcast[CameraID]()[])


fn open_camera(
    instance_id: CameraID, spec: Ptr[CameraSpec]
) raises -> Ptr[Camera, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenCamera
    """
    var result = get_sdl3_function_table().open_camera(
        Ptr(to=instance_id).bitcast[CameraID]()[],
        Ptr(to=spec).bitcast[Ptr[CameraSpec, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn get_camera_permission_state(camera: Ptr[Camera]) -> CameraPermissionState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraPermissionState
    """
    return get_sdl3_function_table().get_camera_permission_state(
        Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[]
    )


fn get_camera_id(camera: Ptr[Camera]) -> CameraID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraID
    """
    return get_sdl3_function_table().get_camera_id(
        Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[]
    )


fn get_camera_properties(camera: Ptr[Camera]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraProperties
    """
    return get_sdl3_function_table().get_camera_properties(
        Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[]
    )


fn get_camera_format(camera: Ptr[Camera], spec: Ptr[CameraSpec]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCameraFormat
    """
    var success = get_sdl3_function_table().get_camera_format(
        Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[],
        Ptr(to=spec).bitcast[Ptr[CameraSpec, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn acquire_camera_frame(
    camera: Ptr[Camera], timestampNS: Ptr[UInt64]
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AcquireCameraFrame
    """
    var result = get_sdl3_function_table().acquire_camera_frame(
        Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[],
        Ptr(to=timestampNS).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
    )
    if not result:
        raise "Error in acquire_camera_frame call. See official documentation for details."
    return result


fn release_camera_frame(camera: Ptr[Camera], frame: Ptr[Surface]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseCameraFrame
    """
    get_sdl3_function_table().release_camera_frame(
        Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[],
        Ptr(to=frame).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
    )


fn close_camera(camera: Ptr[Camera]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseCamera
    """
    get_sdl3_function_table().close_camera(
        Ptr(to=camera).bitcast[Ptr[Camera, MutExternalOrigin]]()[]
    )


fn set_clipboard_text(text: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetClipboardText
    """
    var success = get_sdl3_function_table().set_clipboard_text(
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not success:
        raise get_error()


fn get_clipboard_text() -> Ptr[c_char, MutExternalOrigin]:
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
    var success = get_sdl3_function_table().set_primary_selection_text(
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not success:
        raise get_error()


fn get_primary_selection_text() -> Ptr[c_char, MutExternalOrigin]:
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
    userdata: Ptr[NoneType],
    mime_types: Ptr[CStringSlice[ImmutExternalOrigin]],
    num_mime_types: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetClipboardData
    """
    var success = get_sdl3_function_table().set_clipboard_data(
        Ptr(to=callback).bitcast[ClipboardDataCallback]()[],
        Ptr(to=cleanup).bitcast[ClipboardCleanupCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=mime_types).bitcast[Ptr[CStringSlice[ImmutExternalOrigin], MutExternalOrigin]]()[],
        Ptr(to=num_mime_types).bitcast[Int32]()[],
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
    mime_type: CStringSlice, size: Ptr[Int32]
) raises -> Ptr[NoneType, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetClipboardData
    """
    var result = get_sdl3_function_table().get_clipboard_data(
        mime_type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=size).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn has_clipboard_data(mime_type: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasClipboardData
    """
    return get_sdl3_function_table().has_clipboard_data(
        mime_type.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn get_clipboard_mime_types(
    num_mime_types: Ptr[Int32]
) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetClipboardMimeTypes
    """
    var result = get_sdl3_function_table().get_clipboard_mime_types(
        Ptr(to=num_mime_types).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn set_error(fmt: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetError
    """
    return get_sdl3_function_table().set_error(
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn set_error_v(fmt: CStringSlice, ap: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetErrorV
    """
    return get_sdl3_function_table().set_error_v(
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](), Ptr(to=ap).bitcast[Int32]()[]
    )


fn out_of_memory() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OutOfMemory
    """
    return get_sdl3_function_table().out_of_memory()


fn get_error() -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetError
    """
    var cstring = get_sdl3_function_table().get_error()
    return cstring


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
    events: Ptr[Event], numevents: Int32, action: EventAction, minType: UInt32, maxType: UInt32
) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PeepEvents
    """
    return get_sdl3_function_table().peep_events(
        Ptr(to=events).bitcast[Ptr[Event, MutExternalOrigin]]()[],
        Ptr(to=numevents).bitcast[Int32]()[],
        Ptr(to=action).bitcast[EventAction]()[],
        Ptr(to=minType).bitcast[UInt32]()[],
        Ptr(to=maxType).bitcast[UInt32]()[],
    )


fn has_event(type: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasEvent
    """
    return get_sdl3_function_table().has_event(Ptr(to=type).bitcast[UInt32]()[])


fn has_events(minType: UInt32, maxType: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasEvents
    """
    return get_sdl3_function_table().has_events(
        Ptr(to=minType).bitcast[UInt32]()[], Ptr(to=maxType).bitcast[UInt32]()[]
    )


fn flush_event(type: UInt32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushEvent
    """
    get_sdl3_function_table().flush_event(Ptr(to=type).bitcast[UInt32]()[])


fn flush_events(minType: UInt32, maxType: UInt32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushEvents
    """
    get_sdl3_function_table().flush_events(
        Ptr(to=minType).bitcast[UInt32]()[], Ptr(to=maxType).bitcast[UInt32]()[]
    )


fn poll_event(event: Ptr[Event]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PollEvent
    """
    return get_sdl3_function_table().poll_event(
        Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[]
    )


fn wait_event(event: Ptr[Event]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitEvent
    """
    return get_sdl3_function_table().wait_event(
        Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[]
    )


fn wait_event_timeout(event: Ptr[Event], timeoutMS: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitEventTimeout
    """
    return get_sdl3_function_table().wait_event_timeout(
        Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[],
        Ptr(to=timeoutMS).bitcast[Int32]()[],
    )


fn push_event(event: Ptr[Event]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushEvent
    """
    return get_sdl3_function_table().push_event(
        Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[]
    )


fn set_event_filter(filter: EventFilter, userdata: Ptr[NoneType]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetEventFilter
    """
    get_sdl3_function_table().set_event_filter(
        Ptr(to=filter).bitcast[EventFilter]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )


fn get_event_filter(
    filter: Ptr[EventFilter], userdata: Ptr[Ptr[NoneType, MutExternalOrigin]]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetEventFilter
    """
    return get_sdl3_function_table().get_event_filter(
        Ptr(to=filter).bitcast[Ptr[EventFilter, MutExternalOrigin]]()[],
        Ptr(to=userdata).bitcast[Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]]()[],
    )


fn add_event_watch(filter: EventFilter, userdata: Ptr[NoneType]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddEventWatch
    """
    var success = get_sdl3_function_table().add_event_watch(
        Ptr(to=filter).bitcast[EventFilter]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn remove_event_watch(filter: EventFilter, userdata: Ptr[NoneType]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveEventWatch
    """
    get_sdl3_function_table().remove_event_watch(
        Ptr(to=filter).bitcast[EventFilter]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )


fn filter_events(filter: EventFilter, userdata: Ptr[NoneType]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FilterEvents
    """
    get_sdl3_function_table().filter_events(
        Ptr(to=filter).bitcast[EventFilter]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )


fn set_event_enabled(type: UInt32, enabled: Bool):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetEventEnabled
    """
    get_sdl3_function_table().set_event_enabled(
        Ptr(to=type).bitcast[UInt32]()[], Ptr(to=enabled).bitcast[Bool]()[]
    )


fn event_enabled(type: UInt32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EventEnabled
    """
    return get_sdl3_function_table().event_enabled(Ptr(to=type).bitcast[UInt32]()[])


fn register_events(numevents: Int32) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RegisterEvents
    """
    return get_sdl3_function_table().register_events(Ptr(to=numevents).bitcast[Int32]()[])


fn get_window_from_event(event: Ptr[Event]) raises -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowFromEvent
    """
    var result = get_sdl3_function_table().get_window_from_event(
        Ptr(to=event).bitcast[Ptr[Event, ImmutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in get_window_from_event call. See official documentation for details."
    return result


fn get_event_description(event: Ptr[Event], buf: Ptr[c_char], buflen: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetEventDescription
    """
    return get_sdl3_function_table().get_event_description(
        Ptr(to=event).bitcast[Ptr[Event, ImmutExternalOrigin]]()[],
        Ptr(to=buf).bitcast[Ptr[c_char, MutExternalOrigin]]()[],
        Ptr(to=buflen).bitcast[Int32]()[],
    )


fn get_base_path() raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetBasePath
    """
    var cstring = get_sdl3_function_table().get_base_path()
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_pref_path(org: CStringSlice, app: CStringSlice) raises -> Ptr[c_char, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPrefPath
    """
    var result = get_sdl3_function_table().get_pref_path(
        org.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        app.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise "Error in get_pref_path call. See official documentation for details."
    return result


fn get_user_folder(folder: Folder) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetUserFolder
    """
    var cstring = get_sdl3_function_table().get_user_folder(Ptr(to=folder).bitcast[Folder]()[])
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn create_directory(path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateDirectory
    """
    var success = get_sdl3_function_table().create_directory(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not success:
        raise get_error()


fn enumerate_directory(
    path: CStringSlice, callback: EnumerateDirectoryCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EnumerateDirectory
    """
    var success = get_sdl3_function_table().enumerate_directory(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=callback).bitcast[EnumerateDirectoryCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn remove_path(path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemovePath
    """
    var success = get_sdl3_function_table().remove_path(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not success:
        raise get_error()


fn rename_path(oldpath: CStringSlice, newpath: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenamePath
    """
    var success = get_sdl3_function_table().rename_path(
        oldpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        newpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn copy_file(oldpath: CStringSlice, newpath: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CopyFile
    """
    var success = get_sdl3_function_table().copy_file(
        oldpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        newpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn get_path_info(path: CStringSlice, info: Ptr[PathInfo]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPathInfo
    """
    return get_sdl3_function_table().get_path_info(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=info).bitcast[Ptr[PathInfo, MutExternalOrigin]]()[],
    )


fn glob_directory(
    path: CStringSlice, pattern: CStringSlice, flags: GlobFlags, count: Ptr[Int32]
) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GlobDirectory
    """
    var result = get_sdl3_function_table().glob_directory(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        pattern.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=flags).bitcast[GlobFlags]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn get_current_directory() raises -> Ptr[c_char, MutExternalOrigin]:
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
    return get_sdl3_function_table().add_gamepad_mapping(
        mapping.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn add_gamepad_mappings_from_io(src: Ptr[IOStream], closeio: Bool) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddGamepadMappingsFromIO
    """
    return get_sdl3_function_table().add_gamepad_mappings_from_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=closeio).bitcast[Bool]()[]
    )


fn add_gamepad_mappings_from_file(file: CStringSlice) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddGamepadMappingsFromFile
    """
    return get_sdl3_function_table().add_gamepad_mappings_from_file(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn reload_gamepad_mappings() raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReloadGamepadMappings
    """
    var success = get_sdl3_function_table().reload_gamepad_mappings()
    if not success:
        raise get_error()


fn get_gamepad_mappings(
    count: Ptr[Int32]
) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappings
    """
    var result = get_sdl3_function_table().get_gamepad_mappings(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_gamepad_mapping_for_guid(guid: GUID) raises -> Ptr[c_char, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappingForGUID
    """
    var result = get_sdl3_function_table().get_gamepad_mapping_for_guid(
        Ptr(to=guid).bitcast[GUID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_gamepad_mapping(gamepad: Ptr[Gamepad]) raises -> Ptr[c_char, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadMapping
    """
    var result = get_sdl3_function_table().get_gamepad_mapping(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn set_gamepad_mapping(instance_id: JoystickID, mapping: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadMapping
    """
    var success = get_sdl3_function_table().set_gamepad_mapping(
        Ptr(to=instance_id).bitcast[JoystickID]()[],
        mapping.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn has_gamepad() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasGamepad
    """
    return get_sdl3_function_table().has_gamepad()


fn get_gamepads(count: Ptr[Int32]) raises -> Ptr[JoystickID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepads
    """
    var result = get_sdl3_function_table().get_gamepads(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn is_gamepad(instance_id: JoystickID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsGamepad
    """
    return get_sdl3_function_table().is_gamepad(Ptr(to=instance_id).bitcast[JoystickID]()[])


fn get_gamepad_name_for_id(instance_id: JoystickID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadNameForID
    """
    var cstring = get_sdl3_function_table().get_gamepad_name_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_gamepad_path_for_id(instance_id: JoystickID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPathForID
    """
    var cstring = get_sdl3_function_table().get_gamepad_path_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_gamepad_player_index_for_id(instance_id: JoystickID) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPlayerIndexForID
    """
    return get_sdl3_function_table().get_gamepad_player_index_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_gamepad_guid_for_id(instance_id: JoystickID) -> GUID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadGUIDForID
    """
    return get_sdl3_function_table().get_gamepad_guid_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_gamepad_vendor_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadVendorForID
    """
    return get_sdl3_function_table().get_gamepad_vendor_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_gamepad_product_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductForID
    """
    return get_sdl3_function_table().get_gamepad_product_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_gamepad_product_version_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductVersionForID
    """
    return get_sdl3_function_table().get_gamepad_product_version_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_gamepad_type_for_id(instance_id: JoystickID) -> GamepadType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadTypeForID
    """
    return get_sdl3_function_table().get_gamepad_type_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_real_gamepad_type_for_id(instance_id: JoystickID) -> GamepadType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRealGamepadTypeForID
    """
    return get_sdl3_function_table().get_real_gamepad_type_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_gamepad_mapping_for_id(instance_id: JoystickID) raises -> Ptr[c_char, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappingForID
    """
    var result = get_sdl3_function_table().get_gamepad_mapping_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not result:
        raise "Error in get_gamepad_mapping_for_id call. See official documentation for details."
    return result


fn open_gamepad(instance_id: JoystickID) raises -> Ptr[Gamepad, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenGamepad
    """
    var result = get_sdl3_function_table().open_gamepad(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_gamepad_from_id(instance_id: JoystickID) raises -> Ptr[Gamepad, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadFromID
    """
    var result = get_sdl3_function_table().get_gamepad_from_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_gamepad_from_player_index(player_index: Int32) -> Ptr[Gamepad, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadFromPlayerIndex
    """
    return get_sdl3_function_table().get_gamepad_from_player_index(
        Ptr(to=player_index).bitcast[Int32]()[]
    )


fn get_gamepad_properties(gamepad: Ptr[Gamepad]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProperties
    """
    return get_sdl3_function_table().get_gamepad_properties(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_id(gamepad: Ptr[Gamepad]) -> JoystickID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadID
    """
    return get_sdl3_function_table().get_gamepad_id(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_name(gamepad: Ptr[Gamepad]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadName
    """
    var cstring = get_sdl3_function_table().get_gamepad_name(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_gamepad_name call. See official documentation for details."
    return cstring


fn get_gamepad_path(gamepad: Ptr[Gamepad]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPath
    """
    var cstring = get_sdl3_function_table().get_gamepad_path(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_gamepad_path call. See official documentation for details."
    return cstring


fn get_gamepad_type(gamepad: Ptr[Gamepad]) -> GamepadType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadType
    """
    return get_sdl3_function_table().get_gamepad_type(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_real_gamepad_type(gamepad: Ptr[Gamepad]) -> GamepadType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRealGamepadType
    """
    return get_sdl3_function_table().get_real_gamepad_type(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_player_index(gamepad: Ptr[Gamepad]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPlayerIndex
    """
    return get_sdl3_function_table().get_gamepad_player_index(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn set_gamepad_player_index(gamepad: Ptr[Gamepad], player_index: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadPlayerIndex
    """
    var success = get_sdl3_function_table().set_gamepad_player_index(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=player_index).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_gamepad_vendor(gamepad: Ptr[Gamepad]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadVendor
    """
    return get_sdl3_function_table().get_gamepad_vendor(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_product(gamepad: Ptr[Gamepad]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProduct
    """
    return get_sdl3_function_table().get_gamepad_product(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_product_version(gamepad: Ptr[Gamepad]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductVersion
    """
    return get_sdl3_function_table().get_gamepad_product_version(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_firmware_version(gamepad: Ptr[Gamepad]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadFirmwareVersion
    """
    return get_sdl3_function_table().get_gamepad_firmware_version(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_serial(gamepad: Ptr[Gamepad]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadSerial
    """
    var cstring = get_sdl3_function_table().get_gamepad_serial(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_gamepad_serial call. See official documentation for details."
    return cstring


fn get_gamepad_steam_handle(gamepad: Ptr[Gamepad]) -> UInt64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadSteamHandle
    """
    return get_sdl3_function_table().get_gamepad_steam_handle(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_connection_state(gamepad: Ptr[Gamepad]) -> JoystickConnectionState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadConnectionState
    """
    return get_sdl3_function_table().get_gamepad_connection_state(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_power_info(gamepad: Ptr[Gamepad], percent: Ptr[Int32]) -> PowerState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadPowerInfo
    """
    return get_sdl3_function_table().get_gamepad_power_info(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=percent).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )


fn gamepad_connected(gamepad: Ptr[Gamepad]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadConnected
    """
    return get_sdl3_function_table().gamepad_connected(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_joystick(gamepad: Ptr[Gamepad]) raises -> Ptr[Joystick, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadJoystick
    """
    var result = get_sdl3_function_table().get_gamepad_joystick(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn set_gamepad_events_enabled(enabled: Bool):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadEventsEnabled
    """
    get_sdl3_function_table().set_gamepad_events_enabled(Ptr(to=enabled).bitcast[Bool]()[])


fn gamepad_events_enabled() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadEventsEnabled
    """
    return get_sdl3_function_table().gamepad_events_enabled()


fn get_gamepad_bindings(
    gamepad: Ptr[Gamepad], count: Ptr[Int32]
) raises -> Ptr[Ptr[GamepadBinding, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadBindings
    """
    var result = get_sdl3_function_table().get_gamepad_bindings(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
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
    return get_sdl3_function_table().get_gamepad_type_from_string(
        str.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn get_gamepad_string_for_type(type: GamepadType) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForType
    """
    var cstring = get_sdl3_function_table().get_gamepad_string_for_type(
        Ptr(to=type).bitcast[GamepadType]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_gamepad_string_for_type call. See official documentation for details."
    return cstring


fn get_gamepad_axis_from_string(str: CStringSlice) -> GamepadAxis:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadAxisFromString
    """
    return get_sdl3_function_table().get_gamepad_axis_from_string(
        str.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn get_gamepad_string_for_axis(axis: GamepadAxis) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForAxis
    """
    var cstring = get_sdl3_function_table().get_gamepad_string_for_axis(
        Ptr(to=axis).bitcast[GamepadAxis]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_gamepad_string_for_axis call. See official documentation for details."
    return cstring


fn gamepad_has_axis(gamepad: Ptr[Gamepad], axis: GamepadAxis) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadHasAxis
    """
    return get_sdl3_function_table().gamepad_has_axis(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=axis).bitcast[GamepadAxis]()[],
    )


fn get_gamepad_axis(gamepad: Ptr[Gamepad], axis: GamepadAxis) -> Int16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadAxis
    """
    return get_sdl3_function_table().get_gamepad_axis(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=axis).bitcast[GamepadAxis]()[],
    )


fn get_gamepad_button_from_string(str: CStringSlice) -> GamepadButton:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonFromString
    """
    return get_sdl3_function_table().get_gamepad_button_from_string(
        str.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn get_gamepad_string_for_button(
    button: GamepadButton
) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForButton
    """
    var cstring = get_sdl3_function_table().get_gamepad_string_for_button(
        Ptr(to=button).bitcast[GamepadButton]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_gamepad_string_for_button call. See official documentation for details."
    return cstring


fn gamepad_has_button(gamepad: Ptr[Gamepad], button: GamepadButton) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadHasButton
    """
    return get_sdl3_function_table().gamepad_has_button(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=button).bitcast[GamepadButton]()[],
    )


fn get_gamepad_button(gamepad: Ptr[Gamepad], button: GamepadButton) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadButton
    """
    return get_sdl3_function_table().get_gamepad_button(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=button).bitcast[GamepadButton]()[],
    )


fn get_gamepad_button_label_for_type(
    type: GamepadType, button: GamepadButton
) -> GamepadButtonLabel:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonLabelForType
    """
    return get_sdl3_function_table().get_gamepad_button_label_for_type(
        Ptr(to=type).bitcast[GamepadType]()[], Ptr(to=button).bitcast[GamepadButton]()[]
    )


fn get_gamepad_button_label(gamepad: Ptr[Gamepad], button: GamepadButton) -> GamepadButtonLabel:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonLabel
    """
    return get_sdl3_function_table().get_gamepad_button_label(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=button).bitcast[GamepadButton]()[],
    )


fn get_num_gamepad_touchpads(gamepad: Ptr[Gamepad]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumGamepadTouchpads
    """
    return get_sdl3_function_table().get_num_gamepad_touchpads(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_num_gamepad_touchpad_fingers(gamepad: Ptr[Gamepad], touchpad: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumGamepadTouchpadFingers
    """
    return get_sdl3_function_table().get_num_gamepad_touchpad_fingers(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=touchpad).bitcast[Int32]()[],
    )


fn get_gamepad_touchpad_finger(
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
    var success = get_sdl3_function_table().get_gamepad_touchpad_finger(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=touchpad).bitcast[Int32]()[],
        Ptr(to=finger).bitcast[Int32]()[],
        Ptr(to=down).bitcast[Ptr[Bool, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=pressure).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn gamepad_has_sensor(gamepad: Ptr[Gamepad], type: SensorType) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadHasSensor
    """
    return get_sdl3_function_table().gamepad_has_sensor(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=type).bitcast[SensorType]()[],
    )


fn set_gamepad_sensor_enabled(gamepad: Ptr[Gamepad], type: SensorType, enabled: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadSensorEnabled
    """
    var success = get_sdl3_function_table().set_gamepad_sensor_enabled(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=type).bitcast[SensorType]()[],
        Ptr(to=enabled).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn gamepad_sensor_enabled(gamepad: Ptr[Gamepad], type: SensorType) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GamepadSensorEnabled
    """
    return get_sdl3_function_table().gamepad_sensor_enabled(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=type).bitcast[SensorType]()[],
    )


fn get_gamepad_sensor_data_rate(gamepad: Ptr[Gamepad], type: SensorType) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadSensorDataRate
    """
    return get_sdl3_function_table().get_gamepad_sensor_data_rate(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=type).bitcast[SensorType]()[],
    )


fn get_gamepad_sensor_data(
    gamepad: Ptr[Gamepad], type: SensorType, data: Ptr[Float32], num_values: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadSensorData
    """
    var success = get_sdl3_function_table().get_gamepad_sensor_data(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=type).bitcast[SensorType]()[],
        Ptr(to=data).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=num_values).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn rumble_gamepad(
    gamepad: Ptr[Gamepad],
    low_frequency_rumble: UInt16,
    high_frequency_rumble: UInt16,
    duration_ms: UInt32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RumbleGamepad
    """
    var success = get_sdl3_function_table().rumble_gamepad(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=low_frequency_rumble).bitcast[UInt16]()[],
        Ptr(to=high_frequency_rumble).bitcast[UInt16]()[],
        Ptr(to=duration_ms).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn rumble_gamepad_triggers(
    gamepad: Ptr[Gamepad], left_rumble: UInt16, right_rumble: UInt16, duration_ms: UInt32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RumbleGamepadTriggers
    """
    var success = get_sdl3_function_table().rumble_gamepad_triggers(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=left_rumble).bitcast[UInt16]()[],
        Ptr(to=right_rumble).bitcast[UInt16]()[],
        Ptr(to=duration_ms).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn set_gamepad_led(gamepad: Ptr[Gamepad], red: UInt8, green: UInt8, blue: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGamepadLED
    """
    var success = get_sdl3_function_table().set_gamepad_led(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=red).bitcast[UInt8]()[],
        Ptr(to=green).bitcast[UInt8]()[],
        Ptr(to=blue).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn send_gamepad_effect(gamepad: Ptr[Gamepad], data: Ptr[NoneType], size: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SendGamepadEffect
    """
    var success = get_sdl3_function_table().send_gamepad_effect(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=size).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn close_gamepad(gamepad: Ptr[Gamepad]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseGamepad
    """
    get_sdl3_function_table().close_gamepad(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[]
    )


fn get_gamepad_apple_sf_symbols_name_for_button(
    gamepad: Ptr[Gamepad], button: GamepadButton
) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadAppleSFSymbolsNameForButton
    """
    var cstring = get_sdl3_function_table().get_gamepad_apple_sf_symbols_name_for_button(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=button).bitcast[GamepadButton]()[],
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_gamepad_apple_sf_symbols_name_for_button call. See official documentation for details."
    return cstring


fn get_gamepad_apple_sf_symbols_name_for_axis(
    gamepad: Ptr[Gamepad], axis: GamepadAxis
) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGamepadAppleSFSymbolsNameForAxis
    """
    var cstring = get_sdl3_function_table().get_gamepad_apple_sf_symbols_name_for_axis(
        Ptr(to=gamepad).bitcast[Ptr[Gamepad, MutExternalOrigin]]()[],
        Ptr(to=axis).bitcast[GamepadAxis]()[],
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_gamepad_apple_sf_symbols_name_for_axis call. See official documentation for details."
    return cstring


fn gpu_supports_shader_formats(format_flags: GPUShaderFormat, name: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSupportsShaderFormats
    """
    return get_sdl3_function_table().gpu_supports_shader_formats(
        Ptr(to=format_flags).bitcast[GPUShaderFormat]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn gpu_supports_properties(props: PropertiesID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUSupportsProperties
    """
    return get_sdl3_function_table().gpu_supports_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )


fn create_gpu_device(
    format_flags: GPUShaderFormat, debug_mode: Bool, name: CStringSlice
) raises -> Ptr[GPUDevice, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUDevice
    """
    var result = get_sdl3_function_table().create_gpu_device(
        Ptr(to=format_flags).bitcast[GPUShaderFormat]()[],
        Ptr(to=debug_mode).bitcast[Bool]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise get_error()
    return result


fn create_gpu_device_with_properties(
    props: PropertiesID
) raises -> Ptr[GPUDevice, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUDeviceWithProperties
    """
    var result = get_sdl3_function_table().create_gpu_device_with_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not result:
        raise get_error()
    return result


fn destroy_gpu_device(device: Ptr[GPUDevice]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyGPUDevice
    """
    get_sdl3_function_table().destroy_gpu_device(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
    )


fn get_num_gpu_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumGPUDrivers
    """
    return get_sdl3_function_table().get_num_gpu_drivers()


fn get_gpu_driver(index: Int32) -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUDriver
    """
    var cstring = get_sdl3_function_table().get_gpu_driver(Ptr(to=index).bitcast[Int32]()[])
    return cstring


fn get_gpu_device_driver(device: Ptr[GPUDevice]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUDeviceDriver
    """
    var cstring = get_sdl3_function_table().get_gpu_device_driver(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_gpu_device_driver call. See official documentation for details."
    return cstring


fn get_gpu_shader_formats(device: Ptr[GPUDevice]) -> GPUShaderFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUShaderFormats
    """
    return get_sdl3_function_table().get_gpu_shader_formats(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
    )


fn get_gpu_device_properties(device: Ptr[GPUDevice]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUDeviceProperties
    """
    return get_sdl3_function_table().get_gpu_device_properties(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
    )


fn create_gpu_compute_pipeline(
    device: Ptr[GPUDevice], createinfo: Ptr[GPUComputePipelineCreateInfo]
) raises -> Ptr[GPUComputePipeline, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUComputePipeline
    """
    var result = get_sdl3_function_table().create_gpu_compute_pipeline(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=createinfo).bitcast[Ptr[GPUComputePipelineCreateInfo, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_gpu_graphics_pipeline(
    device: Ptr[GPUDevice], createinfo: Ptr[GPUGraphicsPipelineCreateInfo]
) raises -> Ptr[GPUGraphicsPipeline, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUGraphicsPipeline
    """
    var result = get_sdl3_function_table().create_gpu_graphics_pipeline(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=createinfo).bitcast[Ptr[GPUGraphicsPipelineCreateInfo, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_gpu_sampler(
    device: Ptr[GPUDevice], createinfo: Ptr[GPUSamplerCreateInfo]
) raises -> Ptr[GPUSampler, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUSampler
    """
    var result = get_sdl3_function_table().create_gpu_sampler(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=createinfo).bitcast[Ptr[GPUSamplerCreateInfo, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_gpu_shader(
    device: Ptr[GPUDevice], createinfo: Ptr[GPUShaderCreateInfo]
) raises -> Ptr[GPUShader, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUShader
    """
    var result = get_sdl3_function_table().create_gpu_shader(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=createinfo).bitcast[Ptr[GPUShaderCreateInfo, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_gpu_texture(
    device: Ptr[GPUDevice], createinfo: Ptr[GPUTextureCreateInfo]
) raises -> Ptr[GPUTexture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUTexture
    """
    var result = get_sdl3_function_table().create_gpu_texture(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=createinfo).bitcast[Ptr[GPUTextureCreateInfo, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_gpu_buffer(
    device: Ptr[GPUDevice], createinfo: Ptr[GPUBufferCreateInfo]
) raises -> Ptr[GPUBuffer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUBuffer
    """
    var result = get_sdl3_function_table().create_gpu_buffer(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=createinfo).bitcast[Ptr[GPUBufferCreateInfo, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_gpu_transfer_buffer(
    device: Ptr[GPUDevice], createinfo: Ptr[GPUTransferBufferCreateInfo]
) raises -> Ptr[GPUTransferBuffer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPUTransferBuffer
    """
    var result = get_sdl3_function_table().create_gpu_transfer_buffer(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=createinfo).bitcast[Ptr[GPUTransferBufferCreateInfo, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn set_gpu_buffer_name(device: Ptr[GPUDevice], buffer: Ptr[GPUBuffer], text: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUBufferName
    """
    get_sdl3_function_table().set_gpu_buffer_name(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn set_gpu_texture_name(device: Ptr[GPUDevice], texture: Ptr[GPUTexture], text: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUTextureName
    """
    get_sdl3_function_table().set_gpu_texture_name(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=texture).bitcast[Ptr[GPUTexture, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn insert_gpu_debug_label(command_buffer: Ptr[GPUCommandBuffer], text: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_InsertGPUDebugLabel
    """
    get_sdl3_function_table().insert_gpu_debug_label(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        text.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn push_gpu_debug_group(command_buffer: Ptr[GPUCommandBuffer], name: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushGPUDebugGroup
    """
    get_sdl3_function_table().push_gpu_debug_group(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn pop_gpu_debug_group(command_buffer: Ptr[GPUCommandBuffer]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PopGPUDebugGroup
    """
    get_sdl3_function_table().pop_gpu_debug_group(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
    )


fn release_gpu_texture(device: Ptr[GPUDevice], texture: Ptr[GPUTexture]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTexture
    """
    get_sdl3_function_table().release_gpu_texture(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=texture).bitcast[Ptr[GPUTexture, MutExternalOrigin]]()[],
    )


fn release_gpu_sampler(device: Ptr[GPUDevice], sampler: Ptr[GPUSampler]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUSampler
    """
    get_sdl3_function_table().release_gpu_sampler(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=sampler).bitcast[Ptr[GPUSampler, MutExternalOrigin]]()[],
    )


fn release_gpu_buffer(device: Ptr[GPUDevice], buffer: Ptr[GPUBuffer]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUBuffer
    """
    get_sdl3_function_table().release_gpu_buffer(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
    )


fn release_gpu_transfer_buffer(device: Ptr[GPUDevice], transfer_buffer: Ptr[GPUTransferBuffer]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTransferBuffer
    """
    get_sdl3_function_table().release_gpu_transfer_buffer(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=transfer_buffer).bitcast[Ptr[GPUTransferBuffer, MutExternalOrigin]]()[],
    )


fn release_gpu_compute_pipeline(device: Ptr[GPUDevice], compute_pipeline: Ptr[GPUComputePipeline]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUComputePipeline
    """
    get_sdl3_function_table().release_gpu_compute_pipeline(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=compute_pipeline).bitcast[Ptr[GPUComputePipeline, MutExternalOrigin]]()[],
    )


fn release_gpu_shader(device: Ptr[GPUDevice], shader: Ptr[GPUShader]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUShader
    """
    get_sdl3_function_table().release_gpu_shader(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=shader).bitcast[Ptr[GPUShader, MutExternalOrigin]]()[],
    )


fn release_gpu_graphics_pipeline(
    device: Ptr[GPUDevice], graphics_pipeline: Ptr[GPUGraphicsPipeline]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUGraphicsPipeline
    """
    get_sdl3_function_table().release_gpu_graphics_pipeline(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=graphics_pipeline).bitcast[Ptr[GPUGraphicsPipeline, MutExternalOrigin]]()[],
    )


fn acquire_gpu_command_buffer(
    device: Ptr[GPUDevice]
) raises -> Ptr[GPUCommandBuffer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AcquireGPUCommandBuffer
    """
    var result = get_sdl3_function_table().acquire_gpu_command_buffer(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn push_gpu_vertex_uniform_data(
    command_buffer: Ptr[GPUCommandBuffer], slot_index: UInt32, data: Ptr[NoneType], length: UInt32
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushGPUVertexUniformData
    """
    get_sdl3_function_table().push_gpu_vertex_uniform_data(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        Ptr(to=slot_index).bitcast[UInt32]()[],
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=length).bitcast[UInt32]()[],
    )


fn push_gpu_fragment_uniform_data(
    command_buffer: Ptr[GPUCommandBuffer], slot_index: UInt32, data: Ptr[NoneType], length: UInt32
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushGPUFragmentUniformData
    """
    get_sdl3_function_table().push_gpu_fragment_uniform_data(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        Ptr(to=slot_index).bitcast[UInt32]()[],
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=length).bitcast[UInt32]()[],
    )


fn push_gpu_compute_uniform_data(
    command_buffer: Ptr[GPUCommandBuffer], slot_index: UInt32, data: Ptr[NoneType], length: UInt32
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PushGPUComputeUniformData
    """
    get_sdl3_function_table().push_gpu_compute_uniform_data(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        Ptr(to=slot_index).bitcast[UInt32]()[],
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=length).bitcast[UInt32]()[],
    )


fn begin_gpu_render_pass(
    command_buffer: Ptr[GPUCommandBuffer],
    color_target_infos: Ptr[GPUColorTargetInfo],
    num_color_targets: UInt32,
    depth_stencil_target_info: Ptr[GPUDepthStencilTargetInfo],
) raises -> Ptr[GPURenderPass, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BeginGPURenderPass
    """
    var result = get_sdl3_function_table().begin_gpu_render_pass(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        Ptr(to=color_target_infos).bitcast[Ptr[GPUColorTargetInfo, ImmutExternalOrigin]]()[],
        Ptr(to=num_color_targets).bitcast[UInt32]()[],
        Ptr(to=depth_stencil_target_info).bitcast[Ptr[GPUDepthStencilTargetInfo, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise "Error in begin_gpu_render_pass call. See official documentation for details."
    return result


fn bind_gpu_graphics_pipeline(
    render_pass: Ptr[GPURenderPass], graphics_pipeline: Ptr[GPUGraphicsPipeline]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUGraphicsPipeline
    """
    get_sdl3_function_table().bind_gpu_graphics_pipeline(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=graphics_pipeline).bitcast[Ptr[GPUGraphicsPipeline, MutExternalOrigin]]()[],
    )


fn set_gpu_viewport(render_pass: Ptr[GPURenderPass], viewport: Ptr[GPUViewport]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUViewport
    """
    get_sdl3_function_table().set_gpu_viewport(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=viewport).bitcast[Ptr[GPUViewport, ImmutExternalOrigin]]()[],
    )


fn set_gpu_scissor(render_pass: Ptr[GPURenderPass], scissor: Ptr[Rect]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUScissor
    """
    get_sdl3_function_table().set_gpu_scissor(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=scissor).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )


fn set_gpu_blend_constants(render_pass: Ptr[GPURenderPass], blend_constants: FColor):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUBlendConstants
    """
    get_sdl3_function_table().set_gpu_blend_constants(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=blend_constants).bitcast[FColor]()[],
    )


fn set_gpu_stencil_reference(render_pass: Ptr[GPURenderPass], reference: UInt8):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUStencilReference
    """
    get_sdl3_function_table().set_gpu_stencil_reference(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=reference).bitcast[UInt8]()[],
    )


fn bind_gpu_vertex_buffers(
    render_pass: Ptr[GPURenderPass],
    first_slot: UInt32,
    bindings: Ptr[GPUBufferBinding],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexBuffers
    """
    get_sdl3_function_table().bind_gpu_vertex_buffers(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=bindings).bitcast[Ptr[GPUBufferBinding, ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn bind_gpu_index_buffer(
    render_pass: Ptr[GPURenderPass],
    binding: Ptr[GPUBufferBinding],
    index_element_size: GPUIndexElementSize,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUIndexBuffer
    """
    get_sdl3_function_table().bind_gpu_index_buffer(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=binding).bitcast[Ptr[GPUBufferBinding, ImmutExternalOrigin]]()[],
        Ptr(to=index_element_size).bitcast[GPUIndexElementSize]()[],
    )


fn bind_gpu_vertex_samplers(
    render_pass: Ptr[GPURenderPass],
    first_slot: UInt32,
    texture_sampler_bindings: Ptr[GPUTextureSamplerBinding],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexSamplers
    """
    get_sdl3_function_table().bind_gpu_vertex_samplers(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=texture_sampler_bindings).bitcast[Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn bind_gpu_vertex_storage_textures(
    render_pass: Ptr[GPURenderPass],
    first_slot: UInt32,
    storage_textures: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageTextures
    """
    get_sdl3_function_table().bind_gpu_vertex_storage_textures(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=storage_textures).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn bind_gpu_vertex_storage_buffers(
    render_pass: Ptr[GPURenderPass],
    first_slot: UInt32,
    storage_buffers: Ptr[Ptr[GPUBuffer, MutExternalOrigin]],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageBuffers
    """
    get_sdl3_function_table().bind_gpu_vertex_storage_buffers(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=storage_buffers).bitcast[Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn bind_gpu_fragment_samplers(
    render_pass: Ptr[GPURenderPass],
    first_slot: UInt32,
    texture_sampler_bindings: Ptr[GPUTextureSamplerBinding],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentSamplers
    """
    get_sdl3_function_table().bind_gpu_fragment_samplers(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=texture_sampler_bindings).bitcast[Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn bind_gpu_fragment_storage_textures(
    render_pass: Ptr[GPURenderPass],
    first_slot: UInt32,
    storage_textures: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageTextures
    """
    get_sdl3_function_table().bind_gpu_fragment_storage_textures(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=storage_textures).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn bind_gpu_fragment_storage_buffers(
    render_pass: Ptr[GPURenderPass],
    first_slot: UInt32,
    storage_buffers: Ptr[Ptr[GPUBuffer, MutExternalOrigin]],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageBuffers
    """
    get_sdl3_function_table().bind_gpu_fragment_storage_buffers(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=storage_buffers).bitcast[Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn draw_gpu_indexed_primitives(
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
    get_sdl3_function_table().draw_gpu_indexed_primitives(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=num_indices).bitcast[UInt32]()[],
        Ptr(to=num_instances).bitcast[UInt32]()[],
        Ptr(to=first_index).bitcast[UInt32]()[],
        Ptr(to=vertex_offset).bitcast[Int32]()[],
        Ptr(to=first_instance).bitcast[UInt32]()[],
    )


fn draw_gpu_primitives(
    render_pass: Ptr[GPURenderPass],
    num_vertices: UInt32,
    num_instances: UInt32,
    first_vertex: UInt32,
    first_instance: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DrawGPUPrimitives
    """
    get_sdl3_function_table().draw_gpu_primitives(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=num_vertices).bitcast[UInt32]()[],
        Ptr(to=num_instances).bitcast[UInt32]()[],
        Ptr(to=first_vertex).bitcast[UInt32]()[],
        Ptr(to=first_instance).bitcast[UInt32]()[],
    )


fn draw_gpu_primitives_indirect(
    render_pass: Ptr[GPURenderPass], buffer: Ptr[GPUBuffer], offset: UInt32, draw_count: UInt32
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DrawGPUPrimitivesIndirect
    """
    get_sdl3_function_table().draw_gpu_primitives_indirect(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
        Ptr(to=offset).bitcast[UInt32]()[],
        Ptr(to=draw_count).bitcast[UInt32]()[],
    )


fn draw_gpu_indexed_primitives_indirect(
    render_pass: Ptr[GPURenderPass], buffer: Ptr[GPUBuffer], offset: UInt32, draw_count: UInt32
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DrawGPUIndexedPrimitivesIndirect
    """
    get_sdl3_function_table().draw_gpu_indexed_primitives_indirect(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[],
        Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
        Ptr(to=offset).bitcast[UInt32]()[],
        Ptr(to=draw_count).bitcast[UInt32]()[],
    )


fn end_gpu_render_pass(render_pass: Ptr[GPURenderPass]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EndGPURenderPass
    """
    get_sdl3_function_table().end_gpu_render_pass(
        Ptr(to=render_pass).bitcast[Ptr[GPURenderPass, MutExternalOrigin]]()[]
    )


fn begin_gpu_compute_pass(
    command_buffer: Ptr[GPUCommandBuffer],
    storage_texture_bindings: Ptr[GPUStorageTextureReadWriteBinding],
    num_storage_texture_bindings: UInt32,
    storage_buffer_bindings: Ptr[GPUStorageBufferReadWriteBinding],
    num_storage_buffer_bindings: UInt32,
) -> Ptr[GPUComputePass, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BeginGPUComputePass
    """
    return get_sdl3_function_table().begin_gpu_compute_pass(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        Ptr(to=storage_texture_bindings).bitcast[Ptr[GPUStorageTextureReadWriteBinding, ImmutExternalOrigin]]()[],
        Ptr(to=num_storage_texture_bindings).bitcast[UInt32]()[],
        Ptr(to=storage_buffer_bindings).bitcast[Ptr[GPUStorageBufferReadWriteBinding, ImmutExternalOrigin]]()[],
        Ptr(to=num_storage_buffer_bindings).bitcast[UInt32]()[],
    )


fn bind_gpu_compute_pipeline(
    compute_pass: Ptr[GPUComputePass], compute_pipeline: Ptr[GPUComputePipeline]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUComputePipeline
    """
    get_sdl3_function_table().bind_gpu_compute_pipeline(
        Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
        Ptr(to=compute_pipeline).bitcast[Ptr[GPUComputePipeline, MutExternalOrigin]]()[],
    )


fn bind_gpu_compute_samplers(
    compute_pass: Ptr[GPUComputePass],
    first_slot: UInt32,
    texture_sampler_bindings: Ptr[GPUTextureSamplerBinding],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeSamplers
    """
    get_sdl3_function_table().bind_gpu_compute_samplers(
        Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=texture_sampler_bindings).bitcast[Ptr[GPUTextureSamplerBinding, ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn bind_gpu_compute_storage_textures(
    compute_pass: Ptr[GPUComputePass],
    first_slot: UInt32,
    storage_textures: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageTextures
    """
    get_sdl3_function_table().bind_gpu_compute_storage_textures(
        Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=storage_textures).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn bind_gpu_compute_storage_buffers(
    compute_pass: Ptr[GPUComputePass],
    first_slot: UInt32,
    storage_buffers: Ptr[Ptr[GPUBuffer, MutExternalOrigin]],
    num_bindings: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageBuffers
    """
    get_sdl3_function_table().bind_gpu_compute_storage_buffers(
        Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
        Ptr(to=first_slot).bitcast[UInt32]()[],
        Ptr(to=storage_buffers).bitcast[Ptr[Ptr[GPUBuffer, MutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_bindings).bitcast[UInt32]()[],
    )


fn dispatch_gpu_compute(
    compute_pass: Ptr[GPUComputePass],
    groupcount_x: UInt32,
    groupcount_y: UInt32,
    groupcount_z: UInt32,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DispatchGPUCompute
    """
    get_sdl3_function_table().dispatch_gpu_compute(
        Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
        Ptr(to=groupcount_x).bitcast[UInt32]()[],
        Ptr(to=groupcount_y).bitcast[UInt32]()[],
        Ptr(to=groupcount_z).bitcast[UInt32]()[],
    )


fn dispatch_gpu_compute_indirect(
    compute_pass: Ptr[GPUComputePass], buffer: Ptr[GPUBuffer], offset: UInt32
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DispatchGPUComputeIndirect
    """
    get_sdl3_function_table().dispatch_gpu_compute_indirect(
        Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[],
        Ptr(to=buffer).bitcast[Ptr[GPUBuffer, MutExternalOrigin]]()[],
        Ptr(to=offset).bitcast[UInt32]()[],
    )


fn end_gpu_compute_pass(compute_pass: Ptr[GPUComputePass]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EndGPUComputePass
    """
    get_sdl3_function_table().end_gpu_compute_pass(
        Ptr(to=compute_pass).bitcast[Ptr[GPUComputePass, MutExternalOrigin]]()[]
    )


fn map_gpu_transfer_buffer(
    device: Ptr[GPUDevice], transfer_buffer: Ptr[GPUTransferBuffer], cycle: Bool
) raises -> Ptr[NoneType, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapGPUTransferBuffer
    """
    var result = get_sdl3_function_table().map_gpu_transfer_buffer(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=transfer_buffer).bitcast[Ptr[GPUTransferBuffer, MutExternalOrigin]]()[],
        Ptr(to=cycle).bitcast[Bool]()[],
    )
    if not result:
        raise get_error()
    return result


fn unmap_gpu_transfer_buffer(device: Ptr[GPUDevice], transfer_buffer: Ptr[GPUTransferBuffer]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnmapGPUTransferBuffer
    """
    get_sdl3_function_table().unmap_gpu_transfer_buffer(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=transfer_buffer).bitcast[Ptr[GPUTransferBuffer, MutExternalOrigin]]()[],
    )


fn begin_gpu_copy_pass(
    command_buffer: Ptr[GPUCommandBuffer]
) -> Ptr[GPUCopyPass, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BeginGPUCopyPass
    """
    return get_sdl3_function_table().begin_gpu_copy_pass(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
    )


fn upload_to_gpu_texture(
    copy_pass: Ptr[GPUCopyPass],
    source: Ptr[GPUTextureTransferInfo],
    destination: Ptr[GPUTextureRegion],
    cycle: Bool,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UploadToGPUTexture
    """
    get_sdl3_function_table().upload_to_gpu_texture(
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
        Ptr(to=source).bitcast[Ptr[GPUTextureTransferInfo, ImmutExternalOrigin]]()[],
        Ptr(to=destination).bitcast[Ptr[GPUTextureRegion, ImmutExternalOrigin]]()[],
        Ptr(to=cycle).bitcast[Bool]()[],
    )


fn upload_to_gpu_buffer(
    copy_pass: Ptr[GPUCopyPass],
    source: Ptr[GPUTransferBufferLocation],
    destination: Ptr[GPUBufferRegion],
    cycle: Bool,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UploadToGPUBuffer
    """
    get_sdl3_function_table().upload_to_gpu_buffer(
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
        Ptr(to=source).bitcast[Ptr[GPUTransferBufferLocation, ImmutExternalOrigin]]()[],
        Ptr(to=destination).bitcast[Ptr[GPUBufferRegion, ImmutExternalOrigin]]()[],
        Ptr(to=cycle).bitcast[Bool]()[],
    )


fn copy_gpu_texture_to_texture(
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
    get_sdl3_function_table().copy_gpu_texture_to_texture(
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
        Ptr(to=source).bitcast[Ptr[GPUTextureLocation, ImmutExternalOrigin]]()[],
        Ptr(to=destination).bitcast[Ptr[GPUTextureLocation, ImmutExternalOrigin]]()[],
        Ptr(to=w).bitcast[UInt32]()[],
        Ptr(to=h).bitcast[UInt32]()[],
        Ptr(to=d).bitcast[UInt32]()[],
        Ptr(to=cycle).bitcast[Bool]()[],
    )


fn copy_gpu_buffer_to_buffer(
    copy_pass: Ptr[GPUCopyPass],
    source: Ptr[GPUBufferLocation],
    destination: Ptr[GPUBufferLocation],
    size: UInt32,
    cycle: Bool,
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CopyGPUBufferToBuffer
    """
    get_sdl3_function_table().copy_gpu_buffer_to_buffer(
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
        Ptr(to=source).bitcast[Ptr[GPUBufferLocation, ImmutExternalOrigin]]()[],
        Ptr(to=destination).bitcast[Ptr[GPUBufferLocation, ImmutExternalOrigin]]()[],
        Ptr(to=size).bitcast[UInt32]()[],
        Ptr(to=cycle).bitcast[Bool]()[],
    )


fn download_from_gpu_texture(
    copy_pass: Ptr[GPUCopyPass],
    source: Ptr[GPUTextureRegion],
    destination: Ptr[GPUTextureTransferInfo],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUTexture
    """
    get_sdl3_function_table().download_from_gpu_texture(
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
        Ptr(to=source).bitcast[Ptr[GPUTextureRegion, ImmutExternalOrigin]]()[],
        Ptr(to=destination).bitcast[Ptr[GPUTextureTransferInfo, ImmutExternalOrigin]]()[],
    )


fn download_from_gpu_buffer(
    copy_pass: Ptr[GPUCopyPass],
    source: Ptr[GPUBufferRegion],
    destination: Ptr[GPUTransferBufferLocation],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUBuffer
    """
    get_sdl3_function_table().download_from_gpu_buffer(
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[],
        Ptr(to=source).bitcast[Ptr[GPUBufferRegion, ImmutExternalOrigin]]()[],
        Ptr(to=destination).bitcast[Ptr[GPUTransferBufferLocation, ImmutExternalOrigin]]()[],
    )


fn end_gpu_copy_pass(copy_pass: Ptr[GPUCopyPass]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EndGPUCopyPass
    """
    get_sdl3_function_table().end_gpu_copy_pass(
        Ptr(to=copy_pass).bitcast[Ptr[GPUCopyPass, MutExternalOrigin]]()[]
    )


fn generate_mipmaps_for_gpu_texture(
    command_buffer: Ptr[GPUCommandBuffer], texture: Ptr[GPUTexture]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GenerateMipmapsForGPUTexture
    """
    get_sdl3_function_table().generate_mipmaps_for_gpu_texture(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        Ptr(to=texture).bitcast[Ptr[GPUTexture, MutExternalOrigin]]()[],
    )


fn blit_gpu_texture(command_buffer: Ptr[GPUCommandBuffer], info: Ptr[GPUBlitInfo]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitGPUTexture
    """
    get_sdl3_function_table().blit_gpu_texture(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        Ptr(to=info).bitcast[Ptr[GPUBlitInfo, ImmutExternalOrigin]]()[],
    )


fn window_supports_gpu_swapchain_composition(
    device: Ptr[GPUDevice], window: Ptr[Window], swapchain_composition: GPUSwapchainComposition
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUSwapchainComposition
    """
    return get_sdl3_function_table().window_supports_gpu_swapchain_composition(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=swapchain_composition).bitcast[GPUSwapchainComposition]()[],
    )


fn window_supports_gpu_present_mode(
    device: Ptr[GPUDevice], window: Ptr[Window], present_mode: GPUPresentMode
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUPresentMode
    """
    return get_sdl3_function_table().window_supports_gpu_present_mode(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=present_mode).bitcast[GPUPresentMode]()[],
    )


fn claim_window_for_gpu_device(device: Ptr[GPUDevice], window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClaimWindowForGPUDevice
    """
    var success = get_sdl3_function_table().claim_window_for_gpu_device(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn release_window_from_gpu_device(device: Ptr[GPUDevice], window: Ptr[Window]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseWindowFromGPUDevice
    """
    get_sdl3_function_table().release_window_from_gpu_device(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
    )


fn set_gpu_swapchain_parameters(
    device: Ptr[GPUDevice],
    window: Ptr[Window],
    swapchain_composition: GPUSwapchainComposition,
    present_mode: GPUPresentMode,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUSwapchainParameters
    """
    var success = get_sdl3_function_table().set_gpu_swapchain_parameters(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=swapchain_composition).bitcast[GPUSwapchainComposition]()[],
        Ptr(to=present_mode).bitcast[GPUPresentMode]()[],
    )
    if not success:
        raise get_error()


fn set_gpu_allowed_frames_in_flight(
    device: Ptr[GPUDevice], allowed_frames_in_flight: UInt32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPUAllowedFramesInFlight
    """
    var success = get_sdl3_function_table().set_gpu_allowed_frames_in_flight(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=allowed_frames_in_flight).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn get_gpu_swapchain_texture_format(
    device: Ptr[GPUDevice], window: Ptr[Window]
) -> GPUTextureFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUSwapchainTextureFormat
    """
    return get_sdl3_function_table().get_gpu_swapchain_texture_format(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
    )


fn acquire_gpu_swapchain_texture(
    command_buffer: Ptr[GPUCommandBuffer],
    window: Ptr[Window],
    swapchain_texture: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
    swapchain_texture_width: Ptr[UInt32],
    swapchain_texture_height: Ptr[UInt32],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AcquireGPUSwapchainTexture
    """
    var success = get_sdl3_function_table().acquire_gpu_swapchain_texture(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=swapchain_texture).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin]]()[],
        Ptr(to=swapchain_texture_width).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        Ptr(to=swapchain_texture_height).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn wait_for_gpu_swapchain(device: Ptr[GPUDevice], window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitForGPUSwapchain
    """
    var success = get_sdl3_function_table().wait_for_gpu_swapchain(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn wait_and_acquire_gpu_swapchain_texture(
    command_buffer: Ptr[GPUCommandBuffer],
    window: Ptr[Window],
    swapchain_texture: Ptr[Ptr[GPUTexture, MutExternalOrigin]],
    swapchain_texture_width: Ptr[UInt32],
    swapchain_texture_height: Ptr[UInt32],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitAndAcquireGPUSwapchainTexture
    """
    var success = get_sdl3_function_table().wait_and_acquire_gpu_swapchain_texture(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=swapchain_texture).bitcast[Ptr[Ptr[GPUTexture, MutExternalOrigin], MutExternalOrigin]]()[],
        Ptr(to=swapchain_texture_width).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        Ptr(to=swapchain_texture_height).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn submit_gpu_command_buffer(command_buffer: Ptr[GPUCommandBuffer]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SubmitGPUCommandBuffer
    """
    var success = get_sdl3_function_table().submit_gpu_command_buffer(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn submit_gpu_command_buffer_and_acquire_fence(
    command_buffer: Ptr[GPUCommandBuffer]
) raises -> Ptr[GPUFence, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SubmitGPUCommandBufferAndAcquireFence
    """
    var result = get_sdl3_function_table().submit_gpu_command_buffer_and_acquire_fence(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn cancel_gpu_command_buffer(command_buffer: Ptr[GPUCommandBuffer]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CancelGPUCommandBuffer
    """
    var success = get_sdl3_function_table().cancel_gpu_command_buffer(
        Ptr(to=command_buffer).bitcast[Ptr[GPUCommandBuffer, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn wait_for_gpu_idle(device: Ptr[GPUDevice]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitForGPUIdle
    """
    var success = get_sdl3_function_table().wait_for_gpu_idle(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn wait_for_gpu_fences(
    device: Ptr[GPUDevice],
    wait_all: Bool,
    fences: Ptr[Ptr[GPUFence, MutExternalOrigin]],
    num_fences: UInt32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WaitForGPUFences
    """
    var success = get_sdl3_function_table().wait_for_gpu_fences(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=wait_all).bitcast[Bool]()[],
        Ptr(to=fences).bitcast[Ptr[Ptr[GPUFence, MutExternalOrigin], ImmutExternalOrigin]]()[],
        Ptr(to=num_fences).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn query_gpu_fence(device: Ptr[GPUDevice], fence: Ptr[GPUFence]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_QueryGPUFence
    """
    return get_sdl3_function_table().query_gpu_fence(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=fence).bitcast[Ptr[GPUFence, MutExternalOrigin]]()[],
    )


fn release_gpu_fence(device: Ptr[GPUDevice], fence: Ptr[GPUFence]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUFence
    """
    get_sdl3_function_table().release_gpu_fence(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=fence).bitcast[Ptr[GPUFence, MutExternalOrigin]]()[],
    )


fn gpu_texture_format_texel_block_size(format: GPUTextureFormat) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureFormatTexelBlockSize
    """
    return get_sdl3_function_table().gpu_texture_format_texel_block_size(
        Ptr(to=format).bitcast[GPUTextureFormat]()[]
    )


fn gpu_texture_supports_format(
    device: Ptr[GPUDevice],
    format: GPUTextureFormat,
    type: GPUTextureType,
    usage: GPUTextureUsageFlags,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsFormat
    """
    return get_sdl3_function_table().gpu_texture_supports_format(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=format).bitcast[GPUTextureFormat]()[],
        Ptr(to=type).bitcast[GPUTextureType]()[],
        Ptr(to=usage).bitcast[GPUTextureUsageFlags]()[],
    )


fn gpu_texture_supports_sample_count(
    device: Ptr[GPUDevice], format: GPUTextureFormat, sample_count: GPUSampleCount
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsSampleCount
    """
    return get_sdl3_function_table().gpu_texture_supports_sample_count(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=format).bitcast[GPUTextureFormat]()[],
        Ptr(to=sample_count).bitcast[GPUSampleCount]()[],
    )


fn calculate_gpu_texture_format_size(
    format: GPUTextureFormat, width: UInt32, height: UInt32, depth_or_layer_count: UInt32
) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CalculateGPUTextureFormatSize
    """
    return get_sdl3_function_table().calculate_gpu_texture_format_size(
        Ptr(to=format).bitcast[GPUTextureFormat]()[],
        Ptr(to=width).bitcast[UInt32]()[],
        Ptr(to=height).bitcast[UInt32]()[],
        Ptr(to=depth_or_layer_count).bitcast[UInt32]()[],
    )


fn get_pixel_format_from_gpu_texture_format(format: GPUTextureFormat) -> PixelFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatFromGPUTextureFormat
    """
    return get_sdl3_function_table().get_pixel_format_from_gpu_texture_format(
        Ptr(to=format).bitcast[GPUTextureFormat]()[]
    )


fn get_gpu_texture_format_from_pixel_format(format: PixelFormat) -> GPUTextureFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPUTextureFormatFromPixelFormat
    """
    return get_sdl3_function_table().get_gpu_texture_format_from_pixel_format(
        Ptr(to=format).bitcast[PixelFormat]()[]
    )


fn guid_to_string(guid: GUID, pszGUID: Ptr[c_char], cbGUID: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GUIDToString
    """
    get_sdl3_function_table().guid_to_string(
        Ptr(to=guid).bitcast[GUID]()[],
        Ptr(to=pszGUID).bitcast[Ptr[c_char, MutExternalOrigin]]()[],
        Ptr(to=cbGUID).bitcast[Int32]()[],
    )


fn string_to_guid(pchGUID: CStringSlice) -> GUID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StringToGUID
    """
    return get_sdl3_function_table().string_to_guid(
        pchGUID.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn get_haptics(count: Ptr[Int32]) raises -> Ptr[HapticID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHaptics
    """
    var result = get_sdl3_function_table().get_haptics(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_haptic_name_for_id(instance_id: HapticID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticNameForID
    """
    var cstring = get_sdl3_function_table().get_haptic_name_for_id(
        Ptr(to=instance_id).bitcast[HapticID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn open_haptic(instance_id: HapticID) raises -> Ptr[Haptic, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenHaptic
    """
    var result = get_sdl3_function_table().open_haptic(Ptr(to=instance_id).bitcast[HapticID]()[])
    if not result:
        raise get_error()
    return result


fn get_haptic_from_id(instance_id: HapticID) raises -> Ptr[Haptic, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticFromID
    """
    var result = get_sdl3_function_table().get_haptic_from_id(
        Ptr(to=instance_id).bitcast[HapticID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_haptic_id(haptic: Ptr[Haptic]) -> HapticID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticID
    """
    return get_sdl3_function_table().get_haptic_id(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )


fn get_haptic_name(haptic: Ptr[Haptic]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticName
    """
    var cstring = get_sdl3_function_table().get_haptic_name(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn is_mouse_haptic() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsMouseHaptic
    """
    return get_sdl3_function_table().is_mouse_haptic()


fn open_haptic_from_mouse() raises -> Ptr[Haptic, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenHapticFromMouse
    """
    var result = get_sdl3_function_table().open_haptic_from_mouse()
    if not result:
        raise get_error()
    return result


fn is_joystick_haptic(joystick: Ptr[Joystick]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsJoystickHaptic
    """
    return get_sdl3_function_table().is_joystick_haptic(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn open_haptic_from_joystick(joystick: Ptr[Joystick]) raises -> Ptr[Haptic, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenHapticFromJoystick
    """
    var result = get_sdl3_function_table().open_haptic_from_joystick(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn close_haptic(haptic: Ptr[Haptic]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseHaptic
    """
    get_sdl3_function_table().close_haptic(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )


fn get_max_haptic_effects(haptic: Ptr[Haptic]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMaxHapticEffects
    """
    return get_sdl3_function_table().get_max_haptic_effects(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )


fn get_max_haptic_effects_playing(haptic: Ptr[Haptic]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMaxHapticEffectsPlaying
    """
    return get_sdl3_function_table().get_max_haptic_effects_playing(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )


fn get_haptic_features(haptic: Ptr[Haptic]) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticFeatures
    """
    return get_sdl3_function_table().get_haptic_features(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )


fn get_num_haptic_axes(haptic: Ptr[Haptic]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumHapticAxes
    """
    return get_sdl3_function_table().get_num_haptic_axes(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )


fn haptic_effect_supported(haptic: Ptr[Haptic], effect: Ptr[HapticEffect]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticEffectSupported
    """
    return get_sdl3_function_table().haptic_effect_supported(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
        Ptr(to=effect).bitcast[Ptr[HapticEffect, ImmutExternalOrigin]]()[],
    )


fn create_haptic_effect(haptic: Ptr[Haptic], effect: Ptr[HapticEffect]) -> HapticEffectID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateHapticEffect
    """
    return get_sdl3_function_table().create_haptic_effect(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
        Ptr(to=effect).bitcast[Ptr[HapticEffect, ImmutExternalOrigin]]()[],
    )


fn update_haptic_effect(
    haptic: Ptr[Haptic], effect: HapticEffectID, data: Ptr[HapticEffect]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateHapticEffect
    """
    var success = get_sdl3_function_table().update_haptic_effect(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
        Ptr(to=effect).bitcast[HapticEffectID]()[],
        Ptr(to=data).bitcast[Ptr[HapticEffect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn run_haptic_effect(haptic: Ptr[Haptic], effect: HapticEffectID, iterations: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RunHapticEffect
    """
    var success = get_sdl3_function_table().run_haptic_effect(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
        Ptr(to=effect).bitcast[HapticEffectID]()[],
        Ptr(to=iterations).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn stop_haptic_effect(haptic: Ptr[Haptic], effect: HapticEffectID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StopHapticEffect
    """
    var success = get_sdl3_function_table().stop_haptic_effect(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
        Ptr(to=effect).bitcast[HapticEffectID]()[],
    )
    if not success:
        raise get_error()


fn destroy_haptic_effect(haptic: Ptr[Haptic], effect: HapticEffectID):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyHapticEffect
    """
    get_sdl3_function_table().destroy_haptic_effect(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
        Ptr(to=effect).bitcast[HapticEffectID]()[],
    )


fn get_haptic_effect_status(haptic: Ptr[Haptic], effect: HapticEffectID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHapticEffectStatus
    """
    return get_sdl3_function_table().get_haptic_effect_status(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
        Ptr(to=effect).bitcast[HapticEffectID]()[],
    )


fn set_haptic_gain(haptic: Ptr[Haptic], gain: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetHapticGain
    """
    var success = get_sdl3_function_table().set_haptic_gain(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[], Ptr(to=gain).bitcast[Int32]()[]
    )
    if not success:
        raise get_error()


fn set_haptic_autocenter(haptic: Ptr[Haptic], autocenter: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetHapticAutocenter
    """
    var success = get_sdl3_function_table().set_haptic_autocenter(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
        Ptr(to=autocenter).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn pause_haptic(haptic: Ptr[Haptic]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PauseHaptic
    """
    var success = get_sdl3_function_table().pause_haptic(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn resume_haptic(haptic: Ptr[Haptic]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResumeHaptic
    """
    var success = get_sdl3_function_table().resume_haptic(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn stop_haptic_effects(haptic: Ptr[Haptic]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StopHapticEffects
    """
    var success = get_sdl3_function_table().stop_haptic_effects(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn haptic_rumble_supported(haptic: Ptr[Haptic]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HapticRumbleSupported
    """
    return get_sdl3_function_table().haptic_rumble_supported(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )


fn init_haptic_rumble(haptic: Ptr[Haptic]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_InitHapticRumble
    """
    var success = get_sdl3_function_table().init_haptic_rumble(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn play_haptic_rumble(haptic: Ptr[Haptic], strength: Float32, length: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PlayHapticRumble
    """
    var success = get_sdl3_function_table().play_haptic_rumble(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[],
        Ptr(to=strength).bitcast[Float32]()[],
        Ptr(to=length).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn stop_haptic_rumble(haptic: Ptr[Haptic]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StopHapticRumble
    """
    var success = get_sdl3_function_table().stop_haptic_rumble(
        Ptr(to=haptic).bitcast[Ptr[Haptic, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn set_hint_with_priority(name: CStringSlice, value: CStringSlice, priority: HintPriority) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetHintWithPriority
    """
    var success = get_sdl3_function_table().set_hint_with_priority(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=priority).bitcast[HintPriority]()[],
    )
    if not success:
        raise get_error()


fn set_hint(name: CStringSlice, value: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetHint
    """
    var success = get_sdl3_function_table().set_hint(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn reset_hint(name: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResetHint
    """
    var success = get_sdl3_function_table().reset_hint(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not success:
        raise get_error()


fn reset_hints():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResetHints
    """
    get_sdl3_function_table().reset_hints()


fn get_hint(name: CStringSlice) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHint
    """
    var cstring = get_sdl3_function_table().get_hint(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_hint call. See official documentation for details."
    return cstring


fn get_hint_boolean(name: CStringSlice, default_value: Bool) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetHintBoolean
    """
    return get_sdl3_function_table().get_hint_boolean(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=default_value).bitcast[Bool]()[],
    )


fn add_hint_callback(name: CStringSlice, callback: HintCallback, userdata: Ptr[NoneType]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddHintCallback
    """
    var success = get_sdl3_function_table().add_hint_callback(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=callback).bitcast[HintCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn remove_hint_callback(name: CStringSlice, callback: HintCallback, userdata: Ptr[NoneType]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveHintCallback
    """
    get_sdl3_function_table().remove_hint_callback(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=callback).bitcast[HintCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )


fn init(flags: InitFlags) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Init
    """
    var success = get_sdl3_function_table().init(Ptr(to=flags).bitcast[InitFlags]()[])
    if not success:
        raise get_error()


fn init_sub_system(flags: InitFlags) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_InitSubSystem
    """
    var success = get_sdl3_function_table().init_sub_system(Ptr(to=flags).bitcast[InitFlags]()[])
    if not success:
        raise get_error()


fn quit_sub_system(flags: InitFlags):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_QuitSubSystem
    """
    get_sdl3_function_table().quit_sub_system(Ptr(to=flags).bitcast[InitFlags]()[])


fn was_init(flags: InitFlags) -> InitFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WasInit
    """
    return get_sdl3_function_table().was_init(Ptr(to=flags).bitcast[InitFlags]()[])


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
    callback: MainThreadCallback, userdata: Ptr[NoneType], wait_complete: Bool
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RunOnMainThread
    """
    var success = get_sdl3_function_table().run_on_main_thread(
        Ptr(to=callback).bitcast[MainThreadCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=wait_complete).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn set_app_metadata(
    appname: CStringSlice, appversion: CStringSlice, appidentifier: CStringSlice
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAppMetadata
    """
    var success = get_sdl3_function_table().set_app_metadata(
        appname.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        appversion.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        appidentifier.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn set_app_metadata_property(name: CStringSlice, value: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetAppMetadataProperty
    """
    var success = get_sdl3_function_table().set_app_metadata_property(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn get_app_metadata_property(name: CStringSlice) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetAppMetadataProperty
    """
    var cstring = get_sdl3_function_table().get_app_metadata_property(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_app_metadata_property call. See official documentation for details."
    return cstring


fn io_from_file(file: CStringSlice, mode: CStringSlice) raises -> Ptr[IOStream, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOFromFile
    """
    var result = get_sdl3_function_table().io_from_file(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        mode.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise get_error()
    return result


fn io_from_mem(mem: Ptr[NoneType], size: Int32) raises -> Ptr[IOStream, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOFromMem
    """
    var result = get_sdl3_function_table().io_from_mem(
        Ptr(to=mem).bitcast[Ptr[NoneType, MutExternalOrigin]]()[], Ptr(to=size).bitcast[Int32]()[]
    )
    if not result:
        raise get_error()
    return result


fn io_from_const_mem(mem: Ptr[NoneType], size: Int32) raises -> Ptr[IOStream, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOFromConstMem
    """
    var result = get_sdl3_function_table().io_from_const_mem(
        Ptr(to=mem).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[], Ptr(to=size).bitcast[Int32]()[]
    )
    if not result:
        raise get_error()
    return result


fn io_from_dynamic_mem() raises -> Ptr[IOStream, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOFromDynamicMem
    """
    var result = get_sdl3_function_table().io_from_dynamic_mem()
    if not result:
        raise get_error()
    return result


fn open_io(
    iface: Ptr[IOStreamInterface], userdata: Ptr[NoneType]
) raises -> Ptr[IOStream, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenIO
    """
    var result = get_sdl3_function_table().open_io(
        Ptr(to=iface).bitcast[Ptr[IOStreamInterface, ImmutExternalOrigin]]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn close_io(context: Ptr[IOStream]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseIO
    """
    var success = get_sdl3_function_table().close_io(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn get_io_properties(context: Ptr[IOStream]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetIOProperties
    """
    return get_sdl3_function_table().get_io_properties(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn get_io_status(context: Ptr[IOStream]) -> IOStatus:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetIOStatus
    """
    return get_sdl3_function_table().get_io_status(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn get_io_size(context: Ptr[IOStream]) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetIOSize
    """
    return get_sdl3_function_table().get_io_size(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn seek_io(context: Ptr[IOStream], offset: Int64, whence: IOWhence) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SeekIO
    """
    return get_sdl3_function_table().seek_io(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=offset).bitcast[Int64]()[],
        Ptr(to=whence).bitcast[IOWhence]()[],
    )


fn tell_io(context: Ptr[IOStream]) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TellIO
    """
    return get_sdl3_function_table().tell_io(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )


fn read_io(context: Ptr[IOStream], ptr: Ptr[NoneType], size: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadIO
    """
    return get_sdl3_function_table().read_io(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=ptr).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=size).bitcast[Int32]()[],
    )


fn write_io(context: Ptr[IOStream], ptr: Ptr[NoneType], size: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteIO
    """
    return get_sdl3_function_table().write_io(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=ptr).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=size).bitcast[Int32]()[],
    )


fn i_oprintf(context: Ptr[IOStream], fmt: CStringSlice) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOprintf
    """
    return get_sdl3_function_table().i_oprintf(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn i_ovprintf(context: Ptr[IOStream], fmt: CStringSlice, ap: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IOvprintf
    """
    return get_sdl3_function_table().i_ovprintf(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=ap).bitcast[Int32]()[],
    )


fn flush_io(context: Ptr[IOStream]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushIO
    """
    var success = get_sdl3_function_table().flush_io(
        Ptr(to=context).bitcast[Ptr[IOStream, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn load_file_io(
    src: Ptr[IOStream], datasize: Ptr[Int32], closeio: Bool
) raises -> Ptr[NoneType, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadFile_IO
    """
    var result = get_sdl3_function_table().load_file_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=datasize).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not result:
        raise get_error()
    return result


fn load_file(file: CStringSlice, datasize: Ptr[Int32]) raises -> Ptr[NoneType, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadFile
    """
    var result = get_sdl3_function_table().load_file(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=datasize).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn save_file_io(src: Ptr[IOStream], data: Ptr[NoneType], datasize: Int32, closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SaveFile_IO
    """
    var success = get_sdl3_function_table().save_file_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=datasize).bitcast[Int32]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn save_file(file: CStringSlice, data: Ptr[NoneType], datasize: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SaveFile
    """
    var success = get_sdl3_function_table().save_file(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=datasize).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn read_u8(src: Ptr[IOStream], value: Ptr[UInt8]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU8
    """
    var success = get_sdl3_function_table().read_u8(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_s8(src: Ptr[IOStream], value: Ptr[Int8]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS8
    """
    var success = get_sdl3_function_table().read_s8(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[Int8, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_u16_le(src: Ptr[IOStream], value: Ptr[UInt16]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU16LE
    """
    var success = get_sdl3_function_table().read_u16_le(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_s16_le(src: Ptr[IOStream], value: Ptr[Int16]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS16LE
    """
    var success = get_sdl3_function_table().read_s16_le(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[Int16, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_u16_be(src: Ptr[IOStream], value: Ptr[UInt16]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU16BE
    """
    var success = get_sdl3_function_table().read_u16_be(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_s16_be(src: Ptr[IOStream], value: Ptr[Int16]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS16BE
    """
    var success = get_sdl3_function_table().read_s16_be(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[Int16, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_u32_le(src: Ptr[IOStream], value: Ptr[UInt32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU32LE
    """
    var success = get_sdl3_function_table().read_u32_le(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_s32_le(src: Ptr[IOStream], value: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS32LE
    """
    var success = get_sdl3_function_table().read_s32_le(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_u32_be(src: Ptr[IOStream], value: Ptr[UInt32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU32BE
    """
    var success = get_sdl3_function_table().read_u32_be(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_s32_be(src: Ptr[IOStream], value: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS32BE
    """
    var success = get_sdl3_function_table().read_s32_be(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_u64_le(src: Ptr[IOStream], value: Ptr[UInt64]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU64LE
    """
    var success = get_sdl3_function_table().read_u64_le(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_s64_le(src: Ptr[IOStream], value: Ptr[Int64]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS64LE
    """
    var success = get_sdl3_function_table().read_s64_le(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[Int64, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_u64_be(src: Ptr[IOStream], value: Ptr[UInt64]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadU64BE
    """
    var success = get_sdl3_function_table().read_u64_be(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_s64_be(src: Ptr[IOStream], value: Ptr[Int64]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadS64BE
    """
    var success = get_sdl3_function_table().read_s64_be(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Ptr[Int64, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn write_u8(dst: Ptr[IOStream], value: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU8
    """
    var success = get_sdl3_function_table().write_u8(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[UInt8]()[]
    )
    if not success:
        raise get_error()


fn write_s8(dst: Ptr[IOStream], value: Int8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS8
    """
    var success = get_sdl3_function_table().write_s8(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[Int8]()[]
    )
    if not success:
        raise get_error()


fn write_u16_le(dst: Ptr[IOStream], value: UInt16) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU16LE
    """
    var success = get_sdl3_function_table().write_u16_le(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[UInt16]()[]
    )
    if not success:
        raise get_error()


fn write_s16_le(dst: Ptr[IOStream], value: Int16) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS16LE
    """
    var success = get_sdl3_function_table().write_s16_le(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[Int16]()[]
    )
    if not success:
        raise get_error()


fn write_u16_be(dst: Ptr[IOStream], value: UInt16) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU16BE
    """
    var success = get_sdl3_function_table().write_u16_be(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[UInt16]()[]
    )
    if not success:
        raise get_error()


fn write_s16_be(dst: Ptr[IOStream], value: Int16) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS16BE
    """
    var success = get_sdl3_function_table().write_s16_be(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[Int16]()[]
    )
    if not success:
        raise get_error()


fn write_u32_le(dst: Ptr[IOStream], value: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU32LE
    """
    var success = get_sdl3_function_table().write_u32_le(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[UInt32]()[]
    )
    if not success:
        raise get_error()


fn write_s32_le(dst: Ptr[IOStream], value: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS32LE
    """
    var success = get_sdl3_function_table().write_s32_le(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[Int32]()[]
    )
    if not success:
        raise get_error()


fn write_u32_be(dst: Ptr[IOStream], value: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU32BE
    """
    var success = get_sdl3_function_table().write_u32_be(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[UInt32]()[]
    )
    if not success:
        raise get_error()


fn write_s32_be(dst: Ptr[IOStream], value: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS32BE
    """
    var success = get_sdl3_function_table().write_s32_be(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[Int32]()[]
    )
    if not success:
        raise get_error()


fn write_u64_le(dst: Ptr[IOStream], value: UInt64) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU64LE
    """
    var success = get_sdl3_function_table().write_u64_le(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[UInt64]()[]
    )
    if not success:
        raise get_error()


fn write_s64_le(dst: Ptr[IOStream], value: Int64) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS64LE
    """
    var success = get_sdl3_function_table().write_s64_le(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[Int64]()[]
    )
    if not success:
        raise get_error()


fn write_u64_be(dst: Ptr[IOStream], value: UInt64) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteU64BE
    """
    var success = get_sdl3_function_table().write_u64_be(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[UInt64]()[]
    )
    if not success:
        raise get_error()


fn write_s64_be(dst: Ptr[IOStream], value: Int64) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteS64BE
    """
    var success = get_sdl3_function_table().write_s64_be(
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=value).bitcast[Int64]()[]
    )
    if not success:
        raise get_error()


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


fn get_joysticks(count: Ptr[Int32]) raises -> Ptr[JoystickID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoysticks
    """
    var result = get_sdl3_function_table().get_joysticks(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_joystick_name_for_id(instance_id: JoystickID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickNameForID
    """
    var cstring = get_sdl3_function_table().get_joystick_name_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_joystick_path_for_id(instance_id: JoystickID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPathForID
    """
    var cstring = get_sdl3_function_table().get_joystick_path_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_joystick_player_index_for_id(instance_id: JoystickID) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPlayerIndexForID
    """
    return get_sdl3_function_table().get_joystick_player_index_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_joystick_guid_for_id(instance_id: JoystickID) -> GUID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUIDForID
    """
    return get_sdl3_function_table().get_joystick_guid_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_joystick_vendor_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickVendorForID
    """
    return get_sdl3_function_table().get_joystick_vendor_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_joystick_product_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductForID
    """
    return get_sdl3_function_table().get_joystick_product_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_joystick_product_version_for_id(instance_id: JoystickID) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductVersionForID
    """
    return get_sdl3_function_table().get_joystick_product_version_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn get_joystick_type_for_id(instance_id: JoystickID) -> JoystickType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickTypeForID
    """
    return get_sdl3_function_table().get_joystick_type_for_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn open_joystick(instance_id: JoystickID) raises -> Ptr[Joystick, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenJoystick
    """
    var result = get_sdl3_function_table().open_joystick(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_joystick_from_id(instance_id: JoystickID) raises -> Ptr[Joystick, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickFromID
    """
    var result = get_sdl3_function_table().get_joystick_from_id(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_joystick_from_player_index(player_index: Int32) raises -> Ptr[Joystick, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickFromPlayerIndex
    """
    var result = get_sdl3_function_table().get_joystick_from_player_index(
        Ptr(to=player_index).bitcast[Int32]()[]
    )
    if not result:
        raise get_error()
    return result


fn attach_virtual_joystick(desc: Ptr[VirtualJoystickDesc]) -> JoystickID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AttachVirtualJoystick
    """
    return get_sdl3_function_table().attach_virtual_joystick(
        Ptr(to=desc).bitcast[Ptr[VirtualJoystickDesc, ImmutExternalOrigin]]()[]
    )


fn detach_virtual_joystick(instance_id: JoystickID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DetachVirtualJoystick
    """
    var success = get_sdl3_function_table().detach_virtual_joystick(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )
    if not success:
        raise get_error()


fn is_joystick_virtual(instance_id: JoystickID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_IsJoystickVirtual
    """
    return get_sdl3_function_table().is_joystick_virtual(
        Ptr(to=instance_id).bitcast[JoystickID]()[]
    )


fn set_joystick_virtual_axis(joystick: Ptr[Joystick], axis: Int32, value: Int16) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualAxis
    """
    var success = get_sdl3_function_table().set_joystick_virtual_axis(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=axis).bitcast[Int32]()[],
        Ptr(to=value).bitcast[Int16]()[],
    )
    if not success:
        raise get_error()


fn set_joystick_virtual_ball(
    joystick: Ptr[Joystick], ball: Int32, xrel: Int16, yrel: Int16
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualBall
    """
    var success = get_sdl3_function_table().set_joystick_virtual_ball(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=ball).bitcast[Int32]()[],
        Ptr(to=xrel).bitcast[Int16]()[],
        Ptr(to=yrel).bitcast[Int16]()[],
    )
    if not success:
        raise get_error()


fn set_joystick_virtual_button(joystick: Ptr[Joystick], button: Int32, down: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualButton
    """
    var success = get_sdl3_function_table().set_joystick_virtual_button(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=button).bitcast[Int32]()[],
        Ptr(to=down).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn set_joystick_virtual_hat(joystick: Ptr[Joystick], hat: Int32, value: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualHat
    """
    var success = get_sdl3_function_table().set_joystick_virtual_hat(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=hat).bitcast[Int32]()[],
        Ptr(to=value).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn set_joystick_virtual_touchpad(
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
    var success = get_sdl3_function_table().set_joystick_virtual_touchpad(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=touchpad).bitcast[Int32]()[],
        Ptr(to=finger).bitcast[Int32]()[],
        Ptr(to=down).bitcast[Bool]()[],
        Ptr(to=x).bitcast[Float32]()[],
        Ptr(to=y).bitcast[Float32]()[],
        Ptr(to=pressure).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn send_joystick_virtual_sensor_data(
    joystick: Ptr[Joystick],
    type: SensorType,
    sensor_timestamp: UInt64,
    data: Ptr[Float32],
    num_values: Int32,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SendJoystickVirtualSensorData
    """
    var success = get_sdl3_function_table().send_joystick_virtual_sensor_data(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=type).bitcast[SensorType]()[],
        Ptr(to=sensor_timestamp).bitcast[UInt64]()[],
        Ptr(to=data).bitcast[Ptr[Float32, ImmutExternalOrigin]]()[],
        Ptr(to=num_values).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_joystick_properties(joystick: Ptr[Joystick]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProperties
    """
    return get_sdl3_function_table().get_joystick_properties(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_name(joystick: Ptr[Joystick]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickName
    """
    var cstring = get_sdl3_function_table().get_joystick_name(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_joystick_path(joystick: Ptr[Joystick]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPath
    """
    var cstring = get_sdl3_function_table().get_joystick_path(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_joystick_player_index(joystick: Ptr[Joystick]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPlayerIndex
    """
    return get_sdl3_function_table().get_joystick_player_index(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn set_joystick_player_index(joystick: Ptr[Joystick], player_index: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickPlayerIndex
    """
    var success = get_sdl3_function_table().set_joystick_player_index(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=player_index).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_joystick_guid(joystick: Ptr[Joystick]) -> GUID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUID
    """
    return get_sdl3_function_table().get_joystick_guid(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_vendor(joystick: Ptr[Joystick]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickVendor
    """
    return get_sdl3_function_table().get_joystick_vendor(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_product(joystick: Ptr[Joystick]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProduct
    """
    return get_sdl3_function_table().get_joystick_product(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_product_version(joystick: Ptr[Joystick]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductVersion
    """
    return get_sdl3_function_table().get_joystick_product_version(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_firmware_version(joystick: Ptr[Joystick]) -> UInt16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickFirmwareVersion
    """
    return get_sdl3_function_table().get_joystick_firmware_version(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_serial(joystick: Ptr[Joystick]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickSerial
    """
    var cstring = get_sdl3_function_table().get_joystick_serial(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_joystick_serial call. See official documentation for details."
    return cstring


fn get_joystick_type(joystick: Ptr[Joystick]) -> JoystickType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickType
    """
    return get_sdl3_function_table().get_joystick_type(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_guid_info(
    guid: GUID, vendor: Ptr[UInt16], product: Ptr[UInt16], version: Ptr[UInt16], crc16: Ptr[UInt16]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUIDInfo
    """
    get_sdl3_function_table().get_joystick_guid_info(
        Ptr(to=guid).bitcast[GUID]()[],
        Ptr(to=vendor).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
        Ptr(to=product).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
        Ptr(to=version).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
        Ptr(to=crc16).bitcast[Ptr[UInt16, MutExternalOrigin]]()[],
    )


fn joystick_connected(joystick: Ptr[Joystick]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_JoystickConnected
    """
    return get_sdl3_function_table().joystick_connected(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_id(joystick: Ptr[Joystick]) -> JoystickID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickID
    """
    return get_sdl3_function_table().get_joystick_id(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_num_joystick_axes(joystick: Ptr[Joystick]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickAxes
    """
    return get_sdl3_function_table().get_num_joystick_axes(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_num_joystick_balls(joystick: Ptr[Joystick]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickBalls
    """
    return get_sdl3_function_table().get_num_joystick_balls(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_num_joystick_hats(joystick: Ptr[Joystick]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickHats
    """
    return get_sdl3_function_table().get_num_joystick_hats(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_num_joystick_buttons(joystick: Ptr[Joystick]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickButtons
    """
    return get_sdl3_function_table().get_num_joystick_buttons(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn set_joystick_events_enabled(enabled: Bool):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickEventsEnabled
    """
    get_sdl3_function_table().set_joystick_events_enabled(Ptr(to=enabled).bitcast[Bool]()[])


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


fn get_joystick_axis(joystick: Ptr[Joystick], axis: Int32) -> Int16:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickAxis
    """
    return get_sdl3_function_table().get_joystick_axis(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=axis).bitcast[Int32]()[],
    )


fn get_joystick_axis_initial_state(
    joystick: Ptr[Joystick], axis: Int32, state: Ptr[Int16]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickAxisInitialState
    """
    return get_sdl3_function_table().get_joystick_axis_initial_state(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=axis).bitcast[Int32]()[],
        Ptr(to=state).bitcast[Ptr[Int16, MutExternalOrigin]]()[],
    )


fn get_joystick_ball(joystick: Ptr[Joystick], ball: Int32, dx: Ptr[Int32], dy: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickBall
    """
    var success = get_sdl3_function_table().get_joystick_ball(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=ball).bitcast[Int32]()[],
        Ptr(to=dx).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=dy).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_joystick_hat(joystick: Ptr[Joystick], hat: Int32) -> UInt8:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickHat
    """
    return get_sdl3_function_table().get_joystick_hat(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=hat).bitcast[Int32]()[],
    )


fn get_joystick_button(joystick: Ptr[Joystick], button: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickButton
    """
    return get_sdl3_function_table().get_joystick_button(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=button).bitcast[Int32]()[],
    )


fn rumble_joystick(
    joystick: Ptr[Joystick],
    low_frequency_rumble: UInt16,
    high_frequency_rumble: UInt16,
    duration_ms: UInt32,
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RumbleJoystick
    """
    return get_sdl3_function_table().rumble_joystick(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=low_frequency_rumble).bitcast[UInt16]()[],
        Ptr(to=high_frequency_rumble).bitcast[UInt16]()[],
        Ptr(to=duration_ms).bitcast[UInt32]()[],
    )


fn rumble_joystick_triggers(
    joystick: Ptr[Joystick], left_rumble: UInt16, right_rumble: UInt16, duration_ms: UInt32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RumbleJoystickTriggers
    """
    var success = get_sdl3_function_table().rumble_joystick_triggers(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=left_rumble).bitcast[UInt16]()[],
        Ptr(to=right_rumble).bitcast[UInt16]()[],
        Ptr(to=duration_ms).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn set_joystick_led(joystick: Ptr[Joystick], red: UInt8, green: UInt8, blue: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetJoystickLED
    """
    var success = get_sdl3_function_table().set_joystick_led(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=red).bitcast[UInt8]()[],
        Ptr(to=green).bitcast[UInt8]()[],
        Ptr(to=blue).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn send_joystick_effect(joystick: Ptr[Joystick], data: Ptr[NoneType], size: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SendJoystickEffect
    """
    var success = get_sdl3_function_table().send_joystick_effect(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=size).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn close_joystick(joystick: Ptr[Joystick]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseJoystick
    """
    get_sdl3_function_table().close_joystick(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_connection_state(joystick: Ptr[Joystick]) -> JoystickConnectionState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickConnectionState
    """
    return get_sdl3_function_table().get_joystick_connection_state(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[]
    )


fn get_joystick_power_info(joystick: Ptr[Joystick], percent: Ptr[Int32]) -> PowerState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetJoystickPowerInfo
    """
    return get_sdl3_function_table().get_joystick_power_info(
        Ptr(to=joystick).bitcast[Ptr[Joystick, MutExternalOrigin]]()[],
        Ptr(to=percent).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )


fn has_keyboard() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasKeyboard
    """
    return get_sdl3_function_table().has_keyboard()


fn get_keyboards(count: Ptr[Int32]) raises -> Ptr[KeyboardID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyboards
    """
    var result = get_sdl3_function_table().get_keyboards(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_keyboard_name_for_id(instance_id: KeyboardID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyboardNameForID
    """
    var cstring = get_sdl3_function_table().get_keyboard_name_for_id(
        Ptr(to=instance_id).bitcast[KeyboardID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_keyboard_focus() -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyboardFocus
    """
    return get_sdl3_function_table().get_keyboard_focus()


fn get_keyboard_state(numkeys: Ptr[Int32]) raises -> Ptr[Bool, ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyboardState
    """
    var result = get_sdl3_function_table().get_keyboard_state(
        Ptr(to=numkeys).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
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
    get_sdl3_function_table().set_mod_state(Ptr(to=modstate).bitcast[Keymod]()[])


fn get_key_from_scancode(scancode: Scancode, modstate: Keymod, key_event: Bool) -> Keycode:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyFromScancode
    """
    return get_sdl3_function_table().get_key_from_scancode(
        Ptr(to=scancode).bitcast[Scancode]()[],
        Ptr(to=modstate).bitcast[Keymod]()[],
        Ptr(to=key_event).bitcast[Bool]()[],
    )


fn get_scancode_from_key(key: Keycode, modstate: Ptr[Keymod]) -> Scancode:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetScancodeFromKey
    """
    return get_sdl3_function_table().get_scancode_from_key(
        Ptr(to=key).bitcast[Keycode]()[],
        Ptr(to=modstate).bitcast[Ptr[Keymod, MutExternalOrigin]]()[],
    )


fn set_scancode_name(scancode: Scancode, name: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetScancodeName
    """
    var success = get_sdl3_function_table().set_scancode_name(
        Ptr(to=scancode).bitcast[Scancode]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn get_scancode_name(scancode: Scancode) -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetScancodeName
    """
    var cstring = get_sdl3_function_table().get_scancode_name(
        Ptr(to=scancode).bitcast[Scancode]()[]
    )
    return cstring


fn get_scancode_from_name(name: CStringSlice) -> Scancode:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetScancodeFromName
    """
    return get_sdl3_function_table().get_scancode_from_name(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn get_key_name(key: Keycode) -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyName
    """
    var cstring = get_sdl3_function_table().get_key_name(Ptr(to=key).bitcast[Keycode]()[])
    return cstring


fn get_key_from_name(name: CStringSlice) -> Keycode:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetKeyFromName
    """
    return get_sdl3_function_table().get_key_from_name(
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn start_text_input(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StartTextInput
    """
    var success = get_sdl3_function_table().start_text_input(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn start_text_input_with_properties(window: Ptr[Window], props: PropertiesID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StartTextInputWithProperties
    """
    var success = get_sdl3_function_table().start_text_input_with_properties(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=props).bitcast[PropertiesID]()[],
    )
    if not success:
        raise get_error()


fn text_input_active(window: Ptr[Window]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TextInputActive
    """
    return get_sdl3_function_table().text_input_active(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn stop_text_input(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StopTextInput
    """
    var success = get_sdl3_function_table().stop_text_input(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn clear_composition(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearComposition
    """
    var success = get_sdl3_function_table().clear_composition(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn set_text_input_area(window: Ptr[Window], rect: Ptr[Rect], cursor: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextInputArea
    """
    var success = get_sdl3_function_table().set_text_input_area(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=cursor).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_text_input_area(window: Ptr[Window], rect: Ptr[Rect], cursor: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextInputArea
    """
    var success = get_sdl3_function_table().get_text_input_area(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
        Ptr(to=cursor).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn has_screen_keyboard_support() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasScreenKeyboardSupport
    """
    return get_sdl3_function_table().has_screen_keyboard_support()


fn screen_keyboard_shown(window: Ptr[Window]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ScreenKeyboardShown
    """
    return get_sdl3_function_table().screen_keyboard_shown(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn set_log_priorities(priority: LogPriority):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetLogPriorities
    """
    get_sdl3_function_table().set_log_priorities(Ptr(to=priority).bitcast[LogPriority]()[])


fn set_log_priority(category: Int32, priority: LogPriority):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetLogPriority
    """
    get_sdl3_function_table().set_log_priority(
        Ptr(to=category).bitcast[Int32]()[], Ptr(to=priority).bitcast[LogPriority]()[]
    )


fn get_log_priority(category: Int32) -> LogPriority:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetLogPriority
    """
    return get_sdl3_function_table().get_log_priority(Ptr(to=category).bitcast[Int32]()[])


fn reset_log_priorities():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ResetLogPriorities
    """
    get_sdl3_function_table().reset_log_priorities()


fn set_log_priority_prefix(priority: LogPriority, prefix: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetLogPriorityPrefix
    """
    var success = get_sdl3_function_table().set_log_priority_prefix(
        Ptr(to=priority).bitcast[LogPriority]()[],
        prefix.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn log(fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Log
    """
    get_sdl3_function_table().log(fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]())


fn log_trace(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogTrace
    """
    get_sdl3_function_table().log_trace(
        Ptr(to=category).bitcast[Int32]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn log_verbose(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogVerbose
    """
    get_sdl3_function_table().log_verbose(
        Ptr(to=category).bitcast[Int32]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn log_debug(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogDebug
    """
    get_sdl3_function_table().log_debug(
        Ptr(to=category).bitcast[Int32]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn log_info(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogInfo
    """
    get_sdl3_function_table().log_info(
        Ptr(to=category).bitcast[Int32]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn log_warn(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogWarn
    """
    get_sdl3_function_table().log_warn(
        Ptr(to=category).bitcast[Int32]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn log_error(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogError
    """
    get_sdl3_function_table().log_error(
        Ptr(to=category).bitcast[Int32]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn log_critical(category: Int32, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogCritical
    """
    get_sdl3_function_table().log_critical(
        Ptr(to=category).bitcast[Int32]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn log_message(category: Int32, priority: LogPriority, fmt: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogMessage
    """
    get_sdl3_function_table().log_message(
        Ptr(to=category).bitcast[Int32]()[],
        Ptr(to=priority).bitcast[LogPriority]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn log_message_v(category: Int32, priority: LogPriority, fmt: CStringSlice, ap: Int32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LogMessageV
    """
    get_sdl3_function_table().log_message_v(
        Ptr(to=category).bitcast[Int32]()[],
        Ptr(to=priority).bitcast[LogPriority]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=ap).bitcast[Int32]()[],
    )


fn get_default_log_output_function() -> LogOutputFunction:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDefaultLogOutputFunction
    """
    return get_sdl3_function_table().get_default_log_output_function()


fn get_log_output_function(
    callback: Ptr[LogOutputFunction], userdata: Ptr[Ptr[NoneType, MutExternalOrigin]]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetLogOutputFunction
    """
    get_sdl3_function_table().get_log_output_function(
        Ptr(to=callback).bitcast[Ptr[LogOutputFunction, MutExternalOrigin]]()[],
        Ptr(to=userdata).bitcast[Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]]()[],
    )


fn set_log_output_function(callback: LogOutputFunction, userdata: Ptr[NoneType]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetLogOutputFunction
    """
    get_sdl3_function_table().set_log_output_function(
        Ptr(to=callback).bitcast[LogOutputFunction]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )


fn has_mouse() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasMouse
    """
    return get_sdl3_function_table().has_mouse()


fn get_mice(count: Ptr[Int32]) raises -> Ptr[MouseID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMice
    """
    var result = get_sdl3_function_table().get_mice(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_mouse_name_for_id(instance_id: MouseID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMouseNameForID
    """
    var cstring = get_sdl3_function_table().get_mouse_name_for_id(
        Ptr(to=instance_id).bitcast[MouseID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_mouse_focus() -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMouseFocus
    """
    return get_sdl3_function_table().get_mouse_focus()


fn get_mouse_state(x: Ptr[Float32], y: Ptr[Float32]) -> MouseButtonFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetMouseState
    """
    return get_sdl3_function_table().get_mouse_state(
        Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )


fn get_global_mouse_state(x: Ptr[Float32], y: Ptr[Float32]) -> MouseButtonFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGlobalMouseState
    """
    return get_sdl3_function_table().get_global_mouse_state(
        Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )


fn get_relative_mouse_state(x: Ptr[Float32], y: Ptr[Float32]) -> MouseButtonFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRelativeMouseState
    """
    return get_sdl3_function_table().get_relative_mouse_state(
        Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )


fn warp_mouse_in_window(window: Ptr[Window], x: Float32, y: Float32):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WarpMouseInWindow
    """
    get_sdl3_function_table().warp_mouse_in_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Float32]()[],
        Ptr(to=y).bitcast[Float32]()[],
    )


fn warp_mouse_global(x: Float32, y: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WarpMouseGlobal
    """
    var success = get_sdl3_function_table().warp_mouse_global(
        Ptr(to=x).bitcast[Float32]()[], Ptr(to=y).bitcast[Float32]()[]
    )
    if not success:
        raise get_error()


fn set_relative_mouse_transform(
    callback: MouseMotionTransformCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRelativeMouseTransform
    """
    var success = get_sdl3_function_table().set_relative_mouse_transform(
        Ptr(to=callback).bitcast[MouseMotionTransformCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_window_relative_mouse_mode(window: Ptr[Window], enabled: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowRelativeMouseMode
    """
    var success = get_sdl3_function_table().set_window_relative_mouse_mode(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=enabled).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn get_window_relative_mouse_mode(window: Ptr[Window]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowRelativeMouseMode
    """
    return get_sdl3_function_table().get_window_relative_mouse_mode(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn capture_mouse(enabled: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CaptureMouse
    """
    var success = get_sdl3_function_table().capture_mouse(Ptr(to=enabled).bitcast[Bool]()[])
    if not success:
        raise get_error()


fn create_cursor(
    data: Ptr[UInt8], mask: Ptr[UInt8], w: Int32, h: Int32, hot_x: Int32, hot_y: Int32
) raises -> Ptr[Cursor, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateCursor
    """
    var result = get_sdl3_function_table().create_cursor(
        Ptr(to=data).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
        Ptr(to=mask).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Int32]()[],
        Ptr(to=h).bitcast[Int32]()[],
        Ptr(to=hot_x).bitcast[Int32]()[],
        Ptr(to=hot_y).bitcast[Int32]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_color_cursor(
    surface: Ptr[Surface], hot_x: Int32, hot_y: Int32
) raises -> Ptr[Cursor, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateColorCursor
    """
    var result = get_sdl3_function_table().create_color_cursor(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=hot_x).bitcast[Int32]()[],
        Ptr(to=hot_y).bitcast[Int32]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_animated_cursor(
    frames: Ptr[CursorFrameInfo], frame_count: Int32, hot_x: Int32, hot_y: Int32
) raises -> Ptr[Cursor, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateAnimatedCursor
    """
    var result = get_sdl3_function_table().create_animated_cursor(
        Ptr(to=frames).bitcast[Ptr[CursorFrameInfo, MutExternalOrigin]]()[],
        Ptr(to=frame_count).bitcast[Int32]()[],
        Ptr(to=hot_x).bitcast[Int32]()[],
        Ptr(to=hot_y).bitcast[Int32]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_system_cursor(id: SystemCursor) raises -> Ptr[Cursor, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSystemCursor
    """
    var result = get_sdl3_function_table().create_system_cursor(
        Ptr(to=id).bitcast[SystemCursor]()[]
    )
    if not result:
        raise get_error()
    return result


fn set_cursor(cursor: Ptr[Cursor]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetCursor
    """
    var success = get_sdl3_function_table().set_cursor(
        Ptr(to=cursor).bitcast[Ptr[Cursor, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn get_cursor() raises -> Ptr[Cursor, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCursor
    """
    var result = get_sdl3_function_table().get_cursor()
    if not result:
        raise "Error in get_cursor call. See official documentation for details."
    return result


fn get_default_cursor() raises -> Ptr[Cursor, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDefaultCursor
    """
    var result = get_sdl3_function_table().get_default_cursor()
    if not result:
        raise get_error()
    return result


fn destroy_cursor(cursor: Ptr[Cursor]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyCursor
    """
    get_sdl3_function_table().destroy_cursor(
        Ptr(to=cursor).bitcast[Ptr[Cursor, MutExternalOrigin]]()[]
    )


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


fn get_pen_device_type(instance_id: PenID) -> PenDeviceType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPenDeviceType
    """
    return get_sdl3_function_table().get_pen_device_type(Ptr(to=instance_id).bitcast[PenID]()[])


fn get_pixel_format_name(format: PixelFormat) -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatName
    """
    var cstring = get_sdl3_function_table().get_pixel_format_name(
        Ptr(to=format).bitcast[PixelFormat]()[]
    )
    return cstring


fn get_masks_for_pixel_format(
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
    var success = get_sdl3_function_table().get_masks_for_pixel_format(
        Ptr(to=format).bitcast[PixelFormat]()[],
        Ptr(to=bpp).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=Rmask).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        Ptr(to=Gmask).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        Ptr(to=Bmask).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        Ptr(to=Amask).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_pixel_format_for_masks(
    bpp: Int32, Rmask: UInt32, Gmask: UInt32, Bmask: UInt32, Amask: UInt32
) -> PixelFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatForMasks
    """
    return get_sdl3_function_table().get_pixel_format_for_masks(
        Ptr(to=bpp).bitcast[Int32]()[],
        Ptr(to=Rmask).bitcast[UInt32]()[],
        Ptr(to=Gmask).bitcast[UInt32]()[],
        Ptr(to=Bmask).bitcast[UInt32]()[],
        Ptr(to=Amask).bitcast[UInt32]()[],
    )


fn get_pixel_format_details(
    format: PixelFormat
) raises -> Ptr[PixelFormatDetails, ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatDetails
    """
    var result = get_sdl3_function_table().get_pixel_format_details(
        Ptr(to=format).bitcast[PixelFormat]()[]
    )
    if not result:
        raise get_error()
    return result


fn create_palette(ncolors: Int32) raises -> Ptr[Palette, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreatePalette
    """
    var result = get_sdl3_function_table().create_palette(Ptr(to=ncolors).bitcast[Int32]()[])
    if not result:
        raise get_error()
    return result


fn set_palette_colors(
    palette: Ptr[Palette], colors: Ptr[Color], firstcolor: Int32, ncolors: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetPaletteColors
    """
    var success = get_sdl3_function_table().set_palette_colors(
        Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[],
        Ptr(to=colors).bitcast[Ptr[Color, ImmutExternalOrigin]]()[],
        Ptr(to=firstcolor).bitcast[Int32]()[],
        Ptr(to=ncolors).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn destroy_palette(palette: Ptr[Palette]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyPalette
    """
    get_sdl3_function_table().destroy_palette(
        Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[]
    )


fn map_rgb(
    format: Ptr[PixelFormatDetails], palette: Ptr[Palette], r: UInt8, g: UInt8, b: UInt8
) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapRGB
    """
    return get_sdl3_function_table().map_rgb(
        Ptr(to=format).bitcast[Ptr[PixelFormatDetails, ImmutExternalOrigin]]()[],
        Ptr(to=palette).bitcast[Ptr[Palette, ImmutExternalOrigin]]()[],
        Ptr(to=r).bitcast[UInt8]()[],
        Ptr(to=g).bitcast[UInt8]()[],
        Ptr(to=b).bitcast[UInt8]()[],
    )


fn map_rgba(
    format: Ptr[PixelFormatDetails], palette: Ptr[Palette], r: UInt8, g: UInt8, b: UInt8, a: UInt8
) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapRGBA
    """
    return get_sdl3_function_table().map_rgba(
        Ptr(to=format).bitcast[Ptr[PixelFormatDetails, ImmutExternalOrigin]]()[],
        Ptr(to=palette).bitcast[Ptr[Palette, ImmutExternalOrigin]]()[],
        Ptr(to=r).bitcast[UInt8]()[],
        Ptr(to=g).bitcast[UInt8]()[],
        Ptr(to=b).bitcast[UInt8]()[],
        Ptr(to=a).bitcast[UInt8]()[],
    )


fn get_rgb(
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
    get_sdl3_function_table().get_rgb(
        Ptr(to=pixelvalue).bitcast[UInt32]()[],
        Ptr(to=format).bitcast[Ptr[PixelFormatDetails, ImmutExternalOrigin]]()[],
        Ptr(to=palette).bitcast[Ptr[Palette, ImmutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )


fn get_rgba(
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
    get_sdl3_function_table().get_rgba(
        Ptr(to=pixelvalue).bitcast[UInt32]()[],
        Ptr(to=format).bitcast[Ptr[PixelFormatDetails, ImmutExternalOrigin]]()[],
        Ptr(to=palette).bitcast[Ptr[Palette, ImmutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=a).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )


fn get_power_info(seconds: Ptr[Int32], percent: Ptr[Int32]) -> PowerState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPowerInfo
    """
    return get_sdl3_function_table().get_power_info(
        Ptr(to=seconds).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=percent).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )


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
    var success = get_sdl3_function_table().copy_properties(
        Ptr(to=src).bitcast[PropertiesID]()[], Ptr(to=dst).bitcast[PropertiesID]()[]
    )
    if not success:
        raise get_error()


fn lock_properties(props: PropertiesID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockProperties
    """
    var success = get_sdl3_function_table().lock_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not success:
        raise get_error()


fn unlock_properties(props: PropertiesID):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnlockProperties
    """
    get_sdl3_function_table().unlock_properties(Ptr(to=props).bitcast[PropertiesID]()[])


fn set_pointer_property_with_cleanup(
    props: PropertiesID,
    name: CStringSlice,
    value: Ptr[NoneType],
    cleanup: CleanupPropertyCallback,
    userdata: Ptr[NoneType],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetPointerPropertyWithCleanup
    """
    var success = get_sdl3_function_table().set_pointer_property_with_cleanup(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=value).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=cleanup).bitcast[CleanupPropertyCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_pointer_property(props: PropertiesID, name: CStringSlice, value: Ptr[NoneType]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetPointerProperty
    """
    var success = get_sdl3_function_table().set_pointer_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=value).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_string_property(props: PropertiesID, name: CStringSlice, value: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetStringProperty
    """
    var success = get_sdl3_function_table().set_string_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn set_number_property(props: PropertiesID, name: CStringSlice, value: Int64) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetNumberProperty
    """
    var success = get_sdl3_function_table().set_number_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=value).bitcast[Int64]()[],
    )
    if not success:
        raise get_error()


fn set_float_property(props: PropertiesID, name: CStringSlice, value: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetFloatProperty
    """
    var success = get_sdl3_function_table().set_float_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=value).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn set_boolean_property(props: PropertiesID, name: CStringSlice, value: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetBooleanProperty
    """
    var success = get_sdl3_function_table().set_boolean_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=value).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn has_property(props: PropertiesID, name: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasProperty
    """
    return get_sdl3_function_table().has_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn get_property_type(props: PropertiesID, name: CStringSlice) -> PropertyType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPropertyType
    """
    return get_sdl3_function_table().get_property_type(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn get_pointer_property(
    props: PropertiesID, name: CStringSlice, default_value: Ptr[NoneType]
) -> Ptr[NoneType, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetPointerProperty
    """
    return get_sdl3_function_table().get_pointer_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=default_value).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )


fn get_string_property(
    props: PropertiesID, name: CStringSlice, default_value: CStringSlice
) -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetStringProperty
    """
    var cstring = get_sdl3_function_table().get_string_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        default_value.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    return cstring


fn get_number_property(props: PropertiesID, name: CStringSlice, default_value: Int64) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumberProperty
    """
    return get_sdl3_function_table().get_number_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=default_value).bitcast[Int64]()[],
    )


fn get_float_property(props: PropertiesID, name: CStringSlice, default_value: Float32) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetFloatProperty
    """
    return get_sdl3_function_table().get_float_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=default_value).bitcast[Float32]()[],
    )


fn get_boolean_property(props: PropertiesID, name: CStringSlice, default_value: Bool) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetBooleanProperty
    """
    return get_sdl3_function_table().get_boolean_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=default_value).bitcast[Bool]()[],
    )


fn clear_property(props: PropertiesID, name: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearProperty
    """
    var success = get_sdl3_function_table().clear_property(
        Ptr(to=props).bitcast[PropertiesID]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn enumerate_properties(
    props: PropertiesID, callback: EnumeratePropertiesCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EnumerateProperties
    """
    var success = get_sdl3_function_table().enumerate_properties(
        Ptr(to=props).bitcast[PropertiesID]()[],
        Ptr(to=callback).bitcast[EnumeratePropertiesCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn destroy_properties(props: PropertiesID):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyProperties
    """
    get_sdl3_function_table().destroy_properties(Ptr(to=props).bitcast[PropertiesID]()[])


fn has_rect_intersection(A: Ptr[Rect], B: Ptr[Rect]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasRectIntersection
    """
    return get_sdl3_function_table().has_rect_intersection(
        Ptr(to=A).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=B).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )


fn get_rect_intersection(A: Ptr[Rect], B: Ptr[Rect], result: Ptr[Rect]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectIntersection
    """
    return get_sdl3_function_table().get_rect_intersection(
        Ptr(to=A).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=B).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=result).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )


fn get_rect_union(A: Ptr[Rect], B: Ptr[Rect], result: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectUnion
    """
    var success = get_sdl3_function_table().get_rect_union(
        Ptr(to=A).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=B).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=result).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_rect_enclosing_points(
    points: Ptr[Point], count: Int32, clip: Ptr[Rect], result: Ptr[Rect]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPoints
    """
    return get_sdl3_function_table().get_rect_enclosing_points(
        Ptr(to=points).bitcast[Ptr[Point, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
        Ptr(to=clip).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=result).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )


fn get_rect_and_line_intersection(
    rect: Ptr[Rect], X1: Ptr[Int32], Y1: Ptr[Int32], X2: Ptr[Int32], Y2: Ptr[Int32]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersection
    """
    return get_sdl3_function_table().get_rect_and_line_intersection(
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=X1).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=Y1).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=X2).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=Y2).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )


fn has_rect_intersection_float(A: Ptr[FRect], B: Ptr[FRect]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HasRectIntersectionFloat
    """
    return get_sdl3_function_table().has_rect_intersection_float(
        Ptr(to=A).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=B).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
    )


fn get_rect_intersection_float(A: Ptr[FRect], B: Ptr[FRect], result: Ptr[FRect]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectIntersectionFloat
    """
    return get_sdl3_function_table().get_rect_intersection_float(
        Ptr(to=A).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=B).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=result).bitcast[Ptr[FRect, MutExternalOrigin]]()[],
    )


fn get_rect_union_float(A: Ptr[FRect], B: Ptr[FRect], result: Ptr[FRect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectUnionFloat
    """
    var success = get_sdl3_function_table().get_rect_union_float(
        Ptr(to=A).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=B).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=result).bitcast[Ptr[FRect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_rect_enclosing_points_float(
    points: Ptr[FPoint], count: Int32, clip: Ptr[FRect], result: Ptr[FRect]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPointsFloat
    """
    return get_sdl3_function_table().get_rect_enclosing_points_float(
        Ptr(to=points).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
        Ptr(to=clip).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=result).bitcast[Ptr[FRect, MutExternalOrigin]]()[],
    )


fn get_rect_and_line_intersection_float(
    rect: Ptr[FRect], X1: Ptr[Float32], Y1: Ptr[Float32], X2: Ptr[Float32], Y2: Ptr[Float32]
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersectionFloat
    """
    return get_sdl3_function_table().get_rect_and_line_intersection_float(
        Ptr(to=rect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=X1).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=Y1).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=X2).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=Y2).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )


fn get_num_render_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumRenderDrivers
    """
    return get_sdl3_function_table().get_num_render_drivers()


fn get_render_driver(index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderDriver
    """
    var cstring = get_sdl3_function_table().get_render_driver(Ptr(to=index).bitcast[Int32]()[])
    if not cstring.unsafe_ptr():
        raise "Error in get_render_driver call. See official documentation for details."
    return cstring


fn create_window_and_renderer(
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
    var success = get_sdl3_function_table().create_window_and_renderer(
        title.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=width).bitcast[Int32]()[],
        Ptr(to=height).bitcast[Int32]()[],
        Ptr(to=window_flags).bitcast[WindowFlags]()[],
        Ptr(to=window).bitcast[Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin]]()[],
        Ptr(to=renderer).bitcast[Ptr[Ptr[Renderer, MutExternalOrigin], MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn create_renderer(
    window: Ptr[Window], name: CStringSlice
) raises -> Ptr[Renderer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateRenderer
    """
    var result = get_sdl3_function_table().create_renderer(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        name.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not result:
        raise get_error()
    return result


fn create_renderer_with_properties(props: PropertiesID) raises -> Ptr[Renderer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateRendererWithProperties
    """
    var result = get_sdl3_function_table().create_renderer_with_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not result:
        raise get_error()
    return result


fn create_gpu_renderer(
    device: Ptr[GPUDevice], window: Ptr[Window]
) raises -> Ptr[Renderer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPURenderer
    """
    var result = get_sdl3_function_table().create_gpu_renderer(
        Ptr(to=device).bitcast[Ptr[GPUDevice, MutExternalOrigin]]()[],
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn get_gpu_renderer_device(renderer: Ptr[Renderer]) raises -> Ptr[GPUDevice, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGPURendererDevice
    """
    var result = get_sdl3_function_table().get_gpu_renderer_device(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn create_software_renderer(surface: Ptr[Surface]) raises -> Ptr[Renderer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSoftwareRenderer
    """
    var result = get_sdl3_function_table().create_software_renderer(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_renderer(window: Ptr[Window]) raises -> Ptr[Renderer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderer
    """
    var result = get_sdl3_function_table().get_renderer(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_render_window(renderer: Ptr[Renderer]) raises -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderWindow
    """
    var result = get_sdl3_function_table().get_render_window(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_renderer_name(renderer: Ptr[Renderer]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRendererName
    """
    var cstring = get_sdl3_function_table().get_renderer_name(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_renderer_properties(renderer: Ptr[Renderer]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRendererProperties
    """
    return get_sdl3_function_table().get_renderer_properties(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )


fn get_render_output_size(renderer: Ptr[Renderer], w: Ptr[Int32], h: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderOutputSize
    """
    var success = get_sdl3_function_table().get_render_output_size(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_current_render_output_size(renderer: Ptr[Renderer], w: Ptr[Int32], h: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentRenderOutputSize
    """
    var success = get_sdl3_function_table().get_current_render_output_size(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn create_texture(
    renderer: Ptr[Renderer], format: PixelFormat, access: TextureAccess, w: Int32, h: Int32
) raises -> Ptr[Texture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateTexture
    """
    var result = get_sdl3_function_table().create_texture(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=format).bitcast[PixelFormat]()[],
        Ptr(to=access).bitcast[TextureAccess]()[],
        Ptr(to=w).bitcast[Int32]()[],
        Ptr(to=h).bitcast[Int32]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_texture_from_surface(
    renderer: Ptr[Renderer], surface: Ptr[Surface]
) raises -> Ptr[Texture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateTextureFromSurface
    """
    var result = get_sdl3_function_table().create_texture_from_surface(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_texture_with_properties(
    renderer: Ptr[Renderer], props: PropertiesID
) raises -> Ptr[Texture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateTextureWithProperties
    """
    var result = get_sdl3_function_table().create_texture_with_properties(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=props).bitcast[PropertiesID]()[],
    )
    if not result:
        raise get_error()
    return result


fn get_texture_properties(texture: Ptr[Texture]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureProperties
    """
    return get_sdl3_function_table().get_texture_properties(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[]
    )


fn get_renderer_from_texture(texture: Ptr[Texture]) raises -> Ptr[Renderer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRendererFromTexture
    """
    var result = get_sdl3_function_table().get_renderer_from_texture(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_texture_size(texture: Ptr[Texture], w: Ptr[Float32], h: Ptr[Float32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureSize
    """
    var success = get_sdl3_function_table().get_texture_size(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_texture_palette(texture: Ptr[Texture], palette: Ptr[Palette]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTexturePalette
    """
    var success = get_sdl3_function_table().set_texture_palette(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_texture_palette(texture: Ptr[Texture]) raises -> Ptr[Palette, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTexturePalette
    """
    var result = get_sdl3_function_table().get_texture_palette(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in get_texture_palette call. See official documentation for details."
    return result


fn set_texture_color_mod(texture: Ptr[Texture], r: UInt8, g: UInt8, b: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureColorMod
    """
    var success = get_sdl3_function_table().set_texture_color_mod(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[UInt8]()[],
        Ptr(to=g).bitcast[UInt8]()[],
        Ptr(to=b).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn set_texture_color_mod_float(texture: Ptr[Texture], r: Float32, g: Float32, b: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureColorModFloat
    """
    var success = get_sdl3_function_table().set_texture_color_mod_float(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Float32]()[],
        Ptr(to=g).bitcast[Float32]()[],
        Ptr(to=b).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_texture_color_mod(
    texture: Ptr[Texture], r: Ptr[UInt8], g: Ptr[UInt8], b: Ptr[UInt8]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureColorMod
    """
    var success = get_sdl3_function_table().get_texture_color_mod(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_texture_color_mod_float(
    texture: Ptr[Texture], r: Ptr[Float32], g: Ptr[Float32], b: Ptr[Float32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureColorModFloat
    """
    var success = get_sdl3_function_table().get_texture_color_mod_float(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_texture_alpha_mod(texture: Ptr[Texture], alpha: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureAlphaMod
    """
    var success = get_sdl3_function_table().set_texture_alpha_mod(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=alpha).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn set_texture_alpha_mod_float(texture: Ptr[Texture], alpha: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureAlphaModFloat
    """
    var success = get_sdl3_function_table().set_texture_alpha_mod_float(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=alpha).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_texture_alpha_mod(texture: Ptr[Texture], alpha: Ptr[UInt8]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaMod
    """
    var success = get_sdl3_function_table().get_texture_alpha_mod(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=alpha).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_texture_alpha_mod_float(texture: Ptr[Texture], alpha: Ptr[Float32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaModFloat
    """
    var success = get_sdl3_function_table().get_texture_alpha_mod_float(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=alpha).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_texture_blend_mode(texture: Ptr[Texture], blendMode: BlendMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureBlendMode
    """
    var success = get_sdl3_function_table().set_texture_blend_mode(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=blendMode).bitcast[BlendMode]()[],
    )
    if not success:
        raise get_error()


fn get_texture_blend_mode(texture: Ptr[Texture], blendMode: Ptr[BlendMode]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureBlendMode
    """
    var success = get_sdl3_function_table().get_texture_blend_mode(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=blendMode).bitcast[Ptr[BlendMode, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_texture_scale_mode(texture: Ptr[Texture], scaleMode: ScaleMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetTextureScaleMode
    """
    var success = get_sdl3_function_table().set_texture_scale_mode(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=scaleMode).bitcast[ScaleMode]()[],
    )
    if not success:
        raise get_error()


fn get_texture_scale_mode(texture: Ptr[Texture], scaleMode: Ptr[ScaleMode]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTextureScaleMode
    """
    var success = get_sdl3_function_table().get_texture_scale_mode(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=scaleMode).bitcast[Ptr[ScaleMode, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn update_texture(
    texture: Ptr[Texture], rect: Ptr[Rect], pixels: Ptr[NoneType], pitch: Int32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateTexture
    """
    var success = get_sdl3_function_table().update_texture(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=pixels).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=pitch).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn update_yuv_texture(
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
    var success = get_sdl3_function_table().update_yuv_texture(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=Yplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
        Ptr(to=Ypitch).bitcast[Int32]()[],
        Ptr(to=Uplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
        Ptr(to=Upitch).bitcast[Int32]()[],
        Ptr(to=Vplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
        Ptr(to=Vpitch).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn update_nv_texture(
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
    var success = get_sdl3_function_table().update_nv_texture(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=Yplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
        Ptr(to=Ypitch).bitcast[Int32]()[],
        Ptr(to=UVplane).bitcast[Ptr[UInt8, ImmutExternalOrigin]]()[],
        Ptr(to=UVpitch).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn lock_texture(
    texture: Ptr[Texture],
    rect: Ptr[Rect],
    pixels: Ptr[Ptr[NoneType, MutExternalOrigin]],
    pitch: Ptr[Int32],
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockTexture
    """
    return get_sdl3_function_table().lock_texture(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=pixels).bitcast[Ptr[Ptr[NoneType, MutExternalOrigin], MutExternalOrigin]]()[],
        Ptr(to=pitch).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )


fn lock_texture_to_surface(
    texture: Ptr[Texture], rect: Ptr[Rect], surface: Ptr[Ptr[Surface, MutExternalOrigin]]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockTextureToSurface
    """
    var success = get_sdl3_function_table().lock_texture_to_surface(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=surface).bitcast[Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn unlock_texture(texture: Ptr[Texture]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnlockTexture
    """
    get_sdl3_function_table().unlock_texture(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[]
    )


fn set_render_target(renderer: Ptr[Renderer], texture: Ptr[Texture]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderTarget
    """
    var success = get_sdl3_function_table().set_render_target(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_render_target(renderer: Ptr[Renderer]) raises -> Ptr[Texture, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderTarget
    """
    var result = get_sdl3_function_table().get_render_target(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in get_render_target call. See official documentation for details."
    return result


fn set_render_logical_presentation(
    renderer: Ptr[Renderer], w: Int32, h: Int32, mode: RendererLogicalPresentation
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderLogicalPresentation
    """
    var success = get_sdl3_function_table().set_render_logical_presentation(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Int32]()[],
        Ptr(to=h).bitcast[Int32]()[],
        Ptr(to=mode).bitcast[RendererLogicalPresentation]()[],
    )
    if not success:
        raise get_error()


fn get_render_logical_presentation(
    renderer: Ptr[Renderer], w: Ptr[Int32], h: Ptr[Int32], mode: Ptr[RendererLogicalPresentation]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentation
    """
    var success = get_sdl3_function_table().get_render_logical_presentation(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=mode).bitcast[Ptr[RendererLogicalPresentation, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_render_logical_presentation_rect(renderer: Ptr[Renderer], rect: Ptr[FRect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentationRect
    """
    var success = get_sdl3_function_table().get_render_logical_presentation_rect(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[FRect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_coordinates_from_window(
    renderer: Ptr[Renderer], window_x: Float32, window_y: Float32, x: Ptr[Float32], y: Ptr[Float32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesFromWindow
    """
    var success = get_sdl3_function_table().render_coordinates_from_window(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=window_x).bitcast[Float32]()[],
        Ptr(to=window_y).bitcast[Float32]()[],
        Ptr(to=x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_coordinates_to_window(
    renderer: Ptr[Renderer], x: Float32, y: Float32, window_x: Ptr[Float32], window_y: Ptr[Float32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesToWindow
    """
    var success = get_sdl3_function_table().render_coordinates_to_window(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Float32]()[],
        Ptr(to=y).bitcast[Float32]()[],
        Ptr(to=window_x).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=window_y).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn convert_event_to_render_coordinates(renderer: Ptr[Renderer], event: Ptr[Event]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ConvertEventToRenderCoordinates
    """
    var success = get_sdl3_function_table().convert_event_to_render_coordinates(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=event).bitcast[Ptr[Event, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_render_viewport(renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderViewport
    """
    var success = get_sdl3_function_table().set_render_viewport(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_render_viewport(renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderViewport
    """
    var success = get_sdl3_function_table().get_render_viewport(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_viewport_set(renderer: Ptr[Renderer]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderViewportSet
    """
    return get_sdl3_function_table().render_viewport_set(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )


fn get_render_safe_area(renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderSafeArea
    """
    var success = get_sdl3_function_table().get_render_safe_area(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_render_clip_rect(renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderClipRect
    """
    var success = get_sdl3_function_table().set_render_clip_rect(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_render_clip_rect(renderer: Ptr[Renderer], rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderClipRect
    """
    var success = get_sdl3_function_table().get_render_clip_rect(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_clip_enabled(renderer: Ptr[Renderer]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderClipEnabled
    """
    return get_sdl3_function_table().render_clip_enabled(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )


fn set_render_scale(renderer: Ptr[Renderer], scaleX: Float32, scaleY: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderScale
    """
    var success = get_sdl3_function_table().set_render_scale(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=scaleX).bitcast[Float32]()[],
        Ptr(to=scaleY).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_render_scale(renderer: Ptr[Renderer], scaleX: Ptr[Float32], scaleY: Ptr[Float32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderScale
    """
    var success = get_sdl3_function_table().get_render_scale(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=scaleX).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=scaleY).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_render_draw_color(renderer: Ptr[Renderer], r: UInt8, g: UInt8, b: UInt8, a: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor
    """
    var success = get_sdl3_function_table().set_render_draw_color(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[UInt8]()[],
        Ptr(to=g).bitcast[UInt8]()[],
        Ptr(to=b).bitcast[UInt8]()[],
        Ptr(to=a).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn set_render_draw_color_float(
    renderer: Ptr[Renderer], r: Float32, g: Float32, b: Float32, a: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColorFloat
    """
    var success = get_sdl3_function_table().set_render_draw_color_float(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Float32]()[],
        Ptr(to=g).bitcast[Float32]()[],
        Ptr(to=b).bitcast[Float32]()[],
        Ptr(to=a).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_render_draw_color(
    renderer: Ptr[Renderer], r: Ptr[UInt8], g: Ptr[UInt8], b: Ptr[UInt8], a: Ptr[UInt8]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColor
    """
    var success = get_sdl3_function_table().get_render_draw_color(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=a).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_render_draw_color_float(
    renderer: Ptr[Renderer], r: Ptr[Float32], g: Ptr[Float32], b: Ptr[Float32], a: Ptr[Float32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColorFloat
    """
    var success = get_sdl3_function_table().get_render_draw_color_float(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=a).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_render_color_scale(renderer: Ptr[Renderer], scale: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderColorScale
    """
    var success = get_sdl3_function_table().set_render_color_scale(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=scale).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_render_color_scale(renderer: Ptr[Renderer], scale: Ptr[Float32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderColorScale
    """
    var success = get_sdl3_function_table().get_render_color_scale(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=scale).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_render_draw_blend_mode(renderer: Ptr[Renderer], blendMode: BlendMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawBlendMode
    """
    var success = get_sdl3_function_table().set_render_draw_blend_mode(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=blendMode).bitcast[BlendMode]()[],
    )
    if not success:
        raise get_error()


fn get_render_draw_blend_mode(renderer: Ptr[Renderer], blendMode: Ptr[BlendMode]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawBlendMode
    """
    var success = get_sdl3_function_table().get_render_draw_blend_mode(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=blendMode).bitcast[Ptr[BlendMode, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_clear(renderer: Ptr[Renderer]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderClear
    """
    var success = get_sdl3_function_table().render_clear(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn render_point(renderer: Ptr[Renderer], x: Float32, y: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderPoint
    """
    var success = get_sdl3_function_table().render_point(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Float32]()[],
        Ptr(to=y).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn render_points(renderer: Ptr[Renderer], points: Ptr[FPoint], count: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderPoints
    """
    var success = get_sdl3_function_table().render_points(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=points).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn render_line(renderer: Ptr[Renderer], x1: Float32, y1: Float32, x2: Float32, y2: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderLine
    """
    var success = get_sdl3_function_table().render_line(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=x1).bitcast[Float32]()[],
        Ptr(to=y1).bitcast[Float32]()[],
        Ptr(to=x2).bitcast[Float32]()[],
        Ptr(to=y2).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn render_lines(renderer: Ptr[Renderer], points: Ptr[FPoint], count: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderLines
    """
    var success = get_sdl3_function_table().render_lines(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=points).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn render_rect(renderer: Ptr[Renderer], rect: Ptr[FRect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderRect
    """
    var success = get_sdl3_function_table().render_rect(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_rects(renderer: Ptr[Renderer], rects: Ptr[FRect], count: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderRects
    """
    var success = get_sdl3_function_table().render_rects(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rects).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn render_fill_rect(renderer: Ptr[Renderer], rect: Ptr[FRect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderFillRect
    """
    var success = get_sdl3_function_table().render_fill_rect(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_fill_rects(renderer: Ptr[Renderer], rects: Ptr[FRect], count: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderFillRects
    """
    var success = get_sdl3_function_table().render_fill_rects(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rects).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn render_texture(
    renderer: Ptr[Renderer], texture: Ptr[Texture], srcrect: Ptr[FRect], dstrect: Ptr[FRect]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderTexture
    """
    var success = get_sdl3_function_table().render_texture(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=dstrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_texture_rotated(
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
    var success = get_sdl3_function_table().render_texture_rotated(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=dstrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=angle).bitcast[Float64]()[],
        Ptr(to=center).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
        Ptr(to=flip).bitcast[FlipMode]()[],
    )
    if not success:
        raise get_error()


fn render_texture_affine(
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
    var success = get_sdl3_function_table().render_texture_affine(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=origin).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
        Ptr(to=right).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
        Ptr(to=down).bitcast[Ptr[FPoint, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_texture_tiled(
    renderer: Ptr[Renderer],
    texture: Ptr[Texture],
    srcrect: Ptr[FRect],
    scale: Float32,
    dstrect: Ptr[FRect],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderTextureTiled
    """
    var success = get_sdl3_function_table().render_texture_tiled(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
        Ptr(to=scale).bitcast[Float32]()[],
        Ptr(to=dstrect).bitcast[Ptr[FRect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_texture9_grid(
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
    var success = get_sdl3_function_table().render_texture9_grid(
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
    if not success:
        raise get_error()


fn render_texture9_grid_tiled(
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
    var success = get_sdl3_function_table().render_texture9_grid_tiled(
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
    if not success:
        raise get_error()


fn render_geometry(
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
    var success = get_sdl3_function_table().render_geometry(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[],
        Ptr(to=vertices).bitcast[Ptr[Vertex, ImmutExternalOrigin]]()[],
        Ptr(to=num_vertices).bitcast[Int32]()[],
        Ptr(to=indices).bitcast[Ptr[Int32, ImmutExternalOrigin]]()[],
        Ptr(to=num_indices).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn render_geometry_raw(
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
    var success = get_sdl3_function_table().render_geometry_raw(
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
    if not success:
        raise get_error()


fn set_render_texture_address_mode(
    renderer: Ptr[Renderer], u_mode: TextureAddressMode, v_mode: TextureAddressMode
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderTextureAddressMode
    """
    var success = get_sdl3_function_table().set_render_texture_address_mode(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=u_mode).bitcast[TextureAddressMode]()[],
        Ptr(to=v_mode).bitcast[TextureAddressMode]()[],
    )
    if not success:
        raise get_error()


fn get_render_texture_address_mode(
    renderer: Ptr[Renderer], u_mode: Ptr[TextureAddressMode], v_mode: Ptr[TextureAddressMode]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderTextureAddressMode
    """
    var success = get_sdl3_function_table().get_render_texture_address_mode(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=u_mode).bitcast[Ptr[TextureAddressMode, MutExternalOrigin]]()[],
        Ptr(to=v_mode).bitcast[Ptr[TextureAddressMode, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_read_pixels(
    renderer: Ptr[Renderer], rect: Ptr[Rect]
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderReadPixels
    """
    var result = get_sdl3_function_table().render_read_pixels(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn render_present(renderer: Ptr[Renderer]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderPresent
    """
    var success = get_sdl3_function_table().render_present(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn destroy_texture(texture: Ptr[Texture]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyTexture
    """
    get_sdl3_function_table().destroy_texture(
        Ptr(to=texture).bitcast[Ptr[Texture, MutExternalOrigin]]()[]
    )


fn destroy_renderer(renderer: Ptr[Renderer]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyRenderer
    """
    get_sdl3_function_table().destroy_renderer(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )


fn flush_renderer(renderer: Ptr[Renderer]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlushRenderer
    """
    var success = get_sdl3_function_table().flush_renderer(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn get_render_metal_layer(renderer: Ptr[Renderer]) raises -> Ptr[NoneType, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderMetalLayer
    """
    var result = get_sdl3_function_table().get_render_metal_layer(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in get_render_metal_layer call. See official documentation for details."
    return result


fn get_render_metal_command_encoder(
    renderer: Ptr[Renderer]
) raises -> Ptr[NoneType, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderMetalCommandEncoder
    """
    var result = get_sdl3_function_table().get_render_metal_command_encoder(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in get_render_metal_command_encoder call. See official documentation for details."
    return result


fn add_vulkan_render_semaphores(
    renderer: Ptr[Renderer], wait_stage_mask: UInt32, wait_semaphore: Int64, signal_semaphore: Int64
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddVulkanRenderSemaphores
    """
    var success = get_sdl3_function_table().add_vulkan_render_semaphores(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=wait_stage_mask).bitcast[UInt32]()[],
        Ptr(to=wait_semaphore).bitcast[Int64]()[],
        Ptr(to=signal_semaphore).bitcast[Int64]()[],
    )
    if not success:
        raise get_error()


fn set_render_v_sync(renderer: Ptr[Renderer], vsync: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetRenderVSync
    """
    var success = get_sdl3_function_table().set_render_v_sync(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=vsync).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_render_v_sync(renderer: Ptr[Renderer], vsync: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRenderVSync
    """
    var success = get_sdl3_function_table().get_render_v_sync(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=vsync).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn render_debug_text(renderer: Ptr[Renderer], x: Float32, y: Float32, str: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderDebugText
    """
    var success = get_sdl3_function_table().render_debug_text(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Float32]()[],
        Ptr(to=y).bitcast[Float32]()[],
        str.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn render_debug_text_format(
    renderer: Ptr[Renderer], x: Float32, y: Float32, fmt: CStringSlice
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenderDebugTextFormat
    """
    var success = get_sdl3_function_table().render_debug_text_format(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Float32]()[],
        Ptr(to=y).bitcast[Float32]()[],
        fmt.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn set_default_texture_scale_mode(renderer: Ptr[Renderer], scale_mode: ScaleMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetDefaultTextureScaleMode
    """
    var success = get_sdl3_function_table().set_default_texture_scale_mode(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=scale_mode).bitcast[ScaleMode]()[],
    )
    if not success:
        raise get_error()


fn get_default_texture_scale_mode(renderer: Ptr[Renderer], scale_mode: Ptr[ScaleMode]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDefaultTextureScaleMode
    """
    var success = get_sdl3_function_table().get_default_texture_scale_mode(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=scale_mode).bitcast[Ptr[ScaleMode, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn create_gpu_render_state(
    renderer: Ptr[Renderer], createinfo: Ptr[GPURenderStateCreateInfo]
) raises -> Ptr[GPURenderState, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateGPURenderState
    """
    var result = get_sdl3_function_table().create_gpu_render_state(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=createinfo).bitcast[Ptr[GPURenderStateCreateInfo, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn set_gpu_render_state_fragment_uniforms(
    state: Ptr[GPURenderState], slot_index: UInt32, data: Ptr[NoneType], length: UInt32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateFragmentUniforms
    """
    var success = get_sdl3_function_table().set_gpu_render_state_fragment_uniforms(
        Ptr(to=state).bitcast[Ptr[GPURenderState, MutExternalOrigin]]()[],
        Ptr(to=slot_index).bitcast[UInt32]()[],
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=length).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn set_gpu_render_state(renderer: Ptr[Renderer], state: Ptr[GPURenderState]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetGPURenderState
    """
    var success = get_sdl3_function_table().set_gpu_render_state(
        Ptr(to=renderer).bitcast[Ptr[Renderer, MutExternalOrigin]]()[],
        Ptr(to=state).bitcast[Ptr[GPURenderState, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn destroy_gpu_render_state(state: Ptr[GPURenderState]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyGPURenderState
    """
    get_sdl3_function_table().destroy_gpu_render_state(
        Ptr(to=state).bitcast[Ptr[GPURenderState, MutExternalOrigin]]()[]
    )


fn get_sensors(count: Ptr[Int32]) raises -> Ptr[SensorID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensors
    """
    var result = get_sdl3_function_table().get_sensors(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_sensor_name_for_id(instance_id: SensorID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorNameForID
    """
    var cstring = get_sdl3_function_table().get_sensor_name_for_id(
        Ptr(to=instance_id).bitcast[SensorID]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in get_sensor_name_for_id call. See official documentation for details."
    return cstring


fn get_sensor_type_for_id(instance_id: SensorID) -> SensorType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorTypeForID
    """
    return get_sdl3_function_table().get_sensor_type_for_id(
        Ptr(to=instance_id).bitcast[SensorID]()[]
    )


fn get_sensor_non_portable_type_for_id(instance_id: SensorID) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorNonPortableTypeForID
    """
    return get_sdl3_function_table().get_sensor_non_portable_type_for_id(
        Ptr(to=instance_id).bitcast[SensorID]()[]
    )


fn open_sensor(instance_id: SensorID) raises -> Ptr[Sensor, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenSensor
    """
    var result = get_sdl3_function_table().open_sensor(Ptr(to=instance_id).bitcast[SensorID]()[])
    if not result:
        raise get_error()
    return result


fn get_sensor_from_id(instance_id: SensorID) raises -> Ptr[Sensor, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorFromID
    """
    var result = get_sdl3_function_table().get_sensor_from_id(
        Ptr(to=instance_id).bitcast[SensorID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_sensor_properties(sensor: Ptr[Sensor]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorProperties
    """
    return get_sdl3_function_table().get_sensor_properties(
        Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[]
    )


fn get_sensor_name(sensor: Ptr[Sensor]) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorName
    """
    var cstring = get_sdl3_function_table().get_sensor_name(
        Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_sensor_type(sensor: Ptr[Sensor]) -> SensorType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorType
    """
    return get_sdl3_function_table().get_sensor_type(
        Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[]
    )


fn get_sensor_non_portable_type(sensor: Ptr[Sensor]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorNonPortableType
    """
    return get_sdl3_function_table().get_sensor_non_portable_type(
        Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[]
    )


fn get_sensor_id(sensor: Ptr[Sensor]) -> SensorID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorID
    """
    return get_sdl3_function_table().get_sensor_id(
        Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[]
    )


fn get_sensor_data(sensor: Ptr[Sensor], data: Ptr[Float32], num_values: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSensorData
    """
    var success = get_sdl3_function_table().get_sensor_data(
        Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[],
        Ptr(to=data).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=num_values).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn close_sensor(sensor: Ptr[Sensor]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseSensor
    """
    get_sdl3_function_table().close_sensor(
        Ptr(to=sensor).bitcast[Ptr[Sensor, MutExternalOrigin]]()[]
    )


fn update_sensors():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateSensors
    """
    get_sdl3_function_table().update_sensors()


fn open_title_storage(
    override: CStringSlice, props: PropertiesID
) raises -> Ptr[Storage, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenTitleStorage
    """
    var result = get_sdl3_function_table().open_title_storage(
        override.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=props).bitcast[PropertiesID]()[],
    )
    if not result:
        raise get_error()
    return result


fn open_user_storage(
    org: CStringSlice, app: CStringSlice, props: PropertiesID
) raises -> Ptr[Storage, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenUserStorage
    """
    var result = get_sdl3_function_table().open_user_storage(
        org.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        app.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=props).bitcast[PropertiesID]()[],
    )
    if not result:
        raise get_error()
    return result


fn open_file_storage(path: CStringSlice) raises -> Ptr[Storage, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenFileStorage
    """
    var result = get_sdl3_function_table().open_file_storage(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not result:
        raise get_error()
    return result


fn open_storage(
    iface: Ptr[StorageInterface], userdata: Ptr[NoneType]
) raises -> Ptr[Storage, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_OpenStorage
    """
    var result = get_sdl3_function_table().open_storage(
        Ptr(to=iface).bitcast[Ptr[StorageInterface, ImmutExternalOrigin]]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn close_storage(storage: Ptr[Storage]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CloseStorage
    """
    return get_sdl3_function_table().close_storage(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[]
    )


fn storage_ready(storage: Ptr[Storage]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StorageReady
    """
    return get_sdl3_function_table().storage_ready(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[]
    )


fn get_storage_file_size(storage: Ptr[Storage], path: CStringSlice, length: Ptr[UInt64]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetStorageFileSize
    """
    var success = get_sdl3_function_table().get_storage_file_size(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=length).bitcast[Ptr[UInt64, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_storage_file(
    storage: Ptr[Storage], path: CStringSlice, destination: Ptr[NoneType], length: UInt64
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ReadStorageFile
    """
    var success = get_sdl3_function_table().read_storage_file(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=destination).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=length).bitcast[UInt64]()[],
    )
    if not success:
        raise get_error()


fn write_storage_file(
    storage: Ptr[Storage], path: CStringSlice, source: Ptr[NoneType], length: UInt64
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteStorageFile
    """
    var success = get_sdl3_function_table().write_storage_file(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=source).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=length).bitcast[UInt64]()[],
    )
    if not success:
        raise get_error()


fn create_storage_directory(storage: Ptr[Storage], path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateStorageDirectory
    """
    var success = get_sdl3_function_table().create_storage_directory(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn enumerate_storage_directory(
    storage: Ptr[Storage],
    path: CStringSlice,
    callback: EnumerateDirectoryCallback,
    userdata: Ptr[NoneType],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EnumerateStorageDirectory
    """
    var success = get_sdl3_function_table().enumerate_storage_directory(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=callback).bitcast[EnumerateDirectoryCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn remove_storage_path(storage: Ptr[Storage], path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveStoragePath
    """
    var success = get_sdl3_function_table().remove_storage_path(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn rename_storage_path(storage: Ptr[Storage], oldpath: CStringSlice, newpath: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RenameStoragePath
    """
    var success = get_sdl3_function_table().rename_storage_path(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        oldpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        newpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn copy_storage_file(storage: Ptr[Storage], oldpath: CStringSlice, newpath: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CopyStorageFile
    """
    var success = get_sdl3_function_table().copy_storage_file(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        oldpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        newpath.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn get_storage_path_info(storage: Ptr[Storage], path: CStringSlice, info: Ptr[PathInfo]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetStoragePathInfo
    """
    return get_sdl3_function_table().get_storage_path_info(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=info).bitcast[Ptr[PathInfo, MutExternalOrigin]]()[],
    )


fn get_storage_space_remaining(storage: Ptr[Storage]) -> UInt64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetStorageSpaceRemaining
    """
    return get_sdl3_function_table().get_storage_space_remaining(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[]
    )


fn glob_storage_directory(
    storage: Ptr[Storage],
    path: CStringSlice,
    pattern: CStringSlice,
    flags: GlobFlags,
    count: Ptr[Int32],
) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GlobStorageDirectory
    """
    var result = get_sdl3_function_table().glob_storage_directory(
        Ptr(to=storage).bitcast[Ptr[Storage, MutExternalOrigin]]()[],
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        pattern.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=flags).bitcast[GlobFlags]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_surface(
    width: Int32, height: Int32, format: PixelFormat
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSurface
    """
    var result = get_sdl3_function_table().create_surface(
        Ptr(to=width).bitcast[Int32]()[],
        Ptr(to=height).bitcast[Int32]()[],
        Ptr(to=format).bitcast[PixelFormat]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_surface_from(
    width: Int32, height: Int32, format: PixelFormat, pixels: Ptr[NoneType], pitch: Int32
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSurfaceFrom
    """
    var result = get_sdl3_function_table().create_surface_from(
        Ptr(to=width).bitcast[Int32]()[],
        Ptr(to=height).bitcast[Int32]()[],
        Ptr(to=format).bitcast[PixelFormat]()[],
        Ptr(to=pixels).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=pitch).bitcast[Int32]()[],
    )
    if not result:
        raise get_error()
    return result


fn destroy_surface(surface: Ptr[Surface]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroySurface
    """
    get_sdl3_function_table().destroy_surface(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )


fn get_surface_properties(surface: Ptr[Surface]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceProperties
    """
    return get_sdl3_function_table().get_surface_properties(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )


fn set_surface_colorspace(surface: Ptr[Surface], colorspace: Colorspace) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorspace
    """
    var success = get_sdl3_function_table().set_surface_colorspace(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=colorspace).bitcast[Colorspace]()[],
    )
    if not success:
        raise get_error()


fn get_surface_colorspace(surface: Ptr[Surface]) -> Colorspace:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorspace
    """
    return get_sdl3_function_table().get_surface_colorspace(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )


fn create_surface_palette(surface: Ptr[Surface]) raises -> Ptr[Palette, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateSurfacePalette
    """
    var result = get_sdl3_function_table().create_surface_palette(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn set_surface_palette(surface: Ptr[Surface], palette: Ptr[Palette]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfacePalette
    """
    var success = get_sdl3_function_table().set_surface_palette(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_surface_palette(surface: Ptr[Surface]) raises -> Ptr[Palette, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfacePalette
    """
    var result = get_sdl3_function_table().get_surface_palette(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in get_surface_palette call. See official documentation for details."
    return result


fn add_surface_alternate_image(surface: Ptr[Surface], image: Ptr[Surface]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddSurfaceAlternateImage
    """
    var success = get_sdl3_function_table().add_surface_alternate_image(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=image).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn surface_has_alternate_images(surface: Ptr[Surface]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SurfaceHasAlternateImages
    """
    return get_sdl3_function_table().surface_has_alternate_images(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )


fn get_surface_images(
    surface: Ptr[Surface], count: Ptr[Int32]
) raises -> Ptr[Ptr[Surface, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceImages
    """
    var result = get_sdl3_function_table().get_surface_images(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn remove_surface_alternate_images(surface: Ptr[Surface]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveSurfaceAlternateImages
    """
    get_sdl3_function_table().remove_surface_alternate_images(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )


fn lock_surface(surface: Ptr[Surface]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LockSurface
    """
    var success = get_sdl3_function_table().lock_surface(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn unlock_surface(surface: Ptr[Surface]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UnlockSurface
    """
    get_sdl3_function_table().unlock_surface(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )


fn load_surface_io(src: Ptr[IOStream], closeio: Bool) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadSurface_IO
    """
    var result = get_sdl3_function_table().load_surface_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=closeio).bitcast[Bool]()[]
    )
    if not result:
        raise get_error()
    return result


fn load_surface(file: CStringSlice) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadSurface
    """
    var result = get_sdl3_function_table().load_surface(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not result:
        raise get_error()
    return result


fn load_bmp_io(src: Ptr[IOStream], closeio: Bool) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadBMP_IO
    """
    var result = get_sdl3_function_table().load_bmp_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=closeio).bitcast[Bool]()[]
    )
    if not result:
        raise get_error()
    return result


fn load_bmp(file: CStringSlice) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadBMP
    """
    var result = get_sdl3_function_table().load_bmp(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not result:
        raise get_error()
    return result


fn save_bmp_io(surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SaveBMP_IO
    """
    var success = get_sdl3_function_table().save_bmp_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn save_bmp(surface: Ptr[Surface], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SaveBMP
    """
    var success = get_sdl3_function_table().save_bmp(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn load_png_io(src: Ptr[IOStream], closeio: Bool) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadPNG_IO
    """
    var result = get_sdl3_function_table().load_png_io(
        Ptr(to=src).bitcast[Ptr[IOStream, MutExternalOrigin]]()[], Ptr(to=closeio).bitcast[Bool]()[]
    )
    if not result:
        raise get_error()
    return result


fn load_png(file: CStringSlice) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_LoadPNG
    """
    var result = get_sdl3_function_table().load_png(
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not result:
        raise get_error()
    return result


fn save_png_io(surface: Ptr[Surface], dst: Ptr[IOStream], closeio: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SavePNG_IO
    """
    var success = get_sdl3_function_table().save_png_io(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn save_png(surface: Ptr[Surface], file: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SavePNG
    """
    var success = get_sdl3_function_table().save_png(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        file.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn set_surface_rle(surface: Ptr[Surface], enabled: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceRLE
    """
    var success = get_sdl3_function_table().set_surface_rle(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=enabled).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn surface_has_rle(surface: Ptr[Surface]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SurfaceHasRLE
    """
    return get_sdl3_function_table().surface_has_rle(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )


fn set_surface_color_key(surface: Ptr[Surface], enabled: Bool, key: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorKey
    """
    var success = get_sdl3_function_table().set_surface_color_key(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=enabled).bitcast[Bool]()[],
        Ptr(to=key).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn surface_has_color_key(surface: Ptr[Surface]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SurfaceHasColorKey
    """
    return get_sdl3_function_table().surface_has_color_key(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )


fn get_surface_color_key(surface: Ptr[Surface], key: Ptr[UInt32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorKey
    """
    var success = get_sdl3_function_table().get_surface_color_key(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=key).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_surface_color_mod(surface: Ptr[Surface], r: UInt8, g: UInt8, b: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorMod
    """
    var success = get_sdl3_function_table().set_surface_color_mod(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[UInt8]()[],
        Ptr(to=g).bitcast[UInt8]()[],
        Ptr(to=b).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn get_surface_color_mod(
    surface: Ptr[Surface], r: Ptr[UInt8], g: Ptr[UInt8], b: Ptr[UInt8]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorMod
    """
    var success = get_sdl3_function_table().get_surface_color_mod(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_surface_alpha_mod(surface: Ptr[Surface], alpha: UInt8) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceAlphaMod
    """
    var success = get_sdl3_function_table().set_surface_alpha_mod(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=alpha).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn get_surface_alpha_mod(surface: Ptr[Surface], alpha: Ptr[UInt8]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceAlphaMod
    """
    var success = get_sdl3_function_table().get_surface_alpha_mod(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=alpha).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_surface_blend_mode(surface: Ptr[Surface], blendMode: BlendMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceBlendMode
    """
    var success = get_sdl3_function_table().set_surface_blend_mode(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=blendMode).bitcast[BlendMode]()[],
    )
    if not success:
        raise get_error()


fn get_surface_blend_mode(surface: Ptr[Surface], blendMode: Ptr[BlendMode]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceBlendMode
    """
    var success = get_sdl3_function_table().get_surface_blend_mode(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=blendMode).bitcast[Ptr[BlendMode, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_surface_clip_rect(surface: Ptr[Surface], rect: Ptr[Rect]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetSurfaceClipRect
    """
    return get_sdl3_function_table().set_surface_clip_rect(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )


fn get_surface_clip_rect(surface: Ptr[Surface], rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSurfaceClipRect
    """
    var success = get_sdl3_function_table().get_surface_clip_rect(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn flip_surface(surface: Ptr[Surface], flip: FlipMode) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlipSurface
    """
    var success = get_sdl3_function_table().flip_surface(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=flip).bitcast[FlipMode]()[],
    )
    if not success:
        raise get_error()


fn rotate_surface(surface: Ptr[Surface], angle: Float32) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RotateSurface
    """
    var result = get_sdl3_function_table().rotate_surface(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=angle).bitcast[Float32]()[],
    )
    if not result:
        raise get_error()
    return result


fn duplicate_surface(surface: Ptr[Surface]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DuplicateSurface
    """
    var result = get_sdl3_function_table().duplicate_surface(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn scale_surface(
    surface: Ptr[Surface], width: Int32, height: Int32, scaleMode: ScaleMode
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ScaleSurface
    """
    var result = get_sdl3_function_table().scale_surface(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=width).bitcast[Int32]()[],
        Ptr(to=height).bitcast[Int32]()[],
        Ptr(to=scaleMode).bitcast[ScaleMode]()[],
    )
    if not result:
        raise get_error()
    return result


fn convert_surface(
    surface: Ptr[Surface], format: PixelFormat
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ConvertSurface
    """
    var result = get_sdl3_function_table().convert_surface(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=format).bitcast[PixelFormat]()[],
    )
    if not result:
        raise get_error()
    return result


fn convert_surface_and_colorspace(
    surface: Ptr[Surface],
    format: PixelFormat,
    palette: Ptr[Palette],
    colorspace: Colorspace,
    props: PropertiesID,
) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ConvertSurfaceAndColorspace
    """
    var result = get_sdl3_function_table().convert_surface_and_colorspace(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=format).bitcast[PixelFormat]()[],
        Ptr(to=palette).bitcast[Ptr[Palette, MutExternalOrigin]]()[],
        Ptr(to=colorspace).bitcast[Colorspace]()[],
        Ptr(to=props).bitcast[PropertiesID]()[],
    )
    if not result:
        raise get_error()
    return result


fn convert_pixels(
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
    var success = get_sdl3_function_table().convert_pixels(
        Ptr(to=width).bitcast[Int32]()[],
        Ptr(to=height).bitcast[Int32]()[],
        Ptr(to=src_format).bitcast[PixelFormat]()[],
        Ptr(to=src).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=src_pitch).bitcast[Int32]()[],
        Ptr(to=dst_format).bitcast[PixelFormat]()[],
        Ptr(to=dst).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=dst_pitch).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn convert_pixels_and_colorspace(
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
    var success = get_sdl3_function_table().convert_pixels_and_colorspace(
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
    if not success:
        raise get_error()


fn premultiply_alpha(
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
    var success = get_sdl3_function_table().premultiply_alpha(
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
    if not success:
        raise get_error()


fn premultiply_surface_alpha(surface: Ptr[Surface], linear: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_PremultiplySurfaceAlpha
    """
    var success = get_sdl3_function_table().premultiply_surface_alpha(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=linear).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn clear_surface(surface: Ptr[Surface], r: Float32, g: Float32, b: Float32, a: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ClearSurface
    """
    var success = get_sdl3_function_table().clear_surface(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[Float32]()[],
        Ptr(to=g).bitcast[Float32]()[],
        Ptr(to=b).bitcast[Float32]()[],
        Ptr(to=a).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn fill_surface_rect(dst: Ptr[Surface], rect: Ptr[Rect], color: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FillSurfaceRect
    """
    var success = get_sdl3_function_table().fill_surface_rect(
        Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=color).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn fill_surface_rects(dst: Ptr[Surface], rects: Ptr[Rect], count: Int32, color: UInt32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FillSurfaceRects
    """
    var success = get_sdl3_function_table().fill_surface_rects(
        Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=rects).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
        Ptr(to=color).bitcast[UInt32]()[],
    )
    if not success:
        raise get_error()


fn blit_surface(
    src: Ptr[Surface], srcrect: Ptr[Rect], dst: Ptr[Surface], dstrect: Ptr[Rect]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurface
    """
    var success = get_sdl3_function_table().blit_surface(
        Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn blit_surface_unchecked(
    src: Ptr[Surface], srcrect: Ptr[Rect], dst: Ptr[Surface], dstrect: Ptr[Rect]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceUnchecked
    """
    var success = get_sdl3_function_table().blit_surface_unchecked(
        Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn blit_surface_scaled(
    src: Ptr[Surface],
    srcrect: Ptr[Rect],
    dst: Ptr[Surface],
    dstrect: Ptr[Rect],
    scaleMode: ScaleMode,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceScaled
    """
    var success = get_sdl3_function_table().blit_surface_scaled(
        Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=scaleMode).bitcast[ScaleMode]()[],
    )
    if not success:
        raise get_error()


fn blit_surface_unchecked_scaled(
    src: Ptr[Surface],
    srcrect: Ptr[Rect],
    dst: Ptr[Surface],
    dstrect: Ptr[Rect],
    scaleMode: ScaleMode,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceUncheckedScaled
    """
    var success = get_sdl3_function_table().blit_surface_unchecked_scaled(
        Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=scaleMode).bitcast[ScaleMode]()[],
    )
    if not success:
        raise get_error()


fn stretch_surface(
    src: Ptr[Surface],
    srcrect: Ptr[Rect],
    dst: Ptr[Surface],
    dstrect: Ptr[Rect],
    scaleMode: ScaleMode,
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_StretchSurface
    """
    var success = get_sdl3_function_table().stretch_surface(
        Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=scaleMode).bitcast[ScaleMode]()[],
    )
    if not success:
        raise get_error()


fn blit_surface_tiled(
    src: Ptr[Surface], srcrect: Ptr[Rect], dst: Ptr[Surface], dstrect: Ptr[Rect]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceTiled
    """
    var success = get_sdl3_function_table().blit_surface_tiled(
        Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn blit_surface_tiled_with_scale(
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
    var success = get_sdl3_function_table().blit_surface_tiled_with_scale(
        Ptr(to=src).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=srcrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=scale).bitcast[Float32]()[],
        Ptr(to=scaleMode).bitcast[ScaleMode]()[],
        Ptr(to=dst).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=dstrect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn blit_surface9_grid(
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
    var success = get_sdl3_function_table().blit_surface9_grid(
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
    if not success:
        raise get_error()


fn map_surface_rgb(surface: Ptr[Surface], r: UInt8, g: UInt8, b: UInt8) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapSurfaceRGB
    """
    return get_sdl3_function_table().map_surface_rgb(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[UInt8]()[],
        Ptr(to=g).bitcast[UInt8]()[],
        Ptr(to=b).bitcast[UInt8]()[],
    )


fn map_surface_rgba(surface: Ptr[Surface], r: UInt8, g: UInt8, b: UInt8, a: UInt8) -> UInt32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MapSurfaceRGBA
    """
    return get_sdl3_function_table().map_surface_rgba(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=r).bitcast[UInt8]()[],
        Ptr(to=g).bitcast[UInt8]()[],
        Ptr(to=b).bitcast[UInt8]()[],
        Ptr(to=a).bitcast[UInt8]()[],
    )


fn read_surface_pixel(
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
    var success = get_sdl3_function_table().read_surface_pixel(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Int32]()[],
        Ptr(to=y).bitcast[Int32]()[],
        Ptr(to=r).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
        Ptr(to=a).bitcast[Ptr[UInt8, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn read_surface_pixel_float(
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
    var success = get_sdl3_function_table().read_surface_pixel_float(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Int32]()[],
        Ptr(to=y).bitcast[Int32]()[],
        Ptr(to=r).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=g).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=b).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=a).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn write_surface_pixel(
    surface: Ptr[Surface], x: Int32, y: Int32, r: UInt8, g: UInt8, b: UInt8, a: UInt8
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteSurfacePixel
    """
    var success = get_sdl3_function_table().write_surface_pixel(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Int32]()[],
        Ptr(to=y).bitcast[Int32]()[],
        Ptr(to=r).bitcast[UInt8]()[],
        Ptr(to=g).bitcast[UInt8]()[],
        Ptr(to=b).bitcast[UInt8]()[],
        Ptr(to=a).bitcast[UInt8]()[],
    )
    if not success:
        raise get_error()


fn write_surface_pixel_float(
    surface: Ptr[Surface], x: Int32, y: Int32, r: Float32, g: Float32, b: Float32, a: Float32
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WriteSurfacePixelFloat
    """
    var success = get_sdl3_function_table().write_surface_pixel_float(
        Ptr(to=surface).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Int32]()[],
        Ptr(to=y).bitcast[Int32]()[],
        Ptr(to=r).bitcast[Float32]()[],
        Ptr(to=g).bitcast[Float32]()[],
        Ptr(to=b).bitcast[Float32]()[],
        Ptr(to=a).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_date_time_locale_preferences(
    dateFormat: Ptr[DateFormat], timeFormat: Ptr[TimeFormat]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDateTimeLocalePreferences
    """
    var success = get_sdl3_function_table().get_date_time_locale_preferences(
        Ptr(to=dateFormat).bitcast[Ptr[DateFormat, MutExternalOrigin]]()[],
        Ptr(to=timeFormat).bitcast[Ptr[TimeFormat, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_current_time(ticks: Ptr[Time]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentTime
    """
    var success = get_sdl3_function_table().get_current_time(
        Ptr(to=ticks).bitcast[Ptr[Time, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn time_to_date_time(ticks: Time, dt: Ptr[DateTime], localTime: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TimeToDateTime
    """
    var success = get_sdl3_function_table().time_to_date_time(
        Ptr(to=ticks).bitcast[Time]()[],
        Ptr(to=dt).bitcast[Ptr[DateTime, MutExternalOrigin]]()[],
        Ptr(to=localTime).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn date_time_to_time(dt: Ptr[DateTime], ticks: Ptr[Time]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DateTimeToTime
    """
    var success = get_sdl3_function_table().date_time_to_time(
        Ptr(to=dt).bitcast[Ptr[DateTime, ImmutExternalOrigin]]()[],
        Ptr(to=ticks).bitcast[Ptr[Time, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn time_to_windows(ticks: Time, dwLowDateTime: Ptr[UInt32], dwHighDateTime: Ptr[UInt32]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TimeToWindows
    """
    get_sdl3_function_table().time_to_windows(
        Ptr(to=ticks).bitcast[Time]()[],
        Ptr(to=dwLowDateTime).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
        Ptr(to=dwHighDateTime).bitcast[Ptr[UInt32, MutExternalOrigin]]()[],
    )


fn time_from_windows(dwLowDateTime: UInt32, dwHighDateTime: UInt32) -> Time:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_TimeFromWindows
    """
    return get_sdl3_function_table().time_from_windows(
        Ptr(to=dwLowDateTime).bitcast[UInt32]()[], Ptr(to=dwHighDateTime).bitcast[UInt32]()[]
    )


fn get_days_in_month(year: Int32, month: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDaysInMonth
    """
    return get_sdl3_function_table().get_days_in_month(
        Ptr(to=year).bitcast[Int32]()[], Ptr(to=month).bitcast[Int32]()[]
    )


fn get_day_of_year(year: Int32, month: Int32, day: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDayOfYear
    """
    return get_sdl3_function_table().get_day_of_year(
        Ptr(to=year).bitcast[Int32]()[],
        Ptr(to=month).bitcast[Int32]()[],
        Ptr(to=day).bitcast[Int32]()[],
    )


fn get_day_of_week(year: Int32, month: Int32, day: Int32) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDayOfWeek
    """
    return get_sdl3_function_table().get_day_of_week(
        Ptr(to=year).bitcast[Int32]()[],
        Ptr(to=month).bitcast[Int32]()[],
        Ptr(to=day).bitcast[Int32]()[],
    )


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
    get_sdl3_function_table().delay(Ptr(to=ms).bitcast[UInt32]()[])


fn delay_ns(ns: UInt64):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DelayNS
    """
    get_sdl3_function_table().delay_ns(Ptr(to=ns).bitcast[UInt64]()[])


fn delay_precise(ns: UInt64):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DelayPrecise
    """
    get_sdl3_function_table().delay_precise(Ptr(to=ns).bitcast[UInt64]()[])


fn add_timer(interval: UInt32, callback: TimerCallback, userdata: Ptr[NoneType]) -> TimerID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddTimer
    """
    return get_sdl3_function_table().add_timer(
        Ptr(to=interval).bitcast[UInt32]()[],
        Ptr(to=callback).bitcast[TimerCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )


fn add_timer_ns(interval: UInt64, callback: NSTimerCallback, userdata: Ptr[NoneType]) -> TimerID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_AddTimerNS
    """
    return get_sdl3_function_table().add_timer_ns(
        Ptr(to=interval).bitcast[UInt64]()[],
        Ptr(to=callback).bitcast[NSTimerCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )


fn remove_timer(id: TimerID) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RemoveTimer
    """
    var success = get_sdl3_function_table().remove_timer(Ptr(to=id).bitcast[TimerID]()[])
    if not success:
        raise get_error()


fn get_touch_devices(count: Ptr[Int32]) raises -> Ptr[TouchID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTouchDevices
    """
    var result = get_sdl3_function_table().get_touch_devices(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_touch_device_name(touchID: TouchID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTouchDeviceName
    """
    var cstring = get_sdl3_function_table().get_touch_device_name(
        Ptr(to=touchID).bitcast[TouchID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_touch_device_type(touchID: TouchID) -> TouchDeviceType:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTouchDeviceType
    """
    return get_sdl3_function_table().get_touch_device_type(Ptr(to=touchID).bitcast[TouchID]()[])


fn get_touch_fingers(
    touchID: TouchID, count: Ptr[Int32]
) raises -> Ptr[Ptr[Finger, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetTouchFingers
    """
    var result = get_sdl3_function_table().get_touch_fingers(
        Ptr(to=touchID).bitcast[TouchID]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn get_version() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetVersion
    """
    return get_sdl3_function_table().get_version()


fn get_revision() -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetRevision
    """
    var cstring = get_sdl3_function_table().get_revision()
    return cstring


fn get_num_video_drivers() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNumVideoDrivers
    """
    return get_sdl3_function_table().get_num_video_drivers()


fn get_video_driver(index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetVideoDriver
    """
    var cstring = get_sdl3_function_table().get_video_driver(Ptr(to=index).bitcast[Int32]()[])
    if not cstring.unsafe_ptr():
        raise "Error in get_video_driver call. See official documentation for details."
    return cstring


fn get_current_video_driver() raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentVideoDriver
    """
    var cstring = get_sdl3_function_table().get_current_video_driver()
    if not cstring.unsafe_ptr():
        raise "Error in get_current_video_driver call. See official documentation for details."
    return cstring


fn get_system_theme() -> SystemTheme:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetSystemTheme
    """
    return get_sdl3_function_table().get_system_theme()


fn get_displays(count: Ptr[Int32]) raises -> Ptr[DisplayID, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplays
    """
    var result = get_sdl3_function_table().get_displays(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
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
    return get_sdl3_function_table().get_display_properties(
        Ptr(to=displayID).bitcast[DisplayID]()[]
    )


fn get_display_name(displayID: DisplayID) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayName
    """
    var cstring = get_sdl3_function_table().get_display_name(
        Ptr(to=displayID).bitcast[DisplayID]()[]
    )
    if not cstring.unsafe_ptr():
        raise get_error()
    return cstring


fn get_display_bounds(displayID: DisplayID, rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayBounds
    """
    var success = get_sdl3_function_table().get_display_bounds(
        Ptr(to=displayID).bitcast[DisplayID]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_display_usable_bounds(displayID: DisplayID, rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayUsableBounds
    """
    var success = get_sdl3_function_table().get_display_usable_bounds(
        Ptr(to=displayID).bitcast[DisplayID]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_natural_display_orientation(displayID: DisplayID) -> DisplayOrientation:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetNaturalDisplayOrientation
    """
    return get_sdl3_function_table().get_natural_display_orientation(
        Ptr(to=displayID).bitcast[DisplayID]()[]
    )


fn get_current_display_orientation(displayID: DisplayID) -> DisplayOrientation:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentDisplayOrientation
    """
    return get_sdl3_function_table().get_current_display_orientation(
        Ptr(to=displayID).bitcast[DisplayID]()[]
    )


fn get_display_content_scale(displayID: DisplayID) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayContentScale
    """
    return get_sdl3_function_table().get_display_content_scale(
        Ptr(to=displayID).bitcast[DisplayID]()[]
    )


fn get_fullscreen_display_modes(
    displayID: DisplayID, count: Ptr[Int32]
) raises -> Ptr[Ptr[DisplayMode, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetFullscreenDisplayModes
    """
    var result = get_sdl3_function_table().get_fullscreen_display_modes(
        Ptr(to=displayID).bitcast[DisplayID]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn get_closest_fullscreen_display_mode(
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
    var success = get_sdl3_function_table().get_closest_fullscreen_display_mode(
        Ptr(to=displayID).bitcast[DisplayID]()[],
        Ptr(to=w).bitcast[Int32]()[],
        Ptr(to=h).bitcast[Int32]()[],
        Ptr(to=refresh_rate).bitcast[Float32]()[],
        Ptr(to=include_high_density_modes).bitcast[Bool]()[],
        Ptr(to=closest).bitcast[Ptr[DisplayMode, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_desktop_display_mode(displayID: DisplayID) raises -> Ptr[DisplayMode, ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDesktopDisplayMode
    """
    var result = get_sdl3_function_table().get_desktop_display_mode(
        Ptr(to=displayID).bitcast[DisplayID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_current_display_mode(displayID: DisplayID) raises -> Ptr[DisplayMode, ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetCurrentDisplayMode
    """
    var result = get_sdl3_function_table().get_current_display_mode(
        Ptr(to=displayID).bitcast[DisplayID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_display_for_point(point: Ptr[Point]) -> DisplayID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayForPoint
    """
    return get_sdl3_function_table().get_display_for_point(
        Ptr(to=point).bitcast[Ptr[Point, ImmutExternalOrigin]]()[]
    )


fn get_display_for_rect(rect: Ptr[Rect]) -> DisplayID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayForRect
    """
    return get_sdl3_function_table().get_display_for_rect(
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[]
    )


fn get_display_for_window(window: Ptr[Window]) -> DisplayID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetDisplayForWindow
    """
    return get_sdl3_function_table().get_display_for_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn get_window_pixel_density(window: Ptr[Window]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowPixelDensity
    """
    return get_sdl3_function_table().get_window_pixel_density(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn get_window_display_scale(window: Ptr[Window]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowDisplayScale
    """
    return get_sdl3_function_table().get_window_display_scale(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn set_window_fullscreen_mode(window: Ptr[Window], mode: Ptr[DisplayMode]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowFullscreenMode
    """
    var success = get_sdl3_function_table().set_window_fullscreen_mode(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=mode).bitcast[Ptr[DisplayMode, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_window_fullscreen_mode(window: Ptr[Window]) raises -> Ptr[DisplayMode, ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowFullscreenMode
    """
    var result = get_sdl3_function_table().get_window_fullscreen_mode(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in get_window_fullscreen_mode call. See official documentation for details."
    return result


fn get_window_icc_profile(
    window: Ptr[Window], size: Ptr[Int32]
) raises -> Ptr[NoneType, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowICCProfile
    """
    var result = get_sdl3_function_table().get_window_icc_profile(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=size).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn get_window_pixel_format(window: Ptr[Window]) -> PixelFormat:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowPixelFormat
    """
    return get_sdl3_function_table().get_window_pixel_format(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn get_windows(count: Ptr[Int32]) raises -> Ptr[Ptr[Window, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindows
    """
    var result = get_sdl3_function_table().get_windows(
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn create_window(
    title: CStringSlice, w: Int32, h: Int32, flags: WindowFlags
) raises -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateWindow
    """
    var result = get_sdl3_function_table().create_window(
        title.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=w).bitcast[Int32]()[],
        Ptr(to=h).bitcast[Int32]()[],
        Ptr(to=flags).bitcast[WindowFlags]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_popup_window(
    parent: Ptr[Window], offset_x: Int32, offset_y: Int32, w: Int32, h: Int32, flags: WindowFlags
) raises -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreatePopupWindow
    """
    var result = get_sdl3_function_table().create_popup_window(
        Ptr(to=parent).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=offset_x).bitcast[Int32]()[],
        Ptr(to=offset_y).bitcast[Int32]()[],
        Ptr(to=w).bitcast[Int32]()[],
        Ptr(to=h).bitcast[Int32]()[],
        Ptr(to=flags).bitcast[WindowFlags]()[],
    )
    if not result:
        raise get_error()
    return result


fn create_window_with_properties(props: PropertiesID) raises -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_CreateWindowWithProperties
    """
    var result = get_sdl3_function_table().create_window_with_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not result:
        raise get_error()
    return result


fn get_window_id(window: Ptr[Window]) -> WindowID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowID
    """
    return get_sdl3_function_table().get_window_id(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn get_window_from_id(id: WindowID) raises -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowFromID
    """
    var result = get_sdl3_function_table().get_window_from_id(Ptr(to=id).bitcast[WindowID]()[])
    if not result:
        raise get_error()
    return result


fn get_window_parent(window: Ptr[Window]) raises -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowParent
    """
    var result = get_sdl3_function_table().get_window_parent(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in get_window_parent call. See official documentation for details."
    return result


fn get_window_properties(window: Ptr[Window]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowProperties
    """
    return get_sdl3_function_table().get_window_properties(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn get_window_flags(window: Ptr[Window]) -> WindowFlags:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowFlags
    """
    return get_sdl3_function_table().get_window_flags(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn set_window_title(window: Ptr[Window], title: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowTitle
    """
    var success = get_sdl3_function_table().set_window_title(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        title.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )
    if not success:
        raise get_error()


fn get_window_title(window: Ptr[Window]) -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowTitle
    """
    var cstring = get_sdl3_function_table().get_window_title(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    return cstring


fn set_window_icon(window: Ptr[Window], icon: Ptr[Surface]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowIcon
    """
    var success = get_sdl3_function_table().set_window_icon(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=icon).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_window_position(window: Ptr[Window], x: Int32, y: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowPosition
    """
    var success = get_sdl3_function_table().set_window_position(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Int32]()[],
        Ptr(to=y).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_window_position(window: Ptr[Window], x: Ptr[Int32], y: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowPosition
    """
    var success = get_sdl3_function_table().get_window_position(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=y).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_window_size(window: Ptr[Window], w: Int32, h: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowSize
    """
    var success = get_sdl3_function_table().set_window_size(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Int32]()[],
        Ptr(to=h).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_window_size(window: Ptr[Window], w: Ptr[Int32], h: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSize
    """
    var success = get_sdl3_function_table().get_window_size(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_window_safe_area(window: Ptr[Window], rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSafeArea
    """
    var success = get_sdl3_function_table().get_window_safe_area(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_window_aspect_ratio(window: Ptr[Window], min_aspect: Float32, max_aspect: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowAspectRatio
    """
    var success = get_sdl3_function_table().set_window_aspect_ratio(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=min_aspect).bitcast[Float32]()[],
        Ptr(to=max_aspect).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_window_aspect_ratio(
    window: Ptr[Window], min_aspect: Ptr[Float32], max_aspect: Ptr[Float32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowAspectRatio
    """
    var success = get_sdl3_function_table().get_window_aspect_ratio(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=min_aspect).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
        Ptr(to=max_aspect).bitcast[Ptr[Float32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_window_borders_size(
    window: Ptr[Window], top: Ptr[Int32], left: Ptr[Int32], bottom: Ptr[Int32], right: Ptr[Int32]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowBordersSize
    """
    var success = get_sdl3_function_table().get_window_borders_size(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=top).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=left).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=bottom).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=right).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_window_size_in_pixels(window: Ptr[Window], w: Ptr[Int32], h: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSizeInPixels
    """
    var success = get_sdl3_function_table().get_window_size_in_pixels(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_window_minimum_size(window: Ptr[Window], min_w: Int32, min_h: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowMinimumSize
    """
    var success = get_sdl3_function_table().set_window_minimum_size(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=min_w).bitcast[Int32]()[],
        Ptr(to=min_h).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_window_minimum_size(window: Ptr[Window], w: Ptr[Int32], h: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowMinimumSize
    """
    var success = get_sdl3_function_table().get_window_minimum_size(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_window_maximum_size(window: Ptr[Window], max_w: Int32, max_h: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowMaximumSize
    """
    var success = get_sdl3_function_table().set_window_maximum_size(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=max_w).bitcast[Int32]()[],
        Ptr(to=max_h).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn get_window_maximum_size(window: Ptr[Window], w: Ptr[Int32], h: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowMaximumSize
    """
    var success = get_sdl3_function_table().get_window_maximum_size(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=w).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        Ptr(to=h).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_window_bordered(window: Ptr[Window], bordered: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowBordered
    """
    var success = get_sdl3_function_table().set_window_bordered(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=bordered).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn set_window_resizable(window: Ptr[Window], resizable: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowResizable
    """
    var success = get_sdl3_function_table().set_window_resizable(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=resizable).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn set_window_always_on_top(window: Ptr[Window], on_top: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowAlwaysOnTop
    """
    var success = get_sdl3_function_table().set_window_always_on_top(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[], Ptr(to=on_top).bitcast[Bool]()[]
    )
    if not success:
        raise get_error()


fn set_window_fill_document(window: Ptr[Window], fill: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowFillDocument
    """
    var success = get_sdl3_function_table().set_window_fill_document(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[], Ptr(to=fill).bitcast[Bool]()[]
    )
    if not success:
        raise get_error()


fn show_window(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ShowWindow
    """
    var success = get_sdl3_function_table().show_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn hide_window(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_HideWindow
    """
    var success = get_sdl3_function_table().hide_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn raise_window(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RaiseWindow
    """
    var success = get_sdl3_function_table().raise_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn maximize_window(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MaximizeWindow
    """
    var success = get_sdl3_function_table().maximize_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn minimize_window(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_MinimizeWindow
    """
    var success = get_sdl3_function_table().minimize_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn restore_window(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_RestoreWindow
    """
    var success = get_sdl3_function_table().restore_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn set_window_fullscreen(window: Ptr[Window], fullscreen: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowFullscreen
    """
    var success = get_sdl3_function_table().set_window_fullscreen(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=fullscreen).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn sync_window(window: Ptr[Window]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SyncWindow
    """
    return get_sdl3_function_table().sync_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn window_has_surface(window: Ptr[Window]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_WindowHasSurface
    """
    return get_sdl3_function_table().window_has_surface(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn get_window_surface(window: Ptr[Window]) raises -> Ptr[Surface, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSurface
    """
    var result = get_sdl3_function_table().get_window_surface(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn set_window_surface_v_sync(window: Ptr[Window], vsync: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowSurfaceVSync
    """
    var success = get_sdl3_function_table().set_window_surface_v_sync(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[], Ptr(to=vsync).bitcast[Int32]()[]
    )
    if not success:
        raise get_error()


fn get_window_surface_v_sync(window: Ptr[Window], vsync: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowSurfaceVSync
    """
    var success = get_sdl3_function_table().get_window_surface_v_sync(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=vsync).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn update_window_surface(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateWindowSurface
    """
    var success = get_sdl3_function_table().update_window_surface(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn update_window_surface_rects(window: Ptr[Window], rects: Ptr[Rect], numrects: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_UpdateWindowSurfaceRects
    """
    var success = get_sdl3_function_table().update_window_surface_rects(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=rects).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
        Ptr(to=numrects).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn destroy_window_surface(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyWindowSurface
    """
    var success = get_sdl3_function_table().destroy_window_surface(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn set_window_keyboard_grab(window: Ptr[Window], grabbed: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowKeyboardGrab
    """
    var success = get_sdl3_function_table().set_window_keyboard_grab(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=grabbed).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn set_window_mouse_grab(window: Ptr[Window], grabbed: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowMouseGrab
    """
    var success = get_sdl3_function_table().set_window_mouse_grab(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=grabbed).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn get_window_keyboard_grab(window: Ptr[Window]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowKeyboardGrab
    """
    return get_sdl3_function_table().get_window_keyboard_grab(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn get_window_mouse_grab(window: Ptr[Window]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowMouseGrab
    """
    return get_sdl3_function_table().get_window_mouse_grab(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn get_grabbed_window() raises -> Ptr[Window, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetGrabbedWindow
    """
    var result = get_sdl3_function_table().get_grabbed_window()
    if not result:
        raise "Error in get_grabbed_window call. See official documentation for details."
    return result


fn set_window_mouse_rect(window: Ptr[Window], rect: Ptr[Rect]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowMouseRect
    """
    var success = get_sdl3_function_table().set_window_mouse_rect(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=rect).bitcast[Ptr[Rect, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn get_window_mouse_rect(window: Ptr[Window]) raises -> Ptr[Rect, ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowMouseRect
    """
    var result = get_sdl3_function_table().get_window_mouse_rect(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in get_window_mouse_rect call. See official documentation for details."
    return result


fn set_window_opacity(window: Ptr[Window], opacity: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowOpacity
    """
    var success = get_sdl3_function_table().set_window_opacity(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=opacity).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_window_opacity(window: Ptr[Window]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowOpacity
    """
    return get_sdl3_function_table().get_window_opacity(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn set_window_parent(window: Ptr[Window], parent: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowParent
    """
    var success = get_sdl3_function_table().set_window_parent(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=parent).bitcast[Ptr[Window, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_window_modal(window: Ptr[Window], modal: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowModal
    """
    var success = get_sdl3_function_table().set_window_modal(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[], Ptr(to=modal).bitcast[Bool]()[]
    )
    if not success:
        raise get_error()


fn set_window_focusable(window: Ptr[Window], focusable: Bool) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowFocusable
    """
    var success = get_sdl3_function_table().set_window_focusable(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=focusable).bitcast[Bool]()[],
    )
    if not success:
        raise get_error()


fn show_window_system_menu(window: Ptr[Window], x: Int32, y: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_ShowWindowSystemMenu
    """
    var success = get_sdl3_function_table().show_window_system_menu(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=x).bitcast[Int32]()[],
        Ptr(to=y).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn set_window_hit_test(
    window: Ptr[Window], callback: HitTest, callback_data: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowHitTest
    """
    var success = get_sdl3_function_table().set_window_hit_test(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=callback).bitcast[HitTest]()[],
        Ptr(to=callback_data).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn set_window_shape(window: Ptr[Window], shape: Ptr[Surface]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowShape
    """
    var success = get_sdl3_function_table().set_window_shape(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=shape).bitcast[Ptr[Surface, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn flash_window(window: Ptr[Window], operation: FlashOperation) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_FlashWindow
    """
    var success = get_sdl3_function_table().flash_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=operation).bitcast[FlashOperation]()[],
    )
    if not success:
        raise get_error()


fn set_window_progress_state(window: Ptr[Window], state: ProgressState) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowProgressState
    """
    var success = get_sdl3_function_table().set_window_progress_state(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=state).bitcast[ProgressState]()[],
    )
    if not success:
        raise get_error()


fn get_window_progress_state(window: Ptr[Window]) -> ProgressState:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowProgressState
    """
    return get_sdl3_function_table().get_window_progress_state(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn set_window_progress_value(window: Ptr[Window], value: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_SetWindowProgressValue
    """
    var success = get_sdl3_function_table().set_window_progress_value(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=value).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn get_window_progress_value(window: Ptr[Window]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GetWindowProgressValue
    """
    return get_sdl3_function_table().get_window_progress_value(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn destroy_window(window: Ptr[Window]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_DestroyWindow
    """
    get_sdl3_function_table().destroy_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


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
    var success = get_sdl3_function_table().gl_load_library(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
    if not success:
        raise get_error()


fn gl_get_proc_address(proc: CStringSlice) -> FunctionPointer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_GetProcAddress
    """
    return get_sdl3_function_table().gl_get_proc_address(
        proc.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn egl_get_proc_address(proc: CStringSlice) -> FunctionPointer:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EGL_GetProcAddress
    """
    return get_sdl3_function_table().egl_get_proc_address(
        proc.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn gl_unload_library():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_UnloadLibrary
    """
    get_sdl3_function_table().gl_unload_library()


fn gl_extension_supported(extension: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_ExtensionSupported
    """
    return get_sdl3_function_table().gl_extension_supported(
        extension.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )


fn gl_reset_attributes():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_ResetAttributes
    """
    get_sdl3_function_table().gl_reset_attributes()


fn gl_set_attribute(attr: GLAttr, value: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_SetAttribute
    """
    var success = get_sdl3_function_table().gl_set_attribute(
        Ptr(to=attr).bitcast[GLAttr]()[], Ptr(to=value).bitcast[Int32]()[]
    )
    if not success:
        raise get_error()


fn gl_get_attribute(attr: GLAttr, value: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_GetAttribute
    """
    var success = get_sdl3_function_table().gl_get_attribute(
        Ptr(to=attr).bitcast[GLAttr]()[], Ptr(to=value).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn gl_create_context(window: Ptr[Window]) -> GLContext:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_CreateContext
    """
    return get_sdl3_function_table().gl_create_context(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn gl_make_current(window: Ptr[Window], context: GLContext) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_MakeCurrent
    """
    var success = get_sdl3_function_table().gl_make_current(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=context).bitcast[GLContext]()[],
    )
    if not success:
        raise get_error()


fn gl_get_current_window() raises -> Ptr[Window, MutExternalOrigin]:
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


fn egl_get_window_surface(window: Ptr[Window]) -> EGLSurface:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EGL_GetWindowSurface
    """
    return get_sdl3_function_table().egl_get_window_surface(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )


fn egl_set_attribute_callbacks(
    platformAttribCallback: EGLAttribArrayCallback,
    surfaceAttribCallback: EGLIntArrayCallback,
    contextAttribCallback: EGLIntArrayCallback,
    userdata: Ptr[NoneType],
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_EGL_SetAttributeCallbacks
    """
    get_sdl3_function_table().egl_set_attribute_callbacks(
        Ptr(to=platformAttribCallback).bitcast[EGLAttribArrayCallback]()[],
        Ptr(to=surfaceAttribCallback).bitcast[EGLIntArrayCallback]()[],
        Ptr(to=contextAttribCallback).bitcast[EGLIntArrayCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )


fn gl_set_swap_interval(interval: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_SetSwapInterval
    """
    var success = get_sdl3_function_table().gl_set_swap_interval(
        Ptr(to=interval).bitcast[Int32]()[]
    )
    if not success:
        raise get_error()


fn gl_get_swap_interval(interval: Ptr[Int32]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_GetSwapInterval
    """
    var success = get_sdl3_function_table().gl_get_swap_interval(
        Ptr(to=interval).bitcast[Ptr[Int32, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn gl_swap_window(window: Ptr[Window]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_SwapWindow
    """
    var success = get_sdl3_function_table().gl_swap_window(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[]
    )
    if not success:
        raise get_error()


fn gl_destroy_context(context: GLContext) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_GL_DestroyContext
    """
    var success = get_sdl3_function_table().gl_destroy_context(
        Ptr(to=context).bitcast[GLContext]()[]
    )
    if not success:
        raise get_error()


fn vulkan_load_library(path: CStringSlice) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_LoadLibrary
    """
    var success = get_sdl3_function_table().vulkan_load_library(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin]()
    )
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
    count: Ptr[UInt32]
) raises -> Ptr[CStringSlice[ImmutExternalOrigin], ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_GetInstanceExtensions
    """
    var result = get_sdl3_function_table().vulkan_get_instance_extensions(
        Ptr(to=count).bitcast[Ptr[UInt32, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn vulkan_create_surface(
    window: Ptr[Window],
    instance: VkInstance,
    allocator: Ptr[VkAllocationCallbacks],
    surface: Ptr[VkSurfaceKHR],
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_CreateSurface
    """
    var success = get_sdl3_function_table().vulkan_create_surface(
        Ptr(to=window).bitcast[Ptr[Window, MutExternalOrigin]]()[],
        Ptr(to=instance).bitcast[VkInstance]()[],
        Ptr(to=allocator).bitcast[Ptr[VkAllocationCallbacks, ImmutExternalOrigin]]()[],
        Ptr(to=surface).bitcast[Ptr[VkSurfaceKHR, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn vulkan_destroy_surface(
    instance: VkInstance, surface: VkSurfaceKHR, allocator: Ptr[VkAllocationCallbacks]
):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_DestroySurface
    """
    get_sdl3_function_table().vulkan_destroy_surface(
        Ptr(to=instance).bitcast[VkInstance]()[],
        Ptr(to=surface).bitcast[VkSurfaceKHR]()[],
        Ptr(to=allocator).bitcast[Ptr[VkAllocationCallbacks, ImmutExternalOrigin]]()[],
    )


fn vulkan_get_presentation_support(
    instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: UInt32
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL3/SDL_Vulkan_GetPresentationSupport
    """
    return get_sdl3_function_table().vulkan_get_presentation_support(
        Ptr(to=instance).bitcast[VkInstance]()[],
        Ptr(to=physicalDevice).bitcast[VkPhysicalDevice]()[],
        Ptr(to=queueFamilyIndex).bitcast[UInt32]()[],
    )
