class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head
  def initialize(head = nil)
    @head = head
  end

  def append(value)
    if head.nil?
      @head = value
    else
      tail.next_node = value
    end
  end

  def tail
    pointer = head
    pointer = pointer.next_node until pointer.next_node.nil?
    pointer
  end

  def size
    0 if @head.nil?
  end
end