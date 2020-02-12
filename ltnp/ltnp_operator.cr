require "./ltnp_record"

class LtnpOperator
  def initialize(_cmd_output : String)
	@cmd_output = _cmd_output
	records = @cmd_output.each_line
	records = records.each.select(/^tcp/)
	@ltnp_records = Array(LtnpRecord).new
	records.each { |s| @ltnp_records << LtnpRecord.new s }
  end

  def say_hi
	puts @cmd_output
	puts @ltnp_records.to_s
  end
end
