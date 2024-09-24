extends Node3D

const SPEED = 4.0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += SPEED * delta
	if Input.is_action_pressed("ui_left"):
		if $Visual.rotation.x > -PI / 6:
			$Visual.rotation.x = lerp($Visual.rotation.x, -PI/6, 0.1)
	elif Input.is_action_pressed("ui_right"):
		if $Visual.rotation.x < PI / 6:
			$Visual.rotation.x = lerp($Visual.rotation.x, PI/6, 0.1)
	else:
		$Visual.rotation.x = lerp($Visual.rotation.x, 0.0, 0.1)
	
	if Input.is_action_pressed("ui_down"):
		if $Visual.rotation.z > -PI / 6:
			$Visual.rotation.z = lerp($Visual.rotation.z, -PI/6, 0.1)
	elif Input.is_action_pressed("ui_up"):
		if $Visual.rotation.z < PI / 6:
			$Visual.rotation.z = lerp($Visual.rotation.z, PI/6, 0.1)
	else:
		$Visual.rotation.z = lerp($Visual.rotation.z, 0.0, 0.1)
