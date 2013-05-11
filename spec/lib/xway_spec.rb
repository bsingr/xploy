require 'spec_helper'
require 'xway'

describe Xway do
  its('settings') { should be_kind_of(Xway::Settings) }
end
