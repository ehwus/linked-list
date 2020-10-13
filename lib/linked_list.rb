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

  def prepend(value)
    if head.nil?
      @head = value
    else
      old_head = @head
      @head = value
      value.next_node = old_head
    end
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
    return 0 if @head.nil?

    count = 1
    pointer = @head
    until pointer.next_node.nil?
      count += 1
      pointer = pointer.next_node
    end
    count
  end

  def at(index)
    return @head if index == 0

    counter = 0
    pointer = @head
    until pointer.next_node.nil?
      return pointer if counter == index

      counter += 1
      pointer = pointer.next_node
    end
  end
end