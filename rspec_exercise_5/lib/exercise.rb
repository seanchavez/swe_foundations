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

def my_group_by(arr, &prc)
  grouped = Hash.new {|h, k| h[k] = []}
  arr.each {|el| grouped[prc.call(el)] << el}
  grouped
end

def max_tie_breaker(arr, prc, &blk)
  arr.reduce do |lrg, el|
    case 
    when blk.call(el) > blk.call(lrg) then el 
    when blk.call(el) == blk.call(lrg) 
      prc.call(el) > prc.call(lrg) ? el : lrg
    else lrg 
    end
  end
end

def silly_syllables(sent)
  vowel_s = "aeiou"
  sent.split.map do |word|
    start_i = end_i = nil
    word.each_char.with_index do |char, i| 
      if vowel_s.include?(char)
        start_i ? end_i = i : start_i = i
      end
    end
    end_i ? word[start_i..end_i] : word
  end.join(" ")
end