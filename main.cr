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

  parser.on "-k", "--kill-port", "Kill process on port" do
	output = NetstatRunner.run_ltnp 
	ltnp_parser = LtnpOperator.new output
	ltnp_parser.say_hi
	exit
  end
end
