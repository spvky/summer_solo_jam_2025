package main

import rl "vendor:raylib"

World :: struct {
	player: Player,
}

make_world :: proc() -> World {
	return World{}
}
