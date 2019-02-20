extends KinematicBody2D

#ball variables or rocks same physics.
var GRAVITY = 55
var ROTATION = 30
var directions = [1 , -1]
var sprite
var raycast
var velocity = Vector2(300, 1100) #300,1100

#coming from void variables
var game_width
var ov_velocity = Vector2(400,0) #out view
var ov_direction
var ball_position
var texture_dimensions


func _ready():
	raycast = $topRC
	sprite  = $Sprite
	velocity.x *= directions[randi() % 2 ]  # direction could be 1 or -1 for reverse
	ROTATION *= directions[randi() % 2 ]

	#out view physics
	game_width = ProjectSettings.get("display/window/size/width") #game width
	texture_dimensions = (sprite.texture.get_width() * sprite.get_scale()) # real width

func _physics_process(delta):
	"""ball_position = self.get_position() #position of the ball
	if (ball_position.x + texture_dimensions.x ) <  0 : #if outside from the left
		ov_direction = 1
		move_and_collide(ov_velocity * ov_direction * delta)
		print("left")
	if ball_position.x  > game_width: #if outside from right
		ov_direction = -1
		move_and_collide(ov_velocity * ov_direction * delta)
		print("right")
	if ((ball_position.x > 0) and (ball_position.x   < game_width)) :"""
		#ov_velocity = Vector2(0,0)
		#print("im in")
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
	if raycast.is_colliding():
		velocity.y = min(velocity.y + GRAVITY , 1100)
	sprite.rotation_degrees += ROTATION * delta ##ball rotation
#print(ball_position.x)
#print(game_width)
