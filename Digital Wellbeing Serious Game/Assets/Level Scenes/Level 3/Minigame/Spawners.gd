extends Node2D

@onready var globalRef = get_node("/root/Global")
@export var bug : PackedScene

var dirPool = [[Vector2(0,1),Vector2(0,300)],[Vector2(0,-1),Vector2(0,-300)],[Vector2(1,0),Vector2(300,0)],[Vector2(-1,0),Vector2(-300,0)]] #Up, Down, Left, Right
var locationVector = Vector2(480,270)

#Screen Size	= 960x540
#Scene Size 	= 540x540
#Spawn Areas: Vector2(480,0),Vector2(480,540),Vector2(210,270),Vector2(750,270)



func _on_timer_timeout():
	#if globalRef.level3MiniStart:
	var spawnDir = dirPool.pick_random()
	print(spawnDir[1])
	var spawned = bug.instantiate()
	spawned.set_position(spawnDir[1])
	spawned.dir = spawnDir[0]
	add_child(spawned)

