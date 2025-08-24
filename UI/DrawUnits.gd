extends Node2D

class_name DrawUnits

#region GLOBAL VARIABLES
@export var party: Array[battle_demon]
@export var enemies: Array[battle_demon]
@export var bzone: String
#endregion

func _init(player_units: Array[battle_demon], ai_units: Array[battle_demon], zone: String):
	party = player_units
	enemies = ai_units
	
	#add party
	var num_slots = min(4, len(party))
	for i in range(num_slots):
		var location = Vector2((1280 / num_slots) * (i+0.5), 550)
		party[i].DrawSprite(self, location, 0.6)
	
	#add enemies
	num_slots = len(enemies)
	for i in range(num_slots):
		var location = Vector2((1280 / num_slots) * (i+0.5), 170)
		enemies[i].DrawSprite(self, location, 0.4)
