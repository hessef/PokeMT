extends HSlider

##this function changes the value in the slider
func _change_slider():
	self.value = Metadata.settings[self.name]

##this updates metadata as needed
func _user_change_slider(new_value):
	if new_value != Metadata.settings[self.name]:
		Metadata.settings[self.name] = new_value
