extends MenuButton

@export var MenuName : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var popup_menu = get_popup()
	popup_menu.connect("id_pressed", SetButtonPress)


func SetButtonPress(_id) -> void:
	match MenuName:
		"File":
			match _id:
				0:
					ShutDown()
		"Edit":
			match _id:
				0:
					Undo()
				1:
					Redo()
				2:
					NullButton()
				3:
					Cut()
				4:
					Copy()
				5:
					Paste()
				6:
					Delete()
				7:
					SelectAll()
		"Options":
			match _id:
				0:
					NullButton()
				1:
					LogIn()
				2:
					SignOut()
		"Window":
			match _id:
				0:
					NullButton()
		"Help":
			match _id:
				0:
					About()


func ShutDown() -> void:
	get_tree().quit()


func Undo() -> void:
	pass


func Redo() -> void:
	pass


func NullButton() -> void:
	pass


func Cut() -> void:
	pass


func Copy() -> void:
	pass


func Paste() -> void:
	pass


func Delete() -> void:
	pass


func SelectAll() -> void:
	pass


func LogIn() -> void:
	pass


func SignOut() -> void:
	pass


func About() -> void:
	pass
