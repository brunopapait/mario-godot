extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$placar.get_node("Control/labelMarioVida").add_color_override("font_color", Color(0,0,0));
	$placar.get_node("Control/labelMoeda").add_color_override("font_color", Color(0,0,0));
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.get_name() == 'Mario':
		$".".get_tree().change_scene("res://scenes/Fase4.tscn");
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	$musicafundo.play();
	pass # Replace with function body.
