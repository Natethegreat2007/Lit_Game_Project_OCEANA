extends Sprite2D

var dialogue_manager
@onready var clam_instance = $"/root/Clam"

func _ready():
	dialogue_manager = get_node("/root/DialogueManager")

func _process(delta):
	pass
