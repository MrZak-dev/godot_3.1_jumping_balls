extends Node2D

onready var tween_node = get_node("Tween")
const BULLET = preload("res://scenes/player/bullet.tscn")
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var click_position = get_global_mouse_position()
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		tween_node.interpolate_property(self,"position:x",get_position().x,click_position.x,0.75,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tween_node.start()
		
		#loading bullet 
		var one_bullet = BULLET.instance()
		get_parent().add_child(one_bullet)
		one_bullet.position = $Position2D.global_position
		
		#play fire animation
		$AnimatedSprite.play("fire")
	else:
		tween_node.stop_all()
		$AnimatedSprite.stop()
	pass