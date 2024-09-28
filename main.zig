const std = @import("std");

pub fn main() void {
    std.debug.print("Enter some text (not more than 32 characters): ", .{});

    var reader = std.io.getStdIn().reader();
    var buffer: [4096]u8 = undefined;
    const str = reader.readUntilDelimiterOrEof(&buffer, '\n') catch "";

    if (str) |s| {
        std.debug.print("You entered: {s}\n", .{s});
    }
}
