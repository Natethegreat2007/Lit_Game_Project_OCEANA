extends Node2D

@onready var saylor_battle_sprite = $"../Saylor_battle_sprite"



var player_action: String = ""
var enemies : Array = []
var index: int = 0
var action_queue : Array = []
var is_battle: bool = false

const GAME_OVER_SCENE = "res://game_over.tscn"
const VICTORY_SCENE = "res://victory.tscn"
@onready var choice = $"../CanvasLayer/Choice"

var remaining_actions: int = 3

signal next_player

func _ready():
	enemies = get_children()
	for i in enemies.size():
		enemies[i].position = Vector2(0, i*200)
	show_choice()
	
func _process(_delta):
	if not choice.visible:
		if Input.is_action_just_pressed("ui_up"):
			if index > 0:
				index -= 1
				switch_focus(index, index+1)
		
		if Input.is_action_just_pressed("ui_down"):
			if index < enemies.size() - 1:
				index += 1
				switch_focus(index, index - 1)
		
		if Input.is_action_just_pressed("ui_accept"):
				action_queue.push_back(index)
				emit_signal("next_player")

	
	if action_queue.size() == enemies.size() and not is_battle:
		is_battle = true
		_action(action_queue)

func _action(stack):
	var player_node = get_parent().get_node("Saylor_battle_sprite")
	var num_attacks = 0
	for i in stack:
		if player_action == "Attack":
			num_attacks += 1
			if num_attacks <= 3:
				_reset_focus()
				enemies[i].focus()
				remaining_actions -= 1
				await get_tree().create_timer(1).timeout
				enemies[i].take_damage(1)
				#var alive_enemy_index = -1
				#for j in range(enemies.size()):
					#if not enemies[j].is_dead:
						#alive_enemy_index = j
						#break
				
				#if alive_enemy_index != -1:
					#enemies[alive_enemy_index].focus()
					#await get_tree().create_timer(1).timeout
					#enemies[i].take_damage(5)
			else:
				break
		elif player_action == "Heal":
			_reset_focus()
			player_node.focus()
			remaining_actions -= 1
			await get_tree().create_timer(1).timeout
			player_node.heal(3)
			_start_choosing()
		elif player_action == "Defend":
			_reset_focus()
			player_node.focus()
			remaining_actions -= 1
			await get_tree().create_timer(1).timeout
			player_node.is_defending = true
			_start_choosing()

	player_node.is_defending = false
	enemy_attack(player_node)	
	
	var all_enemies_dead = true
	for enemy in enemies:
		if not enemy.is_dead:
			all_enemies_dead = false
			break
	
	if all_enemies_dead:
		get_tree().change_scene_to_file("res://ending_scene.tscn")
		return
		
	action_queue.clear()
	is_battle = false
	show_choice()
	player_action = ""

func switch_focus(x,y):
	enemies[x].focus()
	enemies[y].unfocus()

func show_choice():
	choice.show()
	var actions = choice.get_node("Actions")
	for action in actions.get_children():
		action.grab_focus()

func _reset_focus():
	index = 0
	for enemy in enemies:
		enemy.unfocus()

func _start_choosing():
	_reset_focus()

func enemy_attack(player_node):
	for enemy in enemies:
		if not enemy.is_dead:
			player_node.take_damage(enemy.attack_power)
			await get_tree().create_timer(0.5).timeout
	
	if player_node.health <= 0:
		get_tree().change_scene_to_file(GAME_OVER_SCENE)
		return
func _on_attack_pressed():
	player_action = "Attack"
	choice.hide()
	_start_choosing()

func _on_defend_pressed():
	player_action = "Defend"
	choice.hide()
	_start_choosing()
	
func _on_heal_pressed():
	player_action = "Heal"
	choice.hide()
	_start_choosing()


