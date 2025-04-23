/// Sieve of Eratosthenes
/// Algorithm to find prime numbers less than N
const std = @import("std");

pub fn main() void {
    const n = 6;

    var primes: [n]bool = .{true} ** (n);

    var i: usize = 2;
    while (i <= std.math.sqrt(n)) : (i += 1) {
        if (primes[i]) {
            var j: usize = i * i;
            while (j < primes.len) : (j += i) {
                primes[j] = false;
            }
        }
    }

    for (2..n) |idx| {
        if (primes[idx]) {
            std.debug.print("{}, ", .{idx});
        }
    }
    std.debug.print("\n", .{});
}
