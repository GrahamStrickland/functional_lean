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

-- def drop : Nat → List α → List α
--   | Nat.zero, xs => xs
--   | _, [] => []
--   | Nat.succ n, x :: xs => drop n xs

-- #eval drop 1 [1, 2, 3]
-- #eval drop 1 [] (α := Int)
-- #eval drop 1 [1.0]

def fromOption (default : α) : Option α → α
  | none => default
  | some x => x

#eval (some "salmonberry").getD ""
#eval none.getD ""

def unzip (pairs : List (α × β)) :=
  match pairs with
  | [] => ([], [])
  | (x, y) :: xys =>
    let (xs, ys) := unzip xys
    (x :: xs, y :: ys)

#eval unzip [(1, "one"), (2, "two"), (3, "three")]
#eval unzip [(1, 1.2), (2, 2.3), (3, 3.4)]

def reverse (xs : List α) : List α :=
  let rec helper : List α → List α → List α
    | [], soFar => soFar
    | y :: ys, soFar => helper ys (y :: soFar)
  helper xs []

#eval reverse [1, 2, 3, 4, 5]
#eval reverse ["five", "four", "three", "two", "one"]

#check 14
#check (14 : Int)

def idFunc (x : α) := x

def drop (n : Nat) (xs : List α) : List α :=
  match n, xs with
  | Nat.zero, ys => ys
  | _, [] => []
  | Nat.succ n, y :: ys => drop n ys

#eval drop 1 [1, 2, 3]
#eval drop 1 [] (α := Int)
#eval drop 1 [1.0]

def even : Nat → Bool
  | 0 => true
  | n + 1 => not (even n)

#eval even 2
#eval even 234
#eval even 0
#eval even 23

def halve : Nat → Nat
  | 0 => 0
  | 1 => 0
  | n + 2 => halve n + 1

#eval halve 20
#eval halve 21

#check fun x => x + 1
#check fun (x : Int) => x + 1
#check fun {α : Type} (x : α) => x

#check fun
  | 0 => none
  | n + 1 => some n

def double : Nat → Nat := fun
  | 0 => 0
  | k + 1 => double k + 2

#check double
#eval double 2
#eval double 42

#eval (· , ·) 1 2
#eval (· * 2) 5

def Nat.double (x : Nat) : Nat := x + x

#check double
#check Nat.double
#eval (4 : Nat).double

namespace NewNamespace
def triple (x : Nat) : Nat := 3 * x
def quadruple (x : Nat) : Nat := 2 * x + 2 * x
end NewNamespace

#check NewNamespace.triple
#check NewNamespace.quadruple

def timesTwelve (x : Nat) :=
  open NewNamespace in
  quadruple (triple x)

#eval timesTwelve 12

open NewNamespace in
#check quadruple

inductive Inline : Type where
  | lineBreak
  | string : String → Inline
  | emph : Inline → Inline
  | strong : Inline → Inline

def Inline.string? (inline : Inline) : Option String :=
  if let Inline.string s := inline then
    some s
  else none

structure Point where
  x : Float
  y : Float
deriving Repr

#eval (⟨1, 2⟩ : Point)

#eval s!"three fives is {NewNamespace.triple 5}"
-- #check s!"three fives is {NewNamespace.triple}"
