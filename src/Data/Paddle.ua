Ray ~ "../Ray"

┌─╴Paddle
  ~ControlKeys {MoveUp MoveDown}

  ~ {
    Position # [X Y]
    Size # [X Y]
    Controls # ControlKeys
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
    ⍜PositionY+ ⟜(×Ray.IsKeyDown ControlKeys.MoveUp Controls ⟜(¯SpeedY))
    ⍜PositionY+ ⟜(×Ray.IsKeyDown ControlKeys.MoveDown Controls ⟜SpeedY)
  )

  Draw ← Ray.DrawRectangle Position ⟜Size ⟜Color
  Update ← (
    MoveUpDown
    ClampTopBot
  )
└─╴
