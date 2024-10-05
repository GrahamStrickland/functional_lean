-- inductive Bool where
--   | false : Bool
--   | true : Bool

-- inductive Nat where
--   | zero : Nat
--   | succ (n : Nat) : Nat

def isZero (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ k => false

#eval isZero Nat.zero
#eval isZero 5
#eval isZero (Nat.succ (Nat.succ (Nat.succ (Nat.succ Nat.zero))))

def pred (n : Nat) : Nat :=
  match n with
  | Nat.zero => Nat.zero
  | Nat.succ k => k

#eval pred 5
#eval pred 839
#eval pred 0

structure Point3D where
  x : Float
  y : Float
  z : Float
deriving Repr

def depth (p : Point3D) : Float :=
  match p with
  | { x := h, y := w, z := d } => d

#eval depth ({ x := 0.0, y := -1.0, z := 1.0 } : Point3D)

def even (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ k => not (even k)

#eval even 0
#eval even 5
#eval even 2

-- def evenLoops (n : Nat) : Bool :=
--   match n with
--   | Nat.zero => true
--   | Nat.succ k => not (evenLoops n)

def plus (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => n
  | Nat.succ k' => Nat.succ (plus n k')

def times (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => Nat.zero
  | Nat.succ k' => plus n (times n k')

#eval times 2 3

def minus (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => n
  | Nat.succ k' => pred (minus n k')

#eval minus 5 3
#eval minus 3 5

-- def div (n : Nat) (k : Nat) : Nat :=
--   if n < k then
--     0
--   else Nat.succ (div (n - k) k)
