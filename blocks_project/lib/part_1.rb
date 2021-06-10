require "byebug"

def select_even_nums(nums)
  nums.select(&:even?)
end

def reject_puppies(dogs)
  dogs.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays(two_d_arr)
  two_d_arr.count {|arr| arr.sum > 0}
end

def aba_translate(word)
  vowel_s = "aeiou"
  word.chars.reduce("") do |trans, char| 
    if vowel_s.include?(char)
      trans + char + "b" + char
    else
      trans + char
    end
  end
end

def aba_array(words)
  words.map {|word| aba_translate(word)}
end