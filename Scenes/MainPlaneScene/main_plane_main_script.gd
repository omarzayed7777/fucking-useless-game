extends Node3D

const FORWARD_SPEED = 4.0
const VERTICAL_SPEED = 2.0
const LATERAL_SPEED = 2.0
const LERP_RETURN_FACTOR = 5.0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += FORWARD_SPEED * delta
	
	if Input.is_action_pressed("ui_left"):
		position.z -= LATERAL_SPEED * delta
		if $Visual.rotation.x > -PI / 6:
			$Visual.rotation.x = lerp($Visual.rotation.x, -PI/6, delta)
	elif Input.is_action_pressed("ui_right"):
		position.z += LATERAL_SPEED * delta
		if $Visual.rotation.x < PI / 6:
			$Visual.rotation.x = lerp($Visual.rotation.x, PI/6, delta)
	else:
		$Visual.rotation.x = lerp($Visual.rotation.x, 0.0, delta * LERP_RETURN_FACTOR)
	
	if Input.is_action_pressed("ui_down"):
		position.y -= VERTICAL_SPEED * delta
		if $Visual.rotation.z > -PI / 6:
			$Visual.rotation.z = lerp($Visual.rotation.z, -PI/6, delta)
	elif Input.is_action_pressed("ui_up"):
		position.y += VERTICAL_SPEED * delta
		if $Visual.rotation.z < PI / 6:
			$Visual.rotation.z = lerp($Visual.rotation.z, PI/6, delta)
	else:
		$Visual.rotation.z = lerp($Visual.rotation.z, 0.0, delta * LERP_RETURN_FACTOR)
