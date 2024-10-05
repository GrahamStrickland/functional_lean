def lastEntry (α : Type) (xs : List α) : Option α :=
  match xs with
  | [] => none
  | y :: _ => some y
