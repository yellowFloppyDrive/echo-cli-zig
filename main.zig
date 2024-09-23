const std = @import("std");

pub fn main() void {
    std.debug.print("Enter some text (not more than 32 characters): ", .{});

    const std_in = std.io.getStdIn();
    var bufferedReader = std.io.bufferedReader(std_in.reader());
    var reader = bufferedReader.reader();

    var buffer: [32]u8 = undefined;
    const str = reader.readUntilDelimiterOrEof(&buffer, '\n') catch "";

    if (str) |s| {
        std.debug.print("You entered: {s}\n", .{s});
    }
}
