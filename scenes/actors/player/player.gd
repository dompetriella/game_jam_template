extends CharacterBody2D
class_name Player

@export var move_speed: float = 300.0
var can_move: bool = true;

func _ready() -> void:
#For Template Only
	BumperEvents.bumper_collided.connect(_on_bumper_collision);
	
	TransitionEvents.transition_started.connect(func(): self.can_move = false)
	TransitionEvents.transition_ended.connect(func(): self.can_move = true)

func _physics_process(delta: float) -> void:
	var input_vector := Vector2.ZERO
	
	if (can_move):
		if Input.is_action_pressed("ui_right"):
			input_vector.x += 1
		if Input.is_action_pressed("ui_left"):
			input_vector.x -= 1
		if Input.is_action_pressed("ui_down"):
			input_vector.y += 1
		if Input.is_action_pressed("ui_up"):
			input_vector.y -= 1
		
		input_vector = input_vector.normalized();
		velocity = input_vector * move_speed
		move_and_slide()

# For Template Only
var bumper_collisions: int = 0;

func _on_bumper_collision():
	bumper_collisions += 1;
	UiEvents.update_bumper_number.emit(bumper_collisions);
