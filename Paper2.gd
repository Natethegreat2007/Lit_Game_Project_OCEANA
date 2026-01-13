extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 20


func _physics_process(delta):
	velocity.y += gravity * delta
	#Must include for the gravity to work
	move_and_slide()



func _on_collsion_body_entered(body):
				#Check if it's the Fish
	if body.get_name() == "Fish" or body.get_name() == "Fish_character":
		#Let the fish respawn
		get_tree().reload_current_scene()
	
	elif body.get_name() == "TileMap":
		queue_free()
