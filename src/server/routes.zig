const std = @import("std");
const zap = @import("zap");
const tables = @import("tables/module.zig");

const User = struct {
    id: []u8,
    name: []u8,
    password: []u8,
    email: []u8,
    token: []u8,
    verified: bool,
    verification_code: []u8,
};

fn on_req(req: zap.SimpleRequest) void {
    if (req.path) |path| {
        if (!std.mem.startsWith([]u8, path, "/api/"))
            return;

        if (std.mem.startsWith([]u8, path[6..], "user")) {
            const user_id = tables.user.get_user_id(path);
            const user = users.get(user_id);
            _ = user;
        }
    }
}

const UserMap = std.AutoHashMap(u32, User);
const users: UserMap = undefined;

pub fn main() !void {
    var listener = zap.SimpleHttpListener.init(.{
        .port = 3000,
    });
    try listener.listen();
}
