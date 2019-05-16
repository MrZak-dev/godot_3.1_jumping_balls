extends Area2D

const rock = preload("res://scenes/pixel_rocks/medium_rock.tscn")
onready var tween = get_node("tween")
onready var spaceship_image = get_node("image")
var spaceship_target_position : Vector2 = Vector2(720,0)
func _ready():
	randomize() # to avoid same random numbers each time
	var spaceship_place : int = randi()% 2 + 1 # 1 for left 2 for right 
	var spaceship_width : int = spaceship_image.texture.get_width() #get the width of the spaceship 

	if spaceship_place == 1 :#set the spaceship position right or left 
		self.position.x = -720 - spaceship_width 
	else:
		self.position.x = 1440 + spaceship_width

func _physics_process(delta):
	tween.interpolate_property(self,"position:x",get_position().x,spaceship_target_position.x,1.5,Tween.TRANS_QUINT,Tween.EASE_OUT)
	#tween.interpolate_property(self,"position:x",self.get_position().x,720,0.75,Tween.TRANS_BACK,Tween.EASE_IN_OUT)
	tween.start()
