module ReverseString
  def self.reverse(value : String) : String
    #return value.reverse
    #return value.chars.reverse.join
    sb = String::Builder.new
    value.size.times do |i|
      sb << value[value.size-i-1]
    end
    sb.to_s
  end
end
