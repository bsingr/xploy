module Xway
  class Runner
    attr_reader :stdin, :stdout, :stderr
    def run
      exe = File.expand_path('../../bin/xway', File.dirname(__FILE__))
      ENV['RUBYLIB'] = File.join(File.dirname(__FILE__), '../../lib')
      @stdin, @stdout, @stderr = Open3.popen3("#{exe}")
    end
  end
end
