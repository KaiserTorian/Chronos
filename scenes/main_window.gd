extends Control
class_name MainWindow

@export var all_tabs: Array[PackedScene]
@export var all_loadet_tabs: Array[TabWindow]

@export_group("Nodes")
@export var tab_list: VBoxContainer
@export var tab_display: Control

var current_tab: TabWindow


func _ready() -> void:
	init_tab_bar()



func init_tab_bar() -> void:
	
	# Create all Tabs
	for tab_scene in all_tabs:
		var tab = tab_scene.instantiate() as TabWindow
		
		# Tab icon currently just Text 
		var tab_icon = Label.new()
		tab_icon.text = tab.tab_icon
		tab_icon.tooltip_text = tab.tab_name
		
		tab_list.add_child(tab_icon)
		all_loadet_tabs.append(tab)
	
	# Open the first one in the list (Maybe this will change to a fixed tab)
	if not all_loadet_tabs[0] == null:
		open_tab(all_loadet_tabs[0])


func open_tab(new_tab: TabWindow):
	if not current_tab == null:
		tab_display.remove_child(current_tab)
		current_tab.queue_free()
		
	tab_display.add_child(new_tab)
	current_tab = new_tab
