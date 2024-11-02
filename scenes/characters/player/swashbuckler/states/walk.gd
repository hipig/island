extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 60

func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	var animate_name
	var abs_x = abs(direction.x)
	var abs_y = abs(direction.y)
	if abs_x > abs_y:
		if direction.x > 0:
			animate_name = "walk_right"
			animated_sprite_2d.play(animate_name)
		else:
			animate_name = "walk_left"
			animated_sprite_2d.play(animate_name)
	elif abs_x < abs_y:
		if direction.y > 0:
			animate_name = "walk_down"
			animated_sprite_2d.play(animate_name)
		else:
			animate_name = "walk_up"
			animated_sprite_2d.play(animate_name)
				
	if direction != Vector2.ZERO:
		player.direction = direction
		#animated_sprite_2d.play(animate_name)
	
	player.velocity = direction * speed
	player.move_and_slide()	

func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")
	
func _on_exit() -> void:
	animated_sprite_2d.stop()	
