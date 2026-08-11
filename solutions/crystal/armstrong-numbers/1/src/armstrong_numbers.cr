module ArmstrongNumbers
  def self.armstrong_number?(input : Number) : Bool
    arr = input.to_s.chars.map {|char| char.to_i}
    input == arr.sum {|i| i ** arr.size}
  end
end
