
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
    ships_needed = @size * 0.25
    while self.num_ships < ships_needed
      pos = [rand(@grid.length), rand(@grid.length)]
      self[pos] = :S
    end
  end
end
