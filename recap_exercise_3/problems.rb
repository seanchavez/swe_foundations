def no_dupes?(arr)
  arr.reject {|el| arr.count(el) > 1}
end

# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
  (1...arr.length).each {|i| return false if arr[i] == arr[i - 1]}
  return true
end

# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  indices = Hash.new {|h, k| h[k] = []}
  str.each_char.with_index {|char, i| indices[char] << i}
  indices
end

# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  longest = ""
  streak = ""
  (0...str.length).each do |i|
    longest = streak if streak.length >= longest.length
    if str[i] == str[i - 1]
      streak << str[i]
    longest = streak if streak.length >= longest.length
    else
      streak = str[i]
    longest = streak if streak.length >= longest.length
    end
  end
  longest
end

# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

def bi_prime?(num)
  primes = []
  (2..num).each {|m| primes << m if (2..m / 2).none? {|n| m % n == 0}}
  (0...primes.length - 1).each do |i|
    (1...primes.length).each {|j| return true if primes[i] * primes[j] == num}
  end
  false
end

# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
