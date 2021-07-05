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
    if self.valid?(position) && self.empty?(position)
      @grid[position.first][position.last] = mark
    else
      raise "INVALID POSITION"
    end
  end

  def print
    @grid.each do |row|
      puts row.join(' ')
    end
  end

  def win_row?(mark)
    @grid.any? {|row| row.all? {|m| m == mark}}
  end

  def win_col?(mark)
    @grid.transpose..any? {|row| row.all? {|m| m == mark}}
  end

  def win_diagonal?
    top_left = @grid[0][0]
    bottom_left = @grid[-1][0]
    top_to_bottom = @grid.each_with_index {|row, i| break unless row[i] == top_left}
    bottom_to_top = @grid.reverse.each_with_index {|row, i| break unless row[i] == bottom_left}
    top_to_bottom || bottom_to_top ? true : false
  end
end