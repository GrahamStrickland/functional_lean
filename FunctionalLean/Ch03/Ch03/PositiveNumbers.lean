inductive Pos : Type where
  | one : Pos
  | succ : Pos → Pos

-- def seven : Pos := 7
def seven : Pos :=
  Pos.succ (Pos.succ (Pos.succ (Pos.succ (Pos.succ (Pos.succ Pos.one)))))

-- def fourteen : Pos := seven + seven
-- def fortyNine : Pos := seven * seven

class Plus (α : Type) where
  plus : α → α → α

instance : Plus Nat where
  plus := Nat.add

#eval Plus.plus 5 3

open Plus (plus)

#eval plus 5 3

def Pos.plus : Pos → Pos → Pos
  | Pos.one, k => Pos.succ k
  | Pos.succ n, k => Pos.succ (n.plus k)

instance : Plus Pos where
  plus := Pos.plus

-- def fourteen : Pos := plus seven seven

-- #eval plus 5.2 917.25861

instance : Add Pos where
  add := Pos.plus

def fourteen : Pos := seven + seven

#eval fourteen + fourteen
