extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	margin_right = get_viewport().get_visible_rect().size.x
	margin_bottom = get_viewport().get_visible_rect().size.y
