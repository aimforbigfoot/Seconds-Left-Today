extends Node2D

export var extra_move_val := 2
export var move_val := 4
onready var main_label := $mainlabel
onready var main_label_styling := preload("res://assets/main_label.tres")
var hour_time : int
var min_time : int
var sec_time : int

func _ready() -> void:
	get_tree().get_root().set_transparent_background(true)
	ProjectSettings.set_setting("display/window/per_pixel_transparency/enabled", true)
	OS.alert("""PLEASE READ \n\n To change the settings, click on the numbers (counter) \nUse the arrow keys to move the counter around \n Use the + and - keys to change text size
	 \n click the escape key to exit \n(Other wise your text size will not be saved)", "Hey, quick user guide""")
	if SaveScript.is_file_there():
		main_label_styling.size = SaveScript.load_score()
	else:
		pass
	get_seconds_left_today()

func _on_Timer_timeout() -> void:
	get_seconds_left_today()


func get_seconds_left_today() -> void:
	hour_time = (OS.get_time().hour * 60 * 60)
	min_time = (OS.get_time().minute * 60)
	sec_time = OS.get_time().second
	var sec_in_today := (hour_time + min_time + sec_time)
	main_label.text = str(86400-sec_in_today)




func _input(event: InputEvent) -> void:
	var curr_mainlabel_text_size := main_label_styling.size
	if event.is_action_pressed("plus") and curr_mainlabel_text_size < 250:
#		extra_move_val += 5
		main_label_styling.size += 5
	if event.is_action_pressed("minus") and curr_mainlabel_text_size > 100:
#		extra_move_val -= 5
		main_label_styling.size -= 5
		
	var diff := Vector2.ZERO
	diff.x = (event.get_action_strength("right") - event.get_action_strength("left")) * extra_move_val
	diff.y = (event.get_action_strength("down") - event.get_action_strength("up")) * extra_move_val
	OS.window_position += diff * move_val
	if event.is_action_pressed("restart"):
		OS.window_position = Vector2(
		(  (OS.get_screen_size().x/2)-OS.window_size.x/2-16),
		(OS.get_screen_size().y-OS.window_size.y-9)  )
	if event.is_action_pressed("exit"):
		get_tree().quit()


func _on_MainScene_tree_exiting() -> void:
	SaveScript.save_score(main_label_styling.size)
	pass # Replace with function body.
