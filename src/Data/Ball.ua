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

  # self ? self
  BounceTopBot ↚ ⍜SpeedY(˜⨬(∘|¯)) ⟜(↥⊃(>Ray.GetScreenHeight|<0) PositionY)

  # self
  Draw ← Ray.DrawCircle Center ⟜Radius ⟜Color

  # 0 = none | 1 = left | 2 = right
  # edgeId ? self
  CurrentTouchingEdge ← (
    ⍣(⊃(˙⍤(<0 PositionX)|1◌)
    | ⊃(˙⍤(>Ray.GetScreenWidth PositionX)|2◌)
    | 0
    )
  )

  # bool ? Paddle self
  CollidingPaddle ← (
    ⊃(⋅∘|⊙◌) # b a
    ⊙Paddle.Rectangle
    Ray.CheckCollisionCircleRec Center ⟜Radius
  )

  # self ? Paddles self
  Update ← (
    ⊃(⋅∘|⊙◌) # b a

    ⍜Center+ ⟜Speed
    BounceTopBot

    ⟜∘
    ⊃(⋅⊙∘|∘) # b c a
    # Check if Colliding with any Paddle in the array
    /↥♭⊞(˜CollidingPaddle) ¤

    # Invert SpeedX if colliding
    ⨬(∘|⍜SpeedX ¯)
  )
└─╴
