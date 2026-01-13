extends CharacterBody2D

var gravity = 20

#Function for Physics gravity
func _physics_process(delta):
	velocity.y += gravity * delta
	#Must include for the gravity to work
	move_and_slide()
	


func _on_player_collision_body_entered(body):
			#Check if it's the Fish
	if body.get_name() == "Fish" or body.get_name() == "Fish_character":
		#Let the fish respawn
		get_tree().reload_current_scene()
	
	elif body.get_name() == "TileMap":
		queue_free()


#Implement Endless Paper Duplication
#func _on_area_2d_area_entered(body):
	#if body.get_name() == "TileMap":
		#duplicate_paper()
		#print("fine")

#Implement paper duplication
#func duplicate_paper():
	#print("Good")
	# Duplicate the paper instance and add it to the scene
	#var paper_clone = preload("res://paperr_obstacle.tscn").instance()
	#get_parent().add_child(paper_clone)
	#paper_clone.global_position = global_position




