extends KinematicBody2D

var motion = Vector2()
var moving_speed = 95
var max_speed = 300
var touch_point = Vector2()
var pressed = false
var player_position = Vector2()


func _process(delta):
	player_position.x = int(self.get_position().x)
	if player_position.x > touch_point.x:
		motion.x = min(motion.x - moving_speed , -max_speed )
	if player_position.x < touch_point.x:
		motion.x = max(motion.x + moving_speed, max_speed)
	move_and_slide(motion)
	#pressed = false #in the end of each frame make it false so the movements wont keep going
	pass  
func _input(event):
	if (event is InputEventScreenTouch) or (event is InputEventScreenDrag):
		pressed = true #if an input event received start moving the canon
		touch_point.x = int(event.get_position().x)
#TODO : figure out the shaking phwsics where it is coming from 
#Notice : this scene is working only on android devices
