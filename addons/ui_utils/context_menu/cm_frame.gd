extends Control
class_name ContextMenuFrame

@export var layer: int = 1

func _enter_tree() -> void:
	CmManager.all_context_areas.append(self)

func on_click():
	print('Test')
	pass
