module ResistorColorTrio
  RESISTORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
  PREFIXES = ["", "kilo", "mega", "giga"]
  
  def self.label(values : Array(String)) : String
    prefix = ""
    value = values[0, 2].reduce(0_i64) do |val, color|
      val * 10 + (RESISTORS.index(color) || 0)
    end * (10 ** (RESISTORS.index(values[2]) || 0))
    i = 0
    while value >= 1000 && i < PREFIXES.size
      value = value // 1000
      i += 1
    end
    prefix = PREFIXES[i]
    "#{value} #{prefix}ohms"
  end
end
