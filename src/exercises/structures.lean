structure Point where
  x : Float
  y : Float
deriving Repr

def distance (p1 : Point) (p2 : Point) : Float :=
  Float.sqrt (((p2.x - p1.x) ^ 2.0) + ((p2.y - p1.y) ^ 2.0))

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
