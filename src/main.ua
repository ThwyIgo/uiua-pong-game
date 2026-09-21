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
  Score₁ ← 0
  Score₂ ← 0
}

# Context ? Context
UpdateScore ← (
  Ball.CurrentTouchingEdge ⊸Context.Ball
  ⨬(∘
  | ( Context ⊃(Context.Score₁|+1Context.Score₂)
      ˜°⊸Context.Score₁
      ˜°⊸Context.Score₂)
  | ( Context ⊃(+1Context.Score₁|Context.Score₂)
      ˜°⊸Context.Score₁
      ˜°⊸Context.Score₂))
)

Ray.InitWindow 640 480 "Pong"
Ray.SetTargetFPS 60
Context

MainLoop ← (
  Ray.ClearBackground Ray.Color.Black
  Ray.BeginDrawing

  °⊸Context.Paddle₁ Paddle.Update ⊸Context.Paddle₁
  °⊸Context.Paddle₂ Paddle.Update ⊸Context.Paddle₂
  °⊸Context.Ball Ball.Update ⊸⊃([Context.Paddle₁ ⟜Context.Paddle₂]|Context.Ball)
  UpdateScore

  Ray.DrawText ⊙([0 -20Ray.GetScreenHeight] 20 Ray.Color.White) $"Player 1: _ | Player 2: _" ⊸⊃Context.Score₁ Context.Score₂

  Ball.Draw ⊸Context.Ball
  Paddle.Draw ⊸Context.Paddle₁
  Paddle.Draw ⊸Context.Paddle₂

  Ray.EndDrawing
)

# MainLoop
⍢(MainLoop|¬Ray.WindowShouldClose)
Ray.CloseWindow
