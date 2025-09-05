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

def posToString (atTop : Bool) (p : Pos) : String :=
  let paren s := if atTop then s else "(" ++ s ++ ")"
  match p with
  | Pos.one => "Pos.one"
  | Pos.succ n => paren s!"Pos.succ {posToString false n}"

instance : ToString Pos where
  toString := posToString true

#eval s!"There are {seven}"

def Pos.toNat : Pos → Nat
  | Pos.one => 1
  | Pos.succ n => n.toNat + 1

instance : ToString Pos where
  toString x := toString (x.toNat)

#eval s!"There are {seven}"

def Pos.mul : Pos → Pos → Pos
  | Pos.one, k => k
  | Pos.succ n, k => n.mul k + k

instance : Mul Pos where
  mul := Pos.mul

#eval [seven * Pos.one,
       seven * seven,
       Pos.succ Pos.one * seven]

-- class Zero (α : Type) where
--   zero : α

class One (α : Type) where
  one : α

instance : One Pos where
  one := Pos.one

-- #eval (1 : Pos)

-- class OfNat (α : Type) (_ : Nat) where
--   ofNat : α

inductive LT4 where
  | zero
  | one
  | two
  | three
deriving Repr

instance : OfNat LT4 0 where
  ofNat := LT4.zero

instance : OfNat LT4 1 where
  ofNat := LT4.one

instance : OfNat LT4 2 where
  ofNat := LT4.two

instance : OfNat LT4 3 where
  ofNat := LT4.three

#eval (3 : LT4)
#eval (0 : LT4)
-- #eval (4 : LT4)

instance : OfNat Pos (n + 1) where
  ofNat :=
    let rec natPlusOne : Nat → Pos
      | 0 => Pos.one
      | k + 1 => Pos.succ (natPlusOne k)
    natPlusOne n

def eight : Pos := 8
-- def zero : Pos := 0

namespace MyPos

structure Pos where
  succ ::
  pred : Nat

def Pos.add : Pos → Pos → Pos
  | succ n, k => Pos.succ (n.add k.pred.succ)

instance : Add Pos where
  add := Pos.add

def Pos.mul : Pos → Pos → Pos
  | succ n, k => Pos.succ ((n.succ.mul k.pred.succ) - 1)

instance : Mul Pos where
  mul := Pos.mul

instance : ToString Pos where
  toString x := toString (x.pred + 1)

instance : OfNat Pos (n + 1) where
  ofNat :=
    let rec natPlusOne : Nat → Pos
      | 0 => Pos.succ 0
      | k => Pos.succ k
    natPlusOne n

def one : Pos := 1
def six : Pos := 6

#eval one + six
#eval six * six * six

#eval s!"{six} * {six} = {six * six}"

end MyPos

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
  | succ n, k => n.mul k

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

def two: Even := 2
def four: Even := Even.succ two
def sixteen: Even := 16

#eval two + two
#eval two * sixteen

#eval s!"{two} * {four} = {two * four}"
