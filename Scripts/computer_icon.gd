extends Node2D

@onready var IconRect_path = $Icon

var icon_key : String
var icon_grids := []
var selected = false
var grid_anchor = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func load_item(_icon_key : String) -> void:
	var icon_path = "" #Path to generic icons based on keys
	IconRect_path.texture = load(icon_path)
