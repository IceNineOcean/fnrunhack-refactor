extends RayCast3D


var current_object

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_colliding():
		var object = get_collider()
		if object == current_object:
			return
		else:
			current_object = object
	else:
		current_object = null
