extends Node

class_name AuxiliaryFunctions

#region ENUMS
const Type		= Enums.type
const Relate	= Enums.relation
const OType		= Enums.ObjectType
const Race		= Demons.demons
const Skill		= Skills.skills
const Arcana	= Enums.arcana
const Category	= Enums.skill_category
const PassType	= Enums.passive_types
const Affinity	= Enums.affinity
#endregion

#region IMPORT FUNCTIONS
var db = SQLite.new()
#endregion

##compares types and returns the relation between them
func TypeRelation(type1:Type, type2:Type):
	#matching
	if type1 == type2:
		return Relate.Match
	
	var data = [type1, type2]
	
	#opposing
	if data.has(Type.Fire) && data.has(Type.Ice):
		return Relate.Oppose
	elif data.has(Type.Elec) && data.has(Type.Wind):
		return Relate.Oppose
	elif data.has(Type.Psy) && data.has(Type.Nuke):
		return Relate.Oppose
	elif data.has(Type.Bless) && data.has(Type.Curse):
		return Relate.Oppose
	#no relation
	else:
		return Relate.Neutral

##retrieves data for an object of the type specified,
##based on the given name in the form of the enum
func GetData(object_type:=OType.Demon, object_name:=0, debug:=SQLite.VerbosityLevel.QUIET):
	##name of table to look in. "demon" by default.
	var table_name = "demon"
	var entry_name = "id ="
	match object_type:
		OType.Demon:
			db.path = "res://Databases/demon_stats.db"
			table_name = "demon"
			entry_name = "id = '%s'" % [Race.keys()[object_name]]
		OType.Skill:
			db.path = "res://Databases/skill_data.db"
			table_name = "skill"
			entry_name = "id = '%s'" % [Skill.keys()[object_name]]
	db.verbosity_level = debug
	db.open_db()
	
	db.select_rows(table_name, entry_name, ["*"])
	
	var output = db.query_result[0]
	
	db.close_db()
	return output
	
##This function returns the arcana of a demon given its ID enum
func GetArcana(race:Race):
	for arcana in Arcana:
		var start_string = "%sStart" % [arcana]
		var end_string = "%sEnd" % [arcana]
		if (Race[start_string] < race) && (race < Race[end_string]):
			return Arcana[arcana]

##This function returns the category of a skill given its ID enum
func GetSkillCategory(id:Skill):
	for skill_cat in Category:
		var start_string = "Start%s" % [skill_cat]
		var end_string = "End%s" % [skill_cat]
		if (Skill[start_string] < id) && (id < Skill[end_string]):
			return Category[skill_cat]
##Returns the element of a physical skill
func GetPhysSkillType(id: Skill):
	#verify input
	if !((Skill.StartPhys < id) && (id < Skill.EndPhys)):
		print("Not a physical skill!")
		return false
	for element in Type:
		var start_string = "Start%s" % [element]
		var end_string = "End%s" % [element]
		if (Skill[start_string] < id) && (id < Skill[end_string]):
			return Type[element]
##Returns the element of a magic skill
func GetMagSkillType(id: Skill):
	#verify input
	if !((Skill.StartMagic < id) && (id < Skill.EndMagic)):
		print("Not a magic skill!")
		return false
	for element in Type:
		var start_string = "Start%s" % [element]
		var end_string = "End%s" % [element]
		if (Skill[start_string] < id) && (id < Skill[end_string]):
			return Type[element]
func GetSuppSkillType(id: Skill):
	#verify input
	if !((Skill.StartSupport < id) && (id < Skill.EndSupport)):
		print("Not an support skill!")
		return false
	for element in Type:
		var start_string = "Start%s" % [element]
		var end_string = "End%s" % [element]
		if (Skill[start_string] < id) && (id < Skill[end_string]):
			return Type[element]
func GetPassSkillType(id: Skill):
	#verify input
	if !((Skill.StartPassive < id) && (id < Skill.EndPassive)):
		print("Not an passive skill!")
		return false
	for subtype in PassType:
		var start_string = "Start%s" % [subtype]
		var end_string = "End%s" % [subtype]
		if (Skill[start_string] < id) && (id < Skill[end_string]):
			return PassType[subtype]
##This function returns the type of a skill given its ID enum
func GetSkillType(id:Skill):
	for skill_cat in Category:
		var start_string = "Start%s" % [skill_cat]
		var end_string = "End%s" % [skill_cat]
		if (Skill[start_string] < id) && (id < Skill[end_string]):
			return Category[skill_cat]

##This function is used in place of a constructor for skills
func BuildSkill(id:Skill):
	var skill_type = GetSkillType(id)
	match skill_type:
		Category.Phys:
			return physical_skill.new(id)
		Category.Magic:
			return magic_skill.new(id)
		Category.Ailment:
			return ailment_skill.new(id)
		Category.Recovery:
			return recovery_skill.new(id)
		Category.Support:
			return support_skill.new(id)
		Category.Passive:
			return passive_skill.new(id)

##this function returns the correct image to use for elemental affinity
func GetAffinityIcon(skill_type:Type, target: demon):
	var output = null
	#if skill type doesn't have elemental effects, return null
	if (skill_type >= Type.Almighty):
		return output
		
	#find relation
	output = load("res://UI/Assets/Icons/%s.png" % [Affinity.keys()[target.aff[skill_type]]])
	
	return output
