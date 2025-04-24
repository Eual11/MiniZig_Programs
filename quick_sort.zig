/// Quick Sort Implementation
const std = @import("std");
fn quick_sort(arr: []i32, l: usize, r: usize) void {
    if (l < r) {
        const m = partition(arr, l, r);
        if (m != 0)
            quick_sort(arr, l, m - 1);
        quick_sort(arr, m + 1, r);
    }
}

fn partition(arr: []i32, l: usize, r: usize) usize {
    var i: isize = @as(isize, @intCast(l)) - 1;

    const pivot: i32 = arr[r];

    for (l..r) |j| {
        if (arr[j] < pivot) {
            i += 1;
            std.mem.swap(i32, &arr[@as(usize, @intCast(i))], &arr[j]);
        }
    }

    std.mem.swap(i32, &arr[@as(usize, @intCast(i + 1))], &arr[r]);

    return @as(usize, @intCast(i + 1));
}

pub fn main() void {
    var arr: [6]i32 = [6]i32{ 1, -1, 388, -4, 9, 3 };

    for (arr) |val| {
        std.debug.print("{}, ", .{val});
    }
    std.debug.print("\n", .{});
    quick_sort(&arr, 0, arr.len - 1);

    for (arr) |val| {
        std.debug.print("{}, ", .{val});
    }
}
