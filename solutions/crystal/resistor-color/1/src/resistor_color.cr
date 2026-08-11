module ResistorColor
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
    "white",
    ]
  
  def self.color_code(color : String) : Int32 | Nil
    RESISTORS.index color
  end

  def self.colors : Array
    RESISTORS.to_a
  end
end
