module PhoneNumber
  extend self
  
  def clean(phrase : String) : String
    phone = String::Builder.build do |sb|
      phrase.each_char_with_index do |char, i|
        sb << char if accept?(char, sb.bytesize)
      end
    end
    raise ArgumentError.new("Bad length") unless valid_length?(phone)
    raise ArgumentError.new("Bad input") unless valid_input?(phone)
    phone
  end

  protected def valid_length?(phone : String)
    phone.size == 10
  end

  protected def valid_input?(phone : String)
    /^[2-9]\d{2}[2-9]\d{6}$/.matches? phone
  end

  protected def accept?(char : Char, index : Int32)
    char.number? && (char != '1' || index != 0)
  end
end
