extends Node

class_name action_node

#region GLOBAL VARIABLES
@export var unit: battle_demon = null #unit acting
@export var next_unit: battle_demon = null #next unit in the turn order
@export var adjusted_Spe: int #speed of the unit
@export var priority: int = 0 #priority level of the action, default 0
#endregion

func _init(tied_unit: battle_demon):
	#set parameters
	unit = tied_unit
	adjusted_Spe = int(float(unit.Spe) * unit.Spe_stages)
	#priority = unit.action["Skill"].priority
