module PerfectNumbers
  def self.classify(num : Number) : String
    raise ArgumentError.new unless num.positive?

    factors = Array(Int32).new
    i = 1

    while i * i < num
      quotient, modulus = num.divmod i 

      if modulus == 0
        factors << i
        factors << quotient if quotient != num
      end

      i += 1 
    end

    sum = factors.sum

    if sum == num
      "perfect"
    elsif sum > num
      "abundant"
    else
      "deficient"
    end
  end
end
