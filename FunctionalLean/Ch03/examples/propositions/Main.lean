-- def onePlusOneIsTwo : 1 + 1 = 2 := rfl

-- def onePlusOneIsFifteen : 1 + 1 = 15 := rfl

-- def OnePlusOneIsTwo : Prop := 1 + 1 = 2

-- theorem onePlusOneIsTwo : OnePlusOneIsTwo := rfl

theorem onePlusOneIsTwo : 1 + 1 = 2 := by
  simp

-- theorem addAndAppend : 1 + 1 = 2 ∧ "Str".append "ing" = "String" := by simp

theorem andImpliesOr : A ∧ B → A ∨ B :=
  fun andEvidence =>
    match andEvidence with
    | And.intro a b => Or.inl a

theorem onePlusOneAndLessThan : 1 + 1 = 2 ∨ 3 < 5 := by simp
theorem notTwoEqualFive : ¬(1 + 1 = 5) := by simp
theorem trueIsTrue : True := True.intro
theorem trueOrFalse : True ∨ False := by simp
theorem falseImpliesTrue : False → True := by simp


def third (xs : List α) (ok : xs.length > 2) : α := xs[2]

def woodlandCritters : List String :=
  ["hedgehog", "deer", "snail"]

-- #eval third woodlandCritters (by simp)

def thirdOption (xs : List α) : Option α := xs[2]?

#eval thirdOption woodlandCritters
#eval thirdOption ["only", "two"]
#eval woodlandCritters[1]!

-- def unsafeThird (xs : List α) : α := xs[2]!

-- #eval woodlandCritters [1]

def main : IO Unit :=
  pure ()
