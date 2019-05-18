extends Area2D

const SPACESHIP_SCENE = preload("res://scenes/spaceship/spaceship.tscn")
onready var spaceship = SPACESHIP_SCENE.instance()
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
	global_variables.current_rocks_value -= 1 # current number of rocks being hitted by the player
	
	#### test each hit if the current rocks value = half of the global rocks value
	var space_shipt_existence = get_parent().get_node_or_null("/root/main_scene/spaceship")
	if( global_variables.current_rocks_value < global_variables.global_rocks_value  and space_shipt_existence == null):
		spaceship.add_to_group("spaceship")
		get_parent().add_child(spaceship)
		


	
	var body_sprite : Node  = body.get_child(0)
	body_sprite.play("hit_taking")

func _on_AnimatedSprite_animation_finished():
	queue_free()