module CommandRunner
  # netstat
  def self.run_ltnp : String
    io = IO::Memory.new
    Process.run("netstat -ltnp", shell: true, output: io)
    io.to_s
  end

  def self.run_nat : String
    io = IO::Memory.new
    Process.run("netstat -nat", shell: true, output: io)
    io.to_s
  end

  # kill
  def self.run_kill(pid : String) : String
    io = IO::Memory.new
    Process.run("kill #{pid}", shell: true, output: io)
    io.to_s
  end
end
