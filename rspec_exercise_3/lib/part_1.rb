def is_prime?(num)
  return false if num < 2
  (2..num / 2).none? {|n| num % n == 0}
end

def nth_prime(n)
  num = 1
  m = 0
  until m == n
    num += 1
    m += 1 if is_prime?(num)
  end
  num
end

def prime_range(min, max)
  (min..max).select {|n| is_prime?(n)}
end