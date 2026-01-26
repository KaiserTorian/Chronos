@tool
extends EditorPlugin

const CM_MANAGER_NAME = "CmManager"
const CM_MANAGER_PATH = "res://addons/ui_utils/context_menu/cm_manager.gd"


func _enable_plugin() -> void:
	# AUTOLOAD
	if not ProjectSettings.has_setting("autoload/" + CM_MANAGER_NAME):
		add_autoload_singleton(CM_MANAGER_NAME,CM_MANAGER_PATH)


func _disable_plugin() -> void:
	# AUTOLOADS
	if ProjectSettings.has_setting("autoload/" + CM_MANAGER_NAME):
		remove_autoload_singleton(CM_MANAGER_NAME)


func _enter_tree() -> void:
	pass
	

func _exit_tree() -> void:
	pass
