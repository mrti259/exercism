module CollatzConjecture
  extend self
  
  def steps(input : Int32, i : Int32 = 0) : Int32
    if input < 1
      raise ArgumentError.new
    elsif input == 1
      i
    elsif input.even?
      steps(input // 2, i + 1)
    else
      steps(3 * input + 1, i + 1)
    end
  end
end
