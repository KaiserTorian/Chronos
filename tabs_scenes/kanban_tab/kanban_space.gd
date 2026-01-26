extends MarginContainer
class_name KanbanSpace

@export var space_res = KanbanSpaceRes
@export_group("Nodes")
@export var column_container: HBoxContainer


func _ready() -> void:
	self.name = self.space_res.space_name


func new_column():
	var column = CMM._GLOBAL_REFS.kanban_column.instantiate() as KanbanColumn
	column.prefab = KanbanColumnRes.new()
	self.column_container.add_child(column)
