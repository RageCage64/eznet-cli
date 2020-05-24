require "../modules/command_runner"
require "../records/nat_record"

class NatOperator
  def initialize(nat_data = "")
    if nat_data.empty?
      nat_data = CommandRunner.run_nat
    end
    records = nat_data.each_line
    records = records.each.select(/^tcp/)
    @nat_records = Array(NatRecord).new
    records.each { |s| @nat_records << NatRecord.new s }
  end
end
