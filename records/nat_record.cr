require "../modules/record_helpers"

class NatRecord
  getter proto : String
  getter recv_q : Int
  getter send_q : Int
  getter address : String
  getter port
  getter f_address : String
  getter f_port : String
  getter state : String

  def initialize(record : String)
    tok_record = RecordHelpers.clean_record(record)

    @proto = tok_record[0]
    @recv_q = tok_record[1].to_i
    @send_q = tok_record[2].to_i
    @address, @port = RecordHelpers.ser_address_port(tok_record[3])
    @f_address, @f_port = RecordHelpers.ser_address_port(tok_record[4])
    @state = tok_record[5]
  end

  def to_s
    puts "%s, " * 8 % [
      @proto,
      @recv_q, @send_q,
      @address, @port,
      @f_address, @f_port,
      @state
    ]
  end
end
