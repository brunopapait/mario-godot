extends KinematicBody2D

var velocidade = 200;
var gravidade = 10;

var movimento = Vector2(0, -1);
var direcao = 0;
var inverteChao = Vector2(0, -1);

func _physics_process(delta):
	movimento.y += gravidade;
	
	if Input.is_action_pressed("ui_right"):
		$Sprite.play("andando");
		$Sprite.flip_h = true;
		direcao = -1;
	elif Input.is_action_pressed("ui_left"):
		$Sprite.play("andando");
		$Sprite.flip_h = false;
		direcao = 1;
	else:
		$Sprite.play("parado");
		direcao = 0;
	movimento.x = direcao * velocidade;
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			movimento.y = -500;
	else:
		$Sprite.play("caindo");
	movimento = move_and_slide(movimento, inverteChao);
	
