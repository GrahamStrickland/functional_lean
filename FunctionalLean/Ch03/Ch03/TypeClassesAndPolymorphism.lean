#check IO.println

#check @IO.println

-- def List.sumOfContents [Add α] [OfNat α 0] : List α → α
--   | [] => 0
--   | x :: xs => x + xs.sumOfContents

def List.sumOfContents [Add α] [Zero α] : List α → α
  | [] => 0
  | x :: xs => x + xs.sumOfContents

def fourNats : List Nat := [1, 2, 3, 4]
#eval fourNats.sumOfContents

-- def fourPos : List Pos := [1, 2, 3, 4]
-- #eval fourPos.sumOfContents

structure PPoint (α : Type) where
  x : α
  y : α

instance [Add α] : Add (PPoint α) where
  add p1 p2 := { x := p1.x + p2.x, y := p1.y + p2.y }

inductive Even : Type where
  | zero : Even
  | succ : Even → Even

def Even.add : Even → Even → Even
  | Even.zero, k => k
  | Even.succ n, k => Even.succ (n.add k)

instance : Add Even where
  add := Even.add

def Even.mul : Even → Even → Even
  | Even.zero, _ => Even.zero
  | Even.succ n, k => (n.mul k) + k + k

instance : Mul Even where
  mul := Even.mul

def Even.toNat : Even → Nat
  | Even.zero => 0
  | Even.succ n => n.toNat + 2

instance : ToString Even where
  toString x := toString (x.toNat)

def isEven : Nat → Bool
  | n => n % 2 == 0

instance : OfNat Even 0 where
  ofNat := Even.zero

instance [OfNat Even n] : OfNat Even (n + 2) where
  ofNat := Even.succ (inferInstance : OfNat Even n).ofNat

partial def evenLim : Even → Even
  | Even.succ n => evenLim (n + 2)
  | n => n

#eval evenLim 2
