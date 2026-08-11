# Please implement your solution to triangle in this file
class Triangle(T)
  @sides : Array(T)
  
  def initialize(sides : Tuple(T, T, T))
    @sides = sides.to_a
    raise ArgumentError.new if @sides.any? do |side| side <= 0 end
    raise ArgumentError.new if @sides.any? do |side| (@sides.sum - 2 * side) < 0 end
  end

  def equilateral?
    @sides.uniq.size == 1
  end

  def isosceles?
    @sides.uniq.size <= 2
  end

  def scalene?
    @sides.uniq.size == 3
  end
end