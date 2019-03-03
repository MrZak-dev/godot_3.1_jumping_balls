extends Area2D


const SPEED = -2000
var velocity = Vector2()
func _ready():
	pass

func _physics_process(delta):
	velocity.y = SPEED * delta
	translate(velocity)
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
