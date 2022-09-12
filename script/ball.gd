extends KinematicBody2D

export (int) var speed = 4

onready var scoreLabel = get_node("/root/world/Control/Label")
onready var dedLabel = get_node("/root/world/Control/ded")
onready var audioHitPlayer = get_node("/root/world/audio")

var score = 0

var direction = Vector2()

var dead = false

func _ready():
	randomize()
	direction.x = int(round(rand_range(-1, 1)))
	direction.y  = int(round(rand_range(-1, 1)))
	#direction.y = 1
	
	if direction.x == 0:
		direction.x = 1
	if direction.y == 0:
		direction.y = -1
	
	var _n = get_node("/root/world/ball").get_global_transform_with_canvas()
	print(get_viewport().get_visible_rect().size)


func _physics_process(_delta):
	
	if dead:
		dedLabel.visible = true

	if Input.is_action_pressed("ui_select") and dead:
		var _p = get_tree().reload_current_scene()

	scoreLabel.text = "score: " + str(score)

	if global_position.x - $ColorRect2.margin_right < 0 or global_position.x + $ColorRect2.margin_right > get_viewport().get_visible_rect().size.x:
		dead = true
	if global_position.y - $ColorRect2.margin_bottom < 0 or global_position.y + $ColorRect2.margin_bottom > get_viewport().get_visible_rect().size.y:
		direction.y = -direction.y
	
	if not dead:
		var dir = move_and_collide(direction * speed)
		if dir:
			if dir.collider.is_in_group("bounce"):
				audioHitPlayer.play()
				score += 1
				speed *= 1.01
				direction = direction.bounce(dir.normal)
