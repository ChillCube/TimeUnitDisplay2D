extends NumbersUI2D
class_name TimeUnitDisplay2D

@export var time_resource : ClockResource
@export_enum("SECONDS", "MINUTES", "HOURS") var unit : int = 0;

var clock : Clock;

signal a_second_passed
signal an_hour_passed
signal a_day_passed

func _ready() -> void:
	clock = Clock.new();
	clock.time_resource = time_resource;
	add_child(clock)
	clock.connect("a_second_passed", _on_second_passed)
	clock.connect("an_hour_passed", _on_hour_passed)
	clock.connect("a_day_passed", _on_day_passed)

func _on_second_passed():
	emit_signal("a_second_passed")
	match unit:
		0: # seconds
			number = time_resource.seconds;
		1: # minutes
			number = time_resource.minutes;
		2: # hours
			number = time_resource.hours;

func _on_hour_passed():
	emit_signal("an_hour_passed")

func _on_day_passed():
	emit_signal("a_day_passed")
