extends Node2D


# Declare member variables here. Examples:
var velocity = Vector2()
onready var Player = get_node("/root/Main/Player")

signal Player_Has_Eaten


# Called when the node enters the scene tree for the first time.
func _ready():
	player_eating()
	connect("Player_Has_Eaten", Player, "add_body_part")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Player.position.distance_to(position) <= 32:
		player_eating()

func player_eating():
	randomize()
	var random_location_x = rand_range(32, 992)
	var random_location_y = rand_range(32, 568)
	
	position.x = random_location_x
	position.y = random_location_y
	emit_signal("Player_Has_Eaten")
