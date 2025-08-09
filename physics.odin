package main

physics_step :: proc() {
	apply_gravity()
	player_collision()
	apply_velocity()
}

apply_velocity :: proc() {
	player := &world.player
	player.translation += player.velocity
}

apply_gravity :: proc() {
	player := &world.player
	player.velocity.y += 10 * TICK_RATE
}
