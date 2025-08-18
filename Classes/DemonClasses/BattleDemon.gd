extends demon

class_name battle_demon

var BattleMath = battle_math.new()

#region ENUMS
const ATypes = Enums.ActionType
#endregion

#region SET STATS
@export var Atk			= 0
@export var Def			= 0
@export var SpA			= 0
@export var SpD			= 0
@export var Spe			= 0
@export var Eva			= 0
@export var Acc			= 0
@export var battle_mp	= 0
#endregion
		
#region ACTION SETTING
@export var action = {	"Actor": self,
						"Target": null,
						"Action": ATypes.None,
						"Skill": Skill.None
}
#endregion

func _init(base=null, data:=Race.Arsene, debug:=Debug.NONE):
	if base == null:
		super(data, debug)
	else:
		#region SET BATTLE STATS
		Atk	= min(99, (base.St+base.bSt))
		Def	= min(99, (base.En+base.bEn))
		SpA	= min(99, (base.Ma+base.bMa))
		SpD	= Def
		Spe	= min(99, (base.Ag+base.bAg))
		Eva	= BattleMath.GenerateAccEva(base.Ag, base.bAg, base.Lu, base.Blu)
		Acc	= Eva
		#endregion

		#region CREATE SKILL LIST
		move_pool	= base.move_pool
		ability		= base.ability
		
		for item in move_pool:
			#LOGIC TO BUILD SKILLS HERE
			print("TEMP")
		#endregion
		
		#region ORGANIZE PASSIVES
		
		#endregion
