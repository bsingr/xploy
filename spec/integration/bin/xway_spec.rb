require 'spec_helper'
require 'open3'

class XwayRunner
  attr_reader :stdin, :stdout, :stderr
  def run
    exe = File.expand_path('../../../bin/xway', File.dirname(__FILE__))
    ENV['RUBYLIB'] = File.join(File.dirname(__FILE__), '../../../lib')
    @stdin, @stdout, @stderr = Open3.popen3("#{exe}")
  end
end

describe XwayRunner do
  before { subject.run }

  its('stdout.readlines.to_s') { should include(Xway::VERSION) }
end