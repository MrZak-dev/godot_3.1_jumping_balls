extends Node2D

const SPACESHIP_SCENE = preload("res://scenes/spaceship/spaceship.tscn")
#onready var spaceship = SPACESHIP_SCENE.instance()




func _process(delta):
	
	#### test each hit if the current rocks value = half of the global rocks value
	var space_shipt_existence = get_parent().get_node_or_null("/root/main_scene/spaceship")
	if( space_shipt_existence == null and global_variables.number_of_rocks_in_scene < global_variables.total_number_of_rocks and global_variables.rocks_movements ):
		#call_deferred("add_spaceship_node")# bring the spaceship to the game
		add_spaceship_node()


func add_spaceship_node() -> void : 
	var spaceship = SPACESHIP_SCENE.instance()
	get_node("/root/main_scene/").add_child(spaceship)
