require "option_parser"
require "./ltnp/ltnp_operator"

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
    operator = LtnpOperator.new
    puts operator.check_port port
    exit
  end

  parser.on "-p PNAME", "--find-process=PNAME", "Find the port and ID of a process by name" do |p_name|
    operator = LtnpOperator.new
    puts operator.find_process p_name
    exit
  end

  parser.on "-k PORT", "--kill-port=PORT", "Kill process on port" do |port|
    operator = LtnpOperator.new
    puts operator.kill_process_on_port port
    exit
  end
end
