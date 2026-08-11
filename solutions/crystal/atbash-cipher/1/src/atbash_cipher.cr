class AtbashCipher
  ALPHABET = "abcdefghijklmnopqrstuvwxyz"
  
  def self.encode(message : String) : String
    self.transform message, 5
  end

  def self.decode(message : String) : String
    self.transform message, message.size
  end

  private def self.transform(message : String, group_size : Int32) : String
    x = AtbashCipher.new group_size
    message.downcase.each_char {|c| x.add(c)}
    x.to_s
  end

  @count = 0
  @sb = String::Builder.new

  def initialize(@group_size : Int32)
  end

  def add(char : Char)
    new_char = encoded char
    return unless new_char
    @sb << new_char
    add_space
  end

  def encoded(char : Char)
    return unless char.ascii_alphanumeric?
    return if char.whitespace?
    char_position = ALPHABET.index char
    if char_position
      ALPHABET[-1-char_position]
    else
      char
    end
  end

  def add_space
    @count += 1
    if (@count % @group_size) == 0
      @sb << " "
    end
  end

  def to_s
    @sb.to_s.strip
  end
end
