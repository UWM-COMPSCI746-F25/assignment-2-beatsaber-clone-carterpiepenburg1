extends CSGBox3D

var speed = 1
@onready var hit = $hit

func _process(delta: float) -> void:
	position.z -= speed * delta
	if global_position.z < 0:
		queue_free()
