@tool
extends Node

func changeType(node : Node, newNode : Node) -> Node:
	node.get_parent().add_child(newNode)
	newNode.owner = node.get_parent()

	for prop in node.get_property_list():
		if newNode.get(prop["name"]) != null:
			newNode.set(prop["name"], node.get(prop["name"]))
			
	for child in node.get_children():
		var newChild = child.duplicate(7)
		newNode.add_child(newChild)
		newChild.owner = newNode.owner

	var namae : String = node.name
	var filename : String = node.scene_file_path
	node.queue_free()
	newNode.name = namae
	newNode.scene_file_path = node.scene_file_path
	
	return newNode
