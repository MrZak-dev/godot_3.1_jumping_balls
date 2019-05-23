extends Node



#power ups variables
var shooting_speed : float = 0.7
var bullets_strength : int = 1

#game variables
var global_rocks_value : int = 0 # contains rocks value in general from the level beginning
var current_rocks_value : int = 0 #contains number of rocks value currently in scene
var rocks_movements : bool = true

var total_number_of_rocks = 3 # total number of rock that the player should interract with each level 
var number_of_rocks_in_scene = 0# number of rocks that the player is currently interracting with

#rock scene global variables
var rock_fall_speed : int = 0#global ball falling speed




