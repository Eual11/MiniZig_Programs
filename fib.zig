///trivial recursive implementation
const std = @import("std");
fn fib(n: u32) u32 {
    if (n <= 1) {
        return 1;
    }
    return fib(n - 2) + fib(n - 1);
}

pub fn main() void {
    std.debug.print("{} \n", .{fib(5)});
}
