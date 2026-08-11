module Squares
  extend self

  def square_of_sum(input : Number) : Number
    sum = 0.step(to: input).sum
    sum ** 2
  end

  def sum_of_squares(input : Number) : Number
    sqrs = 0.step(to: input).map {|num| num ** 2} 
    sqrs.sum
  end

  def difference_of_squares(input : Number) : Number
    square_of_sum(input) - sum_of_squares(input)
  end
end
