Ray ~ "../Ray"

┌─╴Paddle
  ~ {
    Position # [X Y]
    Size # [X Y]
    Speed ← [0 0] # [X Y]
    Color ← Ray.Color.White
  }

  PositionX ← ⊢Position
  PositionY ← ⊣Position
  SizeX     ← ⊢Size
  SizeY     ← ⊣Size
  SpeedX    ← ⊢Speed
  SpeedY    ← ⊣Speed

  ClampTopBot ↚ ⍣(
    ⊃(˙⍤(<0 PositionY)
    | °⊸PositionY 0
    )
  | ˜- Ray.GetScreenHeight ⊸SizeY
    ⊃(˙⍤(> ⊙PositionY)
    | °⊸PositionY
    )
  | ∘
  )

  MoveUpDown ↚ (
    ⍜PositionY+ ⟜(×Ray.IsKeyDown Ray.Key.Up ¯SpeedY)
    ⍜PositionY+ ⟜(×Ray.IsKeyDown Ray.Key.Down SpeedY)
  )

  Draw ← Ray.DrawRectangle Position ⟜Size ⟜Color
  Update ← (
    MoveUpDown
    ClampTopBot
  )
└─╴
