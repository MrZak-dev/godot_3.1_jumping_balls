extends Area2D


var speed : int = -2000
var velocity = Vector2()
func _ready():
	pass

func _physics_process(delta):
	velocity.y = speed * delta
	translate(velocity)
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_bullet_body_entered(body):
	speed = -300
	$AnimatedSprite.play("explosion")
	body.rock_score -= 1

func _on_AnimatedSprite_animation_finished():
	queue_free()