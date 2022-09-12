extends KinematicBody2D

export (int) var speed = 300

onready var ball = get_node("/root/world/ball")

var vel = Vector2()

func _ready():
	pass # Replace with function body.

func _process(_delta):
	
	vel = Vector2()
	
	if Input.is_action_pressed("Player2Up"):
		vel.y += -1
	if Input.is_action_pressed("Player2Down"):
		vel.y += 1
	vel.x = 0

func _physics_process(_delta):
	if not ball.dead:
		var _l = move_and_slide(vel * speed)
