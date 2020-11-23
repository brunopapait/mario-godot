extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_somfundo_finished():
	$somfundo.play();
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.get_name() == 'Mario':
		$".".get_tree().change_scene("res://scenes/Fase3.tscn");
	pass # Replace with function body.
