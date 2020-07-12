extends KinematicBody2D

var dir = Vector2.ZERO
var speed = 1.0
var alive = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !alive and !$CPUParticles2D.emitting:
		queue_free()

func _physics_process(delta):
	var collision
	if alive:
		 collision = move_and_collide((dir*speed)*delta)
	if collision:
		alive = false
		$CollisionShape2D.disabled = true
		$Sprite.visible = false
		$CPUParticles2D.emitting = true
		
func init(dir: Vector2, speed: float):
	self.dir = dir
	self.speed = speed
	self.rotation_degrees = rad2deg(dir.angle())-90