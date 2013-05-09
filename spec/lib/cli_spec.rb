require 'spec_helper'
require 'xway/cli'
require 'xway/version'

describe Xway::Cli do
  let('api') { double('api') }
  let('out') { double('stdout').tap { |o| o.stub('puts') } }
  subject { described_class.new api, out }

  it 'executes commands using api' do
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
