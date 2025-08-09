package main

import rl "vendor:raylib"

render_scene :: proc() {
	rl.BeginTextureMode(screen_texture)
	rl.BeginDrawing()
	rl.BeginMode2D(world.camera)
	rl.ClearBackground({0, 12, 240, 255})
	// Draw the scene here
	draw_colliders()
	render_player()
	rl.DrawCircleV(feet, 5, rl.RED)
	rl.EndMode2D()
	rl.EndTextureMode()
}

draw_to_screen :: proc() {
	rl.BeginDrawing()
	rl.ClearBackground(rl.BLACK)
	source := rl.Rectangle {
		x      = 0,
		y      = 0,
		width  = SCREEN_WIDTH,
		height = -SCREEN_HEIGHT,
	}
	dest := rl.Rectangle {
		x      = 0,
		y      = 0,
		width  = f32(WINDOW_WIDTH),
		height = f32(WINDOW_HEIGHT),
	}
	rl.DrawTexturePro(screen_texture.texture, source, dest, {0, 0}, 0, rl.WHITE)
	player_debug()
	inputs_debug()
	rl.EndDrawing()
}

draw_colliders :: proc() {
	for collider in world.colliders {
		draw_translation := collider.translation - (collider.size / 2)
		rl.DrawRectangleV(draw_translation, collider.size, rl.WHITE)
	}
}
