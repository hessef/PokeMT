extends PanelContainer

class_name bslot

#region ENUMS
const mtypes = Enums.MenuType
const types = Enums.type
const aoes = Enums.aoe
#endregion

#region IMPORT FUNCTIONS
var AuxFunctions = AuxiliaryFunctions.new()
#endregion

#region GLOBAL VARIABLES
@export var action_menu = VBoxContainer.new()
@export var skill_menu = VBoxContainer.new()
@export var ally_menu = VBoxContainer.new()
@export var enemy_menu = VBoxContainer.new()
@export var enemy_menu_list: Array[Button]
@export var enemy_list: Array[battle_demon]
@export var amhidden = true
@export var button = Button.new()
@export var parent: battle_ui = null
@export var current_target: demon
@export var using_skill: skill
@export var using_battack = false
@export var tied_unit: battle_demon
#endregion

#TODO: Change logic to work with battle_demon class
func _init(unit:demon, origin):
	#set parameters
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_SHRINK_END
	parent = origin
	tied_unit = unit
	
	#add vertical box to hold elements
	var vbox = VBoxContainer.new()
	vbox.alignment = BoxContainer.ALIGNMENT_END
	add_child(vbox)
	
	#add label and data
	var label_data = DemonData.new(unit)
	vbox.add_child(label_data)
	
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
	
	#add ally menu
	ally_menu.alignment = BoxContainer.ALIGNMENT_END
	ally_menu.hide()
	vbox.add_child(ally_menu)
	
	#add enemy menu
	enemy_menu.alignment = BoxContainer.ALIGNMENT_END
	enemy_menu.hide()
	vbox.add_child(enemy_menu)
	
	
	#add action menu elements
	var battack = Button.new()
	battack.text = "Attack"
	action_menu.add_child(battack)
	battack.pressed.connect(_select_enemy_battack.bind(unit.battack))
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
		skill_menu.hide()
		ally_menu.hide()
		amhidden = false
	else:
		action_menu.hide()
		button.show()
		amhidden = true

func _lost_focus():
	action_menu.hide()
	skill_menu.hide()
	ally_menu.hide()
	enemy_menu.hide()
	button.show()
	amhidden = true
	
func _battack():
	action_menu.hide()
	var text = "Attacking %s" % [current_target.nickname]
	button.text = text
	button.show()
	amhidden = true
	#TODO: Add logic to set actions
	
func _bskill():
	action_menu.hide()
	skill_menu.show()
	amhidden = true
	
func _skill_used(used_skill: skill):
	skill_menu.hide()
	ally_menu.hide
			
	var text = "Using %s on %s" % [used_skill.disp_name, current_target.nickname]
	button.text = text
	button.show()
	amhidden = true
	#TODO: Add logic to set actions
	
func _select_ally(used_skill:skill):
	skill_menu.hide()
	ally_menu.show()
	using_skill = used_skill
	
func _ally_selected(ally:demon):
	ally_menu.hide()
	current_target = ally
	_skill_used(using_skill)
	
func _select_enemy(used_skill:skill):
	skill_menu.hide()
	enemy_menu.show()
	#add affinity info to each enemy
	for i in range(len(enemy_list)):
		#set icon as needed
		var icon = AuxFunctions.GetAffinityIcon(used_skill.type, enemy_list[i])
		enemy_menu_list[i].icon = icon
	using_skill = used_skill
	using_battack = false
	
func _select_enemy_battack(battack_type:types):
	action_menu.hide()
	amhidden = true
	enemy_menu.show()
	#add affinity info to each enemy
	for i in range(len(enemy_list)):
		#set icon as needed
		var icon = AuxFunctions.GetAffinityIcon(battack_type, enemy_list[i])
		enemy_menu_list[i].icon = icon
	using_battack = true
	
func _enemy_selected(enemy:demon):
	enemy_menu.hide()
	current_target = enemy
	if not using_battack:
		_skill_used(using_skill)
	else:
		_battack()
	
func _back_to_skills():
	ally_menu.hide()
	enemy_menu.hide()
	if using_battack:
		action_menu.show()
		amhidden = false
	else:
		skill_menu.show()
	
func _bguard():
	action_menu.hide()
	var text = "Guarding"
	button.text = text
	button.show()
	amhidden = true
	#TODO: Add logic to set actions
	
func populate_menu(data:Array[skill]):
	for move in data:
		#make sure it's not a passive
		if move.type != types.Passive:
			#create button
			var skill_button = Button.new()
			
			#load icon texture
			if move.type in [types.Buff, types.Debuff, types.Shield, types.Negate, types.Utility]:
				skill_button.icon = load("res://UI/Assets/Elements/Support.png")
			else:
				skill_button.icon = load("res://UI/Assets/Elements/%s.png" % [types.keys()[move.type]])
			#add skill name and cost
			var text = move.disp_name
			if move.scaling == move.Scaling.Strength:
				text = "%s    %d HP" % [move.disp_name, move.cost * 0.01 * tied_unit.MHP]
			elif move.scaling == move.Scaling.Magic:
				text = "%s    %d SP" % [move.disp_name, move.cost]
			skill_button.text = text
			skill_button.alignment = HORIZONTAL_ALIGNMENT_RIGHT
			
			#add skill description
			skill_button.tooltip_text = move.desc
			
			#check if enemy or ally target
			if (move.type == types.Recovery) or (move.type == types.Buff) or (move.type == types.Shield) or (move.type == types.Utility):
				#link button press to open selection menu
				skill_button.pressed.connect(_select_ally.bind(move))
			else:
				#link button press to function
				skill_button.pressed.connect(_select_enemy.bind(move))
			
			#add elements
			skill_menu.add_child(skill_button)
		
	#add button to go back
	var back_button = Button.new()
	back_button.text = "Back"
	back_button.pressed.connect(_pressed)
	skill_menu.add_child(back_button)

func add_guys(data:Array[battle_demon]):
	if data[0].team == data[0].Teams.Player:
		for guy in data:
			#create button for each ally
			var unit_button = Button.new()
			unit_button.text = guy.nickname
			
			#link button
			unit_button.pressed.connect(_ally_selected.bind(guy))
			ally_menu.add_child(unit_button)
		
		#add button to go back
		var back_button = Button.new()
		back_button.text = "Back"
		back_button.pressed.connect(_back_to_skills)
		ally_menu.add_child(back_button)
	else:
		for guy in data:
			#create button for each ally
			var unit_button = Button.new()
			unit_button.text = guy.nickname
			
			#link button
			unit_button.pressed.connect(_enemy_selected.bind(guy))
			enemy_menu.add_child(unit_button)
			enemy_menu_list.append(unit_button)
			enemy_list.append(guy)
		
		#add button to go back
		var back_button = Button.new()
		back_button.text = "Back"
		back_button.pressed.connect(_back_to_skills)
		enemy_menu.add_child(back_button)
