extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_physics_process(_delta : float) -> void:
	var animate_name = "idle_down"
	match player.direction:
		Vector2.UP:
			animate_name = "idle_up"
		Vector2.DOWN:
			animate_name = "idle_down"
		Vector2.LEFT:
			animate_name = "idle_left"
		Vector2.RIGHT:
			animate_name = "idle_right"
	animated_sprite_2d.play(animate_name)					

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
		
	if GameInputEvents.use_tool():
		if player.current_tool == DataTypes.Tools.AxeWood:
			transition.emit("Chopping")
		if player.current_tool == DataTypes.Tools.TillGround:
			transition.emit("Tilling")
	
func _on_exit() -> void:
	animated_sprite_2d.stop()	
