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
      puts row
    end
  end

  def win_row?(mark)
    @grid.any? {|row| row.all? {|m| m == mark}}
  end

  def win_col?(mark)
    @grid.transpose.any? {|row| row.all? {|m| m == mark}}
  end

  def win_diagonal?(mark)
    top_to_bottom = @grid.each_with_index {|row, i| break unless row[i] == mark}
    bottom_to_top = @grid.reverse.each_with_index {|row, i| break unless row[i] == mark}
    !!(top_to_bottom || bottom_to_top)
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.any? {|row| row.any? {|m| m == "_"}}
  end
end