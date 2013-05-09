require 'spec_helper'
require 'xway/cli'

describe Xway::Cli do
  let('out') { double('stdout').tap { |o| o.stub('puts') } }
  before { subject.stub('out') { out } }

  it 'executes commands using api' do
    api = double('api')
    api.should_receive('list')
    subject.stub('api') { api }
    subject.execute ['list']
  end

  its('start') { should eq nil }

  it 'prints version to stdout' do
    out.should_receive('puts').with("xway #{Xway::VERSION}")
    subject.start
  end
end
