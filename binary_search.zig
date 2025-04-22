//Binary search in zig

const std = @import("std");

fn binary_search(slice: []const i32, val: i32) ?usize {
    var l: usize = 0;
    var r: usize = slice.len;

    while (l < r) {
        const m: usize = (l + r) / 2;
        if (slice[m] == val) {
            return m;
        } else if (slice[m] > val) {
            r = m;
        } else {
            l = m + 1;
        }
    }

    return null;
}

pub fn main() void {
    const arr = [_]i32{ 1, 2, 3, 4, 5 };

    const idx = binary_search(&arr, 50);
    if (idx == null) {
        std.debug.print("Not found\n", .{});
        return;
    }

    std.debug.print("found at {any}\n", .{idx});
}
