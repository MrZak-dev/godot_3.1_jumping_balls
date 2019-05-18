extends KinematicBody2D

#ball variables or rocks same physics.
var GRAVITY = 55
var ROTATION = 30
var directions = [1 , -1]
var sprite
var raycast
var velocity = Vector2(300, 1100) #300,1100 


#rock gameplay variables
var rock_score : int

func _ready():
	randomize()
	rock_score = randi() % 20 + 1 
	global_variables.global_rocks_value += rock_score # global rock value increased each time a rock is generated
	global_variables.current_rocks_value += rock_score # rock value currently in scene 
	raycast = $topRC
	sprite  = $AnimatedSprite
	velocity.x *= directions[randi() % 2 ]  # direction could be 1 or -1 for reverse
	ROTATION *= directions[randi() % 2 ]

func _physics_process(delta):
	$Label.set_text(str(rock_score)) #update rock score
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		#if collision_info.get_collider_id() == 1198: # this is for the ground area2d collision
		#	velocity = Vector2(300,1100)
		velocity = velocity.bounce(collision_info.normal)
	if raycast.is_colliding():
		velocity.y = min(velocity.y + GRAVITY , 1100)
	sprite.rotation_degrees += ROTATION * delta ##ball rotation
	$Label.rect_rotation += ROTATION * delta
	if rock_score == 0 :
		queue_free() # TODO : play explosion animation then free

func _on_AnimatedSprite_animation_finished(): ##signal
	$AnimatedSprite.stop()
	pass # Replace with function body.
