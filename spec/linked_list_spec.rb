require 'linked_list'

describe Node do
  it "successfully creates a node object" do
    test = Node.new("Value")
    expect(test).to be_a_kind_of(Node)
  end

  it "returns its value" do
    test = Node.new("Value")
    expect(test.value).to eq("Value")
  end

  it "successfully links two nodes together" do
    test = Node.new("Value", Node.new("Test"))
    expect(test.next_node.value).to eq("Test")
  end

  it "links four nodes together" do
    test = Node.new("1", Node.new("2", Node.new("3", Node.new("4"))))
    expect(test.next_node.next_node.next_node.value).to eq("4")
  end
end

describe LinkedList do
  describe "#append(value)" do
    it "adds a node as head to an empty list" do
      list = LinkedList.new
      node = Node.new(1)
      list.append(node)
      expect(list.head).to eq(node)
    end

    it "adds a node to the end of a list of one" do
      list = LinkedList.new(Node.new(1))
      node = Node.new(2)
      list.append(node)
      expect(list.tail).to eq(node)
    end

    it "adds multiple node to the end of a list" do
      list = LinkedList.new(Node.new(1))
      node1 = Node.new(1)
      node2 = Node.new(2)
      list.append(node1)
      list.append(node2)
      expect(list.tail).to eq(node2)
    end
  end

  describe "#prepend" do
    it "adds a head to an empty list" do
      list = LinkedList.new
      node = Node.new(1)
      list.prepend(node)
      expect(list.head).to eq(node)
    end

    it "changes head to list of one, keeping order" do
      list = LinkedList.new(Node.new(1))
      node2 = Node.new(2)
      list.prepend(node2)
      expect(list.head.value).to eq(2)
      expect(list.tail.value).to eq(1)
    end
  end

  describe "#size" do
    it "returns zero if list is empty" do
      list = LinkedList.new
      expect(list.size).to eq(0)
    end

    it "returns one if list has one node" do
      list = LinkedList.new(Node.new(1))
      expect(list.size).to eq(1)
    end

    it "returns three with three nodes" do
      list = LinkedList.new(Node.new(1))
      list.append(Node.new(2))
      list.append(Node.new(3))
      expect(list.size).to eq(3)
    end
  end
end