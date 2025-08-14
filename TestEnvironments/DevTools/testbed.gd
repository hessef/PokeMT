extends Node

class_name testbed

#region IMPORT ENUMS
const Skill		:= Skills.skills
const OType		:= Enum.ObjectType
const Race		:= Demons.demons
const Arcana	:= Enum.arcana
const Debug		:= Enum.debug_level
const VStatus	:= Enum.volatile_status
const Type		:= Enum.type
const CritC		:= BalanceEnum.crit_chance
#endregion

#region IMPORT FUNCTIONS
var rng := RandomNumberGenerator.new()
var db := SQLite.new()
var AuxFunctions := AuxiliaryFunctions.new()
var SL_Man := save_manager.new()
#endregion

func _ready():
	var bud = demon.new(Race.Jack_Frost)
	var buddy = demon.new(Race.Jack_o_Lantern)
	bud.disp_name = "pookie"

	var test = SL_Man.SaveDmn(bud)
	if test:
		print("f")
	var loaded_guy = SL_Man.LoadDmn("pookie")
	print(loaded_guy.background)
