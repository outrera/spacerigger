
extends Control

onready var game = get_node('/root/Game')

var player_ship




func get_vessels():
	return get_node('Vessels').get_children()

func get_stations():
	return get_node('Stations').get_children()

func get_warpnodes():
	return get_node('WarpNodes').get_children()


func add_vessel(vessel, position, is_player=false):
	get_node('Vessels').add_child(vessel)
	vessel.set_pos(position)
	if is_player:
		game.control.plug_in(vessel)

func add_station(station, position):
	get_node('Stations').add_child(station)
	station.set_pos(position)