const std = @import("std");

pub fn build(b: *std.Build) void {
    const upstream = b.dependency("dr_wav", .{});
    const lib = b.addStaticLibrary(.{
        .name = "dr_wav",
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });
    lib.linkLibC();
    lib.addIncludePath(upstream.path(""));
    lib.addCSourceFiles(.{
        .files = &.{
            "dr_wav.c",
        },
    });
    lib.installHeadersDirectory(upstream.path("."), "", .{ .include_extensions = &.{
        "dr_wav.h",
    } });
    b.installArtifact(lib);
}
