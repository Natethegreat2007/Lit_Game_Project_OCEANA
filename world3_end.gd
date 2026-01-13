extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://before_battle.tscn")


func _on_button_2_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Main_menu.tscn")




func _on_button_3_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://world_1_fish_mini.tscn")




func _on_button_5_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://world3.tscn")


func _on_button_4_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://world2.tscn")
