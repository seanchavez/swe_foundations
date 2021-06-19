
class Board
  def self.print_grid(grid)
    grid.each {|row| puts row.join(" ")} 
  end

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

  def hidden_ships_grid
    @grid.map {|row| row.map.with_index {|el, i| el == :S ? :N : el}}
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
