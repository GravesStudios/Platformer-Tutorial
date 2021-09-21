extends KinematicBody2D

# Continue With Tutorial - https://www.youtube.com/watch?v=z--IEsXl5zc&t=127s

const SPEED = 420
const GRAVITY = 35
const JUMP_STRENGTH = -800
var velocity = Vector2(0, 0)

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		$sprite.play("walk")
		$sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		$sprite.play("walk")
		$sprite.flip_h = true
	else:
		$sprite.play('idle')
		
	if not is_on_floor():
		$sprite.play('air')
		
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_STRENGTH
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.2)
	#End of Phsyics Process



func _on_Fall_Zone_body_entered(body):
	if body.get_name() == 'Player':
		get_tree().change_scene("res://Level1.tscn")
	# End of Fall_Zone_body_entered Function


# Line Notes
	# Line 13 - $sprite
		# The Dollar sign represents everything related to this scene. You have
		# access to the whole node tree. This is how I was able to select the 
		# correct animationt to play with .show() and flipping the horizontal
		# axis when going left or right.

	# Line 25 - velocity.y = velocity.y + GRAVITY 
		# This is gravity here.
		# This takes the current y value and add 30. This to simulate increasing
		# Strength

	# Line 30 - velocity = move_and_slide(velocity, Vector2.UP) 
		# Move and Slide returns an updated version of move_and_slide
		# The second paramater sets the direction for the top of the game.
		
		
	# Line 32 - velocity.x = lerp(velocity.x, 0, 0.2)
		# The lerp function is linear interplation. It takes in a number to
		# start with, what number we want to end at, and the weight.
		
		# This is what lets the player come to a gradual stop when the keys are not
		# being pressed.

		# This is equivalent to counting down from velocity.x to 0 every frame by 20%.

	# Line 37 - Signal Function
		# This is a signal that is sent when a body hits the area 2d labeled Fall
		# Zone in the node tree. This currently just restarts the scene.
