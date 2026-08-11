module Gigasecond
  GIGASECOND = Time::Span.new seconds: 10 ** 9
  
  def self.from(start : Time) : Time
    start + GIGASECOND
  end
end
