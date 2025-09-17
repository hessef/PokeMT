extends demon

class_name battle_demon

#region IMPORT FUNCTIONS
var BattleMath = battle_math.new()
var RNG = RandomNumberGenerator.new()
#endregion

#region ENUMS
const ATypes = Enums.ActionType
const Stages = BalanceEnum.stat_stages
const CritC  = BalanceEnum.crit_chance
#endregion

#region VARIABLES
@export var Atk			= 0
@export var Atk_stages	= Stages["Normal"]
@export var Def			= 0
@export var Def_stages	= Stages["Normal"]
@export var SpA			= 0
@export var SpA_stages	= Stages["Normal"]
@export var SpD			= 0
@export var SpD_stages	= Stages["Normal"]
@export var Spe			= 0
@export var Spe_stages	= Stages["Normal"]
@export var Eva			= 0
@export var Eva_stages	= Stages["Normal"]
@export var Acc			= 0
@export var Acc_stages	= Stages["Normal"]
@export var battle_sp	= 0
@export var sprite_texture: CompressedTexture2D
@export var sprite: Sprite2D
@export var ui_data: DemonData
@export var ui_slot: bslot #for player demons
@export var ui_button: Button #for enemy demons
@export var node: action_node
@export var crit_mult: float
@export var parent: battle_manager = null
#endregion

		
#region ACTION SETTING
@export var action = {	"Actor": self,
						"Target": null,
						"Action": ATypes.None,
						"Skill": skill
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
		Lv			= base.Lv
		Lu			= base.Lu
		crit_mult	= 1.5 #TODO change with passives
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
	
##execute offensive skill
func execute_attack(debug_level:=Debug.NONE):
	#TODO: add logic for what happens when the target is dead
	if action.Target.HP == 0:
		return
	
	var accuracy = 1
	var crit = CritC.DefaultP5 #skill crit chance (default for basic attack)
	var crit_mod = 1.0 #holds the multiplier for crit
	#region CHECK HIT
	if action["Action"] == ATypes.Basic_Attack:
		accuracy = 95
	else:
		accuracy = action["Skill"].accuracy
		if action["Skill"].type in [Type.Slash, Type.Strike, Type.Gun]:
			crit = action["Skill"].crit
			#consume HP (if not enough, will simply die
			HP = max(0, HP - (action["Skill"].cost * 0.01 * MHP))
		else:
			crit = 0
			#consume SP (if not enough, skill fails)
			if SP - action["Skill"].cost <= SP:
				SP = max(0, SP - action["Skill"].cost)
	#check if it hits
	var chance = BattleMath.HitChance(accuracy, 1, item, action["Target"].Eva_stages, Acc_stages, action["Target"].Eva, Acc)
	var rand = RNG.randi_range(1,100)
	
	if debug_level != Debug.NONE:
		print("Calculated hit chance: %d" % [chance])
		print("Generated number: %d" % [rand])
		
	if rand > chance:
		return 0 #attack missed
	#endregion
	
	#region CHECK CRIT
	#attack hit, so continue and find crit if needed
	if crit != 0:
		var crit_chance = BattleMath.FullCrit(self, action["Target"], crit)
		
		#check if critical
		rand = RNG.randi_range(1,100)
		if rand <= crit_chance:
			crit_mod = crit_mult
	
		if debug_level != Debug.NONE:
			print("Calculated crit chance: %d" % [crit_chance])
			print("Generated number: %d" % [rand])
	#endregion
	
	#region DAMAGE CALCULATION AND APPLICATION
	var damage = BattleMath.FullDamageCalc(self, action["Target"], crit_mod)
	if debug_level != Debug.NONE:
		print("Calculated damage: %d" % [damage])
	
	#now, check to see how damage is applied
	var skill_type = battack #default basic attack type
	if action["Action"] == ATypes.Skill:
		skill_type = action["Skill"].type #change to skill type
	match action["Target"].aff[skill_type]:
		Affinity.Null:
			damage = 0.0
			#TODO: add visual indicator of damage nullification
		Affinity.Drain:
			DealDamage(action["Target"], -damage)
		Affinity.Repel:
			damage = BattleMath.FullDamageCalc(self, self, 1) #redo damage calc if it is repelled
			DealDamage(self, damage)
		_:
			DealDamage(action["Target"], damage)
	#TODO: add ui to narrate action
	#endregion

##this function handles dealing damage
func DealDamage(target:battle_demon,damage:float):
	#change HP amount
	target.HP = min(target.MHP, max(0, target.HP - damage))

##this function handles guarding
func execute_guard():
	pass
	#TODO: add ui to narrate action
	
#region FUNCTION OVERRIDES
##this function updates the UI for selectable skills if needed
func skill_selection_update():
	ui_slot.update_usability()
	
##this function updates the HP bar
func update_hp_bar():
	if ui_data:
		ui_data.update_hp()
	
	#update visibility if dead
	if HP == 0:
		ui_data.vbox.hide() #hide the vbox instead of the whole thing so that the spacing isn't thrown off
		sprite.hide()
		#lower count for the correct team if dead
		if team == Teams.Player:
			parent.units_in_play.Player -= 1
		else:
			parent.units_in_play.Enemies -= 1
##this function updates the SP bar
func update_sp_bar():
	if ui_data:
		ui_data.update_sp()
#endregion
