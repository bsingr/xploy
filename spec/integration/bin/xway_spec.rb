require 'spec_helper'
require 'open3'
require 'xway'

describe Xway do
  it 'returns version string' do
    exe = File.expand_path('../../../bin/xway', File.dirname(__FILE__))
    ENV['RUBYLIB'] = File.join(File.dirname(__FILE__), '../../../lib')
    stdin, stdout, stderr = Open3.popen3("#{exe}")
    stdout.readlines.to_s.should include(Xway::VERSION)
  end
end