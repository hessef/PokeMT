extends Node

class_name skill

#region IMPORT ENUMS
const Arcana 	= Enums.arcana
const Affinity 	= Enums.affinity
const Type 		= Enums.type
const Subtype	= Enums.skill_subtypes
const Trait 	= Traits.traits
const AOE 		= Enums.aoe
const Scaling 	= Enums.scaling
const SRange	= Enums.range
const Trigger	= Enums.trigger_condition
const Condition	= Enums.skill_conditions
const NVStatus	= Enums.non_volatile_status
const VStatus	= Enums.volatile_status
const AilChance	= BalanceEnum.ailment_chance
const Stats		= Enums.battle_stats
const Effects	= Enums.recovery_type
const Name		= Skills.skills
const OType		= Enums.ObjectType
const Debug		= Enums.debug_level
const Power		= BalanceEnum.skill_power
const CritC		= BalanceEnum.crit_chance #dict
const Inherit	= Enums.inherit
const PassEff	= Enums.passive_effects
#endregion

#region IMPORT FUNCTIONS
var AuxFunctions	:= AuxiliaryFunctions.new()
#endregion

#region PARAMETERS
@export var ID 			:= Name.Cleave
@export var disp_name	:= "Default"
@export var type 		:= Type.Slash
@export var subtype 	:= Subtype.Standard
@export var desc 		:= "NULL" #skill description to be shown to the player
@export var inheritable	:= Subtype.Standard
@export var scaling		:= Scaling.Strength
@export var priority	:= 0
#endregion

#region METHODS
	
#endregion
