extends "res://Scripts/Worlds/WorldTemplate.gd"

func _ready():
	WorldCamera.set_camera_limits($GridLimits)

func _on_Player_win():
	Global.set_transition(3)
	Global.goto_scene(next_level)


func _on_TeleportTrigger_body_entered(body):
	if body.is_in_group("Player"):
		pass
