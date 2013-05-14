require 'spec_helper'
require 'xploy'

describe Xploy do
  its('parameter') { should be_kind_of(Xploy::Parameter) }

  describe 'build_cli' do
    subject { described_class.build_cli }

    it { should be_kind_of(Xploy::Cli) }

    it 'uses Api' do
      subject.instance_variable_get('@api').should be_kind_of(Xploy::Api)
    end

    it 'uses STDOUT' do
      subject.instance_variable_get('@out').should eq STDOUT
    end
  end
end
