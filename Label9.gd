extends Label

var page = 0

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		page += 1
		
		if page == 1:
			set_text("¿Seguro?")
		elif page == 2:
				get_tree().change_scene("Inicio10.tscn")
