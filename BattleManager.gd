extends Node

class_name battle_manager
	
##spawns demon at the designated slot on the battlefield
##slots 0-3 are for the player, 4-9 are for enemies
##only wild demons should be in slots 8 or 9
##enc_type 0 is trainer battle, 1 is wild demons
func spawn_demon(guy:demon, slot:int, enc_type:bool):
	#region Set Team
	if (slot <= 3):
		var team = 0 #team 0 means an ally
	elif ((slot <= 7)):
		var team = 1 #team 1 means enemy
	elif ((slot > 7) && (enc_type == false)):
		return false #trying to place more than 4 enemies in a trainer battle fails
	#endregion
		
	#region Set Stats
	#set physical attack
	var temp = int(guy.St + guy.bSt)
	guy.att = min(temp,99)
	
	#set magical attack
	temp = int(guy.Ma + guy.bMa)
	guy.spa = min(temp,99)
	
	#set defenses
	temp = int(guy.En + guy.bEn)
	guy.def = min(temp,99)
	guy.spd = min(temp,99)
	
	#set speed and accuracy
	temp = int(guy.Ag + guy.bAg)
	guy.spe = min(temp,99)
	guy.acc = min(temp,99)
	
	#set evasion
	temp = int(guy.Ag + guy.bAg + ((1/10) * (guy.Lu + guy.bLu)))
	guy.eva = min(temp,99)
	
	#set crit chance
	temp = int(guy.Lu + guy.bLu)
	guy.crt = min(temp,99)
	#endregion	
