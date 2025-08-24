extends PanelContainer

class_name DemonData

#region GLOBAL VARIABLES
@export var vbox = VBoxContainer.new()
@export var label = Label.new()
@export var health_bar = ProgressBar.new()
@export var sp_bar = ProgressBar.new()
#endregion
	
func _init(unit:battle_demon):
	#add vertical box to hold elements
	vbox.alignment = BoxContainer.ALIGNMENT_END
	add_child(vbox)
	
	#add label
	label.text = unit.disp_name
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(label)

	#add HP
	health_bar.fill_mode = health_bar.FILL_BEGIN_TO_END
	#health_bar.show_percentage = false
	health_bar.add_theme_stylebox_override("fill", StyleBoxFlat.new())
	health_bar.get_theme_stylebox("fill").set("bg_color", Color("#7eab1e"))
	health_bar.max_value = unit.MHP
	health_bar.step = 1
	health_bar.value = 50
	vbox.add_child(health_bar)
