require 'spec_helper'
require 'xway/error'

describe Xway::Error do
  it { should be_kind_of(StandardError) }
end
