class Raindrops
  def self.convert(num : Int32) : String
    sb = String::Builder.new
    sb << "Pling" if num % 3 == 0
    sb << "Plang" if num % 5 == 0
    sb << "Plong" if num % 7 == 0
    sb << num.to_s if sb.bytesize == 0
    sb.to_s
  end
end
