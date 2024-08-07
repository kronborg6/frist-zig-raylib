const std = @import("std");
const rl = @import("raylib");
const gui = @import("raygui");

pub fn main() anyerror!void {
    const screenWidt = 1000;
    const screenHeight = 1000;

    var showMessageBox: bool = false;
    var cout: u8 = 0;

    rl.initWindow(screenWidt, screenHeight, "gui or somfig");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.white);
        rl.drawText("i love you", 190, 200, 20, rl.Color.light_gray);

        if (!showMessageBox) {
            if (gui.guiButton(rl.Rectangle{ .x = 400, .y = 250, .width = 120, .height = 60 }, "Click Me") == 1) {
                cout += 1;
                std.debug.print("you have clicked this {d} times\n", .{cout});

                showMessageBox = true;
            }
        }

        if (showMessageBox) {
            const result: i32 = gui.guiMessageBox(rl.Rectangle{ .x = 400, .y = 450, .width = 250, .height = 100 }, "#191#Message Box", "Hello you i just stole you hart", "Nice;Cool");
            if (result >= 0) showMessageBox = false;
        }
    }
}
