require_relative "board"
require_relative "player"

class Battleship
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  attr_reader :board, :player

  def start_game
    @board.place_random_ships
    puts "Board contains #{@board.num_ships} ships"
    @board.print
  end

  def lose?
    return false if @remaining_misses > 0
    puts "you lose"
    true
  end

  def win?
    return false if @board.num_ships > 0
    puts "you win"
    true
  end

  def game_over?
    self.win? || self.lose?  
  end
end
