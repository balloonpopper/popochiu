extends Node
# (D) Para hacer cosas con los árboles de diálogo

signal option_selected(opt)
signal dialog_requested
signal dialog_finished

var active := false

var _trees := []


# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ métodos públicos ░░░░
func show_dialog(script_name: String) -> void:
	var dialog_tree: DialogTree = E.get_dialog_tree(script_name)
	
	if dialog_tree:
		active = true
		dialog_tree.start()
		yield(D, 'dialog_finished')
		active = false
		G.done()
	else:
		yield(get_tree(), 'idle_frame')
