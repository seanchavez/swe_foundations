def average(m, n)
  (m + n) / 2.0
end

def average_array(nums)
  nums.sum / nums.length.to_f
end

def repeat(str, num)
  result = ""
  num.times {result << str}
  result
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sentence)
  sentence.split.map.with_index {|word, i| i.odd? ? word.downcase : word.upcase}.join(" ")
end