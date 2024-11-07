extends Control

# Reference to the main scene script (to modify score and click power)
var main_game: Node = null

# Upgrades
var click_power_upgrade_cost: int = 10
var click_power_increase: int = 1

func _ready():
	# Reference to the main game scene
	main_game = get_tree().root.get_child(0)  # Assuming your main game scene is the first loaded scene
	
	# Debugging: Check if VBoxContainer and Upgrade1Button exist
	if $VBoxContainer and $VBoxContainer/Upgrade1Button:
		print("VBoxContainer and Upgrade1Button found")
		$VBoxContainer/Upgrade1Button.pressed.connect(_on_Upgrade1Button_pressed)
	else:
		print("VBoxContainer or Upgrade1Button not found")

# Function for the first upgrade (increase click value)
func _on_Upgrade1Button_pressed():
	if main_game.score >= click_power_upgrade_cost:
		main_game.score -= click_power_upgrade_cost
		main_game.click_power += click_power_increase
		main_game._update_score_label()  # Update the score label
