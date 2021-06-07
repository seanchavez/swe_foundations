def palindrome?(str)
  i = str.length - 1
  reversed = ""
  while i >= 0 
    reversed << str[i]
    i -= 1
  end
  str == reversed
end

def substrings(str)
  
end