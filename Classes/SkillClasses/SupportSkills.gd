extends skill

class_name support_skill

#region GLOBAL VARIABLES
@export var stat:		Array[Stats]
@export var status:		VStatus
@export var condition:	Condition
@export var cost:		int
@export var power:		float
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
	match subtype:
		Subtype.Standard:
			#if standard, set which stat it alters
			match data['status']:
				#Taru prefix means attack stats
				'Taru':
					stat.append(Stats.Att)
					stat.append(Stats.Spa)
				#Raku prefix means defense stats
				'Raku':
					stat.append(Stats.Def)
					stat.append(Stats.Spd)
				#Suku prefix means accuracy/evasion
				'Suku':
					stat.append(Stats.Acc)
					stat.append(Stats.Eva)
				_:
					stat.append(Stats[data['status']])
			power = Stages[data['power']]
		Subtype.Break:
			#if inflicting a break, set that here
			status		= VStatus[data['ailment']]
		Subtype.PositiveStatus:
			#if granting a positive status, set that here
			status		= VStatus[data['ailment']]
	#set these regardless of subtype
	condition	= Condition[data['skill_conditions']]
	cost		= int(data['cost'])
	aoe			= AOE[data['aoe']]
	#endregion
