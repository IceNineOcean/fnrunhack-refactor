extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var axis = Vector3(0,1,0)
	var rotation_amount = 0.005
	transform.basis = Basis(axis,rotation_amount) * transform.basis
