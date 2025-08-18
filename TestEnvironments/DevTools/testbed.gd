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
	var d1 = party_demon.new(null, Race.Arsene)
	var d2 = party_demon.new(null, Race.Zorro)
	var d3 = party_demon.new(null, Race.Jack_o_Lantern)
	var d4 = party_demon.new(null, Race.Jack_Frost)
	var d5 = party_demon.new(null, Race.Io)
	
	var party: Array[demon] = [d1,d2,d3,d4]
	var BUI = battle_ui.new(party, [d5])
	add_child(BUI)

func _button_pressed():
	print("TEST")
