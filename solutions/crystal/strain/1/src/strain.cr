class Array(T)
  def keep
    arr = Array(T).new()
    each do |el|
      arr << el if yield el
    end
    arr
  end

  def discard
    arr = Array(T).new()
    each do |el|
      arr << el unless yield el
    end
    arr
  end
end