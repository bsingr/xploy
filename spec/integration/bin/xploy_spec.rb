require 'spec_helper'
require 'open3'
require 'xploy/version'

class XployBinary
  attr_reader :stdin, :stdout, :stderr
  def run
    exe = File.expand_path('../../../bin/xploy', File.dirname(__FILE__))
    ENV['RUBYLIB'] = File.join(File.dirname(__FILE__), '../../../lib')
    @stdin, @stdout, @stderr = Open3.popen3("#{exe} --version")
  end
end

describe Xploy, profile: false do
  it 'just prints the version to stdout' do
    binary = XployBinary.new
    binary.run
    binary.stderr.readlines.to_s.should_not include('xploy')
    binary.stdout.readlines.to_s.should include(Xploy::VERSION)
  end
end
