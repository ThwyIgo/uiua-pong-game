Ray ~ "./Ray"

Data ~ "./Data/mod" ~ Ball Paddle

PaddleWidth  ← 10
PaddleHeight ← 70

~Context {
  Ball ← (
    Ball ÷2Ray!([GetScreenWidth GetScreenHeight]) 15
    °⊸Ball.Speed [7 7]
  )
  Paddle₁ ← (
    Paddle [0 (-÷2PaddleHeight ÷2Ray.GetScreenHeight)] PaddleWidth_PaddleHeight (Paddle.ControlKeys @w @s)
    °⊸Paddle.Speed [0 6]
  )
  Paddle₂ ← (
    Paddle [(-PaddleWidth Ray.GetScreenWidth (-÷2PaddleHeight ÷2Ray.GetScreenHeight))] PaddleWidth_PaddleHeight (Paddle.ControlKeys Ray.Key.Up Ray.Key.Down)
    °⊸Paddle.Speed [0 6]
  )
}

Ray.InitWindow 640 480 "Rayua minimal example"
Ray.SetTargetFPS 60
Context

MainLoop ← (
  Ray.ClearBackground Ray.Color.Black
  Ray.BeginDrawing

  °⊸Context.Ball Ball.Update ⊸Context.Ball
  Ball.Draw ⊸Context.Ball

  °⊸Context.Paddle₁ Paddle.Update ⊸Context.Paddle₁
  °⊸Context.Paddle₂ Paddle.Update ⊸Context.Paddle₂
  Paddle.Draw ⊸Context.Paddle₁
  Paddle.Draw ⊸Context.Paddle₂

  Ray.EndDrawing
)

# MainLoop
⍢(MainLoop|¬Ray.WindowShouldClose)
Ray.CloseWindow
