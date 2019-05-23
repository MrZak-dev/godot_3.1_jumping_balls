extends Area2D


var speed : int = -2000
var velocity = Vector2()
func _ready():
	pass

func _physics_process(delta):
	velocity.y = speed * delta
	translate(velocity)



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_bullet_body_entered(body):
	bullet_explosion()
	body.rock_score -= global_variables.bullets_strength 
	global_variables.current_rocks_value -= global_variables.bullets_strength # current number of rocks being hitted by the player
	var body_sprite : Node  = body.get_child(0)
	body_sprite.play("hit_taking")
	


func bullet_explosion() -> void:
	speed = -300 #decrease bullet speed to see the explosion moving slowly 
	$AnimatedSprite.play("explosion")

func _on_AnimatedSprite_animation_finished():
	queue_free()