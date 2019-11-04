extends Control

onready var player_variables = $"/root/PlayerVariables"

func _process(delta):
	$HBoxContainer/Life.text = "L: " + str(player_variables.life)
	$HBoxContainer/Attack.text = "A: " + str(player_variables.attack)
	$HBoxContainer/Defense.text = "D: " + str(player_variables.defense)
	$HBoxContainer/Gold.text = "G: " + str(player_variables.gold)