extends KinematicBody2D

onready var velocity : Vector2 = Vector2(50, -100)
onready var up_raycas : Node = $up
onready var down_raycast  : Node = $down
const GRAVITY : int  = 10


var movements
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if up_raycas.is_colliding():
		velocity.y = min(velocity.y + GRAVITY , 100)
	if down_raycast.is_colliding():
		velocity.y = max (velocity.y - GRAVITY , -100)
	
	movements = move_and_collide(velocity * delta)
	pass


func _on_power_up_body_area_entered(area):
	global_variables.bullets_strength += 1
	area.bullet_explosion() # a bullet should explode when i hit a power up the same as hitting a rock
	#play animation later
	queue_free()



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
