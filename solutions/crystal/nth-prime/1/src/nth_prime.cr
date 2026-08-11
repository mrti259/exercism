module NthPrime
  def self.prime(number : Number) : Number
    raise ArgumentError.new unless number > 0
    return 2 if number == 1
    n = 3
    while number > 2
      n = next_prime(n)
      number -= 1
    end
    n
  end

  def self.next_prime(number : Number) : Number
    loop do
      number += 2
      return number if prime? number
    end
  end

  def self.prime?(number : Number) : Bool
    2.to(number // 2) do |divisor|
      return false if number % divisor == 0
    end
    true
  end
end
