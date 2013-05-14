require 'spec_helper'
require 'xploy/cli'
require 'xploy/error'
require 'xploy/version'

describe Xploy::Cli do
  let('parameter') do
    double('Xploy::Parameter').tap do |mock|
      mock.stub('rest').and_return([])
      mock.stub('[]').with(:version).and_return(nil)
    end
  end
  let('api') { double('Xploy::Api') }
  let('out') { double('stdout').tap { |o| o.stub('puts') } }
  before { Xploy.stub('parameter').and_return(parameter) }
  subject { described_class.new api, out }

  context 'default' do
    let!('api_class') do
      Xploy::Api = double('api_class').tap do |mock|
        mock.stub('new').and_return(api)
      end
    end
    subject { described_class.new }
  
    it 'uses Api' do
      subject.instance_variable_get('@api').should eq api
    end

    it 'uses STDOUT' do
      subject.instance_variable_get('@out').should eq STDOUT
    end
  end
  
  it 'prints usage per default' do
    parameter.should_receive('print_help!')
    subject.start
  end

  it 'prints version on :version parameter' do
    parameter.stub('[]').with(:version).and_return(true)
    out.should_receive('puts').with("xploy #{Xploy::VERSION}")
    subject.start
  end

  it 'executes commands on api' do
    api.should_receive('request').with('list').and_return('list result')
    out.should_receive('puts').with('list result')
    parameter.stub('rest').and_return(['list'])
    subject.start
  end

  it 'rescues MissingParameter' do
    parameter.stub('rest') { raise Xploy::MissingParameter, 'foo' }
    out.should_receive('puts').with('foo')
    subject.start
  end
end
