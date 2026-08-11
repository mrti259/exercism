module ETL
  def self.transform(input : Hash(String, Array(String))) : Hash(String, Int32)
    scores = Hash(String, Int32).new
    input.each do |key, letters|
      score = key.to_i
      letters.each do |letter|
        scores[letter.downcase] = score
      end
    end
    scores
  end
end
