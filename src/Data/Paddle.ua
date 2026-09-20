Ray ~ "../Ray"

┌─╴Paddle
  ~ControlKeys {MoveUp MoveDown}

  ~ {
    Rectangle # Ray.Rectangle
    Controls # ControlKeys
    Speed ← [0 0] # [X Y]
    Color ← Ray.Color.White
  }

  PositionX ← Ray.Rectangle.X Rectangle
  PositionY ← Ray.Rectangle.Y Rectangle
  SizeX     ← Ray.Rectangle.Width Rectangle
  SizeY     ← Ray.Rectangle.Height Rectangle
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

  Draw ← Ray.DrawRectangle [⊃Ray.Rectangle.X Ray.Rectangle.Y] ⟜[⊃Ray.Rectangle.Width Ray.Rectangle.Height] Rectangle ⟜Color
  Update ← (
    MoveUpDown
    ClampTopBot
  )
└─╴
