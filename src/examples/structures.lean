#check 1.2
#check -454.2123215
#check 0.0

#check 0
#check (0 : Float)

structure Point where
  x : Float
  y : Float
deriving Repr

def origin : Point := { x := 0.0, y := 0.0 }
#eval origin
#eval origin.x
#eval origin.y

def addPoints (p1 : Point) (p2 : Point) : Point :=
  { x := p1.x + p2.x, y := p1.y + p2.y }

def distance (p1 : Point) (p2 : Point) : Float :=
  Float.sqrt (((p2.x - p1.x) ^ 2.0) + ((p2.y - p1.y) ^ 2.0))

#eval addPoints { x := 1.5, y := 32 } { x := -8, y := 0.2 }
#eval distance { x := 1.0, y := 2.0 } { x := 5.0, y := -1.0 }

structure Point3D where
  x : Float
  y : Float
  z : Float
deriving Repr

def origin3D : Point3D := { x := 0.0, y := 0.0, z := 0.0 }

#check ({ x := 0.0, y := 0.0 } : Point)
#check { x := 0.0, y := 0.0 : Point}

def zeroX (p : Point) : Point :=
  { p with x := 0 }

#eval zeroX { x := 1.0, y := 2.0 }

def fourAndThree : Point :=
  { x := 4.3, y := 3.4 }

#eval fourAndThree
#eval zeroX fourAndThree
#eval fourAndThree

#check Point.mk 1.5 2.8
#check (Point.mk)

-- structure Point where
--   point ::
--   x : Float
--   y : Float
-- deriving Repr

#check (Point.x)
#check (Point.y)

#eval origin.x
#eval Point.x origin

#eval "one string".append " and another"

def Point.modifyBoth (f : Float → Float) (p : Point) : Point :=
  { x := f p.x, y := f p.y }

#eval fourAndThree.modifyBoth Float.floor

structure RectangularPrism where
  height : Float
  width : Float
  depth : Float
deriving Repr

def volume (p : RectangularPrism) : Float :=
  p.height * p.width * p.depth

#eval volume { height := 1.2, width := 2.1, depth := 3.0 }

structure Segment where
  p1 : Point
  p2 : Point
deriving Repr

def length (s : Segment) : Float :=
  distance s.p2 s.p1

#eval length { p1 := { x := 1.0, y := -1.0}, p2 := { x := 2.0, y := 3.0 } }

structure Hamster where
  name : String
  fluffy : Bool

structure Book where
  makeBook ::
  title : String
  author : String
  price : Float
