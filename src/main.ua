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
    Paddle (Ray.Rectangle 0 (-÷2PaddleHeight ÷2Ray.GetScreenHeight) PaddleWidth PaddleHeight) (Paddle.ControlKeys @w @s)
    °⊸Paddle.Speed [0 6]
  )
  Paddle₂ ← (
    Paddle (Ray.Rectangle (-PaddleWidth Ray.GetScreenWidth) (-÷2PaddleHeight ÷2Ray.GetScreenHeight) PaddleWidth PaddleHeight) (Paddle.ControlKeys Ray.Key.Up Ray.Key.Down)
    °⊸Paddle.Speed [0 6]
  )
}

Ray.InitWindow 640 480 "Rayua minimal example"
Ray.SetTargetFPS 60
Context

MainLoop ← (
  Ray.ClearBackground Ray.Color.Black
  Ray.BeginDrawing

  °⊸Context.Paddle₁ Paddle.Update ⊸Context.Paddle₁
  °⊸Context.Paddle₂ Paddle.Update ⊸Context.Paddle₂
  Paddle.Draw ⊸Context.Paddle₁
  Paddle.Draw ⊸Context.Paddle₂

  °⊸Context.Ball Ball.Update ⊸⊃([Context.Paddle₁ ⟜Context.Paddle₂]|Context.Ball)
  Ball.Draw ⊸Context.Ball

  &p Ball.CurrentTouchingEdge ⊸Context.Ball

  Ray.EndDrawing
)

# MainLoop
⍢(MainLoop|¬Ray.WindowShouldClose)
Ray.CloseWindow
