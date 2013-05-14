require 'spec_helper'
require 'xploy'

describe Xploy::Cli do
  it 'uses api and stdout per default' do
    subject.instance_variable_get('@api').should be_instance_of(Xploy::Api)
    subject.instance_variable_get('@out').should eq STDOUT
  end

  context 'mock api + out' do
    let('api') do
      double('api').tap do |mock|
        mock.stub('request')
      end
    end
    let('out') do
      double('out').tap do |mock|
        mock.stub('puts')
      end
    end
    subject { described_class.new(api, out) }

    it 'rescues MissingParameter' do
      api.stub('request') { raise Xploy::MissingParameter, 'foo' }
      out.should_receive('puts').with('foo')
      subject.start
    end
  end
end
