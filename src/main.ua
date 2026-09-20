Ray ~ "./Ray"

Data ~ "./Data/mod" ~ Ball

~Context {
  Ball ← (
    Ball ÷2Ray!([GetScreenWidth GetScreenHeight]) 15
    °⊸Ball.SpeedX 7
    °⊸Ball.SpeedY 7
  )
  Paddle₁ ← 0
  Paddle₂ ← 0
}

Ray.InitWindow 640 480 "Rayua minimal example"
Ray.SetTargetFPS 60
Context

MainLoop ← (
  Ray.ClearBackground Ray.Color.Black
  Ray.BeginDrawing

  °⊸Context.Ball Ball.Update ⊸Context.Ball
  Ball.Draw ⊸Context.Ball

  Ray.EndDrawing
)

# MainLoop
⍢(MainLoop|¬Ray.WindowShouldClose)
Ray.CloseWindow
