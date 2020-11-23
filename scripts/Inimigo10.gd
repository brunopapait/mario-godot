extends StaticBody2D

export var vel = 30
export var dist = 150

var posicaoInicial;
var posicaoFinal;
var flip;

func _ready():
	posicaoInicial = $".".position.x
	posicaoFinal = posicaoInicial + dist
	flip = false
	$AnimatedSprite.play("andando")
	
func _process(delta):
	
	if $".".position.x < posicaoFinal and flip == false: 
		$".".position.x += vel * delta 
		if $".".position.x >= posicaoFinal:
			flip = true
		
	if $".".position.x > posicaoInicial and flip == true:
		$".".position.x -= vel * delta 
		if $".".position.x <= posicaoInicial:
			flip = false
			
	$AnimatedSprite.flip_h = flip	
	
func morrer():
	$".".queue_free();

func _on_Area2D_body_entered(body):
	if body.get_name() == "Mario":
		body.morrer();

