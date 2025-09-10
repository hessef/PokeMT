extends Node

class_name action_node

#region ENUMS
const Debug = Enums.debug_level
const Stages = BalanceEnum.stat_stages
const ATypes = Enums.ActionType
#endregion

#region GLOBAL VARIABLES
@export var unit: battle_demon = null #unit acting
@export var next_node: action_node = null #next unit in the turn order
@export var adjusted_Spe: int #speed of the unit
@export var priority: int = 0 #priority level of the action, default 0
#endregion

func _init(tied_unit: battle_demon):
	#set parameters
	unit = tied_unit
	adjusted_Spe = int(float(unit.Spe) * unit.Spe_stages)
	#priority = unit.action["Skill"].priority

##prints data for debugging
func debug(debug_level:=Debug.INFO):
	print("----------")
	if debug_level == Debug.INFO:
		print("Unit: %s" % [unit.disp_name])
		print("Adjusted Speed: %d" % [adjusted_Spe])
		print("Action Priority: %d" % [priority])
	elif debug_level == Debug.VERBOSE:
		print("Unit Name: %s" % [unit.nickname])
		print("Unit Race: %s" % [unit.disp_name])
		print("Unit Base Speed: %d" % [unit.Spe])
		print("Unit Speed Stages: %s" % [Stages.find_key(unit.Spe_stages)])
		print("Adjusted Speed: %d" % [adjusted_Spe])
		print("Action Type: %s" % [ATypes.find_key(unit.action["Action"])])
		if unit.action["Action"] == ATypes.Skill:
			print("Skill Being Used: %s" % [unit.action["Skill"].disp_name])
		elif unit.action["Action"] == ATypes.Switch:
			print("Switching To: %s" % [unit.action["Target"].nickname])
		print("Action Priority: %d" % [priority])
	print("----------\n")
