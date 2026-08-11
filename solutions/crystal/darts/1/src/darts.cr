module Darts  
  struct Area
    getter score : Int32
    
    def initialize(@radius : Int32, @score : Int32)
    end

    def accept?(x : Number, y : Number)
      (x ** 2 + y ** 2) <= @radius ** 2
    end
  end
  
  def self.score(x : Number, y : Number) : Number
    areas = [Area.new(10, 1), Area.new(5, 5), Area.new(1, 10)]
    areas.reduce(0) do |scored, area|
      if area.accept? x, y
        area.score
      else
        scored
      end
    end 
  end
end
