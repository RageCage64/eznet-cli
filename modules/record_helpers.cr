module RecordHelpers
  def self.clean_record(record : String) : Array(String)
    tokenized_record = record.split(" ")
    tokenized_record = tokenized_record.reject { |s| s == "" }
    tokenized_record
  end

  def ser_address_port(address_port_str : String) : {String, String}
    address_port = address_port_str.split(':')
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
    pid_pro = pid_pro_str.split('/')
    pid = String.new
    p_name = String.new

    if pid_pro.size == 2
      pid = pid_pro[0]
      p_name = pid_pro[1]
    end

    {pid, p_name}
  end
end
