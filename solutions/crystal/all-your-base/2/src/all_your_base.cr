module AllYourBase
  extend self
  def rebase(input_base : Int32, digits : Array(Int32), output_base : Int32) : Array(Int32)
    check_rebase(input_base, digits, output_base)
    decimal = to_decimal(digits, input_base)
    decimal_to_base(decimal, output_base)
  end
  private def check_rebase(input_base : Int32, digits : Array(Int32), output_base : Int32) : Nil
    raise ArgumentError.new("Invalid input base") if input_base < 2
    raise ArgumentError.new("Invalid output base") if output_base < 2
    raise ArgumentError.new("Negative digit") if digits.any?(&.negative?)
    raise ArgumentError.new("Invalid positive digit") if digits.any? {|digit| digit >= input_base}
  end
  private def to_decimal(digits : Array(Int32), input_base : Int32) : Int32
    decimal = 0
    digits.reverse.each_with_index do |digit, index|
      decimal += digit * (input_base ** index)
    end
    decimal
  end
  private def decimal_to_base(decimal : Int32, output_base) : Array(Int32)
    output = Array(Int32).new
    while decimal != 0
      decimal, digit = decimal.divmod output_base
      output << digit
    end
    output << 0 if output.empty?
    output.reverse
  end
end