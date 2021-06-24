def my_reject(arr, &prc)
  rejects = []
  arr.each {|el| rejects << el unless prc.call(el)}
  rejects
end

def my_one?(arr, &prc)
  has_one = false
  arr.each do |el|
    if prc.call(el)
      return false if has_one
      has_one = true
    end
  end
  has_one
end

def hash_select(hsh, &prc)
  selected = {}
  hsh.each {|k, v| selected[k] = v if prc.call(k, v)}
  selected
end

def xor_select(arr, prc_1, prc_2)
  selects = []
  arr.each do |el| 
    if prc_1.call(el) || prc_2.call(el) 
      selects << el unless prc_1.call(el) && prc_2.call(el)
    end 
  end               
  selects
end

def proc_count(val, procs)
  procs.count {|prc| prc.call(val)}
end