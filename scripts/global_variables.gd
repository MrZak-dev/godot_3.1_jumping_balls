extends Node

#game variables
var global_rocks_value : int = 0 # contains rocks value in general from the level beginning
var current_rocks_value : int = 0 #contains number of rocks value currently in scene
#ball variables
var ball_falling_speed : int



func _ready():
	ball_falling_speed = 1100
	pass 

