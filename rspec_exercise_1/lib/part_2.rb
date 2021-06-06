def hipsterfy(word)
  word.reverse.sub(/[aeiou]/, "").reverse
end

def vowel_counts(str)
  vowel_s = "aeiou"
  vowel_tally = Hash.new(0)
  str.each_char do |char| 
    char = char.downcase
    vowel_tally[char] += 1 if vowel_s.include?(char)
  end
  vowel_tally
end