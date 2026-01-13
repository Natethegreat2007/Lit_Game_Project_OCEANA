extends Sprite2D

var dialogue_manager
var player_in_area = false
var got_clam = false
var crab
var next_level

func _ready():
	dialogue_manager = get_node("/root/DialogueManager")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("ui_accept"):
			print("Got pearl")
			hide()
			print("Hidden")
			got_clam = true
			print(got_clam)

func _on_pickablearea_body_entered(body):
	if body.is_in_group("Player"):
		player_in_area = true
		print("In location")
	
func _on_pickablearea_body_exited(body):
	if body.is_in_group("Player"):
		player_in_area = false
		print("Out of location")

