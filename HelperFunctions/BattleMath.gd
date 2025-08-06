extends Node

class_name battle_math

#region SET UP ENUMS
const AilChance 	= BalanceEnum.ailment_chance #actually a dict
const CritChance	= BalanceEnum.crit_chance #actually a dict
const AccModifier	= BalanceEnum.accuracy_modifiers
const StatStage		= BalanceEnum.stat_stages #actually a dict
const HeldItem		= Items.held_items
const DamageMods	= BalanceEnum.damage_mult #actually a dict
const Elements		= Enums.type
const Abilities		= Traits.traits
const Relate		= Enums.relation
#endregion

#region IMPORT CLASSES
var AuxFunctions	= AuxiliaryFunctions.new()
#endregion

##This function takes a demon's Luck (Lu) and Agility (Ag) stats
##in order to find the baseline accuracy and evasion
func GenerateAccEva(base_ag:int, bonus_ag:int, base_lu:int, bonus_lu:int):
	var acc_eva = 3*(base_ag+bonus_ag) + (base_lu+bonus_lu) + 20
	return acc_eva
	
##This function takes the accuracy of a skill, the stages of the
##user's accuracy, stages of the target's evasion, and the held
##item of the user to find the hit chance of the skill
func HitChance(	acc_skill:int, modifier:float, held_item:HeldItem,
				target_eva_stages:float, user_acc_stages:float):
	var micle	= 1
	if held_item == HeldItem.Micle:
		micle 	= 1.2
		
	var output = acc_skill * modifier * target_eva_stages * user_acc_stages * micle
	
	return output
#region damage calculations
##base damage calculation for pokemon skills
func BaseDamageCalcPoke(power:int, atk:int, def:int, user_lv:int,
					target_def_stages:float, user_atk_stages:float):
	
	var base = ((float(2*user_lv)/5)+2)*power*((atk*user_atk_stages)/(def*target_def_stages))+2
	var rand = RandomNumberGenerator.new().randf_range(0.85, 1)
	var output = base * rand
	
	return output
	
##base damage calculation for persona skills
func BaseDamageCalcPersona(	power:int, atk:int, def:int,
							target_def_stages:float, user_atk_stages:float):
	
	var base = ((sqrt(power)*sqrt(atk)*user_atk_stages)/(sqrt(def*8)*target_def_stages))
	var rand = RandomNumberGenerator.new().randf_range(0.95, 1.05)
	var output = base * rand
	
	return output
	

##compares user inheritance type and skill type
##matching: STAB, opposite: ISTAB, matching and adaptibility: ADAPTSTAB, else None
func STAB(	user_inheritance:Elements, skill_type:Elements, user_trait:Abilities):
	##STAB in effect
	match AuxFunctions.TypeRelation(user_inheritance, skill_type):
		Relate.Match:
			if user_trait == Abilities.Adaptability:
				return DamageMods["ADAPTSTAB"]
			else:
				return DamageMods["STAB"]
		Relate.Oppose:
			return DamageMods["ISTAB"]
		Relate.Neutral:
			return DamageMods["None"]
				
#endregion
##this function calculates the base crit chance (c1) of a move
##by using the user and target's level and luck
func BaseCrit(user_lv:int, target_lv:int, user_lu, target_lu):
	var output = 3 * ((float(user_lv+10)/(target_lv+10))+(min(4,((user_lu+10)/(target_lu+10))))^2)
	return output
