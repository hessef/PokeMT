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
const Teams		:= Enum.Team
#endregion

#region IMPORT FUNCTIONS
var rng := RandomNumberGenerator.new()
var db := SQLite.new()
var AuxFunctions := AuxiliaryFunctions.new()
var SL_Man := save_manager.new()
#endregion

func _ready():
	var d1 = battle_demon.new(party_demon.new(null, Race.Izanagi))
	var d2 = battle_demon.new(party_demon.new(null, Race.Captain_Kidd))
	var d3 = battle_demon.new(party_demon.new(null, Race.Jack_o_Lantern))
	var d4 = battle_demon.new(party_demon.new(null, Race.Jack_Frost))
	var d5 = battle_demon.new(party_demon.new(null, Race.Io))
	var d6 = battle_demon.new(party_demon.new(null, Race.Pixie))
	d1.team = Teams.Player
	d2.team = Teams.Player
	d3.team = Teams.Player
	d4.team = Teams.Player
	
	var party: Array[battle_demon] = [d1,d2,d3,d4]
	var enemies: Array[battle_demon] = [d5,d6]
	var battle = battle_manager.new(party, enemies)
	add_child(battle)

func _button_pressed():
	print("TEST")
