
extends PanelContainer

onready var game = get_node('/root/Game')

onready var box = get_node('box')
onready var icon = box.get_node('Icon/Base/Sprite')
onready var target_name = box.get_node('TargetName')
onready var output = box.get_node('Output')
onready var out_values = output.get_node('Values')
onready var distance = out_values.get_node('Distance')
onready var linvel = out_values.get_node('LinVel')
onready var linvelr = out_values.get_node('LinVelR')
onready var heading = out_values.get_node('Heading')
onready var headingr = out_values.get_node('HeadingR')

func process():
	var s = game.control.ship
	if game.control.ship.target:
		var t = game.control.ship.target
		if !icon.get_texture():
			icon.set_texture(t.get_node('Sprite').get_texture())
		#icon.set_rot(t.get_rot() - s.get_rot())
		target_name.set_text(t.get_name())
		distance.set_text(str(s.get_pos().distance_to(t.get_pos())).pad_decimals(2))
		linvel.set_text(str(t.get_linear_velocity().length()).pad_decimals(2))
		var lvr = t.get_linear_velocity() - s.get_linear_velocity()
		linvelr.set_text(str(lvr.length()).pad_decimals(2))
		heading.set_text(str(abs(rad2deg(t.get_rot()))).pad_decimals(2))
		var hr = t.get_rot() - s.get_rot()
		headingr.set_text(str(abs(rad2deg(hr))).pad_decimals(2))


