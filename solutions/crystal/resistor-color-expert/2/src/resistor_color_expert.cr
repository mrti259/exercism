module ResistorColorExpert
  COLORS = [
    "black", "brown", "red",
    "orange", "yellow", "green",
    "blue", "violet", "grey",
    "white",
  ]

  TOLERANCE = {
    "black" => 0,
    "grey" => 0.05,
    "violet" => 0.10,
    "blue" => 0.25,
    "green" => 0.5,
    "brown" => 1,
    "red" => 2,
    "gold" => 5,
    "silver" => 10,
  }

  def self.resistor_label(bands : Array(String)) : String
    String.build do |sb|
      sb << resistance(bands)
      sb << " " << tolerance(bands) if bands.size > 3
    end
  end

  private def self.resistance(bands : Array(String)) : String
    i_multiplier = bands.size == 5 ? 3 : 2

    value = bands[0,i_multiplier].reduce(0) do |total, color|
      10 * total + COLORS.index! color
    end

    value *= 10 ** COLORS.index! bands[i_multiplier] if bands.size > i_multiplier
  
    return "#{value} ohms" if value < 1000

    value, remainder = value.divmod 1000
    value += remainder / 1000 unless remainder == 0
    return "#{value} kiloohms" if value < 1000

    value, remainder = value.divmod 1000
    value += remainder / 1000 unless remainder == 0
    "#{value} megaohms"
  end

  private def self.tolerance(bands : Array(String)) : String
    value = TOLERANCE[bands.last]
    "±#{value}%"
  end
end
