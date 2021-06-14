# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min if self.all? {|el| el.is_a? Numeric}
  end

  def average
    return nil if self.empty?
    self.sum / self.length.to_f if self.all? {|el| el.is_a? Numeric}
  end

  def median
    return nil if self.empty?
    sorted = self.sort
    mid = self.length / 2
    self.length.odd? ? sorted[mid] : sorted[mid - 1..mid].sum / 2.0
  end

  def counts
    count_h = Hash.new(0)
    self.each {|el| count_h[el] += 1}
    count_h
  end
end
