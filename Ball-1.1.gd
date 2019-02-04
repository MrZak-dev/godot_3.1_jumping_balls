extends KinematicBody2D

var MVMNT = Vector2(300,1000)
var GRAVITY = 20
var topRC
var bottomRC
var rightRC
var leftRC



func _ready():
	topRC = $topRC
	bottomRC = $bottomRC
	rightRC = $rightRC
	leftRC = $leftRC

func _physics_process(delta):
	
	if topRC.is_colliding():
		MVMNT.y = min(MVMNT.y + GRAVITY , 1000)
	
	if rightRC.is_colliding() || leftRC.is_colliding():
		MVMNT.x *= -1 
	if bottomRC.is_colliding():
		MVMNT.y *= -1 
		
	move_and_slide(MVMNT)
	pass
