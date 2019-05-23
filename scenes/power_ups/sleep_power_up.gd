extends KinematicBody2D

onready var velocity : Vector2 = Vector2(50, -100)
onready var up_raycas : Node = $up
onready var down_raycast  : Node = $down
onready var sleep_time_timer : Node = $sleeping_time
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
	#play animation later
	global_variables.rocks_movements = false
	sleep_time_timer.start()
	sleep_time_timer.get_parent().remove_child(sleep_time_timer)
	get_node("/root/main_scene/").add_child(sleep_time_timer)
	area.bullet_explosion() # a bullet should explode when ihit a power up the same as hitting a rock
	queue_free()



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


	
