def List.lastEntry? (α : Type) (xs : List α) : Option α := xs[xs.length - 1]?

#eval [1, 2, 3].lastEntry?
#eval [].lastEntry? (α := Nat)
#eval [1.4, 2.78, 3.14].lastEntry?
#eval [].lastEntry? (α := Int)

def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α :=
  match xs with
  | [] => none
  | _ :: ys => match ys.get? 0 with
               | some v => if predicate v then some v else ys.findFirst? predicate
               | none => none

#eval [].findFirst? (α := Int) (fun x => x % 2 == 0)
#eval [1, 2, 3].findFirst? (α := Int) (fun x => x % 2 == 0)
#eval [1, 3, 4].findFirst? (α := Int) (fun x => x % 2 == 0)
#eval [1, 3, 5].findFirst? (α := Int) (fun x => x % 2 == 0)
