extends Node2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

func _ready() -> void:
	_create_world()


func _create_world() -> void:
	for x in range(0,20):
		for y in range(0,20):
			var cell := Vector2i(x,y)
			tile_map_layer.set_sell(cell,0,Vector2i.ZERO) 
			
			
			
			
