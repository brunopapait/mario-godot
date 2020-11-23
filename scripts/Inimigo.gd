extends KinematicBody2D

export var velocidade = 15;
const gravidade = 100;
var movimento = Vector2();
var muda_chao = Vector2(0, -1);
var direcao;

func _ready():
	$AnimatedSprite.play("andando");
	direcao = 1;
	
func _process(delta):
	if is_on_wall():
		direcao *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h;
	
	movimento.x = velocidade * direcao;
	movimento.y += gravidade
	movimento = move_and_slide(movimento, muda_chao);

func _on_Area2D_body_entered(body):
	if body.get_name() == "Mario":
		body.morrer();

func morrer():
	$".".queue_free();
