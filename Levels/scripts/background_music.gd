extends AudioStreamPlayer

#preloading all sound effects
const level_music = preload("res://Assets/background_music.mp3")
const click_sound = preload('res://Assets/folley effects/mixkit-video-game-retro-click-237.mp3')
const jump_sound = preload("res://Assets/folley effects/mixkit-player-jumping-in-a-video-game-2043.mp3")
const squish_sound = preload("res://Assets/folley effects/mixkit-video-game-blood-pop-2361.mp3")
const complete_sound = preload("res://Assets/folley effects/mixkit-bonus-earned-in-video-game-2058.mp3")
const death_screen_sound = preload("res://Assets/folley effects/mixkit-arcade-space-shooter-dead-notification-272.mp3")
const coin_sound = preload("res://Assets/folley effects/mixkit-winning-a-coin-video-game-2069.mp3")

#playes music at a set volume accross scense if music isnt already playing
func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	
#calls the play music fucntion wiht level music
func play_music_level():
	_play_music(level_music)
	
#plays sound effects until sounde effect finsihed across scense
func play_FX(stream: AudioStream, volume = -20):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "fx_player"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	
	fx_player.queue_free()
	
