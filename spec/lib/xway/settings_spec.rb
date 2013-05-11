require 'spec_helper'
require 'xway/settings'

describe Xway::Settings do
  its('global_config') { should eq(File.join(ENV['HOME'], '.xway')) }
  its('local_config') { should eq(File.join(Dir.pwd, '.xway')) }

  it 'loads configliere Settings' do
    described_class.stub('global_config') { 'global-xway-conf' }
    described_class.stub('local_config') { 'local-xway-conf' }
    File.stub('exists?') { true }
    ::Settings.should_receive('read').with('global-xway-conf')
    ::Settings.should_receive('read').with('local-xway-conf')
    ::Settings.should_receive('use').with(:commandline)
    ::Settings.should_receive('resolve!')
    described_class.load!
  end

  context 'custom XWAY_CONFIG' do
    let('xway_config') { File.join(Dir.pwd, 'spec/assets/custom.xway') }
    before { ENV.stub('[]') { xway_config } }

    its('global_config') { should eq(xway_config) }
    its('local_config') { should eq(File.join(Dir.pwd, '.xway')) }
  end
end
