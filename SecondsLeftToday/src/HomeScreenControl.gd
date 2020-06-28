extends Control


func _on_start_button_pressed() -> void:
	get_tree().get_root().set_transparent_background(true)
	OS.window_size = Vector2(256,144)
	OS.window_position = Vector2(
		(  (OS.get_screen_size().x/2)-OS.window_size.x/2-16),
	 (OS.get_screen_size().y-OS.window_size.y-9)  )
	get_tree().change_scene("res://src/mainScene/MainScene.tscn")
	OS.set_window_always_on_top(true)
