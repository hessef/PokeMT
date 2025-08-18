extends PanelContainer

class_name bslot

#region ENUMS
const mtypes = Enums.MenuType
#endregion

#region GLOBAL VARIABLES
@export var action_menu = VBoxContainer.new()
@export var skill_menu = VBoxContainer.new()
@export var skill_list: Array[skill]
@export var amhidden = true
@export var button = Button.new()
@export var parent: battle_ui = null
#endregion

func _init(unit:demon, origin):
	#set parameters
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_SHRINK_END
	parent = origin
	
	#add vertical box to hold elements
	var vbox = VBoxContainer.new()
	vbox.alignment = BoxContainer.ALIGNMENT_END
	add_child(vbox)
	
	#add label
	var label = Label.new()
	label.text = unit.disp_name
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(label)
	
	#add button to open and close action menu
	button.text = "Action Unset"
	button.pressed.connect(_pressed)
	vbox.add_child(button)
	
	#add action menu
	action_menu.alignment = BoxContainer.ALIGNMENT_END
	action_menu.hide()
	vbox.add_child(action_menu)
	
	#add skill menu
	skill_menu.alignment = BoxContainer.ALIGNMENT_END
	skill_menu.hide()
	vbox.add_child(skill_menu)
	
	#add action menu elements
	var battack = Button.new()
	battack.text = "Attack"
	action_menu.add_child(battack)
	battack.pressed.connect(_battack)
	var bskill = Button.new()
	bskill.text = "Skill"
	action_menu.add_child(bskill)
	bskill.pressed.connect(_bskill)
	var bguard = Button.new()
	bguard.text = "Guard"
	action_menu.add_child(bguard)
	bguard.pressed.connect(_bguard)

func _pressed():
	if amhidden:
		action_menu.show()
		button.hide()
		amhidden = false
	else:
		action_menu.hide()
		button.show()
		amhidden = true

func _lost_focus():
	action_menu.hide()
	skill_menu.hide()
	button.show()
	amhidden = true
	
func _battack():
	action_menu.hide()
	var text = "Attacking %s" % [parent.target.disp_name]
	button.text = text
	button.show()
	amhidden = true
	#TODO: Add logic to set actions
	
func _bskill():
	action_menu.hide()
	skill_menu.show()
	amhidden = true
	
func _bguard():
	action_menu.hide()
	var text = "Guarding"
	button.text = text
	button.show()
	amhidden = true
	#TODO: Add logic to set actions
	
func populate_menu(data:Array[skill]):
	for move in data:
		var skill_button = Button.new()
		skill_button.text = move.disp_name
		skill_menu.add_child(skill_button)
		skill_list.append(move)
