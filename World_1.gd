extends Node2D

@onready var saylor = $Saylor
@onready var regular_stuart_4 = $"Regular-stuart-4"
@onready var world_1 = $"."

#Please remember to add Area2D, Direction etc to this so it can interact with coral...follow Nathan's video
@onready var actionable_finder: Area2D = $characterdirection/ActionableFinder
@export var move_speed : float = 100
@onready var topdownfish_animation = get_node("AnimationPlayer")
var last_direction = Vector2.ZERO
var input_vector: Vector2 = Vector2.ZERO
var OPENING_CONVO

@onready var dialogue_manager = $DialogueManager

# Called when the node enters the scene tree for the first time.

func change_scene_after_dialogue():
	get_tree().change_scene_to_file("res://world_1_fish_mini.tscn")
func _process(delta):
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()

func nextmission():
	get_tree().change_scene_to_file("res://world_1_fish_mini.tscn")

func _button_pressed():
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://world_1_fish_mini.tscn")
