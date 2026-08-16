class Library
  def self.first_letter(title : String) : Char
    title[0]
  end

  def self.initials(first_name : String, last_name : String) : String
    first_name[0] + "." + last_name[0]
  end

  def self.decrypt_character(character : Char) : Char
    return character unless character.letter?
    r = 'z'.ord - 'a'.ord + 1
    p = character.pred.ord
    p += r if character == 'a' || character == 'A'
    p.chr
  end

  def self.decrypt_text(text : String) : String
    text.chars.map{|c| decrypt_character(c)}.join("")
  end
end
