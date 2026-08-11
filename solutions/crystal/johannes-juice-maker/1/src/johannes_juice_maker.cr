class JuiceMaker
  def self.debug_light_on?
    true
  end

  def initialize(fluid : Int32)
    @running = false
    @fluid = fluid
  end

  def start
    @running = true
  end

  def running?
    @running
  end

  def add_fluid(fluid_to_add)
    @fluid += fluid_to_add
  end

  def stop(minutes_running)
    @running = false
    @fluid -= minutes_running * 5
  end
end