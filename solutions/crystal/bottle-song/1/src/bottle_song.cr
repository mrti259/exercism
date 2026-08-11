module BottleSong
  extend self
  def recite(start_bottles : Int32, take_down : Int32)
    return [] of String if take_down == 0
    arr = [
      "#{num_to_str(start_bottles).capitalize} green bottle#{s(start_bottles)} hanging on the wall,",
      "#{num_to_str(start_bottles).capitalize} green bottle#{s(start_bottles)} hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be #{num_to_str(start_bottles - 1)} green bottle#{s(start_bottles - 1)} hanging on the wall.",
    ]
    if take_down > 1
      arr.push("")
    end
    arr.concat(recite(start_bottles - 1, take_down - 1))
  end
  protected def num_to_str(num : Int32)
    ["no", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"][num]
  end
  protected def s(num : Int32)
    num == 1 ? "" : "s"
  end
end
