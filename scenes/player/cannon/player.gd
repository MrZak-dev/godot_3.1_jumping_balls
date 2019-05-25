extends Area2D

onready var tween_node = get_node("Tween")
onready var shooting_time_timer = get_node("Timer")
onready var shooting_animation  : AnimatedSprite= get_node("AnimatedSprite")

const BULLET = preload("res://scenes/player/bullet/bullet.tscn")

var is_player_pressing = false
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	#each frame update shooting time speed
	shooting_time_timer.set_wait_time(global_variables.shooting_speed) #rplace with global variable 
	# when the shooting speed changes we should also change shooting animation frames speed 
	shooting_animation.frames.set_animation_speed("fire",3.4) # calculate the number 
	var click_position = get_global_mouse_position()
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		tween_node.interpolate_property(self,"position:x",get_position().x,click_position.x,0.75,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tween_node.start()
		
		is_player_pressing = true
	else:
		is_player_pressing = false
		tween_node.stop_all()
		$AnimatedSprite.stop()
	pass


func _on_Timer_timeout():
	if is_player_pressing:
		#loading bullet
		var one_bullet = BULLET.instance()
		one_bullet.position = $fire_position.global_position
		get_parent().add_child(one_bullet)
		#play fire animation
		$AnimatedSprite.play("fire")


func _on_tween_player_body_entered(body):
	print("game over")
	pass # Replace with function body.
