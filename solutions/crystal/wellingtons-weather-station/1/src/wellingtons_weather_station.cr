class Temperature
  def to_kelvin(celsius)
    celsius + 273.15
  end

  def round(celsius)
    celsius.round(1)
  end

  def to_fahrenheit(celsius)
    (32 + 1.8 * celsius).to_i
  end

  def number_missing_sensors(number_of_sensors)
    remainder = number_of_sensors % 4
    return 0 if remainder == 0
    4 - remainder
  end
end
