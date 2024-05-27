extends CharacterBody2D

@export var accel : int = 15
@export var max_speed : int = 100
@export var friction : float = 15

func _physics_process(_delta):
	var input_vector : Vector2 = Vector2.ZERO
	#get the input from the sticks
	#TODO make correct input - do not use UI input
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#normalize the vector - so that it is exactly 1 unit in length
	input_vector = input_vector.normalized() 
	
	#if there's input, set our velocity to our input
	#else, set our velocity to zero
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector*max_speed, accel)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
		
	move_and_slide() #move - and return if we collide - which will introduce a bounce if needed
