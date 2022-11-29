extends KinematicBody2D
signal hit
export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


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
		
#	position += velocity * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
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
		# print("Collided with: ", collision.collider.name)
		# if collision.collider.name == "TileMap2":
		# 	get_tree().change_scene("res://BattleScene/Level6.tscn")
		
		if collision.collider.name in collider_maps:
			get_tree().change_scene(collider_maps[collision.collider.name])
			


func _on_Player_body_entered(body):
	hide() # Player disappears after being hit.
	emit_signal("hit")
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
