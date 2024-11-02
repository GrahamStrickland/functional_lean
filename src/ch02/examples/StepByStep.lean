#eval "Hello!!!".dropRightWhile (· == '!')

#eval "Hello...   ".dropRightWhile (fun c => not (c.isAlphanum))
