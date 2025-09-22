extends Label

##this gets the correct version number and applies it
func _ready():
	self.text = "Ver. %s" % [metadata.game_version]
