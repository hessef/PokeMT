extends skill

class_name recovery_skill

#region GLOBAL VARIABLES
@export var power:	int
@export var effect:	Effects
@export var cost:	int
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
	
	#region SET RECOVERY SPECIFIC VALUES
	power		= Power[data['power']]
	effect		= Effects[data['effect']]
	cost		= int(data['cost'])
	aoe			= AOE[data['aoe']]
	#endregion
