extends Node2D

const SPACESHIP_SCENE = preload("res://scenes/spaceship/spaceship.tscn")
var spaceship 
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#add_child(spaceship)
	pass 
"""
func _process(delta):
	if !is_a_parent_of(spaceship) :
		if global_variables.current_rocks_value == (global_variables.global_rocks_value / 2):
			spaceship = SPACESHIP_SCENE.instance()
			get_parent().add_child(spaceship)

	else :
		print("Yes")
	
	
	
"""