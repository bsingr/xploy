require 'spec_helper'
require 'open3'
require 'xway/runner'

describe Xway::Runner do
  before { subject.run }
  
  its('stdout.readlines.to_s') { should include(Xway::VERSION) }
end
