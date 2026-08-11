require "levenshtein"

module Hamming  
  def self.distance(strand1 : String, strand2 : String) : Number
    raise ArgumentError.new if strand1.size != strand2.size
    strand1.chars.map_with_index do |c, i|
      if strand2[i] != c
        1
      else
        0
      end
    end.sum
  end
end
