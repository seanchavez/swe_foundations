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
end
