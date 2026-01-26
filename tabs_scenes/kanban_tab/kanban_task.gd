extends Control
class_name KanbanTask


@export var text: String
@export var status: bool

@export_group("Nodes")
@export var text_box: LineEdit
@export var check_box: CheckBox

var prefab: KanbanTaskRes

func _ready() -> void:
	self.text_box.text = self.text
	self.check_box.button_pressed = self.status
 
