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

def Prod.swap {α β : Type} (pair : α × β) : β × α := (pair.snd, pair.fst)

#eval (1, 2).swap
#eval ("dog", "cat").swap
#eval (1.34, 2.56).swap

inductive PetName where
  | dog (name : String) : PetName
  | cat (name : String) : PetName

def animals : List PetName :=
  [PetName.dog "Spot", PetName.cat "Tiger", PetName.dog "Fifi", PetName.dog "Rex", PetName.cat "Floof"]

def howManyDogs (pets : List PetName) : Nat :=
  match pets with
  | [] => 0
  | PetName.dog _ :: morePets => howManyDogs morePets + 1
  | PetName.cat _ :: morePets => howManyDogs morePets

#eval howManyDogs animals

def zip {α β : Type} (xs : List α) (ys : List β) : List (α × β) :=
  match xs, ys with
  | [], _ => []
  | _, [] => []
  | x :: xs, y :: ys => (x, y) :: zip xs ys

#eval zip [1, 2, 3] [1.0, 2.0, 3.0, 4.0]
#eval zip ["cat", "dog", "fish"] [] (β := Int)
#eval zip ["cat", "dog", "fish", "mouse"] [1, 2, 3]

def take {α : Type} (n : Int) (xs : List α) : List α :=
  if n <= 0 then
    []
  else
    match xs with
    | [] => []
    | x :: xs => x :: take (n - 1) xs

#eval take 3 ["bolete", "oyster"]
#eval take 1 ["bolete", "oyster"]
