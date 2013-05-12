require 'spec_helper'
require 'open3'
require 'xway/version'

class XwayBinary
  attr_reader :stdin, :stdout, :stderr
  def run
    exe = File.expand_path('../../../bin/xway', File.dirname(__FILE__))
    ENV['RUBYLIB'] = File.join(File.dirname(__FILE__), '../../../lib')
    @stdin, @stdout, @stderr = Open3.popen3("#{exe} --version")
  end
end

describe XwayBinary do
  before { subject.run }
  its('stderr.readlines.to_s') { should_not include('xway') }
  its('stdout.readlines.to_s') { should include(Xway::VERSION) }
end
