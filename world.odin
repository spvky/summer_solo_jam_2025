package main

import rl "vendor:raylib"

World :: struct {
	player:    Player,
	camera:    rl.Camera2D,
	colliders: [dynamic]Collider,
}

make_world :: proc() -> World {
	colliders := make([dynamic]Collider, 0, 8)
	append(&colliders, Collider{translation = Vec2{0, 100}, size = Vec2{100, 10}})
	camera := rl.Camera2D {
		offset = {SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2},
		zoom   = 1,
		target = {0, 0},
	}
	return World{player = make_player(), colliders = colliders, camera = camera}
}
