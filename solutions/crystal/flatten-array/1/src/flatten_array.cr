module FlattenArray
  def self.flatten(input : Array) : Array
    input.flatten.reject! &.nil?
  end
end
