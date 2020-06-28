extends Node2D

onready var button := $Button
onready var anim_player := $AnimationPlayer
var flag1 := false

func _ready() -> void:
	anim_player.play("start_anim")
	pass

func _on_Button_pressed() -> void:
	if flag1 == false:
		button.text = "back"
		anim_player.play("extras")
		flag1 = true
	else:
		button.text = "extras"
		anim_player.play("back_from_extras")
		flag1 = false
