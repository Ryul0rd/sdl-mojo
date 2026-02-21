from ffi import OwnedDLHandle, c_char, CStringSlice
from sys import CompilationTarget
from os import PathLike
from pathlib import Path
from .misc import *
from .typedefs import *
from .structs import *
from .enums import *
from .vulkan import *
from .sdl3_functions import Sdl3Functions


comptime Ptr = UnsafePointer


struct SdlMixerFunctions:
    var _dynamic_library_handle: OwnedDLHandle
    var _get_error: fn() -> CStringSlice[ImmutExternalOrigin]
    var _version: fn() -> Int32
    var _init: fn() -> Bool
    var _quit: fn() -> NoneType
    var _get_num_audio_decoders: fn() -> Int32
    var _get_audio_decoder: fn(Int32) -> CStringSlice[ImmutExternalOrigin]
    var _create_mixer_device: fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var _create_mixer: fn(Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var _destroy_mixer: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> NoneType
    var _get_mixer_properties: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> PropertiesID
    var _get_mixer_format: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var _load_audio_io: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var _load_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var _load_audio_with_properties: fn(PropertiesID) -> Ptr[MIX_Audio, MutExternalOrigin]
    var _load_raw_audio_io: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var _load_raw_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]
    var _load_raw_audio_no_copy: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]
    var _create_sine_wave_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Int32, Float32, Int64) -> Ptr[MIX_Audio, MutExternalOrigin]
    var _get_audio_properties: fn(Ptr[MIX_Audio, MutExternalOrigin]) -> PropertiesID
    var _get_audio_duration: fn(Ptr[MIX_Audio, MutExternalOrigin]) -> Int64
    var _get_audio_format: fn(Ptr[MIX_Audio, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var _destroy_audio: fn(Ptr[MIX_Audio, MutExternalOrigin]) -> NoneType
    var _create_track: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Track, MutExternalOrigin]
    var _destroy_track: fn(Ptr[MIX_Track, MutExternalOrigin]) -> NoneType
    var _get_track_properties: fn(Ptr[MIX_Track, MutExternalOrigin]) -> PropertiesID
    var _get_track_mixer: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var _set_track_audio: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool
    var _set_track_audio_stream: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[AudioStream, MutExternalOrigin]) -> Bool
    var _set_track_io_stream: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool
    var _set_track_raw_io_stream: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Bool
    var _tag_track: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _untag_track: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType
    var _get_track_tags: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]
    var _get_tagged_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[MIX_Track, MutExternalOrigin], MutExternalOrigin]
    var _set_track_playback_position: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool
    var _get_track_playback_position: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64
    var _get_track_fade_frames: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64
    var _get_track_loops: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int32
    var _set_track_loops: fn(Ptr[MIX_Track, MutExternalOrigin], Int32) -> Bool
    var _get_track_audio: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]
    var _get_track_audio_stream: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]
    var _get_track_remaining: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64
    var _track_ms_to_frames: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64
    var _track_frames_to_ms: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64
    var _audio_ms_to_frames: fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64
    var _audio_frames_to_ms: fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64
    var _ms_to_frames: fn(Int32, Int64) -> Int64
    var _frames_to_ms: fn(Int32, Int64) -> Int64
    var _play_track: fn(Ptr[MIX_Track, MutExternalOrigin], PropertiesID) -> Bool
    var _play_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Bool
    var _play_audio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool
    var _stop_track: fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool
    var _stop_all_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin], Int64) -> Bool
    var _stop_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool
    var _pause_track: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var _pause_all_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool
    var _pause_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _resume_track: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var _resume_all_tracks: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool
    var _resume_tag: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool
    var _track_playing: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var _track_paused: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool
    var _set_mixer_gain: fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool
    var _get_mixer_gain: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32
    var _set_track_gain: fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool
    var _get_track_gain: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32
    var _set_tag_gain: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool
    var _set_mixer_frequency_ratio: fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool
    var _get_mixer_frequency_ratio: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32
    var _set_track_frequency_ratio: fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool
    var _get_track_frequency_ratio: fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32
    var _set_track_output_channel_map: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool
    var _set_track_stereo: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_StereoGains, ImmutExternalOrigin]) -> Bool
    var _set_track3_d_position: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, ImmutExternalOrigin]) -> Bool
    var _get_track3_d_position: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, MutExternalOrigin]) -> Bool
    var _create_group: fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Group, MutExternalOrigin]
    var _destroy_group: fn(Ptr[MIX_Group, MutExternalOrigin]) -> NoneType
    var _get_group_properties: fn(Ptr[MIX_Group, MutExternalOrigin]) -> PropertiesID
    var _get_group_mixer: fn(Ptr[MIX_Group, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]
    var _set_track_group: fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Group, MutExternalOrigin]) -> Bool
    var _set_track_stopped_callback: fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackStoppedCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _set_track_raw_callback: fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _set_track_cooked_callback: fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _set_group_post_mix_callback: fn(Ptr[MIX_Group, MutExternalOrigin], MIX_GroupMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _set_post_mix_callback: fn(Ptr[MIX_Mixer, MutExternalOrigin], MIX_PostMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool
    var _generate: fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Bool
    var _create_audio_decoder: fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]
    var _create_audio_decoder_io: fn(Ptr[IOStream, MutExternalOrigin], Bool, PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]
    var _destroy_audio_decoder: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> NoneType
    var _get_audio_decoder_properties: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> PropertiesID
    var _get_audio_decoder_format: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool
    var _decode_audio: fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Int32

    fn __init__(out self, sdl3_functions: Sdl3Functions) raises:
        var library_path: Path
        @parameter
        if CompilationTarget.is_linux():
            library_path = Path("libSDL3_mixer.so")
        elif CompilationTarget.is_macos():
            library_path = Path("libSDL3_mixer.dylib")
        else:
            constrained[False, "Target operating system is not supported."]()
            library_path = Path()
        self = Self(sdl3_functions, library_path)

    fn __init__(out self, sdl3_functions: Sdl3Functions, library_path: Path) raises:
        self._dynamic_library_handle = OwnedDLHandle(library_path)
        self._get_error = sdl3_functions._get_error
        self._version = self._dynamic_library_handle.get_function[fn() -> Int32]("MIX_Version")
        self._init = self._dynamic_library_handle.get_function[fn() -> Bool]("MIX_Init")
        self._quit = self._dynamic_library_handle.get_function[fn() -> NoneType]("MIX_Quit")
        self._get_num_audio_decoders = self._dynamic_library_handle.get_function[fn() -> Int32]("MIX_GetNumAudioDecoders")
        self._get_audio_decoder = self._dynamic_library_handle.get_function[fn(Int32) -> CStringSlice[ImmutExternalOrigin]]("MIX_GetAudioDecoder")
        self._create_mixer_device = self._dynamic_library_handle.get_function[fn(AudioDeviceID, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_CreateMixerDevice")
        self._create_mixer = self._dynamic_library_handle.get_function[fn(Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_CreateMixer")
        self._destroy_mixer = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> NoneType]("MIX_DestroyMixer")
        self._get_mixer_properties = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> PropertiesID]("MIX_GetMixerProperties")
        self._get_mixer_format = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("MIX_GetMixerFormat")
        self._load_audio_io = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool, Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadAudio_IO")
        self._load_audio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadAudio")
        self._load_audio_with_properties = self._dynamic_library_handle.get_function[fn(PropertiesID) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadAudioWithProperties")
        self._load_raw_audio_io = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadRawAudio_IO")
        self._load_raw_audio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadRawAudio")
        self._load_raw_audio_no_copy = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, ImmutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_LoadRawAudioNoCopy")
        self._create_sine_wave_audio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Int32, Float32, Int64) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_CreateSineWaveAudio")
        self._get_audio_properties = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin]) -> PropertiesID]("MIX_GetAudioProperties")
        self._get_audio_duration = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin]) -> Int64]("MIX_GetAudioDuration")
        self._get_audio_format = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("MIX_GetAudioFormat")
        self._destroy_audio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin]) -> NoneType]("MIX_DestroyAudio")
        self._create_track = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Track, MutExternalOrigin]]("MIX_CreateTrack")
        self._destroy_track = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> NoneType]("MIX_DestroyTrack")
        self._get_track_properties = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> PropertiesID]("MIX_GetTrackProperties")
        self._get_track_mixer = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_GetTrackMixer")
        self._set_track_audio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool]("MIX_SetTrackAudio")
        self._set_track_audio_stream = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[AudioStream, MutExternalOrigin]) -> Bool]("MIX_SetTrackAudioStream")
        self._set_track_io_stream = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Bool) -> Bool]("MIX_SetTrackIOStream")
        self._set_track_raw_io_stream = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[IOStream, MutExternalOrigin], Ptr[AudioSpec, ImmutExternalOrigin], Bool) -> Bool]("MIX_SetTrackRawIOStream")
        self._tag_track = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("MIX_TagTrack")
        self._untag_track = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> NoneType]("MIX_UntagTrack")
        self._get_track_tags = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]]("MIX_GetTrackTags")
        self._get_tagged_tracks = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Ptr[Int32, MutExternalOrigin]) -> Ptr[Ptr[MIX_Track, MutExternalOrigin], MutExternalOrigin]]("MIX_GetTaggedTracks")
        self._set_track_playback_position = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool]("MIX_SetTrackPlaybackPosition")
        self._get_track_playback_position = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64]("MIX_GetTrackPlaybackPosition")
        self._get_track_fade_frames = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64]("MIX_GetTrackFadeFrames")
        self._get_track_loops = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int32]("MIX_GetTrackLoops")
        self._set_track_loops = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int32) -> Bool]("MIX_SetTrackLoops")
        self._get_track_audio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[MIX_Audio, MutExternalOrigin]]("MIX_GetTrackAudio")
        self._get_track_audio_stream = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Ptr[AudioStream, MutExternalOrigin]]("MIX_GetTrackAudioStream")
        self._get_track_remaining = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Int64]("MIX_GetTrackRemaining")
        self._track_ms_to_frames = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64]("MIX_TrackMSToFrames")
        self._track_frames_to_ms = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Int64]("MIX_TrackFramesToMS")
        self._audio_ms_to_frames = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64]("MIX_AudioMSToFrames")
        self._audio_frames_to_ms = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Audio, MutExternalOrigin], Int64) -> Int64]("MIX_AudioFramesToMS")
        self._ms_to_frames = self._dynamic_library_handle.get_function[fn(Int32, Int64) -> Int64]("MIX_MSToFrames")
        self._frames_to_ms = self._dynamic_library_handle.get_function[fn(Int32, Int64) -> Int64]("MIX_FramesToMS")
        self._play_track = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], PropertiesID) -> Bool]("MIX_PlayTrack")
        self._play_tag = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Bool]("MIX_PlayTag")
        self._play_audio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[MIX_Audio, MutExternalOrigin]) -> Bool]("MIX_PlayAudio")
        self._stop_track = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Int64) -> Bool]("MIX_StopTrack")
        self._stop_all_tracks = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Int64) -> Bool]("MIX_StopAllTracks")
        self._stop_tag = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Int64) -> Bool]("MIX_StopTag")
        self._pause_track = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_PauseTrack")
        self._pause_all_tracks = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool]("MIX_PauseAllTracks")
        self._pause_tag = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("MIX_PauseTag")
        self._resume_track = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_ResumeTrack")
        self._resume_all_tracks = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Bool]("MIX_ResumeAllTracks")
        self._resume_tag = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin]) -> Bool]("MIX_ResumeTag")
        self._track_playing = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_TrackPlaying")
        self._track_paused = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Bool]("MIX_TrackPaused")
        self._set_mixer_gain = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool]("MIX_SetMixerGain")
        self._get_mixer_gain = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32]("MIX_GetMixerGain")
        self._set_track_gain = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool]("MIX_SetTrackGain")
        self._get_track_gain = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32]("MIX_GetTrackGain")
        self._set_tag_gain = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[c_char, ImmutExternalOrigin], Float32) -> Bool]("MIX_SetTagGain")
        self._set_mixer_frequency_ratio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Float32) -> Bool]("MIX_SetMixerFrequencyRatio")
        self._get_mixer_frequency_ratio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Float32]("MIX_GetMixerFrequencyRatio")
        self._set_track_frequency_ratio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Float32) -> Bool]("MIX_SetTrackFrequencyRatio")
        self._get_track_frequency_ratio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin]) -> Float32]("MIX_GetTrackFrequencyRatio")
        self._set_track_output_channel_map = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[Int32, ImmutExternalOrigin], Int32) -> Bool]("MIX_SetTrackOutputChannelMap")
        self._set_track_stereo = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_StereoGains, ImmutExternalOrigin]) -> Bool]("MIX_SetTrackStereo")
        self._set_track3_d_position = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, ImmutExternalOrigin]) -> Bool]("MIX_SetTrack3DPosition")
        self._get_track3_d_position = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Point3D, MutExternalOrigin]) -> Bool]("MIX_GetTrack3DPosition")
        self._create_group = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin]) -> Ptr[MIX_Group, MutExternalOrigin]]("MIX_CreateGroup")
        self._destroy_group = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin]) -> NoneType]("MIX_DestroyGroup")
        self._get_group_properties = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin]) -> PropertiesID]("MIX_GetGroupProperties")
        self._get_group_mixer = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin]) -> Ptr[MIX_Mixer, MutExternalOrigin]]("MIX_GetGroupMixer")
        self._set_track_group = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], Ptr[MIX_Group, MutExternalOrigin]) -> Bool]("MIX_SetTrackGroup")
        self._set_track_stopped_callback = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackStoppedCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetTrackStoppedCallback")
        self._set_track_raw_callback = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetTrackRawCallback")
        self._set_track_cooked_callback = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Track, MutExternalOrigin], MIX_TrackMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetTrackCookedCallback")
        self._set_group_post_mix_callback = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Group, MutExternalOrigin], MIX_GroupMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetGroupPostMixCallback")
        self._set_post_mix_callback = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], MIX_PostMixCallback, Ptr[NoneType, MutExternalOrigin]) -> Bool]("MIX_SetPostMixCallback")
        self._generate = self._dynamic_library_handle.get_function[fn(Ptr[MIX_Mixer, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32) -> Bool]("MIX_Generate")
        self._create_audio_decoder = self._dynamic_library_handle.get_function[fn(Ptr[c_char, ImmutExternalOrigin], PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]]("MIX_CreateAudioDecoder")
        self._create_audio_decoder_io = self._dynamic_library_handle.get_function[fn(Ptr[IOStream, MutExternalOrigin], Bool, PropertiesID) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]]("MIX_CreateAudioDecoder_IO")
        self._destroy_audio_decoder = self._dynamic_library_handle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> NoneType]("MIX_DestroyAudioDecoder")
        self._get_audio_decoder_properties = self._dynamic_library_handle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin]) -> PropertiesID]("MIX_GetAudioDecoderProperties")
        self._get_audio_decoder_format = self._dynamic_library_handle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[AudioSpec, MutExternalOrigin]) -> Bool]("MIX_GetAudioDecoderFormat")
        self._decode_audio = self._dynamic_library_handle.get_function[fn(Ptr[MIX_AudioDecoder, MutExternalOrigin], Ptr[NoneType, MutExternalOrigin], Int32, Ptr[AudioSpec, ImmutExternalOrigin]) -> Int32]("MIX_DecodeAudio")

    fn get_error(self) -> CStringSlice[ImmutExternalOrigin]:
        return self._get_error()

    fn version(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_Version
        """
        return self._version()

    fn init(self) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_Init
        """
        var success_status = self._init()
        if not success_status:
            raise self._get_error()

    fn quit(self):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_Quit
        """
        self._quit()

    fn get_num_audio_decoders(self) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetNumAudioDecoders
        """
        return self._get_num_audio_decoders()

    fn get_audio_decoder(self, index: Int32) raises -> CStringSlice[ImmutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDecoder
        """
        var c_string = self._get_audio_decoder(Ptr(to=index).bitcast[Int32]()[])
        if not c_string.unsafe_ptr():
            raise "Error in get_audio_decoder call. See official documentation for details."
        return c_string

    fn create_mixer_device(
        self, devid: AudioDeviceID, spec: Ptr[AudioSpec]
    ) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateMixerDevice
        """
        var result_pointer = self._create_mixer_device(
            Ptr(to=devid).bitcast[AudioDeviceID]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_mixer(self, spec: Ptr[AudioSpec]) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateMixer
        """
        var result_pointer = self._create_mixer(
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn destroy_mixer(self, mixer: Ptr[MIX_Mixer]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyMixer
        """
        self._destroy_mixer(Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[])

    fn get_mixer_properties(self, mixer: Ptr[MIX_Mixer]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerProperties
        """
        return self._get_mixer_properties(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )

    fn get_mixer_format(self, mixer: Ptr[MIX_Mixer], spec: Ptr[AudioSpec]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerFormat
        """
        var success_status = self._get_mixer_format(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn load_audio_io(
        self, mixer: Ptr[MIX_Mixer], io: Ptr[IOStream], predecode: Bool, closeio: Bool
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadAudio_IO
        """
        var result_pointer = self._load_audio_io(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=predecode).bitcast[Bool]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_audio(
        self, mixer: Ptr[MIX_Mixer], path: CStringSlice, predecode: Bool
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadAudio
        """
        var result_pointer = self._load_audio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=predecode).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_audio_with_properties(
        self, props: PropertiesID
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadAudioWithProperties
        """
        var result_pointer = self._load_audio_with_properties(
            Ptr(to=props).bitcast[PropertiesID]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_raw_audio_io(
        self, mixer: Ptr[MIX_Mixer], io: Ptr[IOStream], spec: Ptr[AudioSpec], closeio: Bool
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadRawAudio_IO
        """
        var result_pointer = self._load_raw_audio_io(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_raw_audio(
        self, mixer: Ptr[MIX_Mixer], data: Ptr[NoneType], datalen: Int32, spec: Ptr[AudioSpec]
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_LoadRawAudio
        """
        var result_pointer = self._load_raw_audio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=datalen).bitcast[Int32]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn load_raw_audio_no_copy(
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
        var result_pointer = self._load_raw_audio_no_copy(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=data).bitcast[Ptr[NoneType, ImmutExternalOrigin]]()[],
            Ptr(to=datalen).bitcast[Int32]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=free_when_done).bitcast[Bool]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn create_sine_wave_audio(
        self, mixer: Ptr[MIX_Mixer], hz: Int32, amplitude: Float32, ms: Int64
    ) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateSineWaveAudio
        """
        var result_pointer = self._create_sine_wave_audio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=hz).bitcast[Int32]()[],
            Ptr(to=amplitude).bitcast[Float32]()[],
            Ptr(to=ms).bitcast[Int64]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_audio_properties(self, audio: Ptr[MIX_Audio]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioProperties
        """
        return self._get_audio_properties(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[]
        )

    fn get_audio_duration(self, audio: Ptr[MIX_Audio]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDuration
        """
        return self._get_audio_duration(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[]
        )

    fn get_audio_format(self, audio: Ptr[MIX_Audio], spec: Ptr[AudioSpec]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioFormat
        """
        var success_status = self._get_audio_format(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn destroy_audio(self, audio: Ptr[MIX_Audio]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyAudio
        """
        self._destroy_audio(Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[])

    fn create_track(self, mixer: Ptr[MIX_Mixer]) raises -> Ptr[MIX_Track, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateTrack
        """
        var result_pointer = self._create_track(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn destroy_track(self, track: Ptr[MIX_Track]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyTrack
        """
        self._destroy_track(Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[])

    fn get_track_properties(self, track: Ptr[MIX_Track]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackProperties
        """
        return self._get_track_properties(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn get_track_mixer(self, track: Ptr[MIX_Track]) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackMixer
        """
        var result_pointer = self._get_track_mixer(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_track_audio(self, track: Ptr[MIX_Track], audio: Ptr[MIX_Audio]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackAudio
        """
        var success_status = self._set_track_audio(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_track_audio_stream(self, track: Ptr[MIX_Track], stream: Ptr[AudioStream]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackAudioStream
        """
        var success_status = self._set_track_audio_stream(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=stream).bitcast[Ptr[AudioStream, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_track_io_stream(self, track: Ptr[MIX_Track], io: Ptr[IOStream], closeio: Bool) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackIOStream
        """
        var success_status = self._set_track_io_stream(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_track_raw_io_stream(
        self, track: Ptr[MIX_Track], io: Ptr[IOStream], spec: Ptr[AudioSpec], closeio: Bool
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackRawIOStream
        """
        var success_status = self._set_track_raw_io_stream(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
        )
        if not success_status:
            raise self._get_error()

    fn tag_track(self, track: Ptr[MIX_Track], tag: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TagTrack
        """
        var success_status = self._tag_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn untag_track(self, track: Ptr[MIX_Track], tag: CStringSlice):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_UntagTrack
        """
        self._untag_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )

    fn get_track_tags(
        self, track: Ptr[MIX_Track], count: Ptr[Int32]
    ) raises -> Ptr[Ptr[c_char, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackTags
        """
        var result_pointer = self._get_track_tags(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn get_tagged_tracks(
        self, mixer: Ptr[MIX_Mixer], tag: CStringSlice, count: Ptr[Int32]
    ) raises -> Ptr[Ptr[MIX_Track, MutExternalOrigin], MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTaggedTracks
        """
        var result_pointer = self._get_tagged_tracks(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=count).bitcast[Ptr[Int32, MutExternalOrigin]]()[],
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_track_playback_position(self, track: Ptr[MIX_Track], frames: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackPlaybackPosition
        """
        var success_status = self._set_track_playback_position(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=frames).bitcast[Int64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_track_playback_position(self, track: Ptr[MIX_Track]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackPlaybackPosition
        """
        return self._get_track_playback_position(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn get_track_fade_frames(self, track: Ptr[MIX_Track]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackFadeFrames
        """
        return self._get_track_fade_frames(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn get_track_loops(self, track: Ptr[MIX_Track]) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackLoops
        """
        return self._get_track_loops(Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[])

    fn set_track_loops(self, track: Ptr[MIX_Track], num_loops: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackLoops
        """
        var success_status = self._set_track_loops(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=num_loops).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_track_audio(self, track: Ptr[MIX_Track]) raises -> Ptr[MIX_Audio, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackAudio
        """
        var result_pointer = self._get_track_audio(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_track_audio call. See official documentation for details."
        return result_pointer

    fn get_track_audio_stream(
        self, track: Ptr[MIX_Track]
    ) raises -> Ptr[AudioStream, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackAudioStream
        """
        var result_pointer = self._get_track_audio_stream(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise "Error in get_track_audio_stream call. See official documentation for details."
        return result_pointer

    fn get_track_remaining(self, track: Ptr[MIX_Track]) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackRemaining
        """
        return self._get_track_remaining(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn track_ms_to_frames(self, track: Ptr[MIX_Track], ms: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TrackMSToFrames
        """
        return self._track_ms_to_frames(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=ms).bitcast[Int64]()[],
        )

    fn track_frames_to_ms(self, track: Ptr[MIX_Track], frames: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TrackFramesToMS
        """
        return self._track_frames_to_ms(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=frames).bitcast[Int64]()[],
        )

    fn audio_ms_to_frames(self, audio: Ptr[MIX_Audio], ms: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_AudioMSToFrames
        """
        return self._audio_ms_to_frames(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
            Ptr(to=ms).bitcast[Int64]()[],
        )

    fn audio_frames_to_ms(self, audio: Ptr[MIX_Audio], frames: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_AudioFramesToMS
        """
        return self._audio_frames_to_ms(
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
            Ptr(to=frames).bitcast[Int64]()[],
        )

    fn ms_to_frames(self, sample_rate: Int32, ms: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_MSToFrames
        """
        return self._ms_to_frames(
            Ptr(to=sample_rate).bitcast[Int32]()[], Ptr(to=ms).bitcast[Int64]()[]
        )

    fn frames_to_ms(self, sample_rate: Int32, frames: Int64) -> Int64:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_FramesToMS
        """
        return self._frames_to_ms(
            Ptr(to=sample_rate).bitcast[Int32]()[], Ptr(to=frames).bitcast[Int64]()[]
        )

    fn play_track(self, track: Ptr[MIX_Track], options: PropertiesID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PlayTrack
        """
        var success_status = self._play_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=options).bitcast[PropertiesID]()[],
        )
        if not success_status:
            raise self._get_error()

    fn play_tag(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice, options: PropertiesID) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PlayTag
        """
        var success_status = self._play_tag(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=options).bitcast[PropertiesID]()[],
        )
        if not success_status:
            raise self._get_error()

    fn play_audio(self, mixer: Ptr[MIX_Mixer], audio: Ptr[MIX_Audio]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PlayAudio
        """
        var success_status = self._play_audio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=audio).bitcast[Ptr[MIX_Audio, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn stop_track(self, track: Ptr[MIX_Track], fade_out_frames: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_StopTrack
        """
        var success_status = self._stop_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=fade_out_frames).bitcast[Int64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn stop_all_tracks(self, mixer: Ptr[MIX_Mixer], fade_out_ms: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_StopAllTracks
        """
        var success_status = self._stop_all_tracks(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=fade_out_ms).bitcast[Int64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn stop_tag(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice, fade_out_ms: Int64) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_StopTag
        """
        var success_status = self._stop_tag(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=fade_out_ms).bitcast[Int64]()[],
        )
        if not success_status:
            raise self._get_error()

    fn pause_track(self, track: Ptr[MIX_Track]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PauseTrack
        """
        var success_status = self._pause_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn pause_all_tracks(self, mixer: Ptr[MIX_Mixer]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PauseAllTracks
        """
        var success_status = self._pause_all_tracks(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn pause_tag(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_PauseTag
        """
        var success_status = self._pause_tag(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn resume_track(self, track: Ptr[MIX_Track]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_ResumeTrack
        """
        var success_status = self._resume_track(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn resume_all_tracks(self, mixer: Ptr[MIX_Mixer]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_ResumeAllTracks
        """
        var success_status = self._resume_all_tracks(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )
        if not success_status:
            raise self._get_error()

    fn resume_tag(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_ResumeTag
        """
        var success_status = self._resume_tag(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
        )
        if not success_status:
            raise self._get_error()

    fn track_playing(self, track: Ptr[MIX_Track]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TrackPlaying
        """
        return self._track_playing(Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[])

    fn track_paused(self, track: Ptr[MIX_Track]) -> Bool:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_TrackPaused
        """
        return self._track_paused(Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[])

    fn set_mixer_gain(self, mixer: Ptr[MIX_Mixer], gain: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetMixerGain
        """
        var success_status = self._set_mixer_gain(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=gain).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_mixer_gain(self, mixer: Ptr[MIX_Mixer]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerGain
        """
        return self._get_mixer_gain(Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[])

    fn set_track_gain(self, track: Ptr[MIX_Track], gain: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackGain
        """
        var success_status = self._set_track_gain(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=gain).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_track_gain(self, track: Ptr[MIX_Track]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackGain
        """
        return self._get_track_gain(Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[])

    fn set_tag_gain(self, mixer: Ptr[MIX_Mixer], tag: CStringSlice, gain: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTagGain
        """
        var success_status = self._set_tag_gain(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            tag.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=gain).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_mixer_frequency_ratio(self, mixer: Ptr[MIX_Mixer], ratio: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetMixerFrequencyRatio
        """
        var success_status = self._set_mixer_frequency_ratio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=ratio).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_mixer_frequency_ratio(self, mixer: Ptr[MIX_Mixer]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetMixerFrequencyRatio
        """
        return self._get_mixer_frequency_ratio(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )

    fn set_track_frequency_ratio(self, track: Ptr[MIX_Track], ratio: Float32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackFrequencyRatio
        """
        var success_status = self._set_track_frequency_ratio(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=ratio).bitcast[Float32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_track_frequency_ratio(self, track: Ptr[MIX_Track]) -> Float32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrackFrequencyRatio
        """
        return self._get_track_frequency_ratio(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[]
        )

    fn set_track_output_channel_map(
        self, track: Ptr[MIX_Track], chmap: Ptr[Int32], count: Int32
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackOutputChannelMap
        """
        var success_status = self._set_track_output_channel_map(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=chmap).bitcast[Ptr[Int32, ImmutExternalOrigin]]()[],
            Ptr(to=count).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_track_stereo(self, track: Ptr[MIX_Track], gains: Ptr[MIX_StereoGains]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackStereo
        """
        var success_status = self._set_track_stereo(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=gains).bitcast[Ptr[MIX_StereoGains, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_track3_d_position(self, track: Ptr[MIX_Track], position: Ptr[MIX_Point3D]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrack3DPosition
        """
        var success_status = self._set_track3_d_position(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=position).bitcast[Ptr[MIX_Point3D, ImmutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn get_track3_d_position(self, track: Ptr[MIX_Track], position: Ptr[MIX_Point3D]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetTrack3DPosition
        """
        var success_status = self._get_track3_d_position(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=position).bitcast[Ptr[MIX_Point3D, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn create_group(self, mixer: Ptr[MIX_Mixer]) raises -> Ptr[MIX_Group, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateGroup
        """
        var result_pointer = self._create_group(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn destroy_group(self, group: Ptr[MIX_Group]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyGroup
        """
        self._destroy_group(Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[])

    fn get_group_properties(self, group: Ptr[MIX_Group]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetGroupProperties
        """
        return self._get_group_properties(
            Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[]
        )

    fn get_group_mixer(self, group: Ptr[MIX_Group]) raises -> Ptr[MIX_Mixer, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetGroupMixer
        """
        var result_pointer = self._get_group_mixer(
            Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[]
        )
        if not result_pointer:
            raise self._get_error()
        return result_pointer

    fn set_track_group(self, track: Ptr[MIX_Track], group: Ptr[MIX_Group]) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackGroup
        """
        var success_status = self._set_track_group(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_track_stopped_callback(
        self, track: Ptr[MIX_Track], cb: MIX_TrackStoppedCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackStoppedCallback
        """
        var success_status = self._set_track_stopped_callback(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_TrackStoppedCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_track_raw_callback(
        self, track: Ptr[MIX_Track], cb: MIX_TrackMixCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackRawCallback
        """
        var success_status = self._set_track_raw_callback(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_TrackMixCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_track_cooked_callback(
        self, track: Ptr[MIX_Track], cb: MIX_TrackMixCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetTrackCookedCallback
        """
        var success_status = self._set_track_cooked_callback(
            Ptr(to=track).bitcast[Ptr[MIX_Track, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_TrackMixCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_group_post_mix_callback(
        self, group: Ptr[MIX_Group], cb: MIX_GroupMixCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetGroupPostMixCallback
        """
        var success_status = self._set_group_post_mix_callback(
            Ptr(to=group).bitcast[Ptr[MIX_Group, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_GroupMixCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn set_post_mix_callback(
        self, mixer: Ptr[MIX_Mixer], cb: MIX_PostMixCallback, userdata: Ptr[NoneType]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_SetPostMixCallback
        """
        var success_status = self._set_post_mix_callback(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=cb).bitcast[MIX_PostMixCallback]()[],
            Ptr(to=userdata).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn generate(self, mixer: Ptr[MIX_Mixer], buffer: Ptr[NoneType], buflen: Int32) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_Generate
        """
        var success_status = self._generate(
            Ptr(to=mixer).bitcast[Ptr[MIX_Mixer, MutExternalOrigin]]()[],
            Ptr(to=buffer).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=buflen).bitcast[Int32]()[],
        )
        if not success_status:
            raise self._get_error()

    fn create_audio_decoder(
        self, path: CStringSlice, props: PropertiesID
    ) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateAudioDecoder
        """
        return self._create_audio_decoder(
            path.unsafe_ptr().unsafe_origin_cast[ImmutExternalOrigin](),
            Ptr(to=props).bitcast[PropertiesID]()[],
        )

    fn create_audio_decoder_io(
        self, io: Ptr[IOStream], closeio: Bool, props: PropertiesID
    ) -> Ptr[MIX_AudioDecoder, MutExternalOrigin]:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_CreateAudioDecoder_IO
        """
        return self._create_audio_decoder_io(
            Ptr(to=io).bitcast[Ptr[IOStream, MutExternalOrigin]]()[],
            Ptr(to=closeio).bitcast[Bool]()[],
            Ptr(to=props).bitcast[PropertiesID]()[],
        )

    fn destroy_audio_decoder(self, audiodecoder: Ptr[MIX_AudioDecoder]):
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DestroyAudioDecoder
        """
        self._destroy_audio_decoder(
            Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[]
        )

    fn get_audio_decoder_properties(self, audiodecoder: Ptr[MIX_AudioDecoder]) -> PropertiesID:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDecoderProperties
        """
        return self._get_audio_decoder_properties(
            Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[]
        )

    fn get_audio_decoder_format(
        self, audiodecoder: Ptr[MIX_AudioDecoder], spec: Ptr[AudioSpec]
    ) raises:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_GetAudioDecoderFormat
        """
        var success_status = self._get_audio_decoder_format(
            Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, MutExternalOrigin]]()[],
        )
        if not success_status:
            raise self._get_error()

    fn decode_audio(
        self,
        audiodecoder: Ptr[MIX_AudioDecoder],
        buffer: Ptr[NoneType],
        buflen: Int32,
        spec: Ptr[AudioSpec],
    ) -> Int32:
        """See official documentation for details.
        
        https://wiki.libsdl.org/SDL_mixer/MIX_DecodeAudio
        """
        return self._decode_audio(
            Ptr(to=audiodecoder).bitcast[Ptr[MIX_AudioDecoder, MutExternalOrigin]]()[],
            Ptr(to=buffer).bitcast[Ptr[NoneType, MutExternalOrigin]]()[],
            Ptr(to=buflen).bitcast[Int32]()[],
            Ptr(to=spec).bitcast[Ptr[AudioSpec, ImmutExternalOrigin]]()[],
        )
