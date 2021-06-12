def reverser(str, &blk)
  blk.call(str.reverse)
end

def word_changer(sentence, &blk)
  sentence.split.map {|word| blk.call(word)}.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  result_1 = prc_1.call(num)
  result_2 = prc_2.call(num)
  result_1 > result_2 ? result_1 : result_2
end