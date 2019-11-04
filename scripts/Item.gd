extends Area2D

# 0 - HP, 1 - ATK, 2 - DEF
export var effect_type = 0
export var increase_points = 0

func _effect():
	if effect_type == 0:
		$"/root/PlayerVariables".life += increase_points
	elif effect_type == 1:
		$"/root/PlayerVariables".attack += increase_points
	elif effect_type == 2:
		$"/root/PlayerVariables".defense += increase_points

func _on_PotionLifeP_area_entered(area):
	_effect()
	queue_free()
