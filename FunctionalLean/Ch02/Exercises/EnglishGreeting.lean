def main : IO Unit := do
  let englishGreeting := IO.println "Hello!"
  IO.println "Bonjour!"
  englishGreeting

-- main
-- ===>
-- IO.println "Bonjour!" -> act  (side effect)
-- ===> 
-- englishGreeting       -> expr
-- IO.println "Hello!"   -> expr (side effect)
