extends skill

class_name physical_skill

#region GLOBAL VARIABLES
@export var power:	 	int
@export var crit:		int
@export var ailment 	= VStatus.None	#must not declare type yet because it could be V or NV
@export var ail_chance	= AilChance
@export var condition:	Condition
@export var cost:		int
@export var accuracy:	int
@export var hit_count	= [1,1] #default of just 1 hit
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
	priority	= int(data['priority'])
	#endregion
	
	#region SET PHYSICAL SPECIFIC VALUES
	power		= int(data['power'])
	crit		= CritC[data['crit_chance']]
	ail_chance	= AilChance[data['ailment_chance']]
	condition	= Condition[data['skill_conditions']]
	cost		= int(data['cost'])
	accuracy	= int(data['accuracy'])
	hit_count	= [int(data['hit_min']),int(data['hit_max'])]
	aoe			= AOE[data['aoe']]
	
	if data['ailment'] in NVStatus:
		ailment	= NVStatus[data['ailment']]
	else:
		ailment	= VStatus[data['ailment']]
	#endregion
