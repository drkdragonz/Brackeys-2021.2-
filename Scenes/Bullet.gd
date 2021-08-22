extends Node2D


const speed = 100

func _process(delta):
	position += transform.x * speed * delta


func _on_KillTimer_timeout():
	queue_free()


func _on_Bullet_area_entered(area):
	if area.is_in_group("player"):
		queue_free()
