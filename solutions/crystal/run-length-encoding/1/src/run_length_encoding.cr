module RunLengthEncoding
  def self.encode(input : String) : String
    String::Builder.build do |sb|
      char = nil
      count = 0
      i = 0
      while i <= input.size
        curr_char = input[i]?
        i += 1
        if curr_char != char
          sb << count if count > 1
          sb << char
          char = curr_char
          count = 1
        else
          count += 1
        end
      end
    end
  end

  def self.decode(input : String) : String
    String::Builder.build do |sb|
      char = nil
      count = 0
      i = 0
      while i <= input.size
        char = input[i]?
        i += 1
        if char.nil?
          next
        elsif char.number?
          count = count * 10 + char.to_i
        else
          count = 1 if count == 0
          sb << char.to_s * count
          count = 0
        end
      end
    end
  end
end
