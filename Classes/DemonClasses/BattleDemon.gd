extends demon

class_name battle_demon

var BattleMath = battle_math.new()

#region ENUMS
const ATypes = Enums.ActionType
#endregion

#region VARIABLES
@export var Atk			= 0
@export var Def			= 0
@export var SpA			= 0
@export var SpD			= 0
@export var Spe			= 0
@export var Eva			= 0
@export var Acc			= 0
@export var battle_sp	= 0
@export var sprite_texture: CompressedTexture2D
@export var sprite: Sprite2D
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
		#region COPY DATA
		ID 			= base.ID
		disp_name	= base.disp_name
		fake_ID		= base.fake_ID
		nickname	= base.nickname
		arcana		= base.arcana
		background	= base.background
		evolve		= base.evolve
		inheritance	= base.inheritance
		battack		= base.battack
		aff			= base.aff
		#endregion
		
		#region SET BATTLE STATS
		Atk	= min(99, (base.St+base.bSt))
		Def	= min(99, (base.En+base.bEn))
		SpA	= min(99, (base.Ma+base.bMa))
		SpD	= Def
		Spe	= min(99, (base.Ag+base.bAg))
		Eva	= BattleMath.GenerateAccEva(base.Ag, base.bAg, base.Lu, base.bLu)
		Acc	= Eva
		MHP	= base.MHP
		HP	= base.HP
		MSP	= base.MSP
		SP	= base.SP
		#endregion

		#region CREATE SKILL LIST
		move_pool	= base.move_pool
		ability		= base.ability
		battack		= base.battack
		for item in move_pool:
			#LOGIC TO BUILD SKILLS HERE
			print("TEMP")
		#endregion
		
	#region ORGANIZE PASSIVES
	
	#endregion
	
	#region GET SPRITE
	sprite_texture = load("res://UI/Assets/Demons/%s.png" % [disp_name])
	#endregion

##draw sprite
func DrawSprite(origin, location:Vector2, scale = 1.0):
	sprite = Sprite2D.new()
	sprite.texture = sprite_texture
	sprite.global_position = location
	sprite.scale = Vector2(scale,scale)
	origin.add_child(sprite)
