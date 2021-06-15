class GuessingGame
  def initialize(min, max)
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  def num_attempts
    @num_attempts
  end

  def game_over?
    @game_over
  end

  def check_num(num)
    @num_attempts += 1
    case  
    when num > @secret_num then puts "too big"
    when num < @secret_num then puts "too small"
    else   
      @game_over = true 
       puts "you win"
    end
  end

  def ask_user
    puts "Enter a number: "
    input_num = gets.chomp.to_i
    self.check_num(input_num)
  end
end
