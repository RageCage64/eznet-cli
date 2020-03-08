require "./ltnp_record"

class LtnpOperator
  def initialize(cmd_output : String)
    records = cmd_output.each_line
    records = records.each.select(/^tcp/)
    @ltnp_records = Array(LtnpRecord).new
    records.each { |s| @ltnp_records << LtnpRecord.new s }
  end

  def say_hi
    @ltnp_records.each { |r| puts r.to_s }
  end

  def get_port_record(port : String) : LtnpRecord | Nil
    @ltnp_records.find { |r| r.port == port }
  end
end
