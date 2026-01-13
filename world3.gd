extends Node2D

@onready var AudiostreamPlayer = get_node("AudioStreamPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	var audio_stream_player = get_node_or_null("AudioStreamPlayer")
	if audio_stream_player != null and not audio_stream_player.playing:
		audio_stream_player.play()
		
func next_level_3():
	var next_level_instance = preload("res://next_level.tscn").instantiate()
	# Set the next_level_path variable to the desired scene path
	next_level_instance.next_level_path = "res://world3_end.tscn"
	# Add the NextLevel scene instance as a child of this node
	next_level_instance.position = Vector2(750, -150)
	add_child(next_level_instance)
