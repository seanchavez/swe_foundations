require_relative "../rspec_exercise_3/lib/part_1.rb"

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


def pretentious_primes(nums, n)
  nums.map do |num|
    if n.negative?
      lesser_primes = prime_range(2, num - 1)
      -n > lesser_primes.length ? nil : lesser_primes[n]
    else
      nth_prime(n, num)
    end
  end
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]