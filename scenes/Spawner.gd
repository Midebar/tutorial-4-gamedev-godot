extends Node2D

export (PackedScene) var obstacle
export var start_cooldown = 5
export var cooldown = 1

func _ready():
	yield(get_tree().create_timer(start_cooldown), "timeout")
	repeat()

func spawn():
	var spawned = obstacle.instance()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x + rand_range(-25, 25)

	spawned.global_position = spawn_pos

func repeat():
	spawn()
	yield(get_tree().create_timer(cooldown), "timeout")
	repeat()
