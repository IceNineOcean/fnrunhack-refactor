extends Node

@export var data_path : String
var item_data := {}
var item_grid_data := {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_data(data_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func load_data(_path : String) -> void:
	var config = ConfigFile.new()
	var err = config.load(_path)
	
	if err != OK:
		return
	
	for _section in config.get_sections():
		var _temp_section_dict := {}
		for _key in config.get_section_keys(_section):
			_temp_section_dict[_key] = config.get_value(_section, _key)
			if _key == "Grid":
				var _temp_grid_array := []
				for _point in config.get_value(_section, _key).split("/"):
					_temp_grid_array.push_back(_point.split(","))
				item_grid_data[_section] = _temp_grid_array
		item_data[_section] = _temp_section_dict
