extends Node2D

#Remember to add more coral for story tidbits
@onready var AudiostreamPlayer = get_node("AudioStreamPlayer")

func _ready():
	# Instantiate the NextLevel scene
	var next_level_instance = preload("res://next_level.tscn").instantiate()
	# Set the next_level_path variable to the desired scene path
	next_level_instance.next_level_path = "res://world_2_end.tscn"
	# Add the NextLevel scene instance as a child of this node
	next_level_instance.position = Vector2(-455, 1370)
	add_child(next_level_instance)
	
signal world_changed(world_name)
var entered = false

@export var world_name = "world"

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			print("entered")
			emit_signal("world_changed", world_name)
			
	var audio_stream_player = get_node_or_null("AudioStreamPlayer")
	if audio_stream_player != null and not audio_stream_player.playing:
		audio_stream_player.play()
		
@warning_ignore("unused_parameter")
func _on_body_entered(body: PhysicsBody2D):
	entered = true

@warning_ignore("unused_parameter")
func _on_body_exited(body):
	entered = false

@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body: PhysicsBody2D):
	entered = true

@warning_ignore("unused_parameter")
func _on_area_2d_body_exited(body):
	entered = false

