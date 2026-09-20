Ray ~ "../Ray"

┌─╴Ball
  ~ {
    Center # [X Y]
    Radius # float
    SpeedX ← 0 # float
    SpeedY ← 0 # float
    Color ← Ray.Color.White
  }

  ReflectBot ↚ ⍜SpeedY(˜⨬(∘|¯)) ⟜(>Ray.GetScreenHeight ⊣ Center)

  Draw ← Ray.DrawCircle Center ⟜Radius ⟜Color

  Update ← (
    ⍜Center+ ⟜[SpeedX ⟜SpeedY]
    ReflectBot
  )
└─╴
