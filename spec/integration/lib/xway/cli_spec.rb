require 'spec_helper'
require 'xway'

describe Xway::Cli do
  it 'uses api and stdout per default' do
    subject.instance_variable_get('@api').should be_instance_of(Xway::Api)
    subject.instance_variable_get('@out').should eq STDOUT
  end
end
