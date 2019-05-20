extends KinematicBody2D

onready var velocity : Vector2 = Vector2(70, -100)
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
	if global_variables.shooting_speed > 0.08 and global_variables.shooting_speed - 0.02 >= 0.08 :
		global_variables.shooting_speed -= 0.02
	#play animation later
	queue_free()



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
