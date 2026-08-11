class Anagram
  def self.find(word : String, arr : Array(String)) : Array(String)
    a = Anagram.new(word.downcase)
    arr.select { |w| a.match(w.downcase) }
  end

  def initialize(@word : String)
  end

  def match(word : String) : Bool
    if word == @word
      false
    elsif word.size != @word.size
      false
    else
      cmp_chars word
    end
  end

  def cmp_chars(word : String) : Bool
    word.chars.uniq.all? do |char|
      @word.chars.count(char) == word.chars.count(char)
    end
  end
end
