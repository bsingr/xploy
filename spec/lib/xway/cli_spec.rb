require 'spec_helper'
require 'xway/cli'
require 'xway/version'

describe Xway::Cli do
  let('parameter') do
    double('Xway::Parameter').tap do |mock|
      mock.stub('rest').and_return([])
      mock.stub('[]').with(:version).and_return(nil)
    end
  end
  let('api') { double('api') }
  let('out') { double('stdout').tap { |o| o.stub('puts') } }
  before { Xway.stub('parameter').and_return(parameter) }
  subject { described_class.new api, out }
  
  it 'prints usage per default' do
    parameter.should_receive('print_help!')
    subject.start
  end

  it 'prints version on :version parameter' do
    parameter.stub('[]').with(:version).and_return(true)
    out.should_receive('puts').with("xway #{Xway::VERSION}")
    subject.start
  end

  it 'executes commands on api' do
    api.should_receive('request').with('list').and_return('list result')
    out.should_receive('puts').with('list result')
    parameter.stub('rest').and_return(['list'])
    subject.start
  end
end
