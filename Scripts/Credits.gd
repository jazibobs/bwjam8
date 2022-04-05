extends Control


func _on_BackBtn_pressed():
	get_node("/root/Game/SceneManager").change_scene(get_node("."), "res://Scenes/Title.tscn")
