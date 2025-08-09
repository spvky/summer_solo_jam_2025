package main

physics_step :: proc() {
	jump()
	apply_gravity()
	player_collision()
	apply_velocity()
}

apply_velocity :: proc() {
	player := &world.player
	player.translation += player.velocity * TICK_RATE
}

apply_gravity :: proc() {
	player := &world.player
	if player.velocity.y < 0 {
		player.velocity.y += rising_gravity
	} else {
		player.velocity.y += falling_gravity
	}
}
