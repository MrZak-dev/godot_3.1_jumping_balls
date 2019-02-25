extends KinematicBody2D

var motion = Vector2()
var moving_speed = 230
var max_speed = 400 
var touch_point = Vector2()
var pressed = false
var player_position = Vector2()

#dra variables
var drag_index


func _process(delta):
	if pressed:
		player_position.x = int(self.get_position().x)
		if player_position.x > touch_point.x:
			motion.x = min(motion.x - moving_speed,-max_speed)
		if player_position.x < touch_point.x:
			motion.x = max(motion.x + moving_speed,max_speed)
		move_and_slide(motion)
		pressed = false #in the end of each frame make it false so the movements wont keep going
	else:
		move_and_slide(Vector2(0,0))
	pass  
func _input(event):
	if event is InputEventScreenDrag or InputEventScreenTouch:
		if event is InputEventScreenDrag: #fonctions that works only for drag event
			max_speed = event.get_speed().x
			drag_index = event.get_index()
			pass
		pressed = true #if an input event received start moving the canon
		touch_point.x = int(event.get_position().x)
#TODO : figure out the shaking physics where it is coming from 
#Notice : this scene is working only on android devices
