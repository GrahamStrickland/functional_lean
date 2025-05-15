def hello := "Hello"
def lean : String := "Lean"

#eval String.append hello (String.append " " lean)

def add1 (n : Nat) : Nat := n + 1
#eval add1 7

def maximum (n : Nat) (k : Nat) : Nat :=
  if n < k then
    k
  else n

#eval maximum (5 + 8) (2 * 7)

#check add1
#check (add1)
#check (maximum)
#check maximum 3
#check String.append "Hello "

def joinStringsWith (s1 : String) (s2 : String) (s3 : String) : String :=
  String.append s2 (String.append s1 s3)

#eval joinStringsWith ", " "one" "and another"
#check (joinStringsWith)

def volume (height : Nat) (width : Nat) (depth : Nat) : Nat := height * width * depth

#eval volume 3 4 5

def Str : Type := String
def aStr : Str := "This is a string."

#eval aStr
#check aStr

def NaturalNumber : Type := Nat
def thirtyEight : NaturalNumber := (38 : Nat)
#eval thirtyEight

abbrev N : Type := Nat
def thirtyNine : N := 39
#eval thirtyNine
