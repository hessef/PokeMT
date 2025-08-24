extends Node

class_name BalanceEnum

#region Constants for All
const BasicAttackPower = 100
#endregion

#region Ailment Chances
##These are the chances for ailments to be inflicted
##as percentages
const ailment_chance = {
	"Default": 0,
	"Low20": 0.2,
	"Low24": 0.24,
	"Low25": 0.25,
	"Low26": 0.26,
	"Low30": 0.3,
	"Medium35": 0.35,
	"Medium40": 0.4,
	"Medium50": 0.5,
	"Medium55": 0.55,
	"High60": 0.6,
	"High70": 0.7,
	"High90": 0.9,
	"Guaranteed": 1
}
#endregion

#region Crit Chances
const crit_chance = {
	"DefaultP5": 5,
	"DefaultPokemon": 4.17,
	"Base10": 10,
	"Base20": 20,
	"Base25": 25,
	"Base30": 30,
	"Base35": 35,
	"Base40": 40,
	"Base45": 45,
	"Base50": 50
}
#endregion

#region Accuracy Modifiers
const accuracy_modifiers = {
	"Normal": 1,
	
}
#endregion

#region Stages
const stat_stages = {
	"Minus6": float(2)/8,
	"Minus5": float(2)/7,
	"Minus4": float(2)/6,
	"Minus3": float(2)/5,
	"Minus2": float(2)/4,
	"Minus1": float(2)/3,
	"Normal": 1,
	"Plus1": float(3)/2,
	"Plus2": float(4)/2,
	"Plus3": float(5)/2,
	"Plus4": float(6)/2,
	"Plus5": float(7)/2,
	"Plus6": float(8)/2
}
#endregion

#region Damage Multipliers
const damage_mult = {
	"Null": 0,
	"None": 1,
	"Weak": 1.25,
	"Crit": 1.5,
	"Technical": 1.8,
	"Resist": 0.5,
	"STAB": 1.5,
	"ISTAB": 0.5,
	"ADAPTSTAB": 2
}
#endregion

#region SKILL POWER
enum skill_power{
	Default			= 0,
	Miniscule15		= 15,
	Miniscule20		= 20,
	Miniscule25		= 25,
	Light30			= 30,
	Light40			= 40,
	Light50			= 50,
	Light60			= 60,
	Light65			= 65,
	Light70			= 70,
	Medium80		= 80,
	Medium90		= 90,
	Medium100		= 100,
	Medium110		= 110,
	Heavy120		= 120,
	Heavy130		= 130,
	Heavy140		= 140,
	Heavy150		= 150,
	Heavy160		= 160,
	Severe180		= 180,
	Severe190		= 190,
	Severe210		= 210,
	Severe220		= 220,
	Severe300		= 300,
	Colossal350		= 350,
	Colossal360		= 360,
	Colossal600		= 600,
	Colossal800		= 800,
	Colossal1200	= 1200
}
#endregion
