extends StaticBody2D

onready var player_shield_animation : AnimatedSprite = get_node("AnimatedSprite")
onready var player_shield_timer : Timer = get_node("Timer")

func _ready():
	player_shield_animation.play("appear")
	player_shield_timer.start()
	pass # Replace with function body.



func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.


