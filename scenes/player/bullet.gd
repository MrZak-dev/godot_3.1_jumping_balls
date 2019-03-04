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


func _on_bullet_body_entered(body):
	#play hit animation and wait for it to finish then free
	queue_free()
	pass # Replace with function body.
