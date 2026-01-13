extends Node2D



func _on_button_2_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://world_1_fish_mini.tscn")


func _on_button_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
func _on_continue_button_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://World2.tscn")
