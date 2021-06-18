class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? {|peg| POSSIBLE_PEGS.include?(peg.upcase)}
  end

  def self.random(length)
    Code.new(Array.new(length) {POSSIBLE_PEGS.keys.sample})
  end

  def self.from_string(peg_s)
    Code.new(peg_s.chars)
  end

  attr_reader :pegs

  def initialize(pegs)
    Code.valid_pegs?(pegs) ? @pegs = pegs.map(&:upcase) : (raise "INVALID PEGS")
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    @pegs.select.with_index {|peg, i| peg == guess[i].to_s}.length
  end

  def num_near_matches(guess)
    filtered_guess = guess.pegs.reject.with_index {|peg, i| peg == @pegs[i]}
    filtered_code = @pegs.reject.with_index {|peg, i| peg == guess.pegs[i]}
    filtered_guess.reduce(0) do |near_matches, peg|
      if filtered_code.include?(peg)
        filtered_code.slice!(filtered_code.index(peg))
        near_matches + 1
      else
        near_matches
      end
    end
  end

  def ==(other_code)
    @pegs == other_code.pegs
  end
end
