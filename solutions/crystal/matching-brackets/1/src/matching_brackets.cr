module MatchingBrackets
  extend self

  SYMBOLS = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }
  
  def valid?(str : String) : Bool
    stack = Array(Char).new
    is_valid = true
    i = 0
    while is_valid && i < str.size
      char = str[i]
      i += 1
      if SYMBOLS.keys.includes? char
        stack.push char
      elsif !SYMBOLS.values.includes? char
        next
      elsif stack.empty?
        is_valid = false
      else
        is_valid = SYMBOLS[stack.pop] == char
      end
    end
    stack.empty? && is_valid
  end
end
