const rl = @import("raylib");
const gui = @import("raygui");
const meta = @import("std").meta;
const std = @import("std");

pub fn main() anyerror!void {
    const screenWidt = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidt, screenHeight, "kronborg er gud");
    defer rl.closeWindow();

    var CubePosition = rl.Vector3{ .x = 0, .y = 0, .z = 0 };

    const cam = rl.Camera3D{ .position = rl.Vector3{ .x = 0, .y = 10, .z = 15 }, .target = rl.Vector3{ .x = 0, .y = 0, .z = 0 }, .up = rl.Vector3{ .x = 0, .y = 1, .z = 0 }, .fovy = 45, .projection = rl.CameraProjection.camera_perspective };

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        cam.begin();
        defer cam.end();

        if (gui.guiButton(rl.Rectangle{ .x = 10, .y = 10, .width = 240, .height = 30 }, "gdfg") == 1) {}

        rl.clearBackground(rl.Color.white);

        rl.drawCube(CubePosition, 2, 2, 2, rl.Color.red);
        rl.drawCubeWires(CubePosition, 2, 2, 2, rl.Color.blue);
        // if (rl.checkCollisionBoxes(rl.BoundingBox{}, rl.BoundingBox{})) {}

        const key = rl.getKeyPressed();
        if (key != rl.KeyboardKey.key_null) {
            std.debug.print("The key pressed: {}\n", .{key});
        }
        if (rl.isKeyDown(rl.KeyboardKey.key_s)) {
            CubePosition.z += 0.2;
            std.debug.print("yes \n", .{});
        }
        if (rl.isKeyDown(rl.KeyboardKey.key_w)) {
            CubePosition.z -= 0.2;
            std.debug.print("yes \n", .{});
        }
        if (rl.isKeyDown(rl.KeyboardKey.key_d)) {
            CubePosition.x += 0.2;
            std.debug.print("yes \n", .{});
        }
        if (rl.isKeyDown(rl.KeyboardKey.key_a)) {
            CubePosition.x -= 0.2;
            std.debug.print("yes \n", .{});
        }

        rl.drawGrid(10, 1.0);

        rl.drawText("i love you", 190, 200, 20, rl.Color.light_gray);

        rl.drawFPS(10, 10);
    }
}
// raylib-zig (c) Nikolas Wipper 2023
