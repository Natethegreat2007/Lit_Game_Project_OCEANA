extends Area2D

# Declare a variable to hold the path of the next level
var next_level_path : String ="res://World1_sim.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("here")
		var current_scene_file = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file(next_level_path)

