extends XROrigin3D

@onready var hitSound = $"../hitSound"

#Left sword
func _on_left_area_area_entered(area: Area3D) -> void:
	if area.name == "cubeArea":
		area.get_parent().queue_free()
		hitSound.play()
		print("left")
	
#Right sword
func _on_right_area_area_entered(area: Area3D) -> void:
	if area.name == "cubeArea":
		area.get_parent().queue_free()
		hitSound.play()
		print("right")
