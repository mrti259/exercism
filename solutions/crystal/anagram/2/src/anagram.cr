class Anagram
  def self.find(word : String, arr : Array(String)) : Array(String)
    a = Anagram.new(word.downcase)
    arr.select { |w| a.match(w.downcase) }
  end
  
  protected def initialize(@word : String)
  end
  
  def match(word : String) : Bool
    !same_word?(word) && same_size?(word) && same_chars?(word)
  end

  def same_word?(word : String) : Bool
    @word == word
  end

  def same_size?(word : String) : Bool
    @word.size == word.size
  end

  def same_chars?(word : String) : Bool
    word.chars.uniq.all? {|c| @word.chars.count(c) == word.chars.count(c)}
  end
end