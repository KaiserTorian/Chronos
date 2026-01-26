extends Control
class_name ContextMenuHandler

var all_context_areas: Array[ContextMenuFrame]
var current_control: ContextMenuFrame

func _process(delta):
	pass
	

func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("cm_rmb"):
		return
		
	var cm_area = get_top_control_area()
	if cm_area == null:
		return
	
	# Init context menu
	
	
func get_top_control_area():
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	var found_areas: Array[ContextMenuFrame] = []
	
	for i in all_context_areas:
		var rect: Rect2 = Rect2(i.global_position,i.size)
		
		if not rect.has_point(mouse_pos):
			continue
			
		if not is_visible_on_screen(i):
			continue
		
		found_areas.append(i)
		
	found_areas.sort_custom(_sort_areas)
	#DEBUG
	found_areas[0].get_child(0).visible = !found_areas[0].get_child(0).visible
	return found_areas[0]


# why a random func down there?
func _sort_areas(a:ContextMenuFrame,b:ContextMenuFrame):
	return a.layer > b.layer


# a very scuffed way to find out if the node is visile, but ok.
func is_visible_on_screen(cont_area: ContextMenuFrame) -> bool:
	var node: Node = cont_area
	
	while not node.get_parent() == null:
		if not node.visible == true:
			return false
			
		node = node.get_parent()
		
	return true
	
