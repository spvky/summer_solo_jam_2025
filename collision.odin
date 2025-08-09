package main

import "core:math"
import l "core:math/linalg"

Collider :: struct {
	translation: Vec2,
	size:        Vec2,
}

find_nearest_point_on_collider :: proc(p: Vec2, collider: Collider) -> Vec2 {
	min := collider.translation - (collider.size / 2)
	max := collider.translation + (collider.size / 2)

	return l.clamp(p, min, max)
}

player_collision :: proc() {
	player := &world.player
	half_height := Vec2{0, player.height / 2}
	for collider in world.colliders {
		nearest_player := l.clamp(
			collider.translation,
			player.translation - half_height,
			player.translation + half_height,
		)
		nearest_collider := find_nearest_point_on_collider(player.translation, collider)
		if l.distance(nearest_player, nearest_collider) < player.radius {
			collision_vector := nearest_player - nearest_collider
			collision_normal := l.normalize0(collision_vector)
			player.translation += collision_vector
			if math.abs(l.dot(collision_normal, Vec2{1, 0})) > 0.7 {
				player.velocity.x = 0
			}
			if math.abs(l.dot(collision_normal, Vec2{0, 1})) > 0.7 {
				player.velocity.y = 0
			}
		}

	}
}
