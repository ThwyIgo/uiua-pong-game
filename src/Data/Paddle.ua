Ray ~ "../Ray"

┌─╴Paddle
  ~ {
    Position # [X Y]
    Size # [X Y]
    Speed ← [0 0] # [X Y]
    Color ← Ray.Color.White
  }

  Draw ← Ray.DrawRectangle Position ⟜Size ⟜Color
└─╴
