def woodlandCritters : List String :=
  ["hedgehog", "deer", "snail"]

def hedgehog := woodlandCritters[0]
def deer := woodlandCritters[1]
def snail := woodlandCritters[2]
-- def oops := woodlandCritters[3]

#eval hedgehog
#eval deer
#eval snail 
-- #eval oops

def main : IO Unit :=
  pure ()
