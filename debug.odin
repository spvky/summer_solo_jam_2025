package main

import "core:c"
import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

player_debug :: proc() {
	player := world.player
	debug_string := fmt.tprintf(
		"State: %v\nTranslation: [%.0f,%.0f]\nVelocity: [%.0f,%.0f]",
		player.state,
		player.translation.x,
		player.translation.y,
		player.velocity.x,
		player.velocity.y,
	)
	rl.DrawText(strings.clone_to_cstring(debug_string), 10, 10, 16, rl.WHITE)
}

inputs_debug :: proc(x: i32 = 10, y: i32 = 100) {
	rl.DrawRectangle(x, y, 50, 200, rl.WHITE)
	for v, k in input_buffer.actions {
		if _, action_buffered := input_buffer.actions[k].(f32); action_buffered {
			input_name := fmt.tprintf("%v", k)
			y_pos: c.int = y + 5 + (c.int(k) * 20)
			rl.DrawText(strings.clone_to_cstring(input_name), 12, y_pos, 16, rl.BLACK)
		}
	}
}
