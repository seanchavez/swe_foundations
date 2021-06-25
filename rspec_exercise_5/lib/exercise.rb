require_relative "../../rspec_exercise_4/lib/part_1.rb"

def zip(*arrs)
  zipped = []
  arrs.first.length.times do |i|
    zipped[i] = []
    arrs.each {|arr| zipped[i] << arr[i]}
  end
  zipped
end

def prizz_proc(arr, prc_1, prc_2)
  xor_select(arr, prc_1, prc_2)
end

def zany_zip(*arrs)
  zipped = []
  arrs.max {|a, b| a.length <=> b.length}.length.times do |i|
    zipped[i] = []
    arrs.each {|arr| arr[i] ? zipped[i] << arr[i] : zipped[i] << nil}  
  end
  zipped
end

def maximum(arr, &prc)
  arr.reduce {|largest, el| prc.call(largest) > prc.call(el) ? largest : el}
end