class LargestSeriesProduct
  def initialize(@serie : String)
    raise ArgumentError.new if @serie.chars.any? do |char|
      !char.number?
    end
  end

  def largest_product(length : Number) : Number
    diff = @serie.size - length
    raise ArgumentError.new if diff.negative?
    max = 0
    (diff + 1).times do |i|
      prod = @serie[i, length].chars.reduce(1) {|p, c| p * c.to_i}
      max = prod if prod > max
    end
    max
  end
end
