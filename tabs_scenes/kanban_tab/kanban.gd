extends TabWindow
class_name KanbanTab

@export var debug_list: Array[KanbanColumnRes]

@export_group("Nodes")
@export var expandet_card: Panel
@export var spaces_container: TabContainer
@export var add_space_tab: Control
@export var save_button: Button
@export var new_button: Button

var current_space: KanbanSpace


func _ready() -> void:
	#Signals Start
	spaces_container.tab_clicked.connect(change_space)
	save_button.pressed.connect(save_kanban_tab)
	new_button.pressed.connect(new_column)
	#Signals End
	
	#load_kanban_list()
	expandet_card.visible = false


func change_space(index: int):
	var space = self.spaces_container.get_child(index)
	
	if space == self.add_space_tab:
		space = new_space()
		self.spaces_container.current_tab = space.get_index()
		
	self.current_space = space
	

func new_space() -> KanbanSpace:
	var space = CMM._GLOBAL_REFS.kanban_space.instantiate() as KanbanSpace
	space.space_res = KanbanSpaceRes.new()
	spaces_container.add_child(space)
	self.spaces_container.move_child(add_space_tab, self.spaces_container.get_child_count(false) - 1)
	return space


func new_column():
	if self.current_space == null: 
		return
	
	self.current_space.new_column()



func save_kanban_tab():
	pass
