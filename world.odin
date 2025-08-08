package main

import rl "vendor:raylib"

World :: struct {
	player: Player,
	colliders: [dynamic]Collider
}

make_world :: proc() -> World {
	return World{player=make_player()}
}


