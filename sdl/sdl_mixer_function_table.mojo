from ffi import OwnedDLHandle, c_char, CStringSlice
from sys import CompilationTarget
from os import PathLike
from pathlib import Path
from .misc import *
from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *
from .sdl3_functions import get_error


comptime Ptr = UnsafePointer


struct SdlMixerFunctionTable:
    var dynamic_library_handle: OwnedDLHandle
    var pointer_mix_version: fn() -> Int32
    var pointer_mix_init: fn() -> Bool
    var pointer_mix_quit: fn() -> NoneType
    var pointer_mix_get_num_audio_decoders: fn() -> Int32
    var pointer_mix_get_audio_decoder: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var pointer_mix_create_mixer_device: fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var pointer_mix_create_mixer: fn(Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var pointer_mix_destroy_mixer: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> NoneType
    var pointer_mix_get_mixer_properties: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> PropertiesID
    var pointer_mix_get_mixer_format: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var pointer_mix_load_audio_io: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var pointer_mix_load_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var pointer_mix_load_audio_with_properties: fn(PropertiesID) -> Ptr[MIX_Audio, MutExternalOrigin]
    var pointer_mix_load_raw_audio_io: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var pointer_mix_load_raw_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]
    var pointer_mix_load_raw_audio_no_copy: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var pointer_mix_create_sine_wave_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Int32, Float32, Int64) -> Ptr[MIX_Audio, MutExternalOrigin]
    var pointer_mix_get_audio_properties: fn(Ptr[MIX_Audio, MutExternalOrigin]) -> PropertiesID
    var pointer_mix_get_audio_duration: fn(Ptr[MIX_Audio, MutExternalOrigin]) -> Int64
    var pointer_mix_get_audio_format: fn(Ptr[MIX_Audio, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var pointer_mix_destroy_audio: fn(Ptr[MIX_Audio, MutExternalOrigin]) -> NoneType
    var pointer_mix_create_track: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Track, MutExternalOrigin]
    var pointer_mix_destroy_track: fn(Ptr[MIX_Track, MutExternalOrigin]) -> NoneType
    var pointer_mix_get_track_properties: fn(Ptr[MIX_Track, MutExternalOrigin]) -> PropertiesID
    var pointer_mix_get_track_mixer: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var pointer_mix_set_track_audio: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool
    var pointer_mix_set_track_audio_stream: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var pointer_mix_set_track_io_stream: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var pointer_mix_set_track_raw_io_stream: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Bool
    var pointer_mix_tag_track: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var pointer_mix_untag_track: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var pointer_mix_get_track_tags: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var pointer_mix_get_tagged_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[MIX_Track, MutExternalOrigin], MutExternalOrigin]
    var pointer_mix_set_track_playback_position: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool
    var pointer_mix_get_track_playback_position: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64
    var pointer_mix_get_track_fade_frames: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64
    var pointer_mix_get_track_loops: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int32
    var pointer_mix_set_track_loops: fn(Ptr[MIX_Track, MutExternalOrigin], Int32) -> Bool
    var pointer_mix_get_track_audio: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]
    var pointer_mix_get_track_audio_stream: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]
    var pointer_mix_get_track_remaining: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64
    var pointer_mix_track_ms_to_frames: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64
    var pointer_mix_track_frames_to_ms: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64
    var pointer_mix_audio_ms_to_frames: fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64
    var pointer_mix_audio_frames_to_ms: fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64
    var pointer_mix_ms_to_frames: fn(Int32, Int64) -> Int64
    var pointer_mix_frames_to_ms: fn(Int32, Int64) -> Int64
    var pointer_mix_play_track: fn(Ptr[MIX_Track, MutExternalOrigin], PropertiesID) -> Bool
    var pointer_mix_play_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Bool
    var pointer_mix_play_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool
    var pointer_mix_stop_track: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool
    var pointer_mix_stop_all_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin], Int64) -> Bool
    var pointer_mix_stop_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool
    var pointer_mix_pause_track: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var pointer_mix_pause_all_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool
    var pointer_mix_pause_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var pointer_mix_resume_track: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var pointer_mix_resume_all_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool
    var pointer_mix_resume_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var pointer_mix_track_playing: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var pointer_mix_track_paused: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var pointer_mix_set_mixer_gain: fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool
    var pointer_mix_get_mixer_gain: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32
    var pointer_mix_set_track_gain: fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool
    var pointer_mix_get_track_gain: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32
    var pointer_mix_set_tag_gain: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool
    var pointer_mix_set_mixer_frequency_ratio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool
    var pointer_mix_get_mixer_frequency_ratio: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32
    var pointer_mix_set_track_frequency_ratio: fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool
    var pointer_mix_get_track_frequency_ratio: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32
    var pointer_mix_set_track_output_channel_map: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool
    var pointer_mix_set_track_stereo: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_StereoGains, ImmutExternalOrigin]) -> Bool
    var pointer_mix_set_track3_d_position: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, ImmutExternalOrigin]) -> Bool
    var pointer_mix_get_track3_d_position: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, MutExternalOrigin]) -> Bool
    var pointer_mix_create_group: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Group, MutExternalOrigin]
    var pointer_mix_destroy_group: fn(Ptr[MIX_Group, MutExternalOrigin]) -> NoneType
    var pointer_mix_get_group_properties: fn(Ptr[MIX_Group, MutExternalOrigin]) -> PropertiesID
    var pointer_mix_get_group_mixer: fn(Ptr[MIX_Group, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var pointer_mix_set_track_group: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Group, MutExternalOrigin]) -> Bool
    var pointer_mix_set_track_stopped_callback: fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackStoppedCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var pointer_mix_set_track_raw_callback: fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var pointer_mix_set_track_cooked_callback: fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var pointer_mix_set_group_post_mix_callback: fn(Ptr[MIX_Group, MutExternalOrigin], MIX_GroupMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var pointer_mix_set_post_mix_callback: fn(Ptr[MIX_Mixer, MutExternalOrigin], MIX_PostMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var pointer_mix_generate: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Bool
    var pointer_mix_create_audio_decoder: fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]
    var pointer_mix_create_audio_decoder_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]
    var pointer_mix_destroy_audio_decoder: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> NoneType
    var pointer_mix_get_audio_decoder_properties: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> PropertiesID
    var pointer_mix_get_audio_decoder_format: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var pointer_mix_decode_audio: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Int32

    fn __init__(out self) raises:
        var library_path: Path
        @parameter
        if CompilationTarget.is_linux():
            library_path = Path("libSDL3_mixer.so")
        elif CompilationTarget.is_macos():
            library_path = Path("libSDL3_mixer.dylib")
        else:
            constrained[False, "Target operating system is not supported."]()
            library_path = Path()
        
        self = Self(library_path)

    fn __init__(out self, library_path: Path) raises:
        self.dynamic_library_handle = OwnedDLHandle(library_path)
        self.pointer_mix_version = self.dynamic_library_handle.get_function[fn() -> Int32]("MIX_Version")
        self.pointer_mix_init = self.dynamic_library_handle.get_function[fn() -> Bool]("MIX_Init")
        self.pointer_mix_quit = self.dynamic_library_handle.get_function[fn() -> NoneType]("MIX_Quit")
        self.pointer_mix_get_num_audio_decoders = self.dynamic_library_handle.get_function[fn() -> Int32]("MIX_GetNumAudioDecoders")
        self.pointer_mix_get_audio_decoder = self.dynamic_library_handle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("MIX_GetAudioDecoder")
        self.pointer_mix_create_mixer_device = self.dynamic_library_handle.get_function[fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_CreateMixerDevice")
        self.pointer_mix_create_mixer = self.dynamic_library_handle.get_function[fn(Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_CreateMixer")
        self.pointer_mix_destroy_mixer = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> NoneType]("MIX_DestroyMixer")
        self.pointer_mix_get_mixer_properties = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> PropertiesID]("MIX_GetMixerProperties")
        self.pointer_mix_get_mixer_format = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("MIX_GetMixerFormat")
        self.pointer_mix_load_audio_io = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadAudio_IO")
        self.pointer_mix_load_audio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadAudio")
        self.pointer_mix_load_audio_with_properties = self.dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadAudioWithProperties")
        self.pointer_mix_load_raw_audio_io = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadRawAudio_IO")
        self.pointer_mix_load_raw_audio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadRawAudio")
        self.pointer_mix_load_raw_audio_no_copy = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadRawAudioNoCopy")
        self.pointer_mix_create_sine_wave_audio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Int32, Float32, Int64) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_CreateSineWaveAudio")
        self.pointer_mix_get_audio_properties = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin]) -> PropertiesID]("MIX_GetAudioProperties")
        self.pointer_mix_get_audio_duration = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin]) -> Int64]("MIX_GetAudioDuration")
        self.pointer_mix_get_audio_format = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("MIX_GetAudioFormat")
        self.pointer_mix_destroy_audio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin]) -> NoneType]("MIX_DestroyAudio")
        self.pointer_mix_create_track = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Track, MutExternalOrigin]]("MIX_CreateTrack")
        self.pointer_mix_destroy_track = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> NoneType]("MIX_DestroyTrack")
        self.pointer_mix_get_track_properties = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> PropertiesID]("MIX_GetTrackProperties")
        self.pointer_mix_get_track_mixer = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_GetTrackMixer")
        self.pointer_mix_set_track_audio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool]("MIX_SetTrackAudio")
        self.pointer_mix_set_track_audio_stream = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[AudioStream, MutExternalOrigin]) -> Bool]("MIX_SetTrackAudioStream")
        self.pointer_mix_set_track_io_stream = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("MIX_SetTrackIOStream")
        self.pointer_mix_set_track_raw_io_stream = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Bool]("MIX_SetTrackRawIOStream")
        self.pointer_mix_tag_track = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("MIX_TagTrack")
        self.pointer_mix_untag_track = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("MIX_UntagTrack")
        self.pointer_mix_get_track_tags = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("MIX_GetTrackTags")
        self.pointer_mix_get_tagged_tracks = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[MIX_Track, MutExternalOrigin], MutExternalOrigin]]("MIX_GetTaggedTracks")
        self.pointer_mix_set_track_playback_position = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool]("MIX_SetTrackPlaybackPosition")
        self.pointer_mix_get_track_playback_position = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64]("MIX_GetTrackPlaybackPosition")
        self.pointer_mix_get_track_fade_frames = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64]("MIX_GetTrackFadeFrames")
        self.pointer_mix_get_track_loops = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int32]("MIX_GetTrackLoops")
        self.pointer_mix_set_track_loops = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int32) -> Bool]("MIX_SetTrackLoops")
        self.pointer_mix_get_track_audio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_GetTrackAudio")
        self.pointer_mix_get_track_audio_stream = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]]("MIX_GetTrackAudioStream")
        self.pointer_mix_get_track_remaining = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64]("MIX_GetTrackRemaining")
        self.pointer_mix_track_ms_to_frames = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64]("MIX_TrackMSToFrames")
        self.pointer_mix_track_frames_to_ms = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64]("MIX_TrackFramesToMS")
        self.pointer_mix_audio_ms_to_frames = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64]("MIX_AudioMSToFrames")
        self.pointer_mix_audio_frames_to_ms = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64]("MIX_AudioFramesToMS")
        self.pointer_mix_ms_to_frames = self.dynamic_library_handle.get_function[fn(Int32, Int64) -> Int64]("MIX_MSToFrames")
        self.pointer_mix_frames_to_ms = self.dynamic_library_handle.get_function[fn(Int32, Int64) -> Int64]("MIX_FramesToMS")
        self.pointer_mix_play_track = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], PropertiesID) -> Bool]("MIX_PlayTrack")
        self.pointer_mix_play_tag = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Bool]("MIX_PlayTag")
        self.pointer_mix_play_audio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool]("MIX_PlayAudio")
        self.pointer_mix_stop_track = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool]("MIX_StopTrack")
        self.pointer_mix_stop_all_tracks = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Int64) -> Bool]("MIX_StopAllTracks")
        self.pointer_mix_stop_tag = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool]("MIX_StopTag")
        self.pointer_mix_pause_track = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_PauseTrack")
        self.pointer_mix_pause_all_tracks = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool]("MIX_PauseAllTracks")
        self.pointer_mix_pause_tag = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("MIX_PauseTag")
        self.pointer_mix_resume_track = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_ResumeTrack")
        self.pointer_mix_resume_all_tracks = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool]("MIX_ResumeAllTracks")
        self.pointer_mix_resume_tag = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("MIX_ResumeTag")
        self.pointer_mix_track_playing = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_TrackPlaying")
        self.pointer_mix_track_paused = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_TrackPaused")
        self.pointer_mix_set_mixer_gain = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool]("MIX_SetMixerGain")
        self.pointer_mix_get_mixer_gain = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32]("MIX_GetMixerGain")
        self.pointer_mix_set_track_gain = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool]("MIX_SetTrackGain")
        self.pointer_mix_get_track_gain = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32]("MIX_GetTrackGain")
        self.pointer_mix_set_tag_gain = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool]("MIX_SetTagGain")
        self.pointer_mix_set_mixer_frequency_ratio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool]("MIX_SetMixerFrequencyRatio")
        self.pointer_mix_get_mixer_frequency_ratio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32]("MIX_GetMixerFrequencyRatio")
        self.pointer_mix_set_track_frequency_ratio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool]("MIX_SetTrackFrequencyRatio")
        self.pointer_mix_get_track_frequency_ratio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32]("MIX_GetTrackFrequencyRatio")
        self.pointer_mix_set_track_output_channel_map = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool]("MIX_SetTrackOutputChannelMap")
        self.pointer_mix_set_track_stereo = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_StereoGains, ImmutExternalOrigin]) -> Bool]("MIX_SetTrackStereo")
        self.pointer_mix_set_track3_d_position = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, ImmutExternalOrigin]) -> Bool]("MIX_SetTrack3DPosition")
        self.pointer_mix_get_track3_d_position = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, MutExternalOrigin]) -> Bool]("MIX_GetTrack3DPosition")
        self.pointer_mix_create_group = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Group, MutExternalOrigin]]("MIX_CreateGroup")
        self.pointer_mix_destroy_group = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin]) -> NoneType]("MIX_DestroyGroup")
        self.pointer_mix_get_group_properties = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin]) -> PropertiesID]("MIX_GetGroupProperties")
        self.pointer_mix_get_group_mixer = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_GetGroupMixer")
        self.pointer_mix_set_track_group = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Group, MutExternalOrigin]) -> Bool]("MIX_SetTrackGroup")
        self.pointer_mix_set_track_stopped_callback = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackStoppedCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetTrackStoppedCallback")
        self.pointer_mix_set_track_raw_callback = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetTrackRawCallback")
        self.pointer_mix_set_track_cooked_callback = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetTrackCookedCallback")
        self.pointer_mix_set_group_post_mix_callback = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin], MIX_GroupMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetGroupPostMixCallback")
        self.pointer_mix_set_post_mix_callback = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], MIX_PostMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetPostMixCallback")
        self.pointer_mix_generate = self.dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Bool]("MIX_Generate")
        self.pointer_mix_create_audio_decoder = self.dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]]("MIX_CreateAudioDecoder")
        self.pointer_mix_create_audio_decoder_io = self.dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]]("MIX_CreateAudioDecoder_IO")
        self.pointer_mix_destroy_audio_decoder = self.dynamic_library_handle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> NoneType]("MIX_DestroyAudioDecoder")
        self.pointer_mix_get_audio_decoder_properties = self.dynamic_library_handle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> PropertiesID]("MIX_GetAudioDecoderProperties")
        self.pointer_mix_get_audio_decoder_format = self.dynamic_library_handle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("MIX_GetAudioDecoderFormat")
        self.pointer_mix_decode_audio = self.dynamic_library_handle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Int32]("MIX_DecodeAudio")

    fn mix_version(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_Version
        """
        return self.pointer_mix_version()

    fn mix_init(self) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_Init
        """
        var success_status = self.pointer_mix_init()
        if not success_status:
            raise get_error()

    fn mix_quit(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_Quit
        """
        self.pointer_mix_quit()

    fn mix_get_num_audio_decoders(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetNumAudioDecoders
        """
        return self.pointer_mix_get_num_audio_decoders()

    fn mix_get_audio_decoder(self, index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDecoder
        """
        var c_string = self.pointer_mix_get_audio_decoder(Ptr(to=index).bitcast[Int32]()[])
        if not c_string.unsafe_ptr():
            raise "Error in mix_get_audio_decoder call. See official documentation for details."
        return c_string

    fn mix_create_mixer_device(
        self, devid: AudioDeviceID, spec: Ptr[AudioSpec]
    ) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateMixerDevice
        """
        var result_pointer = self.pointer_mix_create_mixer_device(
            Ptr(to=devid).bitcast[AudioDeviceID]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_create_mixer(self, spec: Ptr[AudioSpec]) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateMixer
        """
        var result_pointer = self.pointer_mix_create_mixer(
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_destroy_mixer(self, mixer: Ptr[MIX_Mixer]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyMixer
        """
        self.pointer_mix_destroy_mixer(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )

    fn mix_get_mixer_properties(self, mixer: Ptr[MIX_Mixer]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerProperties
        """
        return self.pointer_mix_get_mixer_properties(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )

    fn mix_get_mixer_format(self, mixer: Ptr[MIX_Mixer], spec: Ptr[AudioSpec]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerFormat
        """
        var success_status = self.pointer_mix_get_mixer_format(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_load_audio_io(
        self, mixer: Ptr[MIX_Mixer], io: Ptr[IOStream], predecode: Bool, closeio: Bool
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadAudio_IO
        """
        var result_pointer = self.pointer_mix_load_audio_io(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=predecode).bitcast[Bool]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_load_audio(
        self, mixer: Ptr[MIX_Mixer], path: CStringSlice, predecode: Bool
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadAudio
        """
        var result_pointer = self.pointer_mix_load_audio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=predecode).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_load_audio_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadAudioWithProperties
        """
        var result_pointer = self.pointer_mix_load_audio_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_load_raw_audio_io(
        self, mixer: Ptr[MIX_Mixer], io: Ptr[IOStream], spec: Ptr[AudioSpec], closeio: Bool
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadRawAudio_IO
        """
        var result_pointer = self.pointer_mix_load_raw_audio_io(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_load_raw_audio(
        self, mixer: Ptr[MIX_Mixer], data: Ptr[NoneType], datalen: Int32, spec: Ptr[AudioSpec]
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadRawAudio
        """
        var result_pointer = self.pointer_mix_load_raw_audio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=datalen).bitcast[Int32]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_load_raw_audio_no_copy(
        self,
        mixer: Ptr[MIX_Mixer],
        data: Ptr[NoneType],
        datalen: Int32,
        spec: Ptr[AudioSpec],
        free_when_done: Bool,
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadRawAudioNoCopy
        """
        var result_pointer = self.pointer_mix_load_raw_audio_no_copy(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=datalen).bitcast[Int32]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=free_when_done).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_create_sine_wave_audio(
        self, mixer: Ptr[MIX_Mixer], hz: Int32, amplitude: Float32, ms: Int64
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateSineWaveAudio
        """
        var result_pointer = self.pointer_mix_create_sine_wave_audio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=hz).bitcast[Int32]()[],
            Ptr(to=amplitude).bitcast[Float32]()[],
            Ptr(to=ms).bitcast[Int64]()[],
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_get_audio_properties(self, audio: Ptr[MIX_Audio]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioProperties
        """
        return self.pointer_mix_get_audio_properties(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[]
        )

    fn mix_get_audio_duration(self, audio: Ptr[MIX_Audio]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDuration
        """
        return self.pointer_mix_get_audio_duration(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[]
        )

    fn mix_get_audio_format(self, audio: Ptr[MIX_Audio], spec: Ptr[AudioSpec]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioFormat
        """
        var success_status = self.pointer_mix_get_audio_format(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_destroy_audio(self, audio: Ptr[MIX_Audio]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyAudio
        """
        self.pointer_mix_destroy_audio(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[]
        )

    fn mix_create_track(self, mixer: Ptr[MIX_Mixer]) raises -> Ptr[MIX_Track, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateTrack
        """
        var result_pointer = self.pointer_mix_create_track(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_destroy_track(self, track: Ptr[MIX_Track]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyTrack
        """
        self.pointer_mix_destroy_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_get_track_properties(self, track: Ptr[MIX_Track]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackProperties
        """
        return self.pointer_mix_get_track_properties(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_get_track_mixer(
        self, track: Ptr[MIX_Track]
    ) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackMixer
        """
        var result_pointer = self.pointer_mix_get_track_mixer(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_set_track_audio(self, track: Ptr[MIX_Track], audio: Ptr[MIX_Audio]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackAudio
        """
        var success_status = self.pointer_mix_set_track_audio(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_track_audio_stream(self, track: Ptr[MIX_Track], stream: Ptr[AudioStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackAudioStream
        """
        var success_status = self.pointer_mix_set_track_audio_stream(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_track_io_stream(
        self, track: Ptr[MIX_Track], io: Ptr[IOStream], closeio: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackIOStream
        """
        var success_status = self.pointer_mix_set_track_io_stream(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_track_raw_io_stream(
        self, track: Ptr[MIX_Track], io: Ptr[IOStream], spec: Ptr[AudioSpec], closeio: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackRawIOStream
        """
        var success_status = self.pointer_mix_set_track_raw_io_stream(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_tag_track(self, track: Ptr[MIX_Track], tag: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TagTrack
        """
        var success_status = self.pointer_mix_tag_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise get_error()

    fn mix_untag_track(self, track: Ptr[MIX_Track], tag: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_UntagTrack
        """
        self.pointer_mix_untag_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn mix_get_track_tags(
        self, track: Ptr[MIX_Track], count: Ptr[Int32]
    ) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackTags
        """
        var result_pointer = self.pointer_mix_get_track_tags(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_get_tagged_tracks(
        self, mixer: Ptr[MIX_Mixer], tag: CStringSlice, count: Ptr[Int32]
    ) raises -> Ptr[Ptr[MIX_Track, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTaggedTracks
        """
        var result_pointer = self.pointer_mix_get_tagged_tracks(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_set_track_playback_position(self, track: Ptr[MIX_Track], frames: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackPlaybackPosition
        """
        var success_status = self.pointer_mix_set_track_playback_position(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=frames).bitcast[Int64]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_get_track_playback_position(self, track: Ptr[MIX_Track]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackPlaybackPosition
        """
        return self.pointer_mix_get_track_playback_position(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_get_track_fade_frames(self, track: Ptr[MIX_Track]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackFadeFrames
        """
        return self.pointer_mix_get_track_fade_frames(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_get_track_loops(self, track: Ptr[MIX_Track]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackLoops
        """
        return self.pointer_mix_get_track_loops(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_set_track_loops(self, track: Ptr[MIX_Track], num_loops: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackLoops
        """
        var success_status = self.pointer_mix_set_track_loops(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=num_loops).bitcast[Int32]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_get_track_audio(
        self, track: Ptr[MIX_Track]
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackAudio
        """
        var result_pointer = self.pointer_mix_get_track_audio(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in mix_get_track_audio call. See official documentation for details."
        return result_pointer

    fn mix_get_track_audio_stream(
        self, track: Ptr[MIX_Track]
    ) raises -> Ptr[AudioStream, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackAudioStream
        """
        var result_pointer = self.pointer_mix_get_track_audio_stream(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in mix_get_track_audio_stream call. See official documentation for details."
        return result_pointer

    fn mix_get_track_remaining(self, track: Ptr[MIX_Track]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackRemaining
        """
        return self.pointer_mix_get_track_remaining(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_track_ms_to_frames(self, track: Ptr[MIX_Track], ms: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TrackMSToFrames
        """
        return self.pointer_mix_track_ms_to_frames(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=ms).bitcast[Int64]()[],
        )

    fn mix_track_frames_to_ms(self, track: Ptr[MIX_Track], frames: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TrackFramesToMS
        """
        return self.pointer_mix_track_frames_to_ms(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=frames).bitcast[Int64]()[],
        )

    fn mix_audio_ms_to_frames(self, audio: Ptr[MIX_Audio], ms: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_AudioMSToFrames
        """
        return self.pointer_mix_audio_ms_to_frames(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
            Ptr(to=ms).bitcast[Int64]()[],
        )

    fn mix_audio_frames_to_ms(self, audio: Ptr[MIX_Audio], frames: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_AudioFramesToMS
        """
        return self.pointer_mix_audio_frames_to_ms(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
            Ptr(to=frames).bitcast[Int64]()[],
        )

    fn mix_ms_to_frames(self, sample_rate: Int32, ms: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_MSToFrames
        """
        return self.pointer_mix_ms_to_frames(
            Ptr(to=sample_rate).bitcast[Int32]()[], Ptr(to=ms).bitcast[Int64]()[]
        )

    fn mix_frames_to_ms(self, sample_rate: Int32, frames: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_FramesToMS
        """
        return self.pointer_mix_frames_to_ms(
            Ptr(to=sample_rate).bitcast[Int32]()[], Ptr(to=frames).bitcast[Int64]()[]
        )

    fn mix_play_track(self, track: Ptr[MIX_Track], options: PropertiesID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PlayTrack
        """
        var success_status = self.pointer_mix_play_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=options).bitcast[PropertiesID]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_play_tag(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice, options: PropertiesID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PlayTag
        """
        var success_status = self.pointer_mix_play_tag(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=options).bitcast[PropertiesID]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_play_audio(self, mixer: Ptr[MIX_Mixer], audio: Ptr[MIX_Audio]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PlayAudio
        """
        var success_status = self.pointer_mix_play_audio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_stop_track(self, track: Ptr[MIX_Track], fade_out_frames: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_StopTrack
        """
        var success_status = self.pointer_mix_stop_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=fade_out_frames).bitcast[Int64]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_stop_all_tracks(self, mixer: Ptr[MIX_Mixer], fade_out_ms: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_StopAllTracks
        """
        var success_status = self.pointer_mix_stop_all_tracks(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=fade_out_ms).bitcast[Int64]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_stop_tag(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice, fade_out_ms: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_StopTag
        """
        var success_status = self.pointer_mix_stop_tag(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=fade_out_ms).bitcast[Int64]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_pause_track(self, track: Ptr[MIX_Track]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PauseTrack
        """
        var success_status = self.pointer_mix_pause_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise get_error()

    fn mix_pause_all_tracks(self, mixer: Ptr[MIX_Mixer]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PauseAllTracks
        """
        var success_status = self.pointer_mix_pause_all_tracks(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise get_error()

    fn mix_pause_tag(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PauseTag
        """
        var success_status = self.pointer_mix_pause_tag(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise get_error()

    fn mix_resume_track(self, track: Ptr[MIX_Track]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_ResumeTrack
        """
        var success_status = self.pointer_mix_resume_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise get_error()

    fn mix_resume_all_tracks(self, mixer: Ptr[MIX_Mixer]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_ResumeAllTracks
        """
        var success_status = self.pointer_mix_resume_all_tracks(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise get_error()

    fn mix_resume_tag(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_ResumeTag
        """
        var success_status = self.pointer_mix_resume_tag(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise get_error()

    fn mix_track_playing(self, track: Ptr[MIX_Track]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TrackPlaying
        """
        return self.pointer_mix_track_playing(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_track_paused(self, track: Ptr[MIX_Track]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TrackPaused
        """
        return self.pointer_mix_track_paused(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_set_mixer_gain(self, mixer: Ptr[MIX_Mixer], gain: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetMixerGain
        """
        var success_status = self.pointer_mix_set_mixer_gain(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=gain).bitcast[Float32]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_get_mixer_gain(self, mixer: Ptr[MIX_Mixer]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerGain
        """
        return self.pointer_mix_get_mixer_gain(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )

    fn mix_set_track_gain(self, track: Ptr[MIX_Track], gain: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackGain
        """
        var success_status = self.pointer_mix_set_track_gain(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=gain).bitcast[Float32]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_get_track_gain(self, track: Ptr[MIX_Track]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackGain
        """
        return self.pointer_mix_get_track_gain(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_set_tag_gain(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice, gain: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTagGain
        """
        var success_status = self.pointer_mix_set_tag_gain(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=gain).bitcast[Float32]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_mixer_frequency_ratio(self, mixer: Ptr[MIX_Mixer], ratio: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetMixerFrequencyRatio
        """
        var success_status = self.pointer_mix_set_mixer_frequency_ratio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=ratio).bitcast[Float32]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_get_mixer_frequency_ratio(self, mixer: Ptr[MIX_Mixer]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerFrequencyRatio
        """
        return self.pointer_mix_get_mixer_frequency_ratio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )

    fn mix_set_track_frequency_ratio(self, track: Ptr[MIX_Track], ratio: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackFrequencyRatio
        """
        var success_status = self.pointer_mix_set_track_frequency_ratio(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=ratio).bitcast[Float32]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_get_track_frequency_ratio(self, track: Ptr[MIX_Track]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackFrequencyRatio
        """
        return self.pointer_mix_get_track_frequency_ratio(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn mix_set_track_output_channel_map(
        self, track: Ptr[MIX_Track], chmap: Ptr[Int32], count: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackOutputChannelMap
        """
        var success_status = self.pointer_mix_set_track_output_channel_map(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=chmap).bitcast[Ptr[Int32, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_track_stereo(self, track: Ptr[MIX_Track], gains: Ptr[MIX_StereoGains]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackStereo
        """
        var success_status = self.pointer_mix_set_track_stereo(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=gains).bitcast[Ptr[MIX_StereoGains, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_track3_d_position(self, track: Ptr[MIX_Track], position: Ptr[MIX_Point3D]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrack3DPosition
        """
        var success_status = self.pointer_mix_set_track3_d_position(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=position).bitcast[Ptr[MIX_Point3D, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_get_track3_d_position(self, track: Ptr[MIX_Track], position: Ptr[MIX_Point3D]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrack3DPosition
        """
        var success_status = self.pointer_mix_get_track3_d_position(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=position).bitcast[Ptr[MIX_Point3D, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_create_group(self, mixer: Ptr[MIX_Mixer]) raises -> Ptr[MIX_Group, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateGroup
        """
        var result_pointer = self.pointer_mix_create_group(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_destroy_group(self, group: Ptr[MIX_Group]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyGroup
        """
        self.pointer_mix_destroy_group(
            Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[]
        )

    fn mix_get_group_properties(self, group: Ptr[MIX_Group]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetGroupProperties
        """
        return self.pointer_mix_get_group_properties(
            Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[]
        )

    fn mix_get_group_mixer(
        self, group: Ptr[MIX_Group]
    ) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetGroupMixer
        """
        var result_pointer = self.pointer_mix_get_group_mixer(
            Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise get_error()
        return result_pointer

    fn mix_set_track_group(self, track: Ptr[MIX_Track], group: Ptr[MIX_Group]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackGroup
        """
        var success_status = self.pointer_mix_set_track_group(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_track_stopped_callback(
        self, track: Ptr[MIX_Track], cb: MIX_TrackStoppedCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackStoppedCallback
        """
        var success_status = self.pointer_mix_set_track_stopped_callback(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_TrackStoppedCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_track_raw_callback(
        self, track: Ptr[MIX_Track], cb: MIX_TrackMixCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackRawCallback
        """
        var success_status = self.pointer_mix_set_track_raw_callback(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_TrackMixCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_track_cooked_callback(
        self, track: Ptr[MIX_Track], cb: MIX_TrackMixCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackCookedCallback
        """
        var success_status = self.pointer_mix_set_track_cooked_callback(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_TrackMixCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_group_post_mix_callback(
        self, group: Ptr[MIX_Group], cb: MIX_GroupMixCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetGroupPostMixCallback
        """
        var success_status = self.pointer_mix_set_group_post_mix_callback(
            Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_GroupMixCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_set_post_mix_callback(
        self, mixer: Ptr[MIX_Mixer], cb: MIX_PostMixCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetPostMixCallback
        """
        var success_status = self.pointer_mix_set_post_mix_callback(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_PostMixCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_generate(self, mixer: Ptr[MIX_Mixer], buffer: Ptr[NoneType], buflen: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_Generate
        """
        var success_status = self.pointer_mix_generate(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=buffer).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=buflen).bitcast[Int32]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_create_audio_decoder(
        self, path: CStringSlice, props: PropertiesID
    ) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateAudioDecoder
        """
        return self.pointer_mix_create_audio_decoder(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=props).bitcast[PropertiesID]()[],
        )

    fn mix_create_audio_decoder_io(
        self, io: Ptr[IOStream], closeio: Bool, props: PropertiesID
    ) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateAudioDecoder_IO
        """
        return self.pointer_mix_create_audio_decoder_io(
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=props).bitcast[PropertiesID]()[],
        )

    fn mix_destroy_audio_decoder(self, audiodecoder: Ptr[MIX_AudioDecoder]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyAudioDecoder
        """
        self.pointer_mix_destroy_audio_decoder(
            Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[]
        )

    fn mix_get_audio_decoder_properties(self, audiodecoder: Ptr[MIX_AudioDecoder]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDecoderProperties
        """
        return self.pointer_mix_get_audio_decoder_properties(
            Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[]
        )

    fn mix_get_audio_decoder_format(
        self, audiodecoder: Ptr[MIX_AudioDecoder], spec: Ptr[AudioSpec]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDecoderFormat
        """
        var success_status = self.pointer_mix_get_audio_decoder_format(
            Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise get_error()

    fn mix_decode_audio(
        self,
        audiodecoder: Ptr[MIX_AudioDecoder],
        buffer: Ptr[NoneType],
        buflen: Int32,
        spec: Ptr[AudioSpec],
    ) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DecodeAudio
        """
        return self.pointer_mix_decode_audio(
            Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[],
            Ptr(to=buffer).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=buflen).bitcast[Int32]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        )
