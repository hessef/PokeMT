extends Node

class_name save_manager

#region ENUMS
const Race = Demons.demons
#endregion

#region FUNCTIONS
var md = metadata.new()
var AuxFunctions = AuxiliaryFunctions.new()
#endregion

##save data. Returns true if successful, false otherwise
func SaveDmn(target):
	if target is demon:
		print(OS.get_data_dir())
		var save_name = "user://%s.dmn" % [target.disp_name]
		#verify that name is available
		if not FileAccess.file_exists(save_name):
			print("creating new save...")
		else:
			print("overwriting old save...")
			#delete old file and replace with new
			DirAccess.remove_absolute(save_name)
		# Store the save data
		var save_file = FileAccess.open(save_name, FileAccess.WRITE)
		#serialize data
		var save_data := {	"Ver":md.game_version,
							"Race": target.ID,
							"Name": target.disp_name,
							"Level": target.Lv,
							"Exp": target.Exp,
							"Skills":[],
							"Trait": target.ability,
							"St": target.St,
							"Ma": target.Ma,
							"En": target.En,
							"Ag": target.Ag,
							"Lu": target.Lu,
							"MHP": target.MHP,
							"MSP": target.MSP,
							"HP": target.HP,
							"SP": target.SP,
							"Item": target.item,
							"Status": target.status}
		#add moves
		for move in target.move_pool:
			save_data["Skills"].append(move.ID)
		#store data
		save_file.store_var(save_data, true)
		return true
	else:
		return false

func LoadDmn(target):
	if target is String:	
		var file_name = "user://%s.dmn" % [target]
		#verify it exists
		if FileAccess.file_exists(file_name):
			var file = FileAccess.open(file_name, FileAccess.READ)
			var data = file.get_var(true)
			#create new object of the correct race
			var output = party_demon.new(null, data["Race"])
			#set parameters
			output.disp_name	= data["Name"]
			output.ability 		= data["Trait"]
			output.St			= data["St"]
			output.Ma			= data["Ma"]
			output.En			= data["En"]
			output.Ag			= data["Ag"]
			output.Lu			= data["Lu"]
			output.MHP			= data["MHP"]
			output.MSP			= data["MSP"]
			output.HP			= data["HP"]
			output.SP			= data["SP"]
			output.status		= data["Status"]
			output.item			= data["Item"]
			output.Lv			= data["Level"]
			output.Exp			= data["Exp"]
			#set moves
			output.move_pool.clear()
			for move in data["Skills"]:
				output.move_pool.append(AuxFunctions.BuildSkill(move))
			#return object
			return output
