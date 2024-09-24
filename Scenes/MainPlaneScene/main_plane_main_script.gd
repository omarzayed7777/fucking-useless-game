extends Node3D

const FORWARD_SPEED = 4.0 # The speed in which the plane moves forward
const VERTICAL_SPEED = 2.0 # The speed in which the plane moves vertically when up or down pressed
const LATERAL_SPEED = 2.0 # The speed in which the plane moves 'horizontally' when left or right pressed
const LERP_RETURN_FACTOR = 5.0 # A factor used to make the plane return to its normal rotations at a particular pace
const PROPELLER_SPEED = 100.0

func _process(delta):
	position.x += FORWARD_SPEED * delta
	$Visual/biPlane/RootNode/biplaneProp.rotation.x += PROPELLER_SPEED * delta
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
