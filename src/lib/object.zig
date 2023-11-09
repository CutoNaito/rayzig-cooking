const std = @import("std");
const rl = @import("raylib");

pub const SceneObject = struct {
    name: *const [10:0]u8,
    color: rl.Color,
    start_position: rl.Vector2,
    end_position: rl.Vector2,

    pub fn draw(self: *const SceneObject) !void {
        for (@as(usize, @intFromFloat(self.start_position.x))..@as(usize, @intFromFloat(self.end_position.x))) |x| {
            for (@as(usize, @intFromFloat(self.start_position.y))..@as(usize, @intFromFloat(self.end_position.y))) |y| {
                rl.beginDrawing();
                defer rl.endDrawing();
                rl.drawPixel(@intCast(x), @intCast(y), self.color);
            }
        }
    }
};

pub const Scene = struct {
    name: *const [5:0]u8,
    objects: std.ArrayList(SceneObject),
    color: rl.Color,

    pub fn add_object(self: *Scene, object: SceneObject) !void {
        try self.objects.append(object);
    }

    pub fn print(self: *Scene) !void {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(self.color);

        rl.drawText(self.name, 10, 10, 20, rl.Color.white);

        for (self.objects.items) |object| {
            try object.draw();
        }
    }
};
