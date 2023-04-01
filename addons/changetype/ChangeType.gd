@tool
extends EditorPlugin

var nodes : Array = []
var options : Control = null

func _input(event):
	if Input.is_key_pressed(KEY_F7):
		if nodes.size() == 0:
			nodes = get_editor_interface().get_selection().get_selected_nodes()
		if options == null:
			options = load("res://Menu/Options.tscn").instantiate()
			add_child(options)
			options.get_node("CenterContainer/OptionButton").connect("item_selected", selectType, CONNECT_DEFERRED)

func selectType(index : int):
	if options == null:
		printerr("options is null in ", name)
		return
	if nodes.size() == 0:
		return
	
	for node in nodes:
		match index:
			0: # CharacterBody3D
				print("Change ", node, " to CharacterBody3D -- ", index)
			1: # RigidBody3D
				print("Change ", node, " to RigidBody3D -- ", index)
			_: # Cancel
				print("Cancelled change type with: ", index)
	
	nodes.clear()
	options.free()
	options = null

func _enter_tree():
	# Initialization of the plugin goes here.
	pass

func _exit_tree():
	# Clean-up of the plugin goes here.
	pass
