module LineUp
  def self.format(name : String, number : Int32) : String
    last_num = number % 10
    last_2 = number % 100
    suffix = last_num == 1 && last_2 != 11 ? "st"
      : last_num == 2 && last_2 != 12 ? "nd"
      : last_num == 3 && last_2 != 13 ? "rd"
      : "th";
    "#{name}, you are the #{number}#{suffix} customer we serve today. Thank you!"
  end
end
