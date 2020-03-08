module NetstatRunner
  def self.run_ltnp() : LtnpOperator
	io = IO::Memory.new
	Process.run("sudo netstat -ltnp", shell: true, output: io)
	LtnpOperator.new io.to_s
  end
end
