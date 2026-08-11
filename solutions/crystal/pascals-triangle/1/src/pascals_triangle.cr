struct PascalsTriangle
  def self.rows(number)
    pyramid = new()
    number.times do pyramid.add_row end
    pyramid.rows
  end

  protected getter rows
  
  protected def initialize
    @rows = Array(Array(Int32)).new
  end

  protected def add_row
    new_row = [1]
    last_row = @rows.last 1
    @rows.size.times do |i|
      left = last_row[0][i]
      right = last_row[0][i+1]? || 0
      new_row << left + right
    end
    @rows << new_row
  end
end