def anti_prime?(num)
  num_divisor_count = 0
  1.upto(num) {|m| num_divisor_count += 1 if num % m == 0}
  (num - 1).downto(num / 2) do |n|
    divisor_count = 0
    1.upto(n) {|m| divisor_count += 1 if n % m == 0}
    return false if divisor_count >= num_divisor_count
  end
  true
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false


def matrix_addition(matrix_1, matrix_2)
  new_matrix = Array.new(matrix_1.length) {Array.new(matrix_1.first.length)}
  matrix_1.length.times do |i|
    matrix_1.first.length.times do |j| 
      new_matrix[i][j] = matrix_1[i][j] + matrix_2[i][j]
    end
  end
  new_matrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


def mutual_factors(*nums)
  (1..nums.max).select {|n| nums.all? {|num| num % n == 0}}
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]


def tribonacci_number(n)
  case n
  when 1, 2 then 1
  when 3    then 2
  else 
    tribonacci_number(n - 1) + 
    tribonacci_number(n - 2) + 
    tribonacci_number(n - 3)   
  end
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274