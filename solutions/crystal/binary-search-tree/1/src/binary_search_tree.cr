class Node(T)

  getter value : T
  getter left : Node(T) | Nil = nil
  getter right : Node(T) | Nil = nil
  
  def initialize(value : T)
    @value = value
  end

  def insert(value : T) : Node(T)
    if value <= @value
      @left = insert_left value
    else
      @right = insert_right value
    end
    self
  end

  protected def insert_left(value : T) : Node(T)
    if  @left.nil?
      Node.new value
    else
      @left.not_nil!.insert value
    end
  end

  protected def insert_right(value : T) : Node(T)
    if  @right.nil?
      Node.new value
    else
      @right.not_nil!.insert value
    end
  end

  def delete(value : T) : Nil
    if value <= @value
      @right = delete_left value
    end
    if value >= @value
      @left = delete_right value
    end
  end

  protected def delete_left(value : T) : Node(T) | Nil
    if  @left.nil?
      self
    else
      @left.not_nil!.delete value
    end
  end

  protected def delete_right(value : T) : Node(T) | Nil
    if  @right.nil?
      self
    else
      @right.not_nil!.delete value
    end
  end

  def search(value : T) : Node(T) | Nil
    if value == @value
      self
    elsif value < @value
      search_left value
    else
      search_right value
    end
  end

  protected def search_left(value : T) : Node(T) | Nil
    if  @left.nil?
      nil
    else
      @left.not_nil!.search value
    end
  end

  protected def search_right(value : T) : Node(T) | Nil
    if  @right.nil?
      nil
    else
      @right.not_nil!.search value
    end
  end

  def sort : Array(T)
    arr = Array(T).new
    arr.concat @left.not_nil!.sort unless @left.nil?
    arr << value
    arr.concat @right.not_nil!.sort unless @right.nil?
    arr
  end
end