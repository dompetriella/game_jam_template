extends Node

#region AudioEmitters
signal audio_play_music;
signal audio_switch_music_track;
signal audio_play_sfx;
#endregion

#region AudioMethods
class Audio:
	static func play_music(audio: AudioStream, fade_in: bool = false, fade_in_time: float = 2.0):
		Events.audio_play_music.emit(audio, fade_in, fade_in_time);
	
	static func stop_current_music(fade_out: bool = false, fade_out_time: float = 2.0):
		Events.audio_play_music.emit(fade_out, fade_out_time);
	
	static func switch_music_track(new_music: AudioStream, 	fade_between_tracks: bool = false, fade_time: float = 2.0):
		Events.audio_switch_music_track.emit(new_music, fade_between_tracks, fade_time);

	static func play_sfx(audio: AudioStream, source: AudioSource.Source = AudioSource.Source.WORLD_SFX):
		Events.audio_play_sfx.emit(audio, source);
#endregion
