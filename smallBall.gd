extends KinematicBody2D

var GRAVITY = 55
var raycast
var velocity = Vector2(-300, 1300)
func _ready():
	raycast = $topRC
	pass


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
	if raycast.is_colliding():
		velocity.y = min(velocity.y + GRAVITY , 1100)