extends CharacterBody2D

const SPEED = 700
const JUMP_VELOCITY = -600.0

var gravity = 1500

func _physics_process(delta):
	velocity.y += gravity * delta

	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
		velocity.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * SPEED
		if velocity.x != 0:
			$AnimatedSprite2D.play("run")
			if Input.get_action_strength("ui_left") > 0:
				$AnimatedSprite2D.scale.x = -1
			else:
				$AnimatedSprite2D.scale.x = 1
		else:
			$AnimatedSprite2D.play("Idle")
	else:
		$AnimatedSprite2D.play("jump")

	move_and_slide()
