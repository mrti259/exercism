module Bob
  PHRASES = [
      "Fine. Be that way!",
      "Whatever.",
      "Whoa, chill out!",
      "Sure.",
      "Calm down, I know what I'm doing!"
  ]
  def self.hey(string : String) : String
    string = string.strip
    return PHRASES[0] if string.empty?

    score = 1
    score += 1 if string.downcase != string && string.upcase == string
    score += 2 if string.ends_with? "?"

    PHRASES[score]
  end
end
