extends Area2D

const ROCK = preload("res://scenes/pixel_rocks/medium_rock.tscn")
#variables that loads at script loading time
onready var tween = get_node("tween")
onready var spaceship_image = get_node("image")
onready var center_drop_position = get_node("center_drop_position")
onready var spaceship_drop_timer = get_node("spaceship_drop_timer")



var spaceship_leaving_position : Vector2
func _ready():
	randomize() # to avoid same random numbers each time
	var spaceship_place : int = randi()% 2 + 1 # 1 for left 2 for right 
	var spaceship_width : int = spaceship_image.texture.get_width() #get the width of the spaceship 

	if spaceship_place == 1 :#set the spaceship position right or left (1 for left 2 for right)
		self.position.x = -720 - spaceship_width 
		spaceship_leaving_position = Vector2(1440 + spaceship_width,0) #if it comes from left it complete leaving to right area
	else:
		self.position.x = 1440 + spaceship_width
		spaceship_leaving_position = Vector2(-720 - spaceship_width ,0)#if it comes from right it complete leaving to left area
	tween.interpolate_property(self,"position:x",get_position().x,720,2,Tween.TRANS_QUINT,Tween.EASE_OUT) #720 means the center of the screen
	tween.start()
	spaceship_drop_timer.start()



func _on_Timer_timeout():
	var center_rock = ROCK.instance()
	center_rock.position = center_drop_position.global_position #set the rock position to the position2d node
	if global_variables.number_of_rocks_in_scene < global_variables.total_number_of_rocks: # keep dropping rocks untill it reachs total number wanted
		get_node("/root/main_scene/rocks/").add_child(center_rock)# add the rock to parent node (spaceship)
		spaceship_drop_timer.start()
	else: 
		tween.interpolate_property(self,"position:x",get_position().x,spaceship_leaving_position.x,3,Tween.TRANS_BACK,Tween.EASE_IN_OUT)
		tween.start()




func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
