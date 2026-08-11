struct Luhn
  def self.valid?(input : String) : Bool
    new(input).valid?
  end

  protected def initialize(@code : String)
    remove_whitespace!
  end

  protected def valid? : Bool
    valid_size? && valid_sum?
  end

  protected def valid_size? : Bool
    @code.size > 1
  end

  protected def valid_sum? : Bool
    @code.chars.reverse.map_with_index do |char, i|
      num = char.to_i
      num *= 2 if i % 2 == 1
      num -= 9 if num > 9
      num
    end.sum.divisible_by? 10
  rescue
    false
  end

  protected def remove_whitespace!
    @code = @code.delete &.whitespace?
  end
end