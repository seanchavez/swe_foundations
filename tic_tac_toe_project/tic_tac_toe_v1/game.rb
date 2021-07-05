require_relative "board.rb" 
require_relative "game.rb"

class Game
  def initialize(mark_1, mark_2)
    @player_1 = HumanPlayer.new(mark_1)
    @player_2 = HumanPlayer.new(mark_2)
    @current_player = @player_1
  end

  def switch_turn
    if @current_player == @player_1 
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end
end