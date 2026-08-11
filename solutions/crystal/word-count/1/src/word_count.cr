module WordCount
  def self.count_words(sentence : String) : Hash(String, Int32)
    sentence
      .downcase
      .gsub(/[^a-z0-9']/, " ")
      .split
      .map {|word| word.gsub(/^'/, "").gsub(/'$/, "")}
      .reject!(&.empty?)
      .tally
  end
end
