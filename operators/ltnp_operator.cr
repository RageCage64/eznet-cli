require "../modules/command_runner"
require "../records/ltnp_record"

class LtnpOperator
  def initialize(ltnp_data = "")
    if ltnp_data.nil?
      ltnp_data = CommandRunner.run_ltnp
    end
    records = ltnp_data.each_line
    records = records.each.select(/^tcp/)
    @ltnp_records = Array(LtnpRecord).new
    records.each { |s| @ltnp_records << LtnpRecord.new s }
  end

  # Data methods

  def to_s
    @ltnp_records.each { |r| puts r.to_s }
  end

  def get_port_record(port : String) : LtnpRecord | Nil
    @ltnp_records.find { |r| r.port == port }
  end

  def search_p_name(p_name : String) : LtnpRecord | Nil
    @ltnp_records.find { |r| r.p_name == p_name }
  end

  # Actions

  # -c, --check-port
  def check_port(port : String) : String
    record = get_port_record port

    unless record.nil?
      result = record.output_s
    else
      result = "No processes found on port %s" % port
    end

    result
  end

  # -p, --find-process
  def find_process(p_name : String)
    record = search_p_name p_name

    unless record.nil?
      result = record.output_s
    else
      result = "No process found by the name %s" % p_name
    end

    result
  end

  # -k, --kill-port
  def kill_process_on_port(port : String)
    record = get_port_record port

    unless record.nil?
      puts record.output_s
      puts "Would you like to kill %s? (y/n)" % [record.p_name]
      input = gets
      unless input.nil?
        if input.downcase == "y"
          CommandRunner.run_kill record.pid
        end
      end
    else
      puts "No processes found on port %s" % port
    end
  end
end
