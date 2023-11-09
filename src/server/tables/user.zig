const std = @import("std");

pub fn get_user_id(path: []u8) u32 {
    return @as(u32, @intCast(path[6..] - 0x30));
}
