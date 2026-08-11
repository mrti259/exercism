module ScrabbleScore
  SCORES = {
    1 => "aeioulnrst",
    2 => "dg",
    3 => "bcmp",
    4 => "fhvwy",
    5 => "k",
    8 => "jx",
    10 => "qz"
    }.reduce(Hash(Char, Int32).new) do |hash, (score, letters)|
      letters.each_char do |char|
        hash[char] = score
      end
      hash
    end
  
  def self.score(word : String) : Int32
    word.downcase.chars.reduce(0) do |total, char|
      total += SCORES[char]
    end
  end
end