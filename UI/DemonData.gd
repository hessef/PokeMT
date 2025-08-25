extends PanelContainer

class_name DemonData

#region GLOBAL VARIABLES
@export var vbox = VBoxContainer.new()
@export var label = Label.new()
@export var health_bar = ProgressBar.new()
@export var health_data = Label.new()
@export var health_hbox = HBoxContainer.new()
@export var hp_label = Label.new()
@export var sp_bar = ProgressBar.new()
@export var sp_data = Label.new()
@export var sp_hbox = HBoxContainer.new()
@export var tied_unit: battle_demon
#endregion
	
func _init(unit:battle_demon):
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_SHRINK_END
	tied_unit = unit
	tied_unit.ui_data = self
	
	#add vertical box to hold elements
	vbox.alignment = BoxContainer.ALIGNMENT_END
	add_child(vbox)
	
	#add label
	label.text = unit.disp_name
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(label)

	#region HP BAR
	#create container and label
	health_hbox.set_anchors_preset(PRESET_FULL_RECT)
	hp_label.text = "HP"
	health_hbox.add_child(hp_label)
	
	#create bar
	health_bar.fill_mode = health_bar.FILL_BEGIN_TO_END
	health_bar.show_percentage = false
	health_bar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	health_bar.size_flags_vertical = Control.SIZE_EXPAND_FILL
	health_bar.add_theme_stylebox_override("fill", StyleBoxFlat.new()) #stylebox needed for color
	health_bar.get_theme_stylebox("fill").set("bg_color", Color("#4CBB17"))
	health_bar.max_value = unit.MHP
	health_bar.step = 1
	health_bar.value = unit.HP
	health_hbox.add_child(health_bar)
	
	#create text readout for data
	health_data.text = "%d/%d" % [unit.HP, unit.MHP]
	health_data.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	health_hbox.add_child(health_data)
	vbox.add_child(health_hbox)
	#endregion
	
	#region SP BAR
	#create container and label
	sp_hbox.set_anchors_preset(PRESET_FULL_RECT)
	var sp_label = Label.new()
	sp_label.text = "SP"
	sp_hbox.add_child(sp_label)
	
	#create bar
	sp_bar.fill_mode = sp_bar.FILL_BEGIN_TO_END
	sp_bar.show_percentage = false
	sp_bar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sp_bar.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sp_bar.add_theme_stylebox_override("fill", StyleBoxFlat.new()) #stylebox needed for color
	sp_bar.get_theme_stylebox("fill").set("bg_color", Color("#C229C2"))
	sp_bar.max_value = unit.MSP
	sp_bar.step = 1
	sp_bar.value = unit.SP
	sp_hbox.add_child(sp_bar)
	
	#create text readout for data
	sp_data.text = "%d/%d" % [unit.SP, unit.MSP]
	sp_data.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	sp_hbox.add_child(sp_data)
	vbox.add_child(sp_hbox)
	#endregion

func update_hp(new_hp:int):
	#sets health bar fill
	health_bar.value = new_hp
	#sets data readout
	health_data.text = "%d/%d" % [new_hp, tied_unit.MHP]

func update_sp(new_sp:int):
	#sets sp bar fill
	sp_bar.value = new_sp
	#sets data readout
	sp_data.text = "%d/%d" % [new_sp, tied_unit.MSP]
