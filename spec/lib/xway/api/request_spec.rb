require 'spec_helper'
require 'xway/api/request'

describe Xway::Api::Request do
  subject { described_class.new 'get', '/foo' }

  its('method') { should eq 'get' }
  its('path') { should eq '/foo' }
  its('headers') { should eq({'X-App' => 'appway'}) }
end
