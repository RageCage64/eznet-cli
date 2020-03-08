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
    ser_record = RecordHelpers.clean_record(record)
    @proto = ser_record[0]
    @address, @port = ser_address_port ser_record[3].split(':')
    @f_address, @f_port = ser_address_port ser_record[4].split(':')
    @state = ser_record[5]
    @pid, @p_name = ser_pid_p_name ser_record[6]
  end

  def to_s
    puts "%s, " * 8 % [
      @proto, @state, @address, @port,
      @f_address, @f_port, @pid, @p_name,
    ]
  end

  def ser_address_port(address_port : Array) : {String, String}
    address = String.new
    port = String.new
    unless address_port.size > 2
      address = address_port[0]
      port = address_port[1]
    else
      port = address_port[-1]
    end
    {address, port}
  end

  def ser_pid_p_name(pid_pro_str : String) : {String, String}
    pid = String.new
    p_name = String.new
    unless pid_pro_str == "-"
      pid_pro = pid_pro_str.split('/')
      pid = pid_pro[0]
      p_name = pid_pro[1]
    end
    {pid, p_name}
  end
end
