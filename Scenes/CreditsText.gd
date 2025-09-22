extends RichTextLabel

func _ready():
	var title_string = "[center][font_size=50]CREDITS[/font_size][br]"
	var pe_string = "[font_size=25]A Game by %s[/font_size]" % [metadata.credits["Made By"]]
	
	
	text = title_string + pe_string
