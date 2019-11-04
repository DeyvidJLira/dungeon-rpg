extends Node

export var life: int
export var attack: int
export var defense: int
export var gold: int

onready var battle_variables = $"/root/BattleVariables"

func die():
	queue_free()

func _on_Bat_area_entered(area):
	battle_variables.enemy = self
	battle_variables.in_battle = true
