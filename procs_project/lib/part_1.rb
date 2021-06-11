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

def my_any?(arr, &blk)
  arr.each {|el| return true if blk.call(el)}
  false
end

def my_all?(arr, &blk)
  arr.each {|el| return false unless blk.call(el)}
  true
end

def my_none?(arr, &blk)
  arr.each {|el| return false if blk.call(el)}
  true
end