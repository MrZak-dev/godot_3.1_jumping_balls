extends Node


onready var view_port = get_viewport()
var root
func _ready():
	view_port.connect("size_changed",self,"size_changed")
	root = get_node("/root/Walls/Balls/Ball/Sprite")
	pass # Replace with function body.


func size_changed():
	var window_size = OS.get_window_size()
	print("window changed : ")
	print (window_size.x)
	pass
