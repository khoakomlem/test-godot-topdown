extends Node2D
class_name Wolf

@onready var mob_movement: MobMovement = $MobMovement
@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var animation_player: AnimationPlayer = $View/Sprite2D/AnimationPlayer
# @onready var control: Control = $Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	rotation = lerp_angle(rotation, mob_movement.toRotation, 0.15)
	# velocity_component.velocity.x = cos(mob_movement.toRotation) * mob_movement.currentSpeed
	# velocity_component.velocity.y = sin(mob_movement.toRotation) * mob_movement.currentSpeed
	position += velocity_component.velocity * delta

func _process(delta: float) -> void:
	pass
	# control.rotation = -rotation


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		pass


func _on_hurtbox_received_damage(damage: int) -> void:
	animation_player.play("hit")
