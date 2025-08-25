extends Node

class_name battle_manager

#region GLOBAL VARIABLES
@export var party: Array[battle_demon]
@export var enemies: Array[battle_demon]
@export var drawing: DrawUnits
@export var BUI: battle_ui
#endregion

func _init(input_party:Array[battle_demon], input_enemies:Array[battle_demon]):
	#set parameters
	party = input_party
	enemies = input_enemies
	
	#create UI
	drawing = DrawUnits.new(party, enemies, "SIM")
	BUI = battle_ui.new(party, enemies)
	add_child(drawing)
	add_child(BUI)
	
	
