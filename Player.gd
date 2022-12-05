extends KinematicBody2D
export var speed = 400 # How fast the player will move (pixels/sec).

var screen_size # Size of the game window.


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	velocity = move_and_slide(velocity)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up"
		
	elif velocity.y > 0:
		$AnimatedSprite.animation = "down"
	
	var collider_maps = {
		'TileMap2':"res://BattleScene/Level1.tscn",
		'collisionb2':"res://BattleScene/Level2.tscn",
		'cgrass':"res://BattleScene/Level3.tscn",
		'castlecoll':"res://BattleScene/Level4.tscn",
		'techcoll':"res://BattleScene/Level5.tscn",
		'oceancoll':"res://BattleScene/Level6.tscn"
		}
	#breaking here maybe
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		
		if collision.collider.name in collider_maps:
			get_tree().change_scene(collider_maps[collision.collider.name])
			

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
