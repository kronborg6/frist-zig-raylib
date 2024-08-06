const rl = @import("raylib");
const meta = @import("std").meta;

pub fn main() anyerror!void {
    const screenWidt = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidt, screenHeight, "kronborg er gud");
    defer rl.closeWindow();

    const tgg = rl.Vector3{ .x = 0, .y = 0, .z = 0 };

    const cam = rl.Camera3D{ .position = rl.Vector3{ .x = 0, .y = 10, .z = 15 }, .target = rl.Vector3{ .x = 0, .y = 0, .z = 0 }, .up = rl.Vector3{ .x = 0, .y = 1, .z = 0 }, .fovy = 45, .projection = rl.CameraProjection.camera_perspective };

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        cam.begin();
        defer cam.end();

        rl.clearBackground(rl.Color.white);

        rl.drawCube(tgg, 2, 2, 2, rl.Color.red);
        rl.drawCubeWires(tgg, 2, 2, 2, rl.Color.blue);

        rl.drawGrid(10, 1.0);

        rl.drawText("i love you", 190, 200, 20, rl.Color.light_gray);

        rl.drawFPS(10, 10);
    }
}
// raylib-zig (c) Nikolas Wipper 2023
