extends Node

class_name save_manager

#region ENUMS

#endregion

##save data. Returns true if successful, false otherwise
func Save(target):
	if target is demon:
		print(OS.get_data_dir())
		var save_name = "user://%s.save" % [target.disp_name]
		#verify that name is available
		if not FileAccess.file_exists(save_name):
			# Store the save dictionary as a new line in the save file.
			var save_file = FileAccess.open(save_name, FileAccess.WRITE)
			save_file.store_line(target.disp_name)
			return true
	else:
		return false
