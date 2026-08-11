module Isogram
  def self.isogram?(phrase : String) : Bool
    letters = phrase.downcase.chars.select!(&.letter?)
    letters.tally.values.all? 1
  end
end
