extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var tool_animate_name: String

func _on_enter() -> void:
	var animate_direction = "down"
	match player.direction:
		Vector2.UP:
			animate_direction = "up"
		Vector2.DOWN:
			animate_direction = "down"
		Vector2.LEFT:
			animate_direction = "left"
		Vector2.RIGHT:
			animate_direction = "right"
	animated_sprite_2d.play(tool_animate_name + "_" + animate_direction)	


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_exit() -> void:
	animated_sprite_2d.stop()	
