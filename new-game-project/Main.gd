extends Node2D

var score: int = 0
var click_power: int = 1  # Start with 1 point per click

func _ready():
	# Debugging: Print to check if the nodes exist
	if $Button:
		print("Button found")
	else:
		print("Button not found")
	
	if $UpgradeMenuButton:
		print("UpgradeMenuButton found")
	else:
		print("UpgradeMenuButton not found")
	
	if $Label:
		print("Label found")
	else:
		print("Label not found")

	# Connect signals only if the nodes exist
	if $Button:
		$Button.pressed.connect(_on_Button_pressed)
	if $UpgradeMenuButton:
		$UpgradeMenuButton.pressed.connect(_on_UpgradeMenuButton_pressed)

	_update_score_label()

func _on_Button_pressed():
	score += click_power
	_update_score_label()

func _on_UpgradeMenuButton_pressed():
	var upgrade_menu_scene = load("res://UpgradeMenu.tscn").instantiate()  # Load the upgrade menu scene
	add_child(upgrade_menu_scene)  # Show the upgrade menu

func _update_score_label():
	if $Label:
		$Label.text = "Score: " + str(score)
