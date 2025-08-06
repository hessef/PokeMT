extends skill

class_name ailment_skill

#region GLOBAL VARIABLES
@export var ailment 	= VStatus.None	#must not declare type yet because it could be V or NV
@export var ail_chance	= AilChance
@export var condition:	Condition
@export var cost:		int
@export var aoe:		AOE
#endregion

##constructor class, takes enum as argument
func _init(id:Name, debug:=Debug.NONE):
	#get data from database
	var data = AuxFunctions.GetData(OType.Skill, id)
	
	#region SET INHERITED TRAITS
	ID			= Name[data['id']]
	type 		= Type[data['type']]
	subtype		= Subtype[data['subtype']]
	desc		= data['description']
	inheritable	= Inherit[data['inherit']]
	scaling		= Scaling[data['scaling']]
	disp_name	= data['name']
	#endregion
	
	#region SET AILMENT SPECIFIC VALUES
	ail_chance	= AilChance[data['ailment_chance']]
	condition	= Condition[data['skill_conditions']]
	cost		= int(data['cost'])
	aoe			= AOE[data['aoe']]
	
	if data['ailment'] in NVStatus:
		ailment	= NVStatus[data['ailment']]
	else:
		ailment	= VStatus[data['ailment']]
	#endregion
