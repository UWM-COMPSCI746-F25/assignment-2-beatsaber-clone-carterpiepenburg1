extends XROrigin3D

@onready var leftSword = $LeftHand/Hand/Sword
@onready var rightSword = $RightHand/Hand/Sword

#Left sword (blue)
func _on_left_area_area_entered(area: Area3D) -> void:
	if area.name == "cubeArea":
		if area.get_parent().color == 0 && area.get_parent().destroyed == false:
			area.get_parent().destroy()
			print("left")
	
#Right sword (red)
func _on_right_area_area_entered(area: Area3D) -> void:
	if area.name == "cubeArea":
		if area.get_parent().color == 1 && area.get_parent().destroyed == false:
			area.get_parent().destroy()
			print("right")
			
func _on_left_hand_button_pressed(buttonName: String) -> void:
	if buttonName == "ax_button":
		if leftSword.visible == true:
			leftSword.hide()
			leftSword.get_child(0).monitoring = false
		else:
			leftSword.show()
			leftSword.get_child(0).monitoring = true
	
func _on_right_hand_button_pressed(buttonName: String) -> void:
	if buttonName == "ax_button":
		if rightSword.visible == true:
			rightSword.hide()
			rightSword.get_child(0).monitoring = false
		else:
			rightSword.show()
			rightSword.get_child(0).monitoring = true
