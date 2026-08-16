module Say  
  alias Arr = Array(String)
  
  def self.number(n : Int64) : String
    check_in_range(n)
    return "zero" if n == 0
    arr = Array(String).new
    n = billions(arr, n)
    n = millions(arr, n)
    n = thousands(arr, n)
    n = hundreds(arr, n)
    tens_units(arr, n)
    arr.join " "
  end

  private def self.check_in_range(n : Int) : Nil
    return if n >= 0 && n <= 999_999_999_999
    raise ArgumentError.new("Out of range")
  end
  
  private def self.billions(arr : Arr, n : Int) : Int
    n, r = n.divmod 1_000_000_000
    unless n == 0
      n = hundreds(arr, n)
      tens_units(arr, n)
      arr << "billion"
    end
    r
  end
  
  private def self.millions(arr : Arr, n : Int) : Int
    n, r = n.divmod 1_000_000
    unless n == 0
      n = hundreds(arr, n)
      tens_units(arr, n)
      arr << "million"
    end
    r
  end
  
  private def self.thousands(arr : Arr, n : Int) : Int
    n, r = n.divmod 1_000
    unless n == 0
      n = hundreds(arr, n)
      tens_units(arr, n)
      arr << "thousand"
    end
    r
  end
  
  private def self.hundreds(arr : Arr, n : Int) : Int
    n, r = n.divmod 100
    unless n == 0
      tens_units(arr, n)
      arr << "hundred"
    end
    r
  end
  
  private def self.tens_units(arr : Arr, n : Int) : Nil
    return if n == 0
    tens = ["", "", "twenty", "thirty", "forty", "fifty",
      "sixty", "seventy", "eighty", "ninety"]
    units = ["", "one", "two", "three", "four", "five",
      "six", "seven", "eight", "nine", "ten",
      "eleven", "twelve", "thirdteen", "fourteen", "fifteen",
      "sixteen", "seventeen", "eighteen", "nineteen"]
    q, r = n.divmod tens.size
    arr << if q > 1
      x = tens[q]
      x += "-" + units[r] if r != 0
      x
    else 
      units[n]
    end
  end
end
