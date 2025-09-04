extends CharacterBody3D

var health : float = 3.0

func _physics_process(delta: float) -> void:
	if health <= 0.0:
		pass
