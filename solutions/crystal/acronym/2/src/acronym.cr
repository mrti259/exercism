# Please implement your solution to acronym in this file
class Acronym
  def self.abbreviate(text : String)
    text.split(/[^a-zA-Z']/, remove_empty:true)
      .map(&.char_at 0)
      .join
      .upcase
  end
end