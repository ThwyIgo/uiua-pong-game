Ray ~ "./Ray"

Data ~ "./Data/mod" ~ Ball Paddle

PaddleWidth  ← 10
PaddleHeight ← 70

~Context {
  Ball ← (
    Ball ÷2Ray!([GetScreenWidth GetScreenHeight]) 15
    °⊸Ball.SpeedX 7
    °⊸Ball.SpeedY 7
  )
  Paddle₁ ← (Paddle [0 (-÷2PaddleHeight ÷2Ray.GetScreenHeight)] PaddleWidth_PaddleHeight)
  Paddle₂ ← (Paddle [(-PaddleWidth Ray.GetScreenWidth (-÷2PaddleHeight ÷2Ray.GetScreenHeight))] PaddleWidth_PaddleHeight)
}

Ray.InitWindow 640 480 "Rayua minimal example"
Ray.SetTargetFPS 60
Context

MainLoop ← (
  Ray.ClearBackground Ray.Color.Black
  Ray.BeginDrawing

  °⊸Context.Ball Ball.Update ⊸Context.Ball
  Ball.Draw ⊸Context.Ball

  Paddle.Draw ⊸Context.Paddle₁
  Paddle.Draw ⊸Context.Paddle₂

  Ray.EndDrawing
)

# MainLoop
⍢(MainLoop|¬Ray.WindowShouldClose)
Ray.CloseWindow
