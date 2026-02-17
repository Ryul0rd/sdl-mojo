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


comptime sdl_mixer_function_table = _Global["sdl_mixer_function_table", zero_init[SdlMixerFunctionTable]]()


fn zero_init_sdl_mixer_function_table() -> OpaquePointer[MutExternalOrigin]:
    var fn_table = alloc[SdlMixerFunctionTable](1)
    memset_zero(fn_table, 1)
    return fn_table.bitcast[NoneType]()


fn destroy_sdl_mixer_function_table(fn_table: OpaquePointer[MutExternalOrigin]):
    fn_table.bitcast[SdlMixerFunctionTable]().destroy_pointee()


fn get_sdl_mixer_function_table() -> ref [MutExternalOrigin] SdlMixerFunctionTable:
    return _get_global[
        "sdl_mixer_function_table", zero_init_sdl_mixer_function_table, destroy_sdl_mixer_function_table,
    ]().bitcast[SdlMixerFunctionTable]()[]


fn load_mixer_dl() raises:
    var path: Path
    @parameter
    if CompilationTarget.is_linux():
        path = Path("libSDL3_mixer.so")
    elif CompilationTarget.is_macos():
        path = Path("libSDL3_mixer.dylib")
    else:
        constrained[False, "Target OS is not supported."]()
        path = Path()
    var fn_table = Ptr(to=get_sdl_mixer_function_table())
    fn_table.init_pointee_move(SdlMixerFunctionTable(path))


fn load_mixer_dl(path: Some[PathLike]) raises:
    var fn_table = Ptr(to=get_sdl_mixer_function_table())
    fn_table.init_pointee_move(SdlMixerFunctionTable(path))


struct SdlMixerFunctionTable(Movable):
    var dlhandle: OwnedDLHandle
    var mix_version: fn() -> Int32
    var mix_init: fn() -> Bool
    var mix_quit: fn() -> NoneType
    var mix_get_num_audio_decoders: fn() -> Int32
    var mix_get_audio_decoder: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var mix_create_mixer_device: fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var mix_create_mixer: fn(Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var mix_destroy_mixer: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> NoneType
    var mix_get_mixer_properties: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> PropertiesID
    var mix_get_mixer_format: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var mix_load_audio_io: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var mix_load_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var mix_load_audio_with_properties: fn(PropertiesID) -> Ptr[MIX_Audio, MutExternalOrigin]
    var mix_load_raw_audio_io: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var mix_load_raw_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]
    var mix_load_raw_audio_no_copy: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var mix_create_sine_wave_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Int32, Float32, Int64) -> Ptr[MIX_Audio, MutExternalOrigin]
    var mix_get_audio_properties: fn(Ptr[MIX_Audio, MutExternalOrigin]) -> PropertiesID
    var mix_get_audio_duration: fn(Ptr[MIX_Audio, MutExternalOrigin]) -> Int64
    var mix_get_audio_format: fn(Ptr[MIX_Audio, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var mix_destroy_audio: fn(Ptr[MIX_Audio, MutExternalOrigin]) -> NoneType
    var mix_create_track: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Track, MutExternalOrigin]
    var mix_destroy_track: fn(Ptr[MIX_Track, MutExternalOrigin]) -> NoneType
    var mix_get_track_properties: fn(Ptr[MIX_Track, MutExternalOrigin]) -> PropertiesID
    var mix_get_track_mixer: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var mix_set_track_audio: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool
    var mix_set_track_audio_stream: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var mix_set_track_io_stream: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var mix_set_track_raw_io_stream: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Bool
    var mix_tag_track: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var mix_untag_track: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var mix_get_track_tags: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var mix_get_tagged_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[MIX_Track, MutExternalOrigin], MutExternalOrigin]
    var mix_set_track_playback_position: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool
    var mix_get_track_playback_position: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64
    var mix_get_track_fade_frames: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64
    var mix_get_track_loops: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int32
    var mix_set_track_loops: fn(Ptr[MIX_Track, MutExternalOrigin], Int32) -> Bool
    var mix_get_track_audio: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]
    var mix_get_track_audio_stream: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]
    var mix_get_track_remaining: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64
    var mix_track_ms_to_frames: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64
    var mix_track_frames_to_ms: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64
    var mix_audio_ms_to_frames: fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64
    var mix_audio_frames_to_ms: fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64
    var mix_ms_to_frames: fn(Int32, Int64) -> Int64
    var mix_frames_to_ms: fn(Int32, Int64) -> Int64
    var mix_play_track: fn(Ptr[MIX_Track, MutExternalOrigin], PropertiesID) -> Bool
    var mix_play_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Bool
    var mix_play_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool
    var mix_stop_track: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool
    var mix_stop_all_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin], Int64) -> Bool
    var mix_stop_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool
    var mix_pause_track: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var mix_pause_all_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool
    var mix_pause_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var mix_resume_track: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var mix_resume_all_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool
    var mix_resume_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var mix_track_playing: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var mix_track_paused: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var mix_set_mixer_gain: fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool
    var mix_get_mixer_gain: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32
    var mix_set_track_gain: fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool
    var mix_get_track_gain: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32
    var mix_set_tag_gain: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool
    var mix_set_mixer_frequency_ratio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool
    var mix_get_mixer_frequency_ratio: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32
    var mix_set_track_frequency_ratio: fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool
    var mix_get_track_frequency_ratio: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32
    var mix_set_track_output_channel_map: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool
    var mix_set_track_stereo: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_StereoGains, ImmutExternalOrigin]) -> Bool
    var mix_set_track3_d_position: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, ImmutExternalOrigin]) -> Bool
    var mix_get_track3_d_position: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, MutExternalOrigin]) -> Bool
    var mix_create_group: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Group, MutExternalOrigin]
    var mix_destroy_group: fn(Ptr[MIX_Group, MutExternalOrigin]) -> NoneType
    var mix_get_group_properties: fn(Ptr[MIX_Group, MutExternalOrigin]) -> PropertiesID
    var mix_get_group_mixer: fn(Ptr[MIX_Group, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var mix_set_track_group: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Group, MutExternalOrigin]) -> Bool
    var mix_set_track_stopped_callback: fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackStoppedCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var mix_set_track_raw_callback: fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var mix_set_track_cooked_callback: fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var mix_set_group_post_mix_callback: fn(Ptr[MIX_Group, MutExternalOrigin], MIX_GroupMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var mix_set_post_mix_callback: fn(Ptr[MIX_Mixer, MutExternalOrigin], MIX_PostMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var mix_generate: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Bool
    var mix_create_audio_decoder: fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]
    var mix_create_audio_decoder_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]
    var mix_destroy_audio_decoder: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> NoneType
    var mix_get_audio_decoder_properties: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> PropertiesID
    var mix_get_audio_decoder_format: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var mix_decode_audio: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Int32

    fn __init__(out self, path: Some[PathLike]) raises:
        self.dlhandle = OwnedDLHandle(path)
        self.mix_version = self.dlhandle.get_function[fn() -> Int32]("MIX_Version")
        self.mix_init = self.dlhandle.get_function[fn() -> Bool]("MIX_Init")
        self.mix_quit = self.dlhandle.get_function[fn() -> NoneType]("MIX_Quit")
        self.mix_get_num_audio_decoders = self.dlhandle.get_function[fn() -> Int32]("MIX_GetNumAudioDecoders")
        self.mix_get_audio_decoder = self.dlhandle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("MIX_GetAudioDecoder")
        self.mix_create_mixer_device = self.dlhandle.get_function[fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_CreateMixerDevice")
        self.mix_create_mixer = self.dlhandle.get_function[fn(Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_CreateMixer")
        self.mix_destroy_mixer = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> NoneType]("MIX_DestroyMixer")
        self.mix_get_mixer_properties = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> PropertiesID]("MIX_GetMixerProperties")
        self.mix_get_mixer_format = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("MIX_GetMixerFormat")
        self.mix_load_audio_io = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadAudio_IO")
        self.mix_load_audio = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadAudio")
        self.mix_load_audio_with_properties = self.dlhandle.get_function[fn(PropertiesID) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadAudioWithProperties")
        self.mix_load_raw_audio_io = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadRawAudio_IO")
        self.mix_load_raw_audio = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadRawAudio")
        self.mix_load_raw_audio_no_copy = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadRawAudioNoCopy")
        self.mix_create_sine_wave_audio = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Int32, Float32, Int64) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_CreateSineWaveAudio")
        self.mix_get_audio_properties = self.dlhandle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin]) -> PropertiesID]("MIX_GetAudioProperties")
        self.mix_get_audio_duration = self.dlhandle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin]) -> Int64]("MIX_GetAudioDuration")
        self.mix_get_audio_format = self.dlhandle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("MIX_GetAudioFormat")
        self.mix_destroy_audio = self.dlhandle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin]) -> NoneType]("MIX_DestroyAudio")
        self.mix_create_track = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Track, MutExternalOrigin]]("MIX_CreateTrack")
        self.mix_destroy_track = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> NoneType]("MIX_DestroyTrack")
        self.mix_get_track_properties = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> PropertiesID]("MIX_GetTrackProperties")
        self.mix_get_track_mixer = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_GetTrackMixer")
        self.mix_set_track_audio = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool]("MIX_SetTrackAudio")
        self.mix_set_track_audio_stream = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[AudioStream, MutExternalOrigin]) -> Bool]("MIX_SetTrackAudioStream")
        self.mix_set_track_io_stream = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("MIX_SetTrackIOStream")
        self.mix_set_track_raw_io_stream = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Bool]("MIX_SetTrackRawIOStream")
        self.mix_tag_track = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("MIX_TagTrack")
        self.mix_untag_track = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("MIX_UntagTrack")
        self.mix_get_track_tags = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("MIX_GetTrackTags")
        self.mix_get_tagged_tracks = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[MIX_Track, MutExternalOrigin], MutExternalOrigin]]("MIX_GetTaggedTracks")
        self.mix_set_track_playback_position = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool]("MIX_SetTrackPlaybackPosition")
        self.mix_get_track_playback_position = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64]("MIX_GetTrackPlaybackPosition")
        self.mix_get_track_fade_frames = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64]("MIX_GetTrackFadeFrames")
        self.mix_get_track_loops = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int32]("MIX_GetTrackLoops")
        self.mix_set_track_loops = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int32) -> Bool]("MIX_SetTrackLoops")
        self.mix_get_track_audio = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_GetTrackAudio")
        self.mix_get_track_audio_stream = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]]("MIX_GetTrackAudioStream")
        self.mix_get_track_remaining = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64]("MIX_GetTrackRemaining")
        self.mix_track_ms_to_frames = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64]("MIX_TrackMSToFrames")
        self.mix_track_frames_to_ms = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64]("MIX_TrackFramesToMS")
        self.mix_audio_ms_to_frames = self.dlhandle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64]("MIX_AudioMSToFrames")
        self.mix_audio_frames_to_ms = self.dlhandle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64]("MIX_AudioFramesToMS")
        self.mix_ms_to_frames = self.dlhandle.get_function[fn(Int32, Int64) -> Int64]("MIX_MSToFrames")
        self.mix_frames_to_ms = self.dlhandle.get_function[fn(Int32, Int64) -> Int64]("MIX_FramesToMS")
        self.mix_play_track = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], PropertiesID) -> Bool]("MIX_PlayTrack")
        self.mix_play_tag = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Bool]("MIX_PlayTag")
        self.mix_play_audio = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool]("MIX_PlayAudio")
        self.mix_stop_track = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool]("MIX_StopTrack")
        self.mix_stop_all_tracks = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Int64) -> Bool]("MIX_StopAllTracks")
        self.mix_stop_tag = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool]("MIX_StopTag")
        self.mix_pause_track = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_PauseTrack")
        self.mix_pause_all_tracks = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool]("MIX_PauseAllTracks")
        self.mix_pause_tag = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("MIX_PauseTag")
        self.mix_resume_track = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_ResumeTrack")
        self.mix_resume_all_tracks = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool]("MIX_ResumeAllTracks")
        self.mix_resume_tag = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("MIX_ResumeTag")
        self.mix_track_playing = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_TrackPlaying")
        self.mix_track_paused = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_TrackPaused")
        self.mix_set_mixer_gain = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool]("MIX_SetMixerGain")
        self.mix_get_mixer_gain = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32]("MIX_GetMixerGain")
        self.mix_set_track_gain = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool]("MIX_SetTrackGain")
        self.mix_get_track_gain = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32]("MIX_GetTrackGain")
        self.mix_set_tag_gain = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool]("MIX_SetTagGain")
        self.mix_set_mixer_frequency_ratio = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool]("MIX_SetMixerFrequencyRatio")
        self.mix_get_mixer_frequency_ratio = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32]("MIX_GetMixerFrequencyRatio")
        self.mix_set_track_frequency_ratio = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool]("MIX_SetTrackFrequencyRatio")
        self.mix_get_track_frequency_ratio = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32]("MIX_GetTrackFrequencyRatio")
        self.mix_set_track_output_channel_map = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool]("MIX_SetTrackOutputChannelMap")
        self.mix_set_track_stereo = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_StereoGains, ImmutExternalOrigin]) -> Bool]("MIX_SetTrackStereo")
        self.mix_set_track3_d_position = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, ImmutExternalOrigin]) -> Bool]("MIX_SetTrack3DPosition")
        self.mix_get_track3_d_position = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, MutExternalOrigin]) -> Bool]("MIX_GetTrack3DPosition")
        self.mix_create_group = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Group, MutExternalOrigin]]("MIX_CreateGroup")
        self.mix_destroy_group = self.dlhandle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin]) -> NoneType]("MIX_DestroyGroup")
        self.mix_get_group_properties = self.dlhandle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin]) -> PropertiesID]("MIX_GetGroupProperties")
        self.mix_get_group_mixer = self.dlhandle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_GetGroupMixer")
        self.mix_set_track_group = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Group, MutExternalOrigin]) -> Bool]("MIX_SetTrackGroup")
        self.mix_set_track_stopped_callback = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackStoppedCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetTrackStoppedCallback")
        self.mix_set_track_raw_callback = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetTrackRawCallback")
        self.mix_set_track_cooked_callback = self.dlhandle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetTrackCookedCallback")
        self.mix_set_group_post_mix_callback = self.dlhandle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin], MIX_GroupMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetGroupPostMixCallback")
        self.mix_set_post_mix_callback = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], MIX_PostMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetPostMixCallback")
        self.mix_generate = self.dlhandle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Bool]("MIX_Generate")
        self.mix_create_audio_decoder = self.dlhandle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]]("MIX_CreateAudioDecoder")
        self.mix_create_audio_decoder_io = self.dlhandle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]]("MIX_CreateAudioDecoder_IO")
        self.mix_destroy_audio_decoder = self.dlhandle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> NoneType]("MIX_DestroyAudioDecoder")
        self.mix_get_audio_decoder_properties = self.dlhandle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> PropertiesID]("MIX_GetAudioDecoderProperties")
        self.mix_get_audio_decoder_format = self.dlhandle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("MIX_GetAudioDecoderFormat")
        self.mix_decode_audio = self.dlhandle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Int32]("MIX_DecodeAudio")
