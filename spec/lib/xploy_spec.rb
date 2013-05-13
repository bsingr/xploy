require 'spec_helper'
require 'xploy'

describe Xploy do
  its('parameter') { should be_kind_of(Xploy::Parameter) }
end
