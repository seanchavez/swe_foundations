
def largest_prime_factor(num)
  prime_factors = (2..num / 2).select {|n| num % n == 0 && prime?(n)}
  prime_factors << num if prime?(num)
  prime_factors.last
end

def prime?(num)
  return false if num < 2
  (2..num / 2).each do |factor|
    if num % factor == 0
      return false
    end
  end
  true
end