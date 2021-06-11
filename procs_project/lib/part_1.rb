def my_map(arr, &blk)
  new_arr = []
  arr.each {|el| new_arr << blk.call(el)}
  new_arr
end

def my_select(arr, &blk)
  new_arr = []
  arr.each {|el| new_arr << el if blk.call(el)}
  new_arr
end

def my_count(arr, &blk)
  count = 0
  arr.each {|el| count += 1 if blk.call(el)}
  count
end