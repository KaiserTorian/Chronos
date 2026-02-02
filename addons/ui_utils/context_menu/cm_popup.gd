extends MarginContainer
class_name ContextMenuPopup


func _init(cm_frame:ContextMenuFrame) -> void:
	
	pass


func _ready() -> void:
	print("ready")
	
	self.global_position = get_viewport().get_mouse_position()
