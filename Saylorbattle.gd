extends Node2D
 
var players: Array = []
var index : int = 0
 
@onready var _focus = $"Saylor (Player)/Focus"
@onready var progress_bar = $"Saylor (Player)/ProgressBar"
@onready var animation_player = $"Saylor (Player)/AnimationPlayer"

var MAX_HEALTH: float = 10
var health: float = MAX_HEALTH
var is_defending: bool = false


func _ready():
	players = get_children()
	players[0].focus()
 
func _on_enemy_group_next_player():
	if index < players.size() - 1:
		index += 1
		switch_focus(index, index - 1)
	else:
		index = 0
		switch_focus( index, players.size() - 1 )
 
func heal(amount: float):
	health = clamp(health + amount,0,MAX_HEALTH)
	_update_progress_bar()

func take_damage(value: float):
	if is_defending:
		value /= 2
	health = max(health - value, 0)
	_update_progress_bar()
	_play_animation()
func _update_progress_bar():
	progress_bar.value = (health / MAX_HEALTH) * 100

func _play_animation():
	pass
	
func unfocus():
	_focus.hide()

func focus():
	_focus.show()
	
func switch_focus(x,y):
	players[x].focus()
	players[y].unfocus()
