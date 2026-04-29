# Convery Tutorial

A simple 2D game project built with Godot 4.

## Features

- **TileMap World Generation**: Procedurally generates a tile-based world with alternating tile patterns
- **A* Pathfinding**: Integrated AStarGrid2D for pathfinding with Manhattan heuristic
- **Camera Controls**:
  - Mouse wheel to zoom in/out
  - Right-click drag to pan
  - Keyboard (arrow keys) to move camera
  - Edge scrolling when mouse near screen boundaries

## Project Structure

```
convery-tutorial/
├── main.tscn              # Main scene
├── main.gd                # Main script
├── project.godot          # Godot project configuration
├── source/
│   └── scene/
│       ├── game_scene.tscn
│       └── game_scene.gd  # Game scene with TileMap and Camera
└── icon.svg               # Project icon
```

## Getting Started

1. Open this project in Godot 4.x
2. Press F5 to run the project
3. Select `main.tscn` as the main scene

## Requirements

- Godot Engine 4.x

## License

MIT License