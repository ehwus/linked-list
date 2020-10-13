require 'linked_list'

describe Node do
  it "successfully creates a node object" do
    test = Node.new("Value")
    expect(test).to be_a_kind_of(Node)
  end
end