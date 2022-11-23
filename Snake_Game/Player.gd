extends KinematicBody2D


# Declare member variables here. Examples:
var velocity = Vector2()
var direction
var Player_Body = load("res://Player_Body.tscn")
var Player_Body_Instance = Player_Body.instance()
var Body_Parts = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	
	match direction:
		"up":
			position.y -= 1
		"down":
			position.y += 1
		"left":
			position.x -= 1
		"right":
			position.x += 1
			
	if Body_Parts.size() > 2:
		for i in range(len(Body_Parts)):
			var x = Body_Parts[i-1].position.x
			var y = Body_Parts[i-1].position.y
			Body_Parts[i].position.x = x
			Body_Parts[i].position.y = y

func get_input():
	if Input.is_action_just_pressed("ui_up"):
		direction = "up"
		set_rotation_degrees(0)
	if Input.is_action_just_pressed("ui_down"):
		direction = "down"
		set_rotation_degrees(180)
	if Input.is_action_just_pressed("ui_left"):
		direction = "left"
		set_rotation_degrees(-90)
	if Input.is_action_just_pressed("ui_right"):
		direction = "right"
		set_rotation_degrees(90)

func add_body_part():
	Body_Parts.append(add_child(Player_Body_Instance))
