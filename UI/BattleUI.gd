extends Node

class_name battle_ui

#region ENUMS
const mtypes = Enum.MenuType
#endregion

#region GLOBAL VARIABLES
var current_menu: bslot = null
@export var EnemyUI = Control.new()
@export var PartyUI = Control.new()
#endregion

func _init(party: Array[battle_demon], enemies: Array[battle_demon]):
	
		#region ENEMIES UI
	EnemyUI.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(EnemyUI)
	
	#add margin container to hold the UI
	var MC2 = MarginContainer.new()
	MC2.custom_minimum_size = Vector2(0,0)
	MC2.layout_direction = Control.LAYOUT_DIRECTION_LTR
	MC2.set_anchors_preset(Control.PRESET_TOP_WIDE)
	EnemyUI.add_child(MC2)
	
	#add horizontal box to hold information
	var EnemyDemonSlots = HBoxContainer.new()
	EnemyDemonSlots.set_anchors_preset(Control.PRESET_FULL_RECT)
	MC2.add_child(EnemyDemonSlots)
	for i in range(len(enemies)):
		var enemy_data = DemonData.new(enemies[i])
		enemy_data.sp_hbox.hide()
		enemy_data.health_data.hide()
		EnemyDemonSlots.add_child(enemy_data)
	#endregion
	
	#region PARTY UI
	#add and set up Party UI
	PartyUI.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(PartyUI)
	
	#add margin container to hold the UI
	var MC = MarginContainer.new()
	MC.custom_minimum_size = Vector2(0,0)
	MC.layout_direction = Control.LAYOUT_DIRECTION_LTR
	MC.set_anchors_preset(Control.PRESET_FULL_RECT)
	MC.anchor_right = 1
	MC.anchor_bottom = 1
	PartyUI.add_child(MC)
	
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
		slots[i].add_guys(party)
		slots[i].add_guys(enemies)
	#endregion
	
##this function allows the currently open menu to close when another is selected
func SwitchMenu(menu:bslot):
	if current_menu and current_menu != menu:
		current_menu._lost_focus()
	current_menu = menu
