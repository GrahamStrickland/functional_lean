structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr

def natOrigin : PPoint Nat :=
  { x := Nat.zero, y := Nat.zero }

def replaceX (α : Type) (point : PPoint α) (newX : α) : PPoint α :=
  { point with x := newX }

#check (replaceX)
#check replaceX Nat
#check replaceX Nat natOrigin
#check replaceX Nat natOrigin 5
#eval replaceX Nat natOrigin 5

inductive Sign where
  | pos
  | neg

def posOrNegThree (s : Sign) : match s with | Sign.pos => Nat | Sign.neg => Int :=
  match s with
  | Sign.pos => (3 : Nat)
  | Sign.neg => (-3 : Int)

#check posOrNegThree Sign.pos
#eval posOrNegThree Sign.pos

def primesUnder10 : List Nat := [2, 3, 5, 7]

-- inductive List (α : Type) where
--   | nil : List α
--   | cons : α → List α → List α

def explicitPrimesUnder10 : List Nat :=
  List.cons 2 (List.cons 3 (List.cons 5 (List.cons 7 List.nil)))

-- def length (α : Type) (xs : List α) : Nat :=
--   match xs with
--   | List.nil => Nat.zero
--   | List.cons y ys => Nat.succ (length α ys)

-- def length (α : Type) (xs : List α) : Nat :=
--   match xs with
--   | [] => 0
--   | y :: ys => Nat.succ (length α ys)

-- def replaceX {α : Type} (point : PPoint α) (newX : α) : PPoint α :=
--   { point with x := newX }

-- #eval replaceX natOrigin 5

def length {α : Type} (xs : List α) : Nat :=
  match xs with
  | [] => 0
  | y :: ys => Nat.succ (length ys)

#eval length primesUnder10
#eval primesUnder10.length

#check List.length (α := Int)

-- inductive Option (α : Type) : Type where
--   | none : Option α
--   | some (val : α) : Option α

-- def List.head? {α : Type} (xs : List α) : Option α :=
--   match xs with
--   | [] => none
--   | y :: _ => some y

#eval primesUnder10.head?
-- #eval [].head?
#eval [].head? (α := Int)
#eval ([] : List Int).head?

-- structure Prod (α : Type) (β : Type) : Type where
--   fst : α
--   snd : β

-- def fives : String × Int := { fst := "five", snd := 5 }
def fives : String × Int := ("five", 5)

-- def sevens : String × Int × Nat := ("VII", 7, 4 + 3)
def sevens : String × (Int × Nat) := ("VII", (7, 4 + 3))
