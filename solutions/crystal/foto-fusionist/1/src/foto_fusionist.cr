class FotoFusionist
  def self.binary_to_int(binary : String) : Int32
    binary.to_i(2)
  end

  def self.least_significant_bit(number : Int32) : Int32
    number.to_s(2).chars.last.to_i
  end

  def self.hex_value(number : Int32) : String
    number.to_s(16, precision: 2)
  end

  def self.hex_value_from_rgb(red : Int32, green : Int32, blue : Int32) : String
    String.build do |sb|
      sb << hex_value red
      sb << hex_value green
      sb << hex_value blue
    end
  end
end
