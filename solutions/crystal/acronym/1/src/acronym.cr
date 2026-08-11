# Please implement your solution to acronym in this file
class Acronym
  def self.abbreviate(text : String)
    text.split(/[^a-zA-Z']/, remove_empty:true)
      .map{ |word| word[0].upcase }
      .join("")
  end
end