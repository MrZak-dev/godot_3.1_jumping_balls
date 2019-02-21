extends KinematicBody2D

#ball variables or rocks same physics.
var GRAVITY = 55
var ROTATION = 30
var directions = [1 , -1]
var sprite
var raycast
var velocity = Vector2(300, 1100) #300,1100

func _ready():
	raycast = $topRC
	sprite  = $Sprite
	velocity.x *= directions[randi() % 2 ]  # direction could be 1 or -1 for reverse
	ROTATION *= directions[randi() % 2 ]


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
	if raycast.is_colliding():
		velocity.y = min(velocity.y + GRAVITY , 1100)
	sprite.rotation_degrees += ROTATION * delta ##ball rotation