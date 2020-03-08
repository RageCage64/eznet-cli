require "spec"
require "../../ltnp/ltnp_record.cr"

describe LtnpRecord do
  sut_normal = LtnpRecord.new "tcp        0      0 127.0.0.1:8081          0.0.0.0:*               LISTEN      69/myproc"
  sut_address = LtnpRecord.new "tcp        0      0 :::8081          0.0.0.0:*               LISTEN      69/myproc"
  sut_process = LtnpRecord.new "tcp        0      0 :::8081          0.0.0.0:*               LISTEN      -"

  it "should have expected properties under normal circumstance" do
    sut_normal.proto.should eq("tcp")
    sut_normal.address.should eq("127.0.0.1")
    sut_normal.port.should eq("8081")
    sut_normal.f_address.should eq("0.0.0.0")
    sut_normal.f_port.should eq("*")
    sut_normal.state.should eq("LISTEN")
    sut_normal.pid.should eq("69")
    sut_normal.p_name.should eq("myproc")
  end

  it "should have expected properties when Local Address column is edge case" do
    sut_address.address.empty?.should be_true
    sut_address.port.should eq("8081")
  end

  it "should have expected properties when PID/ProcessName column is edge case" do
    sut_process.pid.empty?.should be_true
    sut_process.p_name.empty?.should be_true
  end
end
