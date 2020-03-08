require "spec"
require "../../ltnp/ltnp_operator.cr"

describe LtnpOperator do
  sut = LtnpOperator.new File.read("./spec/input/ltnp_example.txt")

  describe "#get_port_record" do
	existing_port = "8081"
	nonsense_port = "1234"

	it "should find record when port exists" do
	  sut.get_port_record(existing_port).nil?.should be_false
	end

	it "should not find record when port doesn't exist" do
	  sut.get_port_record(nonsense_port).nil?.should be_true
	end
  end
end
