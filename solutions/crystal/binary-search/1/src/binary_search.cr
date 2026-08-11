struct BinarySearch(T)
  def initialize(@arr : Array(T))
  end

  def find(value : T) : Int32
    find_rec(value, 0, @arr.size)
  end

  protected def find_rec(value : T, start_pos : Int32, end_pos : Int32) : Int32
    raise ArgumentError.new if start_pos == end_pos
    
    pos = (start_pos + end_pos) // 2
    item = @arr[pos]
    if value < item
      find_rec(value, start_pos, pos)
    elsif value > item
      find_rec(value, pos + 1, end_pos)
    else
      pos
    end
  end
end
