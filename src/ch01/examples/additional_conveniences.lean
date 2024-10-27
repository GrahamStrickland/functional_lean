-- def length (xs : List α) : Nat :=
--   match xs with
--   | [] => 0
--   | y :: ys => Nat.succ (length ys)

def length : List α → Nat
  | [] => 0
  | y :: ys => Nat.succ (length ys)

#eval length [1, 2, 3]
#eval length [] (α := Int)
#eval length [1.0]

def drop : Nat → List α → List α
  | Nat.zero, xs => xs
  | _, [] => []
  | Nat.succ n, x :: xs => drop n xs

#eval drop 1 [1, 2, 3]
#eval drop 1 [] (α := Int)
#eval drop 1 [1.0]

def fromOption (default : α) : Option α → α
  | none => default
  | some x => x

#eval (some "salmonberry").getD ""
#eval none.getD ""
