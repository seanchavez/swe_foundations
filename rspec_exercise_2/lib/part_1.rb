def partition(arr, n)
  [arr.select {|el| el < n}, arr.select {|el| el >= n}]
end

def merge(hash_1, hash_2)
  merged = {}
  hash_1.each {|k, v| merged[k] = v}
  hash_2.each {|k, v| merged[k] = v}
  merged
end

def censor(sentence, curse_words)
  vowel_s = "aeiou"
  sentence.split.map do |word|
    if curse_words.include?(word.downcase)
      word.chars.map {|char| vowel_s.include?(char.downcase) ? "*" : char}.join
    else
      word
    end
  end.join(" ")
end