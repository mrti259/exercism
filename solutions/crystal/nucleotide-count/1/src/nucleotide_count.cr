module NucleotideCount
  def self.nucleotide_counts(nucleotides : String) : Hash(Char, Int32)
    count = {
      'A' => 0,
      'C' => 0,
      'G' => 0,
      'T' => 0
    }
    nucleotides.each_char do |char|
      raise ArgumentError.new unless count.has_key? char
      count[char] = count[char] + 1
    end
    count
  end
end
