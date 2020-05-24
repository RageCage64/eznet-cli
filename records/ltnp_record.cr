require "../modules/record_helpers"

class LtnpRecord
  getter proto : String
  getter state : String
  getter address : String
  getter port : String
  getter f_address : String
  getter f_port : String
  getter state : String
  getter pid : String
  getter p_name : String

  def initialize(record : String)
    tok_record = RecordHelpers.clean_record(record)

    @proto = tok_record[0]
    @address, @port = RecordHelpers.ser_address_port(tok_record[3].split(':'))
    @f_address, @f_port = RecordHelpers.ser_address_port(tok_record[4].split(':'))
    @state = tok_record[5]
    @pid, @p_name = ser_pid_p_name tok_record[6]
  end

  def to_s
    puts "%s, " * 8 % [
      @proto, @state,
      @address, @port,
      @f_address, @f_port,
      @pid, @p_name
    ]
  end

  def output_s
    "Port: %s, Process: %s, Process ID: %s" % [self.port, self.p_name, self.pid]
  end
end
