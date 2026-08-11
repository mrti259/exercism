module RotationalCipher
  ALPHABET = "abcdefghijklmnopqrstuvwxyz"
  
  def self.rotate(plaintext : String, key : Number) : String
    plaintext.chars.map do |char|
      char_pos = ALPHABET.index char.downcase
      if char_pos.nil?
        char
      else
        letter = ALPHABET[(char_pos + key) % ALPHABET.size]
        if char.uppercase?
          letter.upcase
        else
          letter
        end
      end
    end.join
  end
end
