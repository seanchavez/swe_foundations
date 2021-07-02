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
      word[first_vowel_index] = word[first_vowel_index].capitalize
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




puts "---------"




puts "---------"




puts "---------"
