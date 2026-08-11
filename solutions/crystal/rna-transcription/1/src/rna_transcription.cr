class RnaComplement
  DNA_COMPLEMENT = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U',
    }
  
  def self.of_dna(strand : String) : String
    strand.chars.map do |char|
      DNA_COMPLEMENT[char]
    end.join
  end
end
