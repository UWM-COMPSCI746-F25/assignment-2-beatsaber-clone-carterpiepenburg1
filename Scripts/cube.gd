extends CSGBox3D

var speed = 1
var color = 0 #0 is blue, 1 is red
var destroyed = false
@onready var hit = $hit
@onready var hitbox = $cubeArea
@onready var blue = preload("res://Materials/blue.tres")
@onready var red = preload("res://Materials/red.tres")

func _ready() -> void:
	color = randi_range(0, 1)
	if color == 0:
		material = blue
	else:
		material = red

func _process(delta: float) -> void:
	if not destroyed:
		position.z -= speed * delta
		if global_position.z < 0:
			queue_free()
		
func destroy():
	destroyed = true
	hide()
	hitbox.monitorable = false
	hit.pitch_scale = randf_range(0.5, 2)
	hit.play()
	await hit.finished
	print("destroyed cube")
	queue_free()
