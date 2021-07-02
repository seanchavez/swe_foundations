def duos(str)
  count = 0
  str.each_char.with_index {|char, i| count += 1 if char == str[i+1]}
  count
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0
puts "---------"


def sentence_swap(sent, hsh)
  sent.split.map {|word| hsh.has_key?(word) ? hsh[word] : word}.join(" ")
end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'
puts "---------"


def hash_mapped(hsh, prc, &blk)
  new_hsh = {}
  hsh.each {|k, v| new_hsh[blk.call(k)] = prc.call(v)}
  new_hsh
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}
puts "---------"


def counted_characters(str)
  str.chars.select {|char| char if str.count(char) > 2}.uniq
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []
puts "---------"


def triplet_true(str)
  (str.length - 2).times {|i| return true if str[i, 3] == str[i] * 3}
  false
end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false
puts "---------"


def energetic_encoding(str, hsh)
  str.chars.map do |char|
    case 
    when hsh.has_key?(char) then hsh[char]
    when char == " " then char
    else "?"
    end
  end.join
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'
puts "---------"


def uncompress(str)
  new_str = ""
  str.length.times {|i| new_str += str[i-1] * str[i].to_i if i.odd?}
  new_str
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'