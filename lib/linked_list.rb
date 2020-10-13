class Node
  attr_reader :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next = nil
  end
end