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

def main : IO Unit :=
  pure ()
