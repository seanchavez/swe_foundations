class Board
  def initialize
    @grid = Array.new(3) {Array.new(3, "_")}
  end

  def valid?(position)
    position.first < @grid.length && position.last < @grid.first.length
  end

  def empty?(position)
    @grid[position.first][position.last] == "_"
  end

  def place_mark(position, mark)
    unless self.valid?(position) && self.empty?(position)
      raise "You can't put your mark there!"
    end
    @grid[position.first][position.last] = mark
  end
end