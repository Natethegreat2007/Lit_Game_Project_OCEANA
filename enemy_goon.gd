extends CharacterBody2D

var enemies : Array = []
@onready var _focus = $Focus
@onready var progress_bar = $ProgressBar
@onready var animation_player = $AnimationPlayer
@onready var saylor_battle_sprite = $Saylor_battle_sprite
@onready var enemy = $"."

@export var MAX_HEALTH: float = 7

var health: float = 7:
	set(value):
		health = value
		_update_progress_bar()
		_play_animation()

func _update_progress_bar():
	print("updated")
	progress_bar.value = (health/MAX_HEALTH) * 100

func _play_animation():
	animation_player.play("Hurt")

func focus():
	_focus.show()

func unfocus():
	_focus.hide()

func take_damage(value):
	health -= value
	_update_progress_bar()
	_play_animation()
	if health <= 0:
		is_dead = true
		enemy.visible = false
		enemy.hide()
var is_dead:bool = false

@export var attack_power: int = 1
