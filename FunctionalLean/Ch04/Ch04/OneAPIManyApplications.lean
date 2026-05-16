import Ch03.StandardClasses

-- def first (xs : List α) : Option α :=
--   xs[0]?

-- #eval first ([] : List Nat)
-- #eval first [1]
-- #eval first [1, 2]

-- def firstThird (xs : List α) : Option (α × α) :=
--   match xs[0]? with
--   | none => none
--   | some first =>
--     match xs[2]? with
--     | none => none
--     | some third =>
--       some (first, third)

-- #eval firstThird ([] : List Nat)
-- #eval firstThird [1]
-- #eval firstThird [1, 2, 3]

-- def firstThirdFifth (xs : List α) : Option (α × α × α) :=
--   match xs[0]? with
--   | none => none
--   | some first =>
--     match xs[2]? with
--     | none => none
--     | some third =>
--       match xs[4]? with
--       | none => none
--       | some fifth =>
--         some (first, third, fifth)

-- def firstThirdFifthSeventh (xs : List α) : Option (α × α × α × α) :=
--   match xs[0]? with
--   | none => none
--   | some first =>
--     match xs[2]? with
--     | none => none
--     | some third =>
--       match xs[4]? with
--       | none => none
--       | some fifth =>
--         match xs[6]? with
--         | none => none
--         | some seventh =>
--           some (first, third, fifth, seventh)

-- def andThen (opt : Option α) (next : α → Option β) : Option β :=
--   match opt with
--   | none => none
--   | some x => next x

-- def firstThird (xs : List α) : Option (α × α) :=
--   andThen xs[0]? fun first =>
--   andThen xs[2]? fun third =>
--   some (first, third)

-- def firstThird (xs : List α) : Option (α × α) :=
--   andThen xs[0]? (fun first =>
--     andThen xs[2]? (fun third =>
--       some (first, third)))

-- #eval firstThird ([] : List Nat)
-- #eval firstThird [1]
-- #eval firstThird [1, 2, 3]

-- infixl:55 " ~~> " => andThen

-- def firstThirdInfix (xs : List α) : Option (α × α) :=
--   xs[0]? ~~> fun first =>
--   xs[2]? ~~> fun third =>
--   some (first, third)

-- def firstThirdFifthSeventh (xs : List α) : Option (α × α × α × α) :=
--   xs[0]? ~~> fun first =>
--   xs[2]? ~~> fun third =>
--   xs[4]? ~~> fun fifth =>
--   xs[6]? ~~> fun seventh =>
--   some (first, third, fifth, seventh)

-- inductive Except (ε : Type) (α : Type) where
--   | error : ε → Except ε α
--   | ok : α →  Except ε α
-- deriving BEq, Hashable, Repr

-- def get (xs : List α) (i : Nat) : Except String α :=
--   match xs[i]? with
--   | none => Except.error s!"Index {i} not found (maximum is {xs.length - 1})"
--   | some x => Except.ok x

def ediblePlants : List String :=
  ["ramsons", "sea plantain", "sea buckthorn", "garden nasturtium"]

-- #eval get ediblePlants 2
-- #eval get ediblePlants 4

-- def first (xs : List α) : Except String α :=
--   get xs 0

-- #eval first ([] : List Nat)
-- #eval first [1]
-- #eval first [1, 2]

-- def firstThird (xs : List α) : Except String (α × α) :=
--   match get xs 0 with
--   | Except.error msg => Except.error msg
--   | Except.ok first =>
--     match get xs 2 with
--     | Except.error msg => Except.error msg
--     | Except.ok third =>
--       Except.ok (first, third)

-- #eval firstThird ([] : List Nat)
-- #eval firstThird [1]
-- #eval firstThird [1, 2, 3]

-- def firstThirdFifth (xs : List α) : Except String (α × α × α) :=
--   match get xs 0 with
--   | Except.error msg => Except.error msg
--   | Except.ok first =>
--     match get xs 2 with
--     | Except.error msg => Except.error msg
--     | Except.ok third =>
--       match get xs 4 with
--       | Except.error msg => Except.error msg
--       | Except.ok fifth =>
--         Except.ok (first, third, fifth)

-- def firstThirdFifthSeventh (xs : List α) : Except String (α × α × α × α) :=
--   match get xs 0 with
--   | Except.error msg => Except.error msg
--   | Except.ok first =>
--     match get xs 2 with
--     | Except.error msg => Except.error msg
--     | Except.ok third =>
--       match get xs 4 with
--       | Except.error msg => Except.error msg
--       | Except.ok fifth =>
--         match get xs 6 with
--         | Except.error msg => Except.error msg
--         | Except.ok seventh =>
--           Except.ok (first, third, fifth, seventh)

def andThen (attempt : Except e α) (next : α → Except e β) : Except e β :=
  match attempt with
  | Except.error msg => Except.error msg
  | Except.ok x => next x

-- def firstThird' (xs : List α) : Except String (α × α) :=
--   andThen (get xs 0) fun first =>
--   andThen (get xs 2) fun third =>
--   Except.ok (first, third)

-- #eval firstThird' ([] : List Nat)
-- #eval firstThird' [1]
-- #eval firstThird' [1, 2, 3]

def ok (x : α) : Except ε α := Except.ok x

def fail (err: ε) : Except ε α := Except.error err

def get (xs : List α) (i : Nat) : Except String α :=
  match xs[i]? with
  | none => fail s!"Index {i} not found (maximum is {xs.length - 1})"
  | some x => ok x

infixl:55 " ~~> " => andThen

def firstThird (xs : List α) : Except String (α × α) :=
  get xs 0 ~~> fun first =>
  get xs 2 ~~> fun third =>
  ok (first, third)

#eval firstThird ([] : List Nat)
#eval firstThird [1]
#eval firstThird [1, 2, 3]

def firstThirdFifthSeventh (xs : List α) : Except String (α × α × α × α) :=
  get xs 0 ~~> fun first =>
  get xs 2 ~~> fun third =>
  get xs 4 ~~> fun fifth =>
  get xs 6 ~~> fun seventh =>
  ok (first, third, fifth, seventh)

def isEven (i : Int) : Bool :=
  i % 2 == 0

def sumAndFindEvens : List Int → List Int × Int
  | [] => ([], 0)
  | i :: is =>
    let (moreEven, sum) := sumAndFindEvens is
    (if isEven i then i :: moreEven else moreEven, sum + i)

def inorderSum : BinTree Int → List Int × Int
  | BinTree.leaf => ([], 0)
  | BinTree.branch l x r =>
    let (leftVisited, leftSum) := inorderSum l
    let (hereVisited, hereSum) := ([x], x)
    let (rightVisited, rightSum) := inorderSum r
    (leftVisited ++ hereVisited ++ rightVisited,
      leftSum + hereSum + rightSum)

