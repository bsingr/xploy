require 'spec_helper'
require 'xway/cli'
require 'xway/version'

describe Xway::Cli do
  let('parameter') do
    double('Xway::Parameter').tap { |o| o.stub('rest').and_return([]) }
  end
  let('api') { double('api') }
  let('out') { double('stdout').tap { |o| o.stub('puts') } }
  before { Xway.stub('parameter').and_return(parameter) }
  subject { described_class.new api, out }

  its('start') { should eq nil }

  it 'prints version per default' do
    out.should_receive('puts').with("xway #{Xway::VERSION}")
    subject.start
  end

  it 'executes commands using api' do
    api.should_receive('list').and_return('list result')
    out.should_receive('puts').with('list result')
    parameter.stub('rest').and_return(['list'])
    subject.start
  end

  it 'executes commands with custom app name' do
    pending 'not impl'
  end
end
