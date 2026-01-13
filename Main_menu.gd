extends Node2D

func _ready():
	$"/root/World1".queue_free()
	$"/root/EndingScene".queue_free()
func _on_button_pressed():
	$UI_Accept.play()
	await get_tree().create_timer(1).timeout
	get_tree().quit()
func _on_button_2_pressed():
	$UI_Accept.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://World_1.tscn")

func _process(delta):
	if $AudioStreamPlayer2D.playing == false:
		$AudioStreamPlayer2D.play()
