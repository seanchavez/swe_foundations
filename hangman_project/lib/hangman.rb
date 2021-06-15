class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matches = []
    @secret_word.chars.each_with_index {|c, i| matches << i if c == char}
    matches
  end

  def fill_indices(char, indices)
    indices.each {|index| @guess_word[index] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      false
    else
      matches = self.get_matching_indices(char)
      if matches.empty? 
        @remaining_incorrect_guesses -= 1 
      else
        self.fill_indices(char, matches)
      end
      @attempted_chars << char
      true  
    end
  end

  def ask_user_for_guess
    puts "Enter a char: "
    guess = gets.chomp
    self.try_guess(guess)
  end

  def win?
    return false unless @guess_word.join == @secret_word
    puts "WIN"
    true
  end

  def lose?
    return false unless @remaining_incorrect_guesses == 0
    puts "LOSE"
    true
  end

  def game_over?
    return false unless self.win? || self.lose?
    puts @secret_word
    true
  end
end
