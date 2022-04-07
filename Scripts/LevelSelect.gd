extends Control


func _on_Level1Btn_pressed():
	get_node("/root/Game/SceneManager").change_scene(get_node("."), "res://Scenes/Movement1.tscn")

