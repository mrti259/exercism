# Please implement your solution to binary in this file
module Binary
  def self.to_decimal(input : String) : Int32
    digits = input
      .chars
      .map(&.to_i)

    raise ArgumentError.new unless digits.all? {|d| [0,1].includes? d}
    
    digits
      .reverse
      .map_with_index {|d, i| d * 2 ** i}
      .sum
  end
end