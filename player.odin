package main

Player :: struct {
	translation: Vec2,
	velocity:    Vec2,
}

make_player :: proc(translation: Vec2) -> Player {
	return Player {translation = translation}
}

render_player: 
