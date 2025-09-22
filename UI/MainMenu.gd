extends Node

#region GLOBAL VARIABLES
@export var current_menu: UI_Enums.MainMenu
@export var previous_menu: UI_Enums.MainMenu
#endregion

#region SIGNALS
signal from_play()
signal from_team()
signal from_options()
signal from_credits()
signal from_quit()
#endregion

##this function starts the game
func _start_game():
	#TODO: change to correct scene
	var battle = "res://TestEnvironments/StatOutputTest.tscn" #this is for the test scene, not the actual battle scene
	get_tree().change_scene_to_file(battle)

##this function ends the game
func _quit_game():
	get_tree().quit()

##this function handles non-mouse input
func _input(event):
	#go to previous menu if escape
	if event.is_action_pressed("ui_cancel"):
		print("ff")
		#if in the main menu already, do nothing
		if current_menu == UI_Enums.MainMenu.Main:
			return
		#if in other menus, call the appropriate function
		else:
			back_menu(current_menu)
			_set_window(previous_menu)

##this sets the current window
func _set_window(window):
	#set parameters
	previous_menu = current_menu
	current_menu = window

##this handles going back in menus with the escape key
func back_menu(old_window):
	match old_window:
		UI_Enums.MainMenu.Play:
			from_play.emit()
		UI_Enums.MainMenu.Team:
			from_team.emit()
		UI_Enums.MainMenu.Options:
			from_options.emit()
		UI_Enums.MainMenu.Credits:
			from_credits.emit()
		UI_Enums.MainMenu.Quit:
			from_quit.emit()
