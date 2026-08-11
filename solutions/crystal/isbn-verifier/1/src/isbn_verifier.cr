struct IsbnVerifier
  def self.valid?(isbn : String) : Bool
    new(isbn).valid?
  rescue
    false
  end

  def initialize(@isbn : String)
  end

  def convert
    @isbn
      .downcase
      .chars
      .reverse
      .reject do |char| char == '-' end
      .map_with_index do |char, i|
        num = if char.number?
          char.to_i
        elsif char == 'x'
          raise ArgumentError.new unless i == 0
          10
        else
          raise ArgumentError.new
        end
        num * (i + 1)
      end
  end

  def valid?
    nums = convert
    return false unless nums.size == 10
    nums.sum.divisible_by?(11)
  end
end