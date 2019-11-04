extends Node2D

onready var player_variables = $"/root/PlayerVariables"
onready var battle_variables = $"/root/BattleVariables"

var time_current = 0
var time_delay = 0.8
var is_turn_player = true

func _ready():
	player_variables.life = 100
	player_variables.attack = 4
	player_variables.defense = 0
	player_variables.gold = 0

func _process(delta):
	if(battle_variables.in_battle):
		time_current += delta
		if(time_current >= time_delay):
			_battle()
			time_current = 0

func _battle():
	$ImpactFX.play()
	if(is_turn_player):
		var damagePlayer = _calculate_damage(player_variables.attack, battle_variables.enemy.defense)
		battle_variables.enemy.life -= damagePlayer
	else:
		var damageEnemy = _calculate_damage(battle_variables.enemy.attack, player_variables.defense)
		player_variables.life -= damageEnemy
	is_turn_player = !is_turn_player
	if(player_variables.life <= 0 or battle_variables.enemy.life <= 0):
		if battle_variables.enemy.life <= 0:
			player_variables.gold += battle_variables.enemy.gold
			battle_variables.enemy.die()
			battle_variables.finish_battle()
	
func _calculate_damage(atk1, def2):
	var damage = atk1 - def2
	if damage > 0:
		return damage
	else:
		return 0
