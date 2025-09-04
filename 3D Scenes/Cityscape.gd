extends MultiMeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in range(3):
		for i in range(36):
			multimesh.set_instance_transform(n*36+i,Transform3D(Basis(),Vector3((((n*12.5)+(randi_range(0,2)-1)*2.5)),(randi_range(0,4)-2)*5.0,(i*12.5)+(randi_range(0,2)-1)*2.5)))
