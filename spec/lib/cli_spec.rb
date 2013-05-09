require 'spec_helper'
require 'xway/cli'
require 'xway/version'

describe Xway::Cli do
  let('api') { double('api') }
  let('out') { double('stdout').tap { |o| o.stub('puts') } }
  subject { described_class.new api, out }
  before do
    ::Settings = double('::Settings') unless defined? ::Settings
    ::Settings.stub('rest') { [] }
  end
  before do
    Xway::Settings = double('Xway::Settings') unless defined? Xway::Settings
    Xway::Settings.stub('load!')
  end

  its('start') { should eq nil }

  it 'prints version per default' do
    out.should_receive('puts').with("xway #{Xway::VERSION}")
    subject.start
  end

  it 'executes commands using api' do
    api.should_receive('list') { 'list result' }
    out.should_receive('puts').with('list result')
    ::Settings.stub('rest') { ['list'] }
    subject.start
  end

  it 'loads settings' do
    Xway::Settings.should_receive('load!')
    subject.start
  end
end
