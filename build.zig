const std = @import("std");

pub fn build(b: *std.Build) void {
    const driver = b.addExecutable(.{
        .name = "zs",
        .root_source_file = b.path("src/driver/main.zig"),
        .target = b.graph.host,
    });

    b.installArtifact(driver);

    const driver_bin = b.addRunArtifact(driver);

    const run_step = b.step("run", "Run zcheme");
    run_step.dependOn(&driver_bin.step);
}
