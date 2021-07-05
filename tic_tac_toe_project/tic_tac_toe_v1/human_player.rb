class HumanPlayer
  def initialize(mark_value)
    @mark = mark_value.to_sym
  end

  attr_reader :mark

  def get_position
    puts "Player #{@mark} enter a position like this: 'row col'"
    input = gets.chomp
    raise "INVALID INPUT" unless input =~ /[0-9] [0-9]/
    input.split.map(&:to_i)
  end
end