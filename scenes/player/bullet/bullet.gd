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
	body.rock_score -= 3
	global_variables.current_rocks_value -= 3 # current number of rocks being hitted by the player
	var body_sprite : Node  = body.get_child(0)
	body_sprite.play("hit_taking")
	
	#### test each hit if the current rocks value = half of the global rocks value
	var space_shipt_existence = get_parent().get_node_or_null("/root/main_scene/spaceship")
	if( global_variables.current_rocks_value < (global_variables.global_rocks_value/2)  and space_shipt_existence == null and global_variables.number_of_rocks_in_scene < global_variables.total_number_of_rocks):
		call_deferred("add_spaceship_node")# bring the spaceship to the game

func add_spaceship_node() -> void : 
	get_parent().add_child(spaceship)


func _on_AnimatedSprite_animation_finished():
	queue_free()