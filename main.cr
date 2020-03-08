require "option_parser"
require "./ltnp/ltnp_operator"
require "./modules/netstat_runner"

OptionParser.parse do |parser|
  parser.banner = "Welcome to eznetstat!"

  parser.on "-v", "--version", "Show version" do
	puts "0.1"
	exit
  end
  
  parser.on "-h", "--help", "Show help" do
	puts parser
	exit
  end

  parser.on "-c PORT", "--check-port=PORT", "Get the process name and ID of process on port" do |port|
	ltnp_operator = NetstatRunner.run_ltnp	
	record = ltnp_operator.get_port_record port
	unless record.nil?
	  puts "Port: %s, Process: %s" % [record.port, record.p_name]
	else
	  puts "No processes found on port %s" % port
	end
	exit
  end

  parser.on "-k", "--kill-port", "Kill process on port" do
	ltnp_operator = NetstatRunner.run_ltnp	
	ltnp_operator.say_hi
	exit
  end
end
