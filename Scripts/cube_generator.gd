extends Node3D

@onready var cube = preload("res://Scenes/cube.tscn")
@onready var timer = $Timer

var spawnTime = 0.5
var cubeSpeed = 1
var height = 1.5

func _ready() -> void:
	timer.wait_time = spawnTime


func _on_timer_timeout() -> void:
	var newCube = cube.instantiate()
	var size = newCube.size.x
	
	cubeSpeed = randf_range(0.5, 2)
	
	#Position will be a in a 4x4 grid
	var yGrid = randi_range(0, 3)
	var xGrid = randi_range(0, 3)
	
	newCube.position.x = (size/2) + (xGrid * size) - (size*2)
	newCube.position.y = (size/2) + (yGrid * size) - (size*2) + height
	newCube.position.z = 6
	
	newCube.speed = cubeSpeed
	
	add_child(newCube)
