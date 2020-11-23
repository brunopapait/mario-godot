extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_Start_pressed():
	get_tree().change_scene("res://scenes/mundo.tscn");


func _on_Sair_pressed():
	get_tree().quit();


func _on_Sobre_pressed():
	get_tree().change_scene("res://scenes/Sobre.tscn");
	pass # Replace with function body.


func _on_AudioStreamPlayer2D_finished():
	$AudioStreamPlayer2D.play();
	pass # Replace with function body.
