require 'spec_helper'
require 'xway/parameter'

describe Xway::Parameter do
  its('global_config') { should eq(File.join(ENV['HOME'], '.xway')) }
  its('local_config') { should eq(File.join(Dir.pwd, '.xway')) }

  context 'mocked Configliere::Param' do
    let('param') do
      double('Configliere::Param').tap do |param|
        param.stub('define')
        param.stub('use')
        param.stub('read')
        param.stub('resolve!')
        param.stub('[]')
        param.stub('to_hash')
        param.stub('rest')
      end
    end
    before do
      subject.stub('global_config').and_return('global-xway-conf')
      subject.stub('local_config').and_return('local-xway-conf')
      File.stub('exists?').with('global-xway-conf').and_return(false)
      File.stub('exists?').with('local-xway-conf').and_return(false)
      Configliere::Param.stub('new').and_return(param)
    end

    its('to_hash') { should eq({}) }
    its('rest') { should eq([]) }
    it { subject[:servers].should eq(nil)}

    describe 'loads!' do
      it 'reads global config when it exists' do
        File.stub('exists?').with('global-xway-conf').and_return(true)
        param.should_receive('read').with('global-xway-conf')
        subject.reload!
      end

      it 'reads local config when it exists' do
        File.stub('exists?').with('local-xway-conf').and_return(true)
        param.should_receive('read').with('local-xway-conf')
        subject.reload!
      end

      it 'uses commandline' do
        param.should_receive('use').with(:commandline)
        subject.reload!
      end

      it 'calls resolve' do
        param.should_receive('resolve!')
        subject.reload!
      end

      it 'defines :servers' do
        param.should_receive('define').with(:servers, type: Array,
                                            description: "all appway servers",
                                            default: ['http://localhost:8000'])
        subject.reload!
      end
    end

    context 'after reload!' do
      before do
        param.stub('[]').with(:servers).and_return('http://bar')
        param.stub('to_hash').and_return(servers: ['http://bar'])
        param.stub('rest').and_return([1,2,3])
        subject.reload!
      end
      its('rest') { should eq([1,2,3]) }
      its('to_hash') { should eq(servers: ['http://bar']) }
      it { subject[:servers].should eq('http://bar') }
    end
  end

  context 'custom XWAY_CONFIG' do
    let('xway_config') { File.join(Dir.pwd, 'spec/assets/custom.xway') }
    before { ENV.stub('[]').and_return(xway_config) }

    its('global_config') { should eq(xway_config) }
    its('local_config') { should eq(File.join(Dir.pwd, '.xway')) }
  end
end
