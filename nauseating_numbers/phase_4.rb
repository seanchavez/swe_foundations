def mersenne_prime(n)
  count = 0
  pow = 1
  until count == n
    pow += 1
    poss = 2 ** pow - 1
    count += 1 if is_prime?(poss)
  end
  poss
end

def is_prime?(num)
  return false if num < 2
  (2..num / 2).none? {|n| num % n == 0}
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071