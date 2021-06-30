def mersenne_prime(n)
  count = 0
  pow = 1
  until count == n
    pow += 1
    poss = 2 ** pow - 1
    count += 1 if is_prime?(poss)
  end
  poss
end

def is_prime?(num)
  return false if num < 2
  (2..num / 2).none? {|n| num % n == 0}
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071


def triangular_word?(word)
  alphabet = ("a".."z").each_with_index.to_h
  encoding = word.chars.reduce(0) {|sum, char| sum + alphabet[char] + 1}
  triangular_num?(encoding)
end

def triangular_num?(num)
  i = 1
  tri = 1
  while tri < num
    i += 1
    tri = (i * (i + 1)) / 2 
    return true if tri == num
  end
  false
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false


def consecutive_collapse(nums)
  collapsed = [*nums]
  done = false
  until done
    done = true
    (1...collapsed.length).each do |i|
      if collapsed[i - 1] == collapsed[i].pred || collapsed[i - 1] == collapsed[i].next
        collapsed = collapsed[0...i - 1] + collapsed[i + 1..-1]
        done = false
        break
      end  
    end
  end
  collapsed
end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []