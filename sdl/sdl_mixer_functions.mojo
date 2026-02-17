from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *
from .sdl_mixer_function_table import get_sdl_mixer_function_table
from .sdl3_functions import get_error
from sys.ffi import CStringSlice, c_char


comptime Ptr = UnsafePointer


fn mix_version() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_Version
    """
    return get_sdl_mixer_function_table().mix_version()


fn mix_init() -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_Init
    """
    return get_sdl_mixer_function_table().mix_init()


fn mix_quit():
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_Quit
    """
    get_sdl_mixer_function_table().mix_quit()


fn mix_get_num_audio_decoders() -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetNumAudioDecoders
    """
    return get_sdl_mixer_function_table().mix_get_num_audio_decoders()


fn mix_get_audio_decoder(index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDecoder
    """
    var cstring = get_sdl_mixer_function_table().mix_get_audio_decoder(
        Ptr(to=index).bitcast[Int32]()[]
    )
    if not cstring.unsafe_ptr():
        raise "Error in mix_get_audio_decoder call. See official documentation for details."
    return cstring


fn mix_create_mixer_device(
    devid: AudioDeviceID, spec: Ptr[AudioSpec]
) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_CreateMixerDevice
    """
    var result = get_sdl_mixer_function_table().mix_create_mixer_device(
        Ptr(to=devid).bitcast[AudioDeviceID]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn mix_create_mixer(spec: Ptr[AudioSpec]) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_CreateMixer
    """
    var result = get_sdl_mixer_function_table().mix_create_mixer(
        Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn mix_destroy_mixer(mixer: Ptr[MIX_Mixer]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_DestroyMixer
    """
    get_sdl_mixer_function_table().mix_destroy_mixer(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
    )


fn mix_get_mixer_properties(mixer: Ptr[MIX_Mixer]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerProperties
    """
    return get_sdl_mixer_function_table().mix_get_mixer_properties(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
    )


fn mix_get_mixer_format(mixer: Ptr[MIX_Mixer], spec: Ptr[AudioSpec]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerFormat
    """
    var success = get_sdl_mixer_function_table().mix_get_mixer_format(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_load_audio_io(
    mixer: Ptr[MIX_Mixer], io: Ptr[IOStream], predecode: Bool, closeio: Bool
) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_LoadAudio_IO
    """
    var result = get_sdl_mixer_function_table().mix_load_audio_io(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=predecode).bitcast[Bool]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not result:
        raise get_error()
    return result


fn mix_load_audio(
    mixer: Ptr[MIX_Mixer], path: CStringSlice, predecode: Bool
) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_LoadAudio
    """
    var result = get_sdl_mixer_function_table().mix_load_audio(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=predecode).bitcast[Bool]()[],
    )
    if not result:
        raise get_error()
    return result


fn mix_load_audio_with_properties(props: PropertiesID) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_LoadAudioWithProperties
    """
    var result = get_sdl_mixer_function_table().mix_load_audio_with_properties(
        Ptr(to=props).bitcast[PropertiesID]()[]
    )
    if not result:
        raise get_error()
    return result


fn mix_load_raw_audio_io(
    mixer: Ptr[MIX_Mixer], io: Ptr[IOStream], spec: Ptr[AudioSpec], closeio: Bool
) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_LoadRawAudio_IO
    """
    var result = get_sdl_mixer_function_table().mix_load_raw_audio_io(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )
    if not result:
        raise get_error()
    return result


fn mix_load_raw_audio(
    mixer: Ptr[MIX_Mixer], data: Ptr[NoneType], datalen: Int32, spec: Ptr[AudioSpec]
) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_LoadRawAudio
    """
    var result = get_sdl_mixer_function_table().mix_load_raw_audio(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=datalen).bitcast[Int32]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn mix_load_raw_audio_no_copy(
    mixer: Ptr[MIX_Mixer],
    data: Ptr[NoneType],
    datalen: Int32,
    spec: Ptr[AudioSpec],
    free_when_done: Bool,
) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_LoadRawAudioNoCopy
    """
    var result = get_sdl_mixer_function_table().mix_load_raw_audio_no_copy(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
        Ptr(to=datalen).bitcast[Int32]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        Ptr(to=free_when_done).bitcast[Bool]()[],
    )
    if not result:
        raise get_error()
    return result


fn mix_create_sine_wave_audio(
    mixer: Ptr[MIX_Mixer], hz: Int32, amplitude: Float32, ms: Int64
) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_CreateSineWaveAudio
    """
    var result = get_sdl_mixer_function_table().mix_create_sine_wave_audio(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=hz).bitcast[Int32]()[],
        Ptr(to=amplitude).bitcast[Float32]()[],
        Ptr(to=ms).bitcast[Int64]()[],
    )
    if not result:
        raise get_error()
    return result


fn mix_get_audio_properties(audio: Ptr[MIX_Audio]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioProperties
    """
    return get_sdl_mixer_function_table().mix_get_audio_properties(
        Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[]
    )


fn mix_get_audio_duration(audio: Ptr[MIX_Audio]) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDuration
    """
    return get_sdl_mixer_function_table().mix_get_audio_duration(
        Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[]
    )


fn mix_get_audio_format(audio: Ptr[MIX_Audio], spec: Ptr[AudioSpec]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioFormat
    """
    var success = get_sdl_mixer_function_table().mix_get_audio_format(
        Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_destroy_audio(audio: Ptr[MIX_Audio]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_DestroyAudio
    """
    get_sdl_mixer_function_table().mix_destroy_audio(
        Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[]
    )


fn mix_create_track(mixer: Ptr[MIX_Mixer]) raises -> Ptr[MIX_Track, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_CreateTrack
    """
    var result = get_sdl_mixer_function_table().mix_create_track(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn mix_destroy_track(track: Ptr[MIX_Track]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_DestroyTrack
    """
    get_sdl_mixer_function_table().mix_destroy_track(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_get_track_properties(track: Ptr[MIX_Track]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackProperties
    """
    return get_sdl_mixer_function_table().mix_get_track_properties(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_get_track_mixer(track: Ptr[MIX_Track]) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackMixer
    """
    var result = get_sdl_mixer_function_table().mix_get_track_mixer(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn mix_set_track_audio(track: Ptr[MIX_Track], audio: Ptr[MIX_Audio]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackAudio
    """
    return get_sdl_mixer_function_table().mix_set_track_audio(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
    )


fn mix_set_track_audio_stream(track: Ptr[MIX_Track], stream: Ptr[AudioStream]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackAudioStream
    """
    return get_sdl_mixer_function_table().mix_set_track_audio_stream(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
    )


fn mix_set_track_io_stream(track: Ptr[MIX_Track], io: Ptr[IOStream], closeio: Bool) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackIOStream
    """
    return get_sdl_mixer_function_table().mix_set_track_io_stream(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )


fn mix_set_track_raw_io_stream(
    track: Ptr[MIX_Track], io: Ptr[IOStream], spec: Ptr[AudioSpec], closeio: Bool
) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackRawIOStream
    """
    return get_sdl_mixer_function_table().mix_set_track_raw_io_stream(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
    )


fn mix_tag_track(track: Ptr[MIX_Track], tag: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_TagTrack
    """
    return get_sdl_mixer_function_table().mix_tag_track(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn mix_untag_track(track: Ptr[MIX_Track], tag: CStringSlice):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_UntagTrack
    """
    get_sdl_mixer_function_table().mix_untag_track(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn mix_get_track_tags(
    track: Ptr[MIX_Track], count: Ptr[Int32]
) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackTags
    """
    var result = get_sdl_mixer_function_table().mix_get_track_tags(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn mix_get_tagged_tracks(
    mixer: Ptr[MIX_Mixer], tag: CStringSlice, count: Ptr[Int32]
) raises -> Ptr[Ptr[MIX_Track, MutExternalOrigin], MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTaggedTracks
    """
    var result = get_sdl_mixer_function_table().mix_get_tagged_tracks(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
    )
    if not result:
        raise get_error()
    return result


fn mix_set_track_playback_position(track: Ptr[MIX_Track], frames: Int64) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackPlaybackPosition
    """
    return get_sdl_mixer_function_table().mix_set_track_playback_position(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=frames).bitcast[Int64]()[],
    )


fn mix_get_track_playback_position(track: Ptr[MIX_Track]) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackPlaybackPosition
    """
    return get_sdl_mixer_function_table().mix_get_track_playback_position(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_get_track_fade_frames(track: Ptr[MIX_Track]) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackFadeFrames
    """
    return get_sdl_mixer_function_table().mix_get_track_fade_frames(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_get_track_loops(track: Ptr[MIX_Track]) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackLoops
    """
    return get_sdl_mixer_function_table().mix_get_track_loops(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_set_track_loops(track: Ptr[MIX_Track], num_loops: Int32) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackLoops
    """
    return get_sdl_mixer_function_table().mix_set_track_loops(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=num_loops).bitcast[Int32]()[],
    )


fn mix_get_track_audio(track: Ptr[MIX_Track]) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackAudio
    """
    var result = get_sdl_mixer_function_table().mix_get_track_audio(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in mix_get_track_audio call. See official documentation for details."
    return result


fn mix_get_track_audio_stream(track: Ptr[MIX_Track]) raises -> Ptr[AudioStream, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackAudioStream
    """
    var result = get_sdl_mixer_function_table().mix_get_track_audio_stream(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )
    if not result:
        raise "Error in mix_get_track_audio_stream call. See official documentation for details."
    return result


fn mix_get_track_remaining(track: Ptr[MIX_Track]) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackRemaining
    """
    return get_sdl_mixer_function_table().mix_get_track_remaining(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_track_ms_to_frames(track: Ptr[MIX_Track], ms: Int64) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_TrackMSToFrames
    """
    return get_sdl_mixer_function_table().mix_track_ms_to_frames(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[], Ptr(to=ms).bitcast[Int64]()[]
    )


fn mix_track_frames_to_ms(track: Ptr[MIX_Track], frames: Int64) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_TrackFramesToMS
    """
    return get_sdl_mixer_function_table().mix_track_frames_to_ms(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=frames).bitcast[Int64]()[],
    )


fn mix_audio_ms_to_frames(audio: Ptr[MIX_Audio], ms: Int64) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_AudioMSToFrames
    """
    return get_sdl_mixer_function_table().mix_audio_ms_to_frames(
        Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[], Ptr(to=ms).bitcast[Int64]()[]
    )


fn mix_audio_frames_to_ms(audio: Ptr[MIX_Audio], frames: Int64) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_AudioFramesToMS
    """
    return get_sdl_mixer_function_table().mix_audio_frames_to_ms(
        Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
        Ptr(to=frames).bitcast[Int64]()[],
    )


fn mix_ms_to_frames(sample_rate: Int32, ms: Int64) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_MSToFrames
    """
    return get_sdl_mixer_function_table().mix_ms_to_frames(
        Ptr(to=sample_rate).bitcast[Int32]()[], Ptr(to=ms).bitcast[Int64]()[]
    )


fn mix_frames_to_ms(sample_rate: Int32, frames: Int64) -> Int64:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_FramesToMS
    """
    return get_sdl_mixer_function_table().mix_frames_to_ms(
        Ptr(to=sample_rate).bitcast[Int32]()[], Ptr(to=frames).bitcast[Int64]()[]
    )


fn mix_play_track(track: Ptr[MIX_Track], options: PropertiesID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_PlayTrack
    """
    return get_sdl_mixer_function_table().mix_play_track(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=options).bitcast[PropertiesID]()[],
    )


fn mix_play_tag(mixer: Ptr[MIX_Mixer], tag: CStringSlice, options: PropertiesID) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_PlayTag
    """
    return get_sdl_mixer_function_table().mix_play_tag(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=options).bitcast[PropertiesID]()[],
    )


fn mix_play_audio(mixer: Ptr[MIX_Mixer], audio: Ptr[MIX_Audio]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_PlayAudio
    """
    return get_sdl_mixer_function_table().mix_play_audio(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
    )


fn mix_stop_track(track: Ptr[MIX_Track], fade_out_frames: Int64) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_StopTrack
    """
    return get_sdl_mixer_function_table().mix_stop_track(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=fade_out_frames).bitcast[Int64]()[],
    )


fn mix_stop_all_tracks(mixer: Ptr[MIX_Mixer], fade_out_ms: Int64) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_StopAllTracks
    """
    return get_sdl_mixer_function_table().mix_stop_all_tracks(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=fade_out_ms).bitcast[Int64]()[],
    )


fn mix_stop_tag(mixer: Ptr[MIX_Mixer], tag: CStringSlice, fade_out_ms: Int64) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_StopTag
    """
    return get_sdl_mixer_function_table().mix_stop_tag(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=fade_out_ms).bitcast[Int64]()[],
    )


fn mix_pause_track(track: Ptr[MIX_Track]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_PauseTrack
    """
    return get_sdl_mixer_function_table().mix_pause_track(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_pause_all_tracks(mixer: Ptr[MIX_Mixer]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_PauseAllTracks
    """
    return get_sdl_mixer_function_table().mix_pause_all_tracks(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
    )


fn mix_pause_tag(mixer: Ptr[MIX_Mixer], tag: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_PauseTag
    """
    return get_sdl_mixer_function_table().mix_pause_tag(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn mix_resume_track(track: Ptr[MIX_Track]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_ResumeTrack
    """
    return get_sdl_mixer_function_table().mix_resume_track(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_resume_all_tracks(mixer: Ptr[MIX_Mixer]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_ResumeAllTracks
    """
    return get_sdl_mixer_function_table().mix_resume_all_tracks(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
    )


fn mix_resume_tag(mixer: Ptr[MIX_Mixer], tag: CStringSlice) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_ResumeTag
    """
    return get_sdl_mixer_function_table().mix_resume_tag(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
    )


fn mix_track_playing(track: Ptr[MIX_Track]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_TrackPlaying
    """
    return get_sdl_mixer_function_table().mix_track_playing(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_track_paused(track: Ptr[MIX_Track]) -> Bool:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_TrackPaused
    """
    return get_sdl_mixer_function_table().mix_track_paused(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_set_mixer_gain(mixer: Ptr[MIX_Mixer], gain: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetMixerGain
    """
    var success = get_sdl_mixer_function_table().mix_set_mixer_gain(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=gain).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn mix_get_mixer_gain(mixer: Ptr[MIX_Mixer]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerGain
    """
    return get_sdl_mixer_function_table().mix_get_mixer_gain(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
    )


fn mix_set_track_gain(track: Ptr[MIX_Track], gain: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackGain
    """
    var success = get_sdl_mixer_function_table().mix_set_track_gain(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=gain).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn mix_get_track_gain(track: Ptr[MIX_Track]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackGain
    """
    return get_sdl_mixer_function_table().mix_get_track_gain(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_set_tag_gain(mixer: Ptr[MIX_Mixer], tag: CStringSlice, gain: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTagGain
    """
    var success = get_sdl_mixer_function_table().mix_set_tag_gain(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=gain).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn mix_set_mixer_frequency_ratio(mixer: Ptr[MIX_Mixer], ratio: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetMixerFrequencyRatio
    """
    var success = get_sdl_mixer_function_table().mix_set_mixer_frequency_ratio(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=ratio).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn mix_get_mixer_frequency_ratio(mixer: Ptr[MIX_Mixer]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerFrequencyRatio
    """
    return get_sdl_mixer_function_table().mix_get_mixer_frequency_ratio(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
    )


fn mix_set_track_frequency_ratio(track: Ptr[MIX_Track], ratio: Float32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackFrequencyRatio
    """
    var success = get_sdl_mixer_function_table().mix_set_track_frequency_ratio(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=ratio).bitcast[Float32]()[],
    )
    if not success:
        raise get_error()


fn mix_get_track_frequency_ratio(track: Ptr[MIX_Track]) -> Float32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackFrequencyRatio
    """
    return get_sdl_mixer_function_table().mix_get_track_frequency_ratio(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
    )


fn mix_set_track_output_channel_map(track: Ptr[MIX_Track], chmap: Ptr[Int32], count: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackOutputChannelMap
    """
    var success = get_sdl_mixer_function_table().mix_set_track_output_channel_map(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=chmap).bitcast[Ptr[Int32, ImmutExternalOrigin]]()[],
        Ptr(to=count).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn mix_set_track_stereo(track: Ptr[MIX_Track], gains: Ptr[MIX_StereoGains]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackStereo
    """
    var success = get_sdl_mixer_function_table().mix_set_track_stereo(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=gains).bitcast[Ptr[MIX_StereoGains, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_set_track3_d_position(track: Ptr[MIX_Track], position: Ptr[MIX_Point3D]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrack3DPosition
    """
    var success = get_sdl_mixer_function_table().mix_set_track3_d_position(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=position).bitcast[Ptr[MIX_Point3D, ImmutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_get_track3_d_position(track: Ptr[MIX_Track], position: Ptr[MIX_Point3D]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetTrack3DPosition
    """
    var success = get_sdl_mixer_function_table().mix_get_track3_d_position(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=position).bitcast[Ptr[MIX_Point3D, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_create_group(mixer: Ptr[MIX_Mixer]) raises -> Ptr[MIX_Group, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_CreateGroup
    """
    var result = get_sdl_mixer_function_table().mix_create_group(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn mix_destroy_group(group: Ptr[MIX_Group]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_DestroyGroup
    """
    get_sdl_mixer_function_table().mix_destroy_group(
        Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[]
    )


fn mix_get_group_properties(group: Ptr[MIX_Group]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetGroupProperties
    """
    return get_sdl_mixer_function_table().mix_get_group_properties(
        Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[]
    )


fn mix_get_group_mixer(group: Ptr[MIX_Group]) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetGroupMixer
    """
    var result = get_sdl_mixer_function_table().mix_get_group_mixer(
        Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[]
    )
    if not result:
        raise get_error()
    return result


fn mix_set_track_group(track: Ptr[MIX_Track], group: Ptr[MIX_Group]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackGroup
    """
    var success = get_sdl_mixer_function_table().mix_set_track_group(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_set_track_stopped_callback(
    track: Ptr[MIX_Track], cb: MIX_TrackStoppedCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackStoppedCallback
    """
    var success = get_sdl_mixer_function_table().mix_set_track_stopped_callback(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=cb).bitcast[MIX_TrackStoppedCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_set_track_raw_callback(
    track: Ptr[MIX_Track], cb: MIX_TrackMixCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackRawCallback
    """
    var success = get_sdl_mixer_function_table().mix_set_track_raw_callback(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=cb).bitcast[MIX_TrackMixCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_set_track_cooked_callback(
    track: Ptr[MIX_Track], cb: MIX_TrackMixCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackCookedCallback
    """
    var success = get_sdl_mixer_function_table().mix_set_track_cooked_callback(
        Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
        Ptr(to=cb).bitcast[MIX_TrackMixCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_set_group_post_mix_callback(
    group: Ptr[MIX_Group], cb: MIX_GroupMixCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetGroupPostMixCallback
    """
    var success = get_sdl_mixer_function_table().mix_set_group_post_mix_callback(
        Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[],
        Ptr(to=cb).bitcast[MIX_GroupMixCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_set_post_mix_callback(
    mixer: Ptr[MIX_Mixer], cb: MIX_PostMixCallback, userdata: Ptr[NoneType]
) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_SetPostMixCallback
    """
    var success = get_sdl_mixer_function_table().mix_set_post_mix_callback(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=cb).bitcast[MIX_PostMixCallback]()[],
        Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_generate(mixer: Ptr[MIX_Mixer], buffer: Ptr[NoneType], buflen: Int32) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_Generate
    """
    var success = get_sdl_mixer_function_table().mix_generate(
        Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
        Ptr(to=buffer).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=buflen).bitcast[Int32]()[],
    )
    if not success:
        raise get_error()


fn mix_create_audio_decoder(
    path: CStringSlice, props: PropertiesID
) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_CreateAudioDecoder
    """
    return get_sdl_mixer_function_table().mix_create_audio_decoder(
        path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        Ptr(to=props).bitcast[PropertiesID]()[],
    )


fn mix_create_audio_decoder_io(
    io: Ptr[IOStream], closeio: Bool, props: PropertiesID
) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_CreateAudioDecoder_IO
    """
    return get_sdl_mixer_function_table().mix_create_audio_decoder_io(
        Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
        Ptr(to=closeio).bitcast[Bool]()[],
        Ptr(to=props).bitcast[PropertiesID]()[],
    )


fn mix_destroy_audio_decoder(audiodecoder: Ptr[MIX_AudioDecoder]):
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_DestroyAudioDecoder
    """
    get_sdl_mixer_function_table().mix_destroy_audio_decoder(
        Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[]
    )


fn mix_get_audio_decoder_properties(audiodecoder: Ptr[MIX_AudioDecoder]) -> PropertiesID:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDecoderProperties
    """
    return get_sdl_mixer_function_table().mix_get_audio_decoder_properties(
        Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[]
    )


fn mix_get_audio_decoder_format(audiodecoder: Ptr[MIX_AudioDecoder], spec: Ptr[AudioSpec]) raises:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDecoderFormat
    """
    var success = get_sdl_mixer_function_table().mix_get_audio_decoder_format(
        Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
    )
    if not success:
        raise get_error()


fn mix_decode_audio(
    audiodecoder: Ptr[MIX_AudioDecoder], buffer: Ptr[NoneType], buflen: Int32, spec: Ptr[AudioSpec]
) -> Int32:
    """See official documentation for details.
    
    https://wiki.libsdl.org/SDL_mixer/MIX_DecodeAudio
    """
    return get_sdl_mixer_function_table().mix_decode_audio(
        Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[],
        Ptr(to=buffer).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        Ptr(to=buflen).bitcast[Int32]()[],
        Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
    )
