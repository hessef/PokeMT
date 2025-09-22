extends Label

##this function updates displayed percentage
func _update_text(value):
	text = "%d" % [value]
