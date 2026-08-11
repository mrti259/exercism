module TwoFer
  def self.two_fer : String
    self.two_fer "you"
  end

  def self.two_fer(name : String) : String
    "One for #{name}, one for me."
  end
end
