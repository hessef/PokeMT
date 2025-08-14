extends Node

class_name demon

#region IMPORT ENUMS
const Arcana 	:= Enums.arcana
const Affinity 	:= Enums.affinity
const Type 		:= Enums.type
const Trait 	:= Traits.traits
const Race		:= Demons.demons
const Skill		:= Skills.skills
const BAttPwr	:= Balance.BasicAttackPower
const Debug		:= Enum.debug_level
const Mobility	:= Enum.mobility
const OType		:= Enum.ObjectType
const NVStatus	:= Enum.non_volatile_status
#endregion

#region IMPORT FUNCTIONS
var AuxFunctions	:= AuxiliaryFunctions.new()
#endregion

#region PROPERTIES
#region default values constants
@export var ID			:= Race.Arsene
@export var UID			:= 12345
@export var disp_name	:= "Default"
@export var fake_ID		:= "Default"
@export var nickname	:= ""
@export var arcana		:= Arcana.Fool
@export var background	:= "NULL"
@export var evolve		:= Race.Arsene
@export var battack		:= Type.Slash
@export var mobility	:= Mobility.Legged
@export var item		:= Items.held_items.NONE
@export var status 		:= NVStatus.None
#endregion

#-----STAT DATA-----
#stats cannot exceed 99 outside of battle (except HP and SP, which max out at 9999)
#individual stat value = Innate + Bonus (not exceeding cap)
#stat total is roughly equal to (Lv*3)+7

#region Persistent Innate Stat Totals

#persistent stat variables (floats, max 99 except MHP and MSP which are max 9999)
##strength; physical attack power
@export var St:		int
##magic; magical attack power
@export var Ma:		int
##endurance; defensive stats
@export var En:		int
##agility; speed, accuracy, and evasion
@export var Ag:		int
##Luck; crit chance, ailment infliction chance, evasion
@export var Lu:		int
##max health
@export var MHP:	int
##max skill points
@export var MSP:	int
##the demon's level
@export var Lv:		int
##the demon's current exp (reset every level)
@export var Exp:	int
##the demon's current HP
@export var HP := 0
##the demon's current SP
@export var SP := 0
#endregion

#region Persistent Bonus Stat Totals

#persistent bonus stat variables (integers, bonuses from items, events, equipment, etc.)
##strength; physical attack power
@export var bSt:=	0
##magic; magical attack power
@export var bMa:=	0
##endurance; defensive stats
@export var bEn:=	0
##agility; speed, accuracy, and evasion
@export var bAg:=	0
##Luck; crit chance, ailment infliction chance, evasion
@export var bLu:=	0
##max health
@export var bMHP:=	0
##max skill points
@export var bMSP:=	0
#endregion

#region Stat Distribution
#ratio stat constants
##ratio of stats allocated to strength
@export var rSt:	float
##ratio of stats allocated to magic
@export var rMa:	float
##ratio of stats allocated to endurance
@export var rEn:	float
##ratio of stats allocated to agility
@export var rAg:	float
##ratio of stats allocated to luck
@export var rLu:	float
#endregion

#region Affinities
##base elemental affinities
@export var aff := [Affinity.Neutral,
					Affinity.Neutral,
					Affinity.Neutral,
					Affinity.Neutral,
					Affinity.Neutral,
					Affinity.Neutral,
					Affinity.Neutral,
					Affinity.Neutral,
					Affinity.Neutral,
					Affinity.Neutral,
					Affinity.Neutral,
			]

##inheritance type
@export var inheritance: Type
#endregion

#-----SKILLS AND ABILITY-----
#each demon can learn a max of 8 skills
#each demon has a passive ability
#skills and abilities can be transferred via fusion with only a few exceptions
#region Move Set
##maximum of 12 skills; 8 normal plus a maximum of 4 more from items or traits
@export var move_pool: Array[skill]

##learnset is array of size 100, with skills learned at a particular
##level placed at that index
@export var learnset : Array[Skill]

##the ability the demon has
@export var ability:	Trait #TODO: Change to trait class once trait constructor is done
#endregion
#endregion

#region METHODS
func _init(race:Race, debug:=Debug.NONE):
	#get the data from the database
	var data = AuxFunctions.GetData(OType.Demon, race)
	
	learnset.resize(100)
	if debug != Debug.NONE:
		print("=====ASSIGNING BASIC DETAILS=====")
	
	ID 			= Race[data["id"]]
	disp_name	= data["name"]
	fake_ID		= data["fakename"]
	arcana		= Arcana[data["arcana"]]
	background	= data["background"]
	evolve		= Race[data["evolve"]]
	inheritance	= Type[data["inheritance"]]

	if debug == Debug.VERBOSE:
		print("ID: %s\nDisplay Name: %s\nFake Name: %s" % [Race.keys()[ID], disp_name, fake_ID])
		print("Arana: %s\nBackground: %s" % [Arcana.keys()[arcana], background])
		if evolve == Race.Arsene:
			print("Does not evolve")
		else:
			print("Evolves into: %s" % [Race.keys()[evolve]])
		print("Inheritance Type: %s" % [Type.keys()[inheritance]])
	
	if debug != Debug.NONE:
		print("=====ASSIGNING BASE STATS=====")
		
	St			= int(data["st"])
	Ma			= int(data["ma"])
	En			= int(data["en"])
	Ag			= int(data["ag"])
	Lu			= int(data["lu"])
	Lv			= int(data["level"])
	MHP			= int(data["hp"])+(6*Lv)+(6*En) #MHP increases by 6 for each level and point of En
	MSP			= int(data["sp"])+(3*Lv)+(3*Ma) #MSP increases by 3 for each level and point of Ma
	
	if debug == Debug.VERBOSE:
		print("St: %d\nMa: %d\nEn: %d\nAg: %d" % [St, Ma, En, Ag])
		print("Lu: %d\nMHP: %d\nMSP: %d\nLv: %d" % [Lu, MHP, MSP, Lv])
		
	if debug != Debug.NONE:
		print("=====ASSIGNING STAT RATIOS=====")
	#find stat ratios
	var stat_total = St + Ma + En + Ag + Lu
	rSt			= float(St) / stat_total
	rMa			= float(Ma) / stat_total
	rEn			= float(En) / stat_total
	rAg			= float(Ag) / stat_total
	rLu			= float(Lu) / stat_total
	
	if debug == Debug.VERBOSE:
		print("Stat Total: %d" % [stat_total])
		print("rSt: %f\nrMa: %f\nrEn: %f\nrAg: %f\nrLu: %f" % [rSt, rMa, rEn, rAg, rLu])
	
	if debug != Debug.NONE:
		print("=====ASSIGNING ELEMENTAL AFFINITIES=====")
		
	for i in range(aff.size()):
		var key = data[Type.keys()[i].to_lower()]
		#fix issue of None in db but Neutral in enum
		if key == "NONE":
			key = "Neutral"
		aff[i] = Affinity[key]
		
		if debug == Debug.VERBOSE:
			print("%s: %s" % [Type.keys()[i], Affinity.keys()[aff[i]]])

	if debug != Debug.NONE:
		print("=====ASSIGNING SKILLS AND TRAIT=====")
		
	ability = Trait[data["trait"]]
	for j in range(8):
		var key = data["skill%d" % [j]]
		#end if previous move was the last one
		if key == "None":
			break
		
		move_pool.append(AuxFunctions.BuildSkill(Skill[key]))
		
		if debug == Debug.VERBOSE:
			print("Skill %d: %s" % [j, move_pool[j].disp_name])
	if debug == Debug.VERBOSE:
		print("Trait: %s" % [Trait.keys()[ability]])
	
	if debug != Debug.NONE:
		print("=====ASSIGNING SKILL LEARNSET=====")
		
	#create learnset
	#create lists of learnset levels and skills
	var skill_levels	= data["learnlvls"].split(",", true)
	var learn_skills	= data["lvlupskills"].split(",", true)
	
	for h in range(skill_levels.size()):
		learnset[int(skill_levels[h])] = Skill[learn_skills[h]]
		
		if debug == Debug.VERBOSE:
			print("Skill %s learned at level %d" % [Skill.keys()[learnset[int(skill_levels[h])]], int(skill_levels[h])])

func GetData(as_text:=false):
	#region LOCAL VARIABLES
	var id_out
	var arcana_out
	var battack_out
	var mob_out
	var aff_out
	var inherit_out
	var mp_out = []
	var ls_out = []
	var ability_out
	#endregion
	
	#set correct value for evolution
	var evo = "None"
	if evolve == Race.Arsene:
		evo = "None"
	else:
		evo = Race.keys()[evolve]
		
	if not as_text:
		id_out		= ID
		arcana_out	= arcana
		battack_out	= battack
		mob_out		= mobility
		aff_out		= {	"Slash": aff[Type.Slash],
						"Strike": aff[Type.Strike],
						"Gun": aff[Type.Gun],
						"Fire": aff[Type.Fire],
						"Ice": aff[Type.Ice],
						"Wind":aff[Type.Wind],
						"Elec": aff[Type.Elec],
						"Psy": aff[Type.Psy],
						"Nuke": aff[Type.Nuke],
						"Bless": aff[Type.Bless],
						"Curse": aff[Type.Curse]}
		inherit_out	= inheritance
		mp_out		= move_pool
		ls_out		= learnset
		ability_out	= ability
	else:
		id_out		= Race.keys()[ID]
		arcana_out	= Arcana.keys()[arcana]
		battack_out	= Type.keys()[battack]
		mob_out		= Mobility.keys()[mobility]
		aff_out		= {	"Slash": Affinity.keys()[aff[Type.Slash]],
						"Strike": Affinity.keys()[aff[Type.Strike]],
						"Gun": Affinity.keys()[aff[Type.Gun]],
						"Fire": Affinity.keys()[aff[Type.Fire]],
						"Ice": Affinity.keys()[aff[Type.Ice]],
						"Wind": Affinity.keys()[aff[Type.Wind]],
						"Elec": Affinity.keys()[aff[Type.Elec]],
						"Psy": Affinity.keys()[aff[Type.Psy]],
						"Nuke": Affinity.keys()[aff[Type.Nuke]],
						"Bless": Affinity.keys()[aff[Type.Bless]],
						"Curse": Affinity.keys()[aff[Type.Curse]]}
		inherit_out	= Type.keys()[inheritance]
		for item in move_pool:
			mp_out.append(disp_name)
		for i in range(len(learnset)):
			if learnset[i]:
				ls_out.append("Learns %s at Lv %d" % [Skill.keys()[learnset[i]], i])
		ability_out	= Trait.keys()[ability]
	var output = {	"ID": id_out,
					"Display Name": disp_name,
					"Arcana": arcana_out,
					"Fake Name": fake_ID,
					"Background": background,
					"Evolves Into": evo,
					"Basic Attack Type": battack_out,
					"Mobility": mob_out,
					"Persistent Stats": {	"St": St,
											"Ma": Ma,
											"En": En,
											"Ag": Ag,
											"Lu": Lu,
											"MHP": MHP,
											"MSP": MSP,
											"Lv": Lv
										},
					"Bonus Stats": {	"bSt": bSt,
										"bMa": bMa,
										"bEn": bEn,
										"bAg": bAg,
										"bLu": bLu,
										"bMHP": bMHP,
										"bMSP": bMSP,
										},
					"Stat Distribution": {	"rSt": rSt,
											"rMa": rMa,
											"rEn": rEn,
											"rAg": rAg,
											"rLu": rLu,
										},
					"Affinities": aff_out,
					"Inheritance Type": inherit_out,
					"Move Pool": mp_out,
					"Learnset": ls_out,
					"Trait": ability_out
	}
	
	return output
#endregion
