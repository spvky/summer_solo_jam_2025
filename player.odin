package main

import "core:math"
import l "core:math/linalg"
import rl "vendor:raylib"

Player :: struct {
	state:            Player_State,
	translation:      Vec2,
	snapshot:         Vec2,
	velocity:         Vec2,
	height:           f32,
	radius:           f32,
	grounded_lockout: f32,
}

Player_State :: enum {
	Grounded,
	Airborne,
}
////////////// Physics values ///////////////////

// How far can the player jump horizontally (in pixels)
MAX_JUMP_DISTANCE: f32 : TILE_SIZE * 3
// How long to reach jump peak (in seconds)
TIME_TO_PEAK: f32 : 0.35
// How long to reach height we jumped from (in seconds)
TIME_TO_DESCENT: f32 : 0.2
// How many pixels high can we jump
JUMP_HEIGHT: f32 : TILE_SIZE * 2

max_speed := calculate_max_speed()
jump_speed := calulate_jump_speed()
rising_gravity := calculate_rising_gravity()
falling_gravity := calculate_falling_gravity()


calulate_jump_speed :: proc() -> f32 {
	return (-2 * JUMP_HEIGHT) / TIME_TO_PEAK
}

calculate_rising_gravity :: proc() -> f32 {
	return (2 * JUMP_HEIGHT) / math.pow(TIME_TO_PEAK, 2)
}

calculate_falling_gravity :: proc() -> f32 {
	return (2 * JUMP_HEIGHT) / math.pow(TIME_TO_DESCENT, 2)
}

calculate_max_speed :: proc() -> f32 {
	return MAX_JUMP_DISTANCE / (TIME_TO_PEAK + TIME_TO_DESCENT)
}

//////////////////////////////////////////////

make_player :: proc(translation: Vec2 = {0, 0}, height: f32 = 20, radius: f32 = 16) -> Player {
	return Player{translation = translation, height = height, radius = radius}
}

render_player :: proc() {
	player := world.player
	top := player.translation - Vec2{0, player.height / 2}
	bot := player.translation + Vec2{0, player.height / 2}

	rl.DrawCircleV(top, player.radius, rl.WHITE)
	rl.DrawCircleV(bot, player.radius, rl.WHITE)
}

jump :: proc() {
	player := &world.player
	if player.grounded_lockout > 0 {
		player.grounded_lockout = l.clamp(player.grounded_lockout - TICK_RATE, 0, 1)
	}
	if is_action_buffered(.Jump) && player.state == .Grounded {
		player.velocity.y = jump_speed
		consume_action(.Jump)
		player.grounded_lockout = 0.15
	}
}
