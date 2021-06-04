# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  count = 0
  repeat = ""
  (0..str.length).each do |i|
    if str[i] != repeat
      if count > 1
        str[i - 1] = count.to_s
      end
      repeat = str[i]
      count = 1
    elsif i == str.length - 1
      count += 1
      str[i - 1] = count.to_s
    else
      count += 1
    end
  end
  str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
