extends skill

class_name passive_skill

#region GLOBAL VARIABLES
@export var trigger: 	Trigger
@export var condition:	Condition
@export var parameter:	Type
@export var ailment = 	VStatus.None	#must not declare type yet because it could be V or NV
@export var effect: PassEff
@export var crit: int
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
	disp_name	= data['name']
	#endregion
	
	#region SET PASSIVE SPECIFIC VALUES
	trigger 	= Trigger[data['trigger_condition']]
	condition	= Condition[data['skill_conditions']]
	parameter	= Type[data['status']]
	effect		= PassEff[data['effect']]
	
	if data['ailment'] in NVStatus:
		ailment	= NVStatus[data['ailment']]
	else:
		ailment	= VStatus[data['ailment']]
		
	if effect == PassEff.AvoidCrit:
		crit	= CritC[data['crit_chance']]
	#endregion
