extends Control

class_name battle_ui

#region ENUMS
const mtypes = Enum.MenuType
#endregion

#region GLOBAL VARIABLES
var current_menu: bslot = null
@export var target: demon = null
#endregion

func _init(party: Array[demon], enemies: Array[demon]):
	#set parameters
	set_anchors_preset(Control.PRESET_FULL_RECT)
	target = enemies[0]
	
	var UI = Control.new()
	UI.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(UI)
	
	#add margin container to hold the UI
	var MC = MarginContainer.new()
	MC.custom_minimum_size = Vector2(0,0)
	MC.layout_direction = Control.LAYOUT_DIRECTION_LTR
	MC.set_anchors_preset(Control.PRESET_FULL_RECT)
	MC.anchor_right = 1
	MC.anchor_bottom = 1
	UI.add_child(MC)
	
	#add horizontal box to hold submenus
	var PlayerDemonSlots = HBoxContainer.new()
	MC.add_child(PlayerDemonSlots)
	
	var slots: Array[bslot]
	for i in range(min(4, party.size())):
		slots.append(bslot.new(party[i], self))
		PlayerDemonSlots.add_child(slots[i])
		
		#bind button press to SwitchMenu
		slots[i].button.pressed.connect(Callable(self, "SwitchMenu").bind(slots[i]))
		#populate menus
		slots[i].populate_menu(party[i].move_pool)

##this function allows the currently open menu to close when another is selected
func SwitchMenu(menu:bslot):
	if current_menu and current_menu != menu:
		current_menu._lost_focus()
	current_menu = menu
