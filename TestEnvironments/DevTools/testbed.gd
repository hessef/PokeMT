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
#endregion

func _ready():
	var bud = demon.new(Race.Jack_Frost, Debug.VERBOSE)
