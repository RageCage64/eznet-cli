module NetstatRunner
  def self.run_ltnp() 
	io = IO::Memory.new
	Process.run("netstat -ltnp", shell: true, output: io)
	io.to_s
  end
end
