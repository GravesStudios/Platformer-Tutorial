extends CanvasLayer

var coinsCount = 0
const coinLimit = 4

func _ready():
	$CoinCount.text = String(coinsCount)




func _on_coin_collected():
	coinsCount += 1
	$CoinCount.text = String(coinsCount)	
	if coinsCount == coinLimit:
		get_tree().change_scene("res://Level1.tscn")
