class Clock
  @minute : Int32
  @hour : Int32

  protected getter minute
  protected getter hour
  
  def initialize(hour : Int32 = 0, minute : Int32 = 0)
    add_hours, @minute = minute.divmod 60
    add_days, @hour = (add_hours + hour).divmod 24
  end

  def to_s(io : IO)
    hour = @hour.to_s.rjust(2,'0')
    minute = @minute.to_s.rjust(2, '0')
    io << "#{hour}:#{minute}"
  end

  def +(clock : Clock)
    Clock.new(hour: @hour + clock.hour, minute: @minute + clock.minute)
  end

  def -(clock : Clock)
    Clock.new(hour: @hour - clock.hour, minute: @minute - clock.minute)
  end

  def ==(clock : Clock)
    @hour == clock.hour && @minute == clock.minute
  end
end
