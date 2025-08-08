package main

import rl "vendor:raylib"

Player :: struct {
	translation: Vec2,
	velocity:    Vec2,
	height:      f32,
	radius:      f32
}

make_player :: proc(translation: Vec2 = {0,0}, height: f32 = 20, radius: f32 = 5) -> Player {
	return Player {translation = translation, height = height, radius = radius}
}

render_player :: proc() {
	player := world.player

	rl.DrawCircleV(player.translation, 20, rl.WHITE)
}
