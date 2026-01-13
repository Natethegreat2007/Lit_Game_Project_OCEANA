extends Node2D

@onready var AudiostreamPlayer = get_node("AudioStreamPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	var audio_stream_player = get_node_or_null("AudioStreamPlayer")
	if audio_stream_player != null and not audio_stream_player.playing:
		audio_stream_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func nextmission():
	var button = Button.new()
	button.text = "Click to Continue to Start the Battle"
	button.pressed.connect(self._button_pressed)
	add_child(button)
func start_battle():
	get_tree().change_scene_to_file("res://final_battle.tscn")
	
func _button_pressed():
	get_tree().change_scene_to_file("res://final_battle.tscn")


