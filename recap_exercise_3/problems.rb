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
    key_i = (key_i + 1) % keys.length
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


class String
  def select(&prc)
    selected = ""
    return selected unless prc
    self.each_char {|char| selected << char if prc.call(char)}
    selected
  end

  def map!(&prc)
    self.length.times {|i| self[i] = prc.call(self[i], i)}
  end
end

# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"

def multiply(a, b)
  return a if a == 0
  if a.positive?
    b + multiply(a - 1, b)
  else
    -b + multiply(a + 1, b)
  end
end

# Examples
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18


def lucas_sequence(n)
  case n
  when 0 then []
  when 1 then [2]
  when 2 then [2, 1]
  else  
    lucas_sequence(n - 1) << lucas_sequence(n - 1)[-1] + lucas_sequence(n - 1)[-2]
  end
end

# Examples
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(num)
  return [] if num < 2
  primes = []
  (2..num).each {|m| primes << m if (2..m / 2).none? {|n| m % n == 0}}
  return [num] if primes.include?(num)
  factor = prime_factor = nil
  primes.each do |prime|
    if num % prime == 0
      factor = num / prime
      prime_factor = prime
      break
    end
  end
  [prime_factor] + prime_factorization(factor)
end

# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]