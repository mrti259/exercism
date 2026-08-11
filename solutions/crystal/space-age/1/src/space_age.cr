# Please implement your solution to space-age in this file
module Space
  extend self
  
  struct Age
    def self.from_seconds(seconds : Number)
      new seconds.seconds.total_days
    end

    protected def initialize(@days_on_earth : Float64)
    end

    def age_on_earth
      @days_on_earth / 365.25
    end
  
    def age_on_mercury
      age_on_earth / 0.2408467
    end
    
    def age_on_venus
      age_on_earth / 0.61519726
    end
    
    def age_on_mars
      age_on_earth / 1.8808158
    end
    
    def age_on_jupiter
      age_on_earth / 11.862615
    end
  
    def age_on_saturn
      age_on_earth / 29.447498
    end

    def age_on_uranus
      age_on_earth / 84.016846
    end
  
    def age_on_neptune
      age_on_earth / 164.79132
    end
  end
end