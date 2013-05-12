require 'spec_helper'
require 'xway'

describe Xway do
  its('parameter') { should be_kind_of(Xway::Parameter) }
end
