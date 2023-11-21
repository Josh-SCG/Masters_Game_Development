extends Node2D

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Assets/Menu Scenes/Main Menu.tscn")


####################
## Credit buttons ##
####################

func _on_char_link_pressed():
	OS.shell_open("https://retro-sprite-creator.nihey.org/character")

func _on_ui_link_pressed():
	OS.shell_open("https://opengameart.org/content/lpc-pennomis-ui-elements")

func _on_dialogue_manager_link_pressed():
	OS.shell_open("https://github.com/nathanhoad/godot_dialogue_manager")

func _on_bot_link_pressed():
	OS.shell_open("https://opengameart.org/content/gum-bot-sprites")

func _on_ui_bg_link_pressed():
	OS.shell_open("https://opengameart.org/content/grid-background")

func _on_pixel_pack_1_link_pressed():
	OS.shell_open("https://opengameart.org/content/lpc-interior-castle-tiles")

func _on_signpost_link_pressed():
	OS.shell_open("https://opengameart.org/content/lpc-signposts-graves-line-cloths-and-scare-crow")

func _on_basic_link_pressed():
	OS.shell_open("https://schwarnhild.itch.io/basic-tileset-and-asset-pack-32x32-pixels")

func _on_forest_bg_link_pressed():
	OS.shell_open("https://opengameart.org/content/sea-forest-background")

func _on_green_field_link_pressed():
	OS.shell_open("https://guttykreum.itch.io/field-of-green")

func _on_office_link_pressed():
	OS.shell_open("https://opengameart.org/content/lpc-revised-the-office")

func _on_tileset_link_pressed():
	OS.shell_open("https://solaarnoble.itch.io/32x32-tileset")

func _on_modern_city_link_pressed():
	OS.shell_open("https://shatteredreality.itch.io/modern-city")

func _on_reyoh_link_pressed():
	OS.shell_open("https://reyoh.itch.io/reyoh-easy-tileset")

func _on_d_link_pressed():
	OS.shell_open("https://kamisama887.itch.io/lorenz-fries-school-horror")

func _on_space_war_link_pressed():
	OS.shell_open("https://opengameart.org/content/space-war-man-new-laser-and-enemies")


func _on_usbg_link_pressed():
	OS.shell_open("https://opengameart.org/content/underground-sidescroller-background")
