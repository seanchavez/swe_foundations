def conjunct_select(arr, *prcs)
  arr.select do |el|
    prcs.all? {|prc| prc.call(el)}
  end
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]
puts "---------"


def convert_pig_latin(sent)
  sent.split.map {|word| word.length < 3 ? word : pigify_word(word)}.join(" ")
end

def pigify_word(word)
  first_vowel_index = word.index(/[aeiou]/i)   
  if first_vowel_index == 0
     word + "yay" 
  else
    if word[0] == word[0].upcase
      word[0] = word[0].downcase
      word[first_vowel_index] = word[first_vowel_index].upcase
    end
    word[first_vowel_index..-1] + word[0...first_vowel_index] + "ay"
  end
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"
puts "---------"


def reverberate(sent)
  sent.split.map {|word| word.length < 3 ? word : reverb_word(word)}.join(" ")
end

def reverb_word(word)
  vowel_exp = /[aeiou]/i
  last_vowel_index = nil
  word.each_char.with_index do |char, i|
    last_vowel_index = i if char =~ vowel_exp 
  end
  if last_vowel_index == word.length - 1
    word[0] == word[0].upcase ? (word * 2).capitalize : word * 2
  else
    word + word[last_vowel_index..-1]
  end
end

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"
puts "---------"


def disjunct_select(arr, *prcs)
  arr.select {|el| prcs.any? {|prc| prc.call(el)}}
end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]
puts "---------"


def alternating_vowel(sent)
  vowel_exp = /[aeiou]/i
  sent.split.map.with_index do |word, i|
    if i.odd? 
      last_i = word.last_index(vowel_exp)
      last_i.nil? ? word : word[0...last_i] + word[last_i + 1 .. -1]
    else
      first_i = word.index(vowel_exp)
      first_i.nil? ? word : word[0...first_i] + word[first_i + 1 .. -1]
    end
  end.join(" ")
end

class String
  def last_index(exp)
    i = self.length - 1
    until i < 0
    return i if self[i] == exp || self[i] =~ exp
    i -= 1
    end
    nil
  end
end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"
puts "---------"


def silly_talk(sent)
  vowel_exp = /[aeiou]/i
  sent.split.map.with_index do |word, i|
    if word[-1] =~ vowel_exp
      word + word[-1]
    else
      word.chars.map do |char| 
        char =~ vowel_exp ? char + "b" + char.downcase : char
      end.join
    end
  end.join(" ")
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"
puts "---------"


def compress(str)
  compressed = ""
  count = 1
  str.length.times do |i|
    if str[i] == str[i+1]
      count += 1
    else
      count < 2 ? compressed += str[i] : compressed += str[i] + count.to_s 
      count = 1
    end
  end
  compressed
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"