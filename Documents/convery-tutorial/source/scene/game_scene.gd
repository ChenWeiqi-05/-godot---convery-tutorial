extends Node2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@export  var region_size := Vector2i(20,20)
var _astar := AStarGrid2D.new() #初始化Astar

func _ready() -> void:
	_astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	_astar.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	_astar.default_estimate_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	_create_world()


func _create_world() -> void:
	for x in range(0,region_size.x):
		for y in range(0,region_size.y):
			var cell := Vector2i(x,y)
			if(x + y) % 2 ==1:
				tile_map_layer.set_cell(cell,0,Vector2i.ZERO) 
			else:		
				tile_map_layer.set_cell(cell,0,Vector2i(1,0)) 
			
			
