def proper_factors(num)
  (1..num / 2).select {|n| num % n == 0}
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(n)
  perfects = []
  m = 1
  until perfects.length == n
    perfects << m if perfect_number?(m)
    m += 1
  end
  perfects
end