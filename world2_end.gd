extends Node2D

func _on_button_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://world3.tscn")

func _on_retry_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://World2.tscn")

func _on_button_2_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Main_menu.tscn")

func _on_button_3_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://world_1_fish_mini.tscn")
