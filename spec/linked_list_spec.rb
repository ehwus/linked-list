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
  end
end