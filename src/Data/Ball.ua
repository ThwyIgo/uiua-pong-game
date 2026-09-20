Ray ~ "../Ray"

┌─╴Ball
  ~ {
    Center # [X Y]
    Radius # float
    Speed ← [0 0] # [X Y]
    Color ← Ray.Color.White
  }

  SpeedY ← ⊣Speed
  SpeedX ← ⊢Speed

  BounceTopBot ↚ ⍜SpeedY(˜⨬(∘|¯)) ⟜(↥⊃(>Ray.GetScreenHeight|<0) ⊣ Center)

  Draw ← Ray.DrawCircle Center ⟜Radius ⟜Color

  Update ← (
    ⍜Center+ ⟜Speed
    BounceTopBot
  )
└─╴
