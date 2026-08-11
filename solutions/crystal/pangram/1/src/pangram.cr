class Pangram
  ALPHABET = "abcdefghijklmnopqrstuvwxyz"
  
  def self.pangram?(input : String) : Bool
    input = input.downcase
    ALPHABET.chars.reduce(true) do |b, letter|
      b && input.includes? letter
    end
  end
end
