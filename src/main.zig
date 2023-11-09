const std = @import("std");
const rl = @import("raylib");
const scenes = @import("scenes/module.zig");
const lib = @import("lib/object.zig");

pub fn main() !void {
    const screenWidth = 800;
    const screenHeight = 450;

    const allocator: std.mem.Allocator = std.heap.page_allocator;

    // List of scenes
    const scene_list = std.ArrayList(lib.Scene).init(allocator);
    defer scene_list.deinit();

    // ---------------------------------------------

    // Scene: Login
    var login_scene = lib.Scene{ .name = "Login", .color = rl.Color.white, .objects = std.ArrayList(lib.SceneObject).init(allocator) };

    try login_scene.add_object(lib.SceneObject{
        .name = "login_text",
        .color = rl.Color.black,
        .start_position = rl.Vector2.init(100, 150),
        .end_position = rl.Vector2.init(190, 200),
    });

    rl.initWindow(screenWidth, screenHeight, "Moapi");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    var i: usize = 0;
    _ = i;

    while (!rl.windowShouldClose()) {
        var current_scene: lib.Scene = scene_list.items[0];

        try current_scene.print();

        //if (rl.isKeyPressed(rl.KeyboardKey.key_enter)) {
        //    if (i < scene_list.items.len - 1) {
        //        i += 1;
        //    } else {
        //        i = 0;
        //    }
        //}
    }
}
