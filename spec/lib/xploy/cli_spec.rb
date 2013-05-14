require 'spec_helper'
require 'xploy/cli'
require 'xploy/error'
require 'xploy/version'
require 'fakefs/safe'

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

  it 'prints usage per default' do
    parameter.should_receive('print_help!')
    subject.start
  end

  it 'prints version on :version parameter' do
    parameter.stub('[]').with(:version).and_return(true)
    out.should_receive('puts').with("xploy #{Xploy::VERSION}")
    subject.start
  end

  it 'prints template on new without :template parameter' do
    parameter.stub('[]').with(:template)
    out.should_receive('puts').with('see appway-example.json')
    parameter.stub('rest').and_return(['new'])
    subject.start
  end

  it 'writes template on new with :template parameter' do
    FakeFS do
      parameter.stub('[]').with(:template).and_return('foo.xploy')
      parameter.stub('rest').and_return(['new'])
      subject.start
      File.read('foo.xploy').should eq('see appway-example.json')
    end
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
