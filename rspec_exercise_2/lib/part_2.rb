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
  subs = []
  i = 0
  while i < str.length
    j = i
    while j < str.length
      subs << str[i..j]
      j += 1
    end
    i +=1
  end
  subs
end