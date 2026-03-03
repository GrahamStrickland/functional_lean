inductive Pos : Type where
  | one : Pos
  | succ : Pos → Pos

def Pos.plus : Pos → Pos → Pos
  | Pos.one, k => Pos.succ k
  | Pos.succ n, k => Pos.succ (n.plus k)

instance : Add Pos where
  add := Pos.plus

def posToString (atTop : Bool) (p : Pos) : String :=
  let paren s := if atTop then s else "(" ++ s ++ ")"
  match p with
  | Pos.one => "Pos.one"
  | Pos.succ n => paren s!"Pos.succ {posToString false n}"

instance : ToString Pos where
  toString := posToString true

def Pos.toNat : Pos → Nat
  | Pos.one => 1
  | Pos.succ n => n.toNat + 1

instance : ToString Pos where
  toString x := toString (x.toNat)

def Pos.mul : Pos → Pos → Pos
  | Pos.one, k => k
  | Pos.succ n, k => n.mul k + k

instance : Mul Pos where
  mul := Pos.mul

instance : OfNat Pos (n + 1) where
  ofNat :=
    let rec natPlusOne : Nat → Pos
      | 0 => Pos.one
      | k + 1 => Pos.succ (natPlusOne k)
    natPlusOne n

def addNatPos : Nat → Pos → Pos
  | 0, p => p
  | n + 1, p => Pos.succ (addNatPos n p)

def addPosNat : Pos → Nat → Pos
  | p, 0 => p
  | p, n + 1 => Pos.succ (addPosNat p n)

instance : HAdd Nat Pos Pos where
  hAdd := addNatPos

instance : HAdd Pos Nat Pos where
  hAdd := addPosNat

#eval (3 : Pos) + (5 : Nat)
#eval (3 : Nat) + (5 : Pos)

-- class HPLus (α : Type) (β : Type) (γ : Type) where
--   hPlus : α → β → γ

class HPlus (α : Type) (β : Type) (γ : outParam Type) where
  hPlus : α → β → γ

instance : HPlus Nat Pos Pos where
  hPlus := addNatPos

instance : HPlus Pos Nat Pos where
  hPlus := addPosNat

#eval toString (HPlus.hPlus (3 : Pos) (5 : Nat))

-- #eval (HPlus.hPlus (3 : Pos) (5 : Nat) : Pos)

#eval HPlus.hPlus (3 : Pos) (5 : Nat)

@[default_instance]
instance [Add α] : HPlus α α α where
  hPlus := Add.add

#eval HPlus.hPlus (3 : Nat) (5 : Nat)

#check HPlus.hPlus (5 : Nat) (3 : Nat)

#check HPlus.hPlus (5 : Nat)

structure PPoint (α : Type) where
  x : α
  y : α

def mulPPointScalar [Mul α] (point : PPoint α) (scalar : α) : (PPoint α) := 
  { x := scalar * point.x, y := scalar * point.y }

instance [Mul α] : HMul (PPoint α) α (PPoint α) where
  hMul := mulPPointScalar

#eval {x := 2.5, y := 3.7 : PPoint Float} * 2.0
