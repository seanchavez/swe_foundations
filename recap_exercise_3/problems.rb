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
  str.length.times do |i|
    str[i] == str[i - 1] ? streak << str[i] : streak = str[i]
    longest = streak if streak.length >= longest.length
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

def vigenere_cipher(message, keys)
  alphabet = ("a".."z").to_a
  cipher_txt = ""
  key_i = 0
  message.each_char do |char|
    cipher_txt << alphabet[(alphabet.index(char) + keys[key_i]) % 26]
    key_i == keys.length - 1 ? key_i = 0 : key_i += 1
  end
  cipher_txt
end

# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
  vowels = %w(a e i o u)
  vowels_in_str = str.chars.select {|char| vowels.include?(char)}
  vowels_in_str = [vowels_in_str[-1]] + vowels_in_str[0..-2]
  str.chars.map.with_index do |char, i|
    vowels.include?(char) ? vowels_in_str.shift : char
  end.join
end

# Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"