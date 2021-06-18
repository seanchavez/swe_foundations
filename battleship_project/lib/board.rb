class Board
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  attr_reader :size

  def [](pos)
    @grid[pos.first][pos.last]
  end

  def []=(pos, val)
    @grid[pos.first][pos.last] = val
  end

  def num_ships
    @grid.reduce(0) {|count, row| count + row.count(:S)}
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end  
  end

  def place_random_ships
    left_to_set = (self.size / 0.25).to_i
    until left_to_set == 0
      dimension = Math.sqrt(self.size)
      pos = [rand(dimension), rand(dimension)]
      unless self[pos] == :S
        self[pos] = :S
        left_to_set -= 1
      end
    end
  end
end
