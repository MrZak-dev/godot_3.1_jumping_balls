extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var position_of_touch = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	position_of_touch.y = self.get_position().y
	pass # Replace with function body.


func _physics_process(delta):
	
	self.set_position(position_of_touch)
func _input(event):
	if event is InputEventScreenDrag or InputEventScreenTouch:
		position_of_touch.x = event.get_position().x
	pass
