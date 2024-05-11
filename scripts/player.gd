extends CharacterBody2D

var SPEED = 250.0
var GRAVITY = 30
var JUMP_VELOCITY = 450.0

var positionStanding = preload("res://art/character_standing.png")
var positionRunLeft = preload("res://art/character_running_left.png")
var positionRunRight = preload("res://art/character_running_right.png")
var positionJumpLeft = preload("res://art/character_jumping_left.png")
var positionJumpRight = preload("res://art/character_jumping_right.png")
var isStanding = true
var switchRunStand = 1.0

const start_level_effect = preload("res://resources/start_level.mp3")
const jump_bing = preload("res://resources/jump_bing.wav")
const jump_bong = preload("res://resources/jump_bong.wav")
var start_effect_played: bool

func _ready():
	$Timer.connect("timeout", self._on_Timer_timeout)
	start_effect_played = AudioPlayer.get_level_started()
	if not start_effect_played:
		AudioPlayer.set_level_started(true)
		AudioPlayer.play_sound_effect(start_level_effect, 0)

func _physics_process(_delta):
	if not Settings.get_is_showed():
		# Get the input direction and handle the movement/deceleration.
		# move_left returns -1, move_right return 1, returns 0 otherwise
		var direction = Input.get_axis("move_left", "move_right")
		
		# Add the gravity.
		if not is_on_floor():
			if direction == -1:
				$Sprite2D.texture = positionJumpLeft
			elif direction == 1:
				$Sprite2D.texture = positionJumpRight
			velocity.y += GRAVITY
			if velocity.y > 2000:
				velocity.y = 2000
		else:
			if direction == -1:
				if isStanding:
					$Sprite2D.texture = positionStanding
				else:
					$Sprite2D.texture = positionRunLeft
			elif direction == 1:
				if isStanding:
					$Sprite2D.texture = positionStanding
				else:
					$Sprite2D.texture = positionRunRight
			else:
				$Sprite2D.texture = positionStanding

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = -JUMP_VELOCITY # Up means negative
			var sound_idx = randi() % 2
			if sound_idx == 0:
				AudioPlayer.play_sound_effect(jump_bing)
			else:
				AudioPlayer.play_sound_effect(jump_bong)
		
		velocity.x = direction * SPEED
		
		if Input.is_action_just_pressed("escape_close_level"):
			call_deferred("escape_to_main_menu")

		move_and_slide()

func _on_Timer_timeout():
	isStanding = not isStanding

func escape_to_main_menu():
	get_tree().change_scene_to_file("res://scenes/control.tscn")
