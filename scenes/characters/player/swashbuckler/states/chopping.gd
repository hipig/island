extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_enter() -> void:
	var animate_name = "chopping_down"
	match player.direction:
		Vector2.UP:
			animate_name = "chopping_up"
		Vector2.DOWN:
			animate_name = "chopping_down"
		Vector2.LEFT:
			animate_name = "chopping_left"
		Vector2.RIGHT:
			animate_name = "chopping_right"
	animated_sprite_2d.play(animate_name)	


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_exit() -> void:
	animated_sprite_2d.stop()	
