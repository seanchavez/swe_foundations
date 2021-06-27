def matrix_addition_reloaded(*matrices)
  height = matrices.first.length
  width = matrices.first.first.length
  matrices.each do |matrix| 
    return nil unless matrix.length == height
    matrix.each {|row| return nil unless row.length == width}
  end
  new_matrix = Array.new(height) {Array.new(width)}
  height.times do |i|
    width.times do |j|
      sum = matrices.reduce(0) {|memo, matrix| memo + matrix[i][j]} 
      new_matrix[i][j] = sum
    end
  end
  new_matrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil