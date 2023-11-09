const std = @import("std");
const rl = @import("raylib");

pub fn draw_login() !void {
    rl.beginDrawing();
    defer rl.endDrawing();

    rl.clearBackground(rl.Color.black);
    rl.drawText("Login", 10, 10, 20, rl.Color.white);
}
