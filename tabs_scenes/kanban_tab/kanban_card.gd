extends MarginContainer
class_name KanbanCard



@export_group("Nodes")
@export var card_title: LineEdit
@export var new_task_button: Button
@export var collapse_button: Button
@export var list_panel: MarginContainer
@export var task_container: VBoxContainer

var card_res: KanbanCardRes
var collapsed: bool = false


func _ready() -> void:
	# Signals
	collapse_button.pressed.connect(collapse_toggle)
	new_task_button.pressed.connect(add_task)
	self.card_title.text = card_res.card_title
	load_tasks()


func add_task(task_res: KanbanTaskRes = null):
	var task = CMM._GLOBAL_REFS.kanban_task.instantiate() as KanbanTask
	if task_res == null:
		task_res= KanbanTaskRes.new()
	
	task.prefab = task_res
	task_container.add_child(task)


func collapse_toggle():
	if collapsed:
		collapsed = false
		self.list_panel.visible = true
		self.collapse_button.text = "↑"
	else:
		collapsed = true
		self.list_panel.visible = false
		self.collapse_button.text = "↓"


func load_tasks():
	for task in card_res.tasks:
		var new_label = Label.new()
		new_label.text = task
		self.task_container.add_child(new_label)
