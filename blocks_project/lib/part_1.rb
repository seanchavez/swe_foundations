require "byebug"

def select_even_nums(nums)
  nums.select(&:even?)
end

def reject_puppies(dogs)
  dogs.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays(two_d_arr)
  two_d_arr.count {|arr| arr.sum > 0}
end