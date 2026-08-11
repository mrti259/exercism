struct Primes
  def self.sieve(limit : Int32) : Array(Int32)
    new().to(limit).to_a
  end

  @primes = Set(Int32).new
  @not_primes = Set(Int32).new
  
  protected def to(limit)
    (2..limit).each do |num|
      next if @not_primes.includes?(num)
      @primes << num
      mark_multiples(num, limit)
    end
    @primes
  end

  protected def mark_multiples(num, limit)
      not_prime = num * 2
      while not_prime <= limit
        @not_primes << not_prime
        not_prime += num
      end
  end
end