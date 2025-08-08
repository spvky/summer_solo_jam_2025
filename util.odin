package main

import "core:strings"
import "utils"
import rl "vendor:raylib"

Vec3 :: [3]f32
Vec2 :: [2]f32

extend :: proc(v: Vec2, z: f32) -> Vec3 {
	return {v.x, v.y, z}
}

load_texture :: proc(filename: string) -> rl.Texture {
	when ODIN_OS == .JS {
		return utils.load_texture(filename)
	}
	return rl.LoadTexture(strings.clone_to_cstring(filename))
}
