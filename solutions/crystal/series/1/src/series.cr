module Series
  def self.slices(series : String, slice_length : Number) : Array(String)
    raise ArgumentError.new if slice_length == 0
    raise ArgumentError.new if series.size < slice_length

    slices = [] of String
    0.upto series.size - slice_length do |i|
      slices << series[i, slice_length]
    end
  
    slices
  end
end
