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
const Aff			= Enums.affinity
const ATypes 		= Enums.ActionType
const Debug			= Enums.debug_level
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
##user's accuracy, stages of the target's evasion, user's accuracy,
##target's evasion, and the held item of the user to find the hit
##chance of the skill
func HitChance(	acc_skill:int, modifier:float, held_item:HeldItem,
				target_eva_stages:float, user_acc_stages:float,
				target_eva:float, user_acc:float):
	var micle	= 1
	if held_item == HeldItem.Micle:
		micle 	= 1.2
		
	var output = float(acc_skill) * modifier / target_eva_stages * user_acc_stages * micle * (user_acc/target_eva)
	
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
	
##calculates the damage done by an attack
func FullDamageCalc(user:battle_demon, target:battle_demon, crit:float, debug_level:=Debug.NONE): #TODO: allow for more modifiers
	#first, find the base power (100 for basic attack)
	#and determine which formula to use (default persona)
	var power = BalanceEnum.BasicAttackPower
	var formula = "Persona"
	var skill_type = user.battack #default basic attack type
	if user.action["Action"] == ATypes.Skill:
		power = user.action["Skill"].power #change power if not a basic attack
		formula = user.action["Skill"].source #only change formula if it's a skill
		skill_type = user.action["Skill"].type #change to skill type
		
	#next, calculate the base damage
	var base_damage:float = 0.0
	if formula == "Persona":
		base_damage = BaseDamageCalcPersona(power, user.Atk, target.Def, user.Atk_stages, target.Def_stages)
	else:
		base_damage = BaseDamageCalcPoke(power, user.Atk, target.Def, user.Lv, user.Atk_stages, target.Def_stages)
	
	#next, apply conditions like weather and parental bond
	#TODO: logic for these conditions
	var PB = 1 #parental bond; 1 normally, 0.25 for second hit
	var W = 1 #weather; Snow->ice*1.5,fire*0.5; Harsh sunlight->fire*1.5,ice*0.5
	var GR = 1 #glaive rush; normally 1, 2 if the user used glaive rush last turn as well as this turn
	var S = 1 #status; normally 1, but 0.5 if user is burned and using strength attack or frostbitten and using magic attack
	var G = 1 #guarding; normally 1, but 0.5 if the target is guarding
	
	#next, calculate the effect of stab
	var stab = STAB(user.inheritance, skill_type, user.ability)
	
	#next, check type relation
	var aff = 1.0
	match target.aff[skill_type]:
		Aff.Resist:
			aff = DamageMods.Resist
		Aff.Weak:
			aff = DamageMods.Weak
		Aff.Null:
			aff = 0
			
	#next, check guarding
	if target.action["Action"] == ATypes.Guard:
		G = 0.5
	
	#finally, put it all together
	var output = base_damage * PB * W * GR * crit * stab * aff * S * G
	
	#region DAMAGE CALC DEBUG
	if debug_level == Debug.INFO:
		print("Attacker: %s" % [user.nickname])
		print("Defender: %s" % [target.nickname])
		print("Calculated Damage: %d\n" % [output])
	elif debug_level == Debug.VERBOSE:
		print("-----BASE DAMAGE CALCULATION-----")
		print("Attacker: %s" % [user.nickname])
		print("Defender: %s" % [target.nickname])
		print("Attack Base Power: %d" % [power])
		print("Calculated Base Damage: %f" % [base_damage])
		print("-----DAMAGE MODIFIERS-----")
		print("Parental Bond: %f" % [PB])
		print("Weather: %f" % [W])
		print("Glaive Rush: %f" % [GR])
		print("Status: %f" % [S])
		print("Guarding: %f" % [G])
		print("STAB Multiplier: %f" % [stab])
		print("Affinity Multiplier: %f" % [aff])
		print("-----FINAL RESULT-----")
		print("Calculated Damage: %f\n" % [output])
	#endregion
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

#region CRIT CALCS
##this function calculates the base crit chance (c1) of a move
##by using the user and target's level and luck
func BaseCrit(user_lv:int, target_lv:int, user_lu:int, target_lu:int):
	var output = 3 * ((float(user_lv+10)/float(target_lv+10))+float(min(4,(float(user_lu+10)/float(target_lu+10))))**2.0)
	return output

##this function calculates the actual crit chance for the move
func FullCrit(user:battle_demon, target:battle_demon, skill_crit:float):
	#get the base crit, c1
	var c1 = BaseCrit(user.Lv, target.Lv, user.Lu, target.Lu)
	
	#get the increase from passives and traits
	var passives:float = 0 #TODO add passive effects
	var traits:float = 1 #TODO add trait effects
	
	#total calculation
	var output = ((1.0+passives) * c1 + skill_crit) * traits
	
	return output

#endregion
