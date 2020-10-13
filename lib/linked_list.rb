class Node
  attr_reader :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(value)
    if head.nil?
      @head = value
    end
  end
end