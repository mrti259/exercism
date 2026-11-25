class CastleDinner
  def self.check_food?(food : String) : String?
    return food if food == "Mushroom pasties"
  end

  def self.check_drink?(drink : String) : String?
    return drink if drink.downcase.includes? 'i'
  end

  def self.replace_drink(drink : String) : String
    check_drink?(drink) || "Apple juice"
  end
end
