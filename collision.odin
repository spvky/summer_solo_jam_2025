package main

import l "core:math/linalg"

Collider :: struct {
	translation: Vec2,
	size: Vec2
}

find_nearest_point_on_collider :: proc(p: Vec2, collider: Collider) -> Vec2 {
	min := collider.translation - (collider.size / 2)
	max := collider.translation + (collider.size / 2)

	return l.clamp(p,min,max)
}

player_collision :: proc() {
	player := &world.player
	half_height := Vec2 {0,player.height/2}
	for collider in world.colliders {
		nearest_player := l.clamp(collider.translation, player.translation - half_height, player.translation + half_height)
		nearest_collider := find_nearest_point_on_collider(player.translation, collider)
		if l.distance(nearest_player, nearest_collider) < player.radius {
			
		}

	}
}
