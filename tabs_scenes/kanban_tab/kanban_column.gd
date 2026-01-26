extends Control
class_name KanbanColumn



@export_group("Nodes")
@export var column_title: LineEdit
@export var card_container: VBoxContainer

@export var add_card_button: Button

var prefab: KanbanColumnRes

func _ready() -> void:
	#Signals 
	add_card_button.pressed.connect(add_card)
	
	column_title.text = prefab.column_name
	self.load_kanban_cards()
	self.size_flags_horizontal = Control.SIZE_FILL



func load_kanban_cards():
	for card_res in prefab.cards:
		var new_card = CMM._GLOBAL_REFS.kanban_card.instantiate() as KanbanCard
		new_card.prefab = card_res
		card_container.add_child(new_card)


func add_card():
	var card = CMM._GLOBAL_REFS.kanban_card.instantiate() as KanbanCard
	card.card_res = KanbanCardRes.new()
	self.card_container.add_child(card)
