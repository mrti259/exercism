module Roman
  def to_roman
    raise ArgumentError.new if self <= 0 || self >= 4000
    String.build do |sb|
      add(sb, "M", 1000)
      add(sb, "CDM", 100)
      add(sb, "XLC", 10)
      add(sb, "IVX", 1)
    end.to_s
  end

  protected def add(sb : String::Builder, letters : String, val : Int32)
    x = (self // val) % 10
    sb << if x <= 3
      letters[0,1] * x
    elsif x == 4
      letters[0,2]
    elsif x < 9
      letters[1,1] + letters[0,1] * (x - 5)
    else
      letters[0,1] + letters[2,1]
    end
  end
end

struct Int32
  include Roman
end