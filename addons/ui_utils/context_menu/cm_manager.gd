extends Control
class_name ContextMenuHandler

const CM_POPUP = preload("uid://c22w7o44a1kae")

var all_context_areas: Array[ContextMenuFrame]
var current_control: ContextMenuFrame

var current_context_menu: ContextMenuPopup
func _process(delta):
	pass
	

func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("cm_rmb"):
		return
		
	var cm_area = _get_top_control_area()
	if cm_area == null:
		close_context_menu()
		return

	open_context_menu(cm_area)



func open_context_menu(cm_area: ContextMenuFrame) -> void:
	if not self.current_context_menu == null:
		close_context_menu()
		
	var cm_popup := CM_POPUP.instantiate()
	cm_area.add_child(cm_popup)
	self.current_context_menu = cm_popup



func close_context_menu() -> void:
	if current_context_menu == null:
		return
	self.current_context_menu.get_parent().remove_child(self.current_context_menu)
	self.current_context_menu.queue_free()
	current_context_menu = null



# Get the top most (self assignt) ContextMenuFrame 
func _get_top_control_area():
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	var found_areas: Array[ContextMenuFrame] = []
	
	for i in all_context_areas:
		var rect: Rect2 = Rect2(i.global_position,i.size)
		
		if not rect.has_point(mouse_pos):
			continue
			
		if not _is_visible_on_screen(i):
			continue
		
		found_areas.append(i)
		
	if found_areas.size() == 0:
		return null
		
	found_areas.sort_custom(_sort_areas)
	return found_areas[0]


# why a random func down there?
func _sort_areas(a:ContextMenuFrame,b:ContextMenuFrame):
	return a.layer > b.layer


# a very scuffed way to find out if the node is visile, but ok.
func _is_visible_on_screen(context_area: ContextMenuFrame) -> bool:
	var node: Node = context_area
	
	while not node.get_parent() == null:
		if not node.visible == true:
			return false
			
		node = node.get_parent()
		
	return true
	
