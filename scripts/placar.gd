extends CanvasLayer
func _ready():
	$Control/labelMarioVida.text = str(VariaveisGobais.vida);

func _on_Mario_alterarPlacar(pontos):
	$Control/labelMoeda.text = str(pontos);

func _on_Mario_alterarVida():
	$Control/labelMarioVida.text = str(VariaveisGobais.vida);
