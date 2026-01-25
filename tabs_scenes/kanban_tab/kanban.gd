extends TabWindow
class_name KanbanTab

@export var debug_list: Array[KanbanColumnRes]
 
@export_group("Nodes")
@export var expandet_card: Panel
@export var column_container: HBoxContainer
@export var save_button: Button
@export var new_button: Button



func _ready() -> void:
	#Signals Start
	SignalBus.new_card.connect(new_card)
	
	save_button.pressed.connect(save_kanban_tab)
	new_button.pressed.connect(new_column)
	#Signals End
	
	load_kanban_list()
	expandet_card.visible = false
	


func load_kanban_list():
	for column_res in debug_list:
		var column = CMM._GLOBAL_REFS.kanban_card_column.instantiate() as KanbanColumn
		column.prefab = column_res
		column_container.add_child(column)


func new_column():
	var column = CMM._GLOBAL_REFS.kanban_card_column.instantiate() as KanbanColumn
	column.prefab = KanbanColumnRes.new()
	column_container.add_child(column)


func new_card(column: KanbanColumn):
	var card = CMM._GLOBAL_REFS.kanban_card.instantiate() as KanbanCard
	card.prefab = KanbanCardRes.new()
	column.card_container.add_child(card)

func new_task(_card: KanbanCard): ## WARNING: Change all "todo" to tasks
	pass

func save_kanban_tab():
	print("Save")
	pass
