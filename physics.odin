package main

physics_step :: proc() {
	apply_gravity()
	player_collision()
	jump()
	apply_velocity()
}

apply_velocity :: proc() {
	player := &world.player
	player.translation += player.velocity * TICK_RATE
}

apply_gravity :: proc() {
	player := &world.player
	if player.velocity.y > 0 {
		player.velocity.y += rising_gravity * TICK_RATE
	} else {
		player.velocity.y += falling_gravity * TICK_RATE
	}
}
