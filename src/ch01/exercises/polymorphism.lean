def List.lastEntry? (α : Type) (xs : List α) : Option α := xs[xs.length - 1]?

#eval [1, 2, 3].lastEntry?
#eval [].lastEntry? (α := Nat)
#eval [1.4, 2.78, 3.14].lastEntry?
#eval [].lastEntry? (α := Int)
