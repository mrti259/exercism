module Allergies
  ITEMS = [
    "eggs",
    "peanuts",
    "shellfish",
    "strawberries",
    "tomatoes",
    "chocolate",
    "pollen",
    "cats",
  ]
  
  def self.allergic_to(item : String, score : Int32) : Bool
    binary = score.to_s(2).reverse
    item_position = ITEMS.index(item)
    return false if item_position.nil?
    binary[item_position]? == '1'
  end


  def self.list(score : Int32) : Array(String)
    score.to_s(2).chars.reverse
      .map_with_index {|b,i| ITEMS[i]? if b == '1'}
      .reject! {|a| a.nil?}
      .map(&.to_s)
  end
end