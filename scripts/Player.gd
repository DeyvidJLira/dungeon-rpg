extends Area2D

onready var ray = $Raycast
onready var tween = $Tween

export var speed = 3

var tile_size = 16
var inputs = {"ui_right": Vector2.RIGHT,
            "ui_left": Vector2.LEFT,
            "ui_up": Vector2.UP,
            "ui_down": Vector2.DOWN}

func _ready():
    position = position.snapped(Vector2.ONE * tile_size)
    position += Vector2.ONE * tile_size/2
	
func _unhandled_input(event):
    if tween.is_active():
        return
    for dir in inputs.keys():
        if event.is_action_pressed(dir):
            move(inputs[dir])
			
func move(dir):
    ray.cast_to = dir * tile_size
    ray.force_raycast_update()
    if !ray.is_colliding():
        move_tween(dir)
		
func move_tween(dir):
    tween.interpolate_property(self, "position",
        position, position + dir * tile_size,
        1.0/speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
    tween.start()