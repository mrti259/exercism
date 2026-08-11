module ResistorColorDuo
   RESISTORS = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
   ]
  
  def self.value(values : Array(String)) : Number
    values[0, 2].reduce(0) do |code, color|
      color_code = RESISTORS.index color
      if color_code.nil?
        code
      else
        code * 10 + color_code
      end
    end
  end
end
