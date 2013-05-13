require 'spec_helper'
require 'xploy/error'

describe Xploy::Error do
  it { should be_kind_of(StandardError) }
end
