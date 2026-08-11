module Wordy
 
  def self.answer(question : String) : Number
    data = transform(question).match(/^What is (.*)\?$/)
    raise ArgumentError.new("No match") if data.nil?
    tokens = data[1].split
    raise ArgumentError.new("Wrong format") if tokens.size.even?
    num1 = 0
    op = Operators[0] # plus
    tokens.each_with_index do |token, index|
      if index.even?
        num2 = token.to_i?
        raise ArgumentError.new("Invalid token: #{token}, #{index}") if num2.nil?
        num1 = op.do(num1, token.to_i)
      else
        op = Operators.find &.accept?(token)
        raise ArgumentError.new("Invalid token: #{token}, #{index}") if op.nil?
      end
    end
    num1
  end

  private def self.transform(question : String) : String
    Operators.reduce(question) { |q, op| op.replace_token q}
  end

  private def self.check_token(token : String, index : Int) : Nil
    return if index.even? && valid_number? token
    return if index.odd? && valid_operation? token
  end

  private def self.valid_number?(token : String) : Bool
    token.matches? /\d*/
  end

  private def self.valid_operation?(token : String) : Bool
    Operators.any? &.accept? token
  end

  Operators = [
    Operator.new "plus" { |a, b| a + b },
    Operator.new "minus" { |a, b| a - b },
    Operator.new "multiplied by" { |a, b| a * b },
    Operator.new "divided by" { |a, b| a // b },
  ]

  private struct Operator
    alias Operation = (Int32, Int32) -> Int32

    def initialize(@token : String, &operation : Operation)
      @operation = operation
      @internal_token = @token.sub /\s+/, "_"
    end

    def do(a : Number, b : Number) : Number
      @operation.call(a, b)
    end

    def replace_token(question : String) : String
      return question if @token == @internal_token
      question.gsub(@token, @internal_token)
    end

    def accept?(token : String) : Bool
      token == @internal_token
    end
  end
end
