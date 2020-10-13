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

  it "successfully links nodes together" do
    test = Node.new("Value", Node.new("Test"))
    expect(test.next_node.value).to eq("Test")
  end
end