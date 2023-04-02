@tool
extends Node

func changeType(node : Node, newNode : Node) -> Node:
	node.get_parent().add_child(newNode)
	newNode.owner = node.owner
	
	# bring over properties
	for prop in node.get_property_list():
		if newNode.get(prop["name"]) != null:
			newNode.set(prop["name"], node.get(prop["name"]))
	
	# bring over children
	for child in node.get_children():
		var newChild = child.duplicate(7)
		newNode.add_child(newChild)
		newChild.owner = newNode.owner
	
	# bring filename, name, and delete old node
	var namae : String = node.name
	var filename : String = node.scene_file_path
	node.free()
	newNode.name = namae
	newNode.scene_file_path = filename
	
	return newNode
