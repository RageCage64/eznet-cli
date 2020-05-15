require "spec"
require "../../operators/ltnp_operator.cr"

describe LtnpOperator do
  sut = LtnpOperator.new File.read("./spec/input/ltnp_example.txt")

  existing_port = "8081"
  nonsense_port = "1234"

  existing_p_name = "polymer"
  partial_existing_p_name = "poly"
  multiple_exist_p_name = "spotify"
  nonsense_p_name = "thisisnotathing"

  describe "#get_port_record" do
    it "should find record when port exists" do
      sut.get_port_record(existing_port).nil?.should be_false
    end

    it "should not find record when port doesn't exist" do
      sut.get_port_record(nonsense_port).nil?.should be_true
    end
  end

  describe "#search_p_name" do
    it "should find record when process exists" do
      sut.search_p_name(existing_p_name).empty?.should be_false
    end

    it "should not find record when process doesn't exist" do
      sut.search_p_name(nonsense_p_name).empty?.should be_true
    end
  end

  describe "#check_port" do
    it "should output successful message if found" do
      sut.check_port(existing_port).should contain("Process:")
    end

    it "should output failure message if not found" do
      sut.check_port(nonsense_port).should contain("No")
    end
  end

  describe "#find_process" do
    it "should output successful message if full match found" do
      sut.find_process(existing_p_name).should contain("Process:")
    end

    it "should output successful message if partial match found" do
      sut.find_process(partial_existing_p_name).should contain("Process:")
    end

    it "should output every found process" do
      sut.find_process(multiple_exist_p_name).each_line.size.should eq 2
    end

    it "should output failure message if not found" do
      sut.find_process(nonsense_p_name).should contain("No")
    end
  end
end
