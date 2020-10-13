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

  describe "#at" do
    it "returns node 0 in list of one element" do
      node0 = Node.new
      list = LinkedList.new(node0)
      expect(list.at(0)).to eq(node0)
    end
    it "returns nil in list of one element if given 1" do
      node0 = Node.new
      list = LinkedList.new(node0)
      expect(list.at(1)).to eq(nil)
    end
    it "returns node from deeper into list" do
      node0 = Node.new(0)
      list = LinkedList.new(node0)
      list.append(Node.new(1))
      list.append(Node.new(2))
      list.append(Node.new(3))
      expect(list.at(2).value).to eq(2)
    end
  end

  describe "#pop" do
    it "does nothing to an empty list" do
      list = LinkedList.new
      list.pop
      expect(list.head).to eq(nil)
    end

    it "removes head of single item list" do
      list = LinkedList.new(Node.new(1))
      list.pop
      expect(list.head).to eq(nil)
    end

    it "removes head of three item list" do
      list = LinkedList.new(Node.new(1))
      list.append(Node.new(2))
      list.append(Node.new(3))
      list.pop
      expect(list.head.value).to eq(2)
      expect(list.tail.value).to eq(3)
    end
  end

  describe "#contains" do
    it "returns false searching an empty list" do
      empty_list = LinkedList.new
      expect(empty_list.contains?('foo')).to eq(false)
    end

    it "returns true searching for a node that exists" do
      list = LinkedList.new(Node.new(2))
      expect(list.contains?(2)).to eq(true)
    end
  end

  describe "#find(value)" do
    it "returns nil looking in an empty list" do
      empty_list = LinkedList.new
      expect(empty_list.find('foo')).to eq(nil)
    end

    it "returns 0 if item found in first node" do
      list = LinkedList.new(Node.new(1))
      expect(list.find(1)).to eq(0)
    end

    it "returns index if item found in longer list" do
      list = LinkedList.new(Node.new(0))
      list.append(Node.new(1))
      list.append(Node.new(2))
      list.append(Node.new(3))
      expect(list.find(3)).to eq(3)
    end
  end

  describe "#to_s" do
    it "returns a nil string from an empty list" do
      empty_list = LinkedList.new
      expect(empty_list.to_s).to eq("nil")
    end

    it "returns a single value chained to nil" do
      list = LinkedList.new("Foo")
      expect(list.to_s).to eq("( Foo ) -> nil")
    end
  end
end