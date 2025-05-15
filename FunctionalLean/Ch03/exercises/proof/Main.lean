-- def TwoPlusThreeIsFive : Prop := 2 + 3 = 5

-- theorem twoPlusThreeIsFive : TwoPlusThreeIsFive := rfl

-- def FifteenMinusEightIsSeven : Prop := 15 - 8 = 7

-- theorem fifteenMinusEightIsSeven : FifteenMinusEightIsSeven := rfl

-- def HelloWorld : Prop := "Hello, ".append "world" = "Hello, world"

-- theorem helloWorld : HelloWorld := rfl

-- def FiveLessThanEighteen : Prop := 5 < 15

-- theorem fiveLessThanEighteen : FiveLessThanEighteen := rfl

theorem twoPlusThreeIsFive : 2 + 3 = 5 := by simp 

theorem fifteenMinusEightIsSeven : 15 - 8 = 7 := by simp

-- theorem helloWorld : "Hello, ".append "world" = "Hello, world" := by simp

theorem fiveLessThanEighteen : 5 < 18 := by simp

def fifth (xs : List α) (ok : xs.length > 4) : α := xs[4]

#eval fifth [1, 2, 3, 4, 5, 6] (by simp)

def main : IO Unit :=
  pure ()
