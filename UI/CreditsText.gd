extends RichTextLabel

func _ready():
	var title_string = "[center][font_size=50]CREDITS[/font_size][br]"
	var pe_string = "[font_size=25]A Game by %s[/font_size][br][br]" % [metadata.credits["Made By"]]
	var full_string = title_string + pe_string
	#go through all categories and add them
	for cat in metadata.credits["Credits"]:
		var sect_header = "[font_size=20]%s[/font_size][br]" % [cat]
		full_string = full_string + sect_header
		for entry in metadata.credits["Credits"][cat]:
			var substring
			if entry == "Name":
				substring = "[font_size=15]%s[/font_size][br]" % [metadata.credits["Credits"][cat][entry]]
			else:
				substring = "[font_size=15][url=https://%s.com/%s/]%s[/url][/font_size][br]" % [entry, metadata.credits["Credits"][cat][entry], entry]
			full_string = full_string + substring
		full_string = full_string + "[br]"
	text = full_string
	

##this function handles the links
func _richtextlabel_on_meta_clicked(meta):
	OS.shell_open(str(meta))
