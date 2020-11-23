extends KinematicBody2D

export var velocidade = 200;
var gravidade = 10;
var pontuacao = 0;

signal alterarVida;
signal alterarPlacar;

var movimento = Vector2(0, 0);
var direcao = 0;
var inverteChao = Vector2(0, -1);


func _physics_process(delta):
	movimento.y += gravidade;
	
	if Input.is_action_pressed("ui_left"):
		$Sprite.play("andando");
		$Sprite.flip_h = true;
		direcao = -1;
	elif Input.is_action_pressed("ui_right"):
		$Sprite.play("andando");
		$Sprite.flip_h = false;
		direcao = 1;
	else:
		direcao = 0;
		if is_on_floor():
			$Sprite.play("parado");
			
	movimento.x = direcao * velocidade;
	
	if movimento.x > 0:
		#indo para a direita
		$Sprite.flip_h = false;
	elif movimento.x < 0:
		$Sprite.flip_h = true;
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			movimento.y = -500;
			$".".get_node("Node2D/salto").play();
	else:
		$Sprite.play("caindo");
		
	movimento = move_and_slide(movimento, inverteChao);
	
# Mario morreu
func morrer():
	$Node2D/perdeuvida.play();
	if VariaveisGobais.vida == 1:
		get_tree().change_scene("res://scenes/GameOver.tscn");
	else:
		VariaveisGobais.vida -= 1;
	emit_signal("alterarVida");
	$Sprite.play("morto", VariaveisGobais.vida);
	
func get_moeda():
	pontuacao += 1;
	$".".get_node("Node2D/getmoeda").play();
	if pontuacao == 15:
		VariaveisGobais.vida += 1
		pontuacao = 0;
		$".".get_node("Node2D/vida").play();
		emit_signal("alterarVida");
	emit_signal("alterarPlacar", pontuacao);
	
func caiuBuraco():
	$".".get_tree().change_scene("res://scenes/GameOver.tscn");
	
func _on_Area2D_body_entered(body):
	if body.find_parent("Inimigos") != null:
		body.morrer();
		$Node2D/morteinimigo.play();
		movimento.y = -500;
		movimento = move_and_slide(movimento, inverteChao);
