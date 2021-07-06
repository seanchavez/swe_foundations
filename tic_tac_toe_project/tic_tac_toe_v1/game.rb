require_relative "board.rb" 
require_relative "human_player.rb"

class Game
  def initialize(mark_1, mark_2)
    @player_1 = HumanPlayer.new(mark_1)
    @player_2 = HumanPlayer.new(mark_2)
    @current_player = @player_1
    @board = Board.new
  end

  def switch_turn
    if @current_player == @player_1 
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_player.get_position, @current_player.mark)
      return puts "victory" if @board.win?(@current_player.mark) 
      self.switch_turn
    end
    puts "draw"
  end
end