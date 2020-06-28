extends Node
# [ top_bullets_shoot , top_enemies_killed]
#var arr_of_scores := [0, 0]
var text_size_path := "user://textsize.dat"
var file := File.new()


func save_score(new_text_size : int):
	file.open(text_size_path, File.WRITE)
	file.store_var(new_text_size)
	file.close()
	print("saved")
	


func load_score() -> int:
	var txt_size : int
	file.open(text_size_path, File.READ)
	txt_size = file.get_var()
	file.close()
	return txt_size
	print("loadded")


func is_file_there() -> bool:
	var state : bool = false
	if file.file_exists(text_size_path):
		state = true
		print("yes, file is there")
	else:
		state = false
		print("no, file is there :(")
	return state
