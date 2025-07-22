extends Control
class_name Transition

@onready var transition_mask: ColorRect = %TransitionMask
@onready var transition_player: AnimationPlayer = %TransitionPlayer


class TransitionType:
	static var fade_in: String = "fade_in";
	static var fade_out: String = "fade_out";
