def element_count(arr)
  el_count = Hash.new(0)
  arr.each {|el| el_count[el] += 1}
  el_count
end

def char_replace!(str, hsh)
  str.each_char.with_index {|c, i| str[i] = hsh[c] if hsh.has_key?(c)}
end

def product_inject(nums)
  nums.inject(:*)
end