Ray ~ "../Ray"

~ "./Paddle" ~ Paddle

┌─╴Ball
  ~ {
    Center # [X Y]
    Radius # float
    Speed ← [0 0] # [X Y]
    Color ← Ray.Color.White
  }

  SpeedY ← ⊣Speed
  SpeedX ← ⊢Speed

  PositionX ← ⊢Center
  PositionY ← ⊣Center

  BounceTopBot ↚ ⍜SpeedY(˜⨬(∘|¯)) ⟜(↥⊃(>Ray.GetScreenHeight|<0) PositionY)

  Draw ← Ray.DrawCircle Center ⟜Radius ⟜Color

  Update ← (
    ⍜Center+ ⟜Speed
    BounceTopBot
  )

  # bool ? Paddle self
  CollidingPaddle ← (
    ⊃(⋅∘|⊙◌) # b a
    ⊙Paddle.Rectangle
    Ray.CheckCollisionCircleRec Center ⟜Radius
  )
└─╴
