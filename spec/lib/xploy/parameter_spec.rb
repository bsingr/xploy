require 'spec_helper'
require 'xploy/parameter'

describe Xploy::Parameter do
  its('global_config') { should eq(File.join(ENV['HOME'], '.xploy')) }
  its('local_config') { should eq(File.join(Dir.pwd, '.xploy')) }

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
      subject.stub('global_config').and_return('global-xploy-conf')
      subject.stub('local_config').and_return('local-xploy-conf')
      File.stub('exists?').with('global-xploy-conf').and_return(false)
      File.stub('exists?').with('local-xploy-conf').and_return(false)
      Configliere::Param.stub('new').and_return(param)
    end

    its('to_hash') { should eq({}) }
    its('rest') { should eq([]) }
    it { subject[:servers].should eq(nil)}

    describe 'loads!' do
      it 'reads global config when it exists' do
        File.stub('exists?').with('global-xploy-conf').and_return(true)
        param.should_receive('read').with('global-xploy-conf')
        subject.reload!
      end

      it 'reads local config when it exists' do
        File.stub('exists?').with('local-xploy-conf').and_return(true)
        param.should_receive('read').with('local-xploy-conf')
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

      it 'defines servers' do
        param.should_receive('define').with(:servers,
                                            type: Array,
                                            flag: 's',
                                            description: 'all appway servers',
                                            default: ['http://localhost:8000'])
        subject.reload!
      end

      it 'defines app.name' do
        param.should_receive('define').with('app.name',
                                            flag: 'a',
                                            description: 'name of your app')
        subject.reload!
      end

      it 'defines app.manifest' do
        param.should_receive('define').with('app.manifest',
                                            flag: 'm',
                                            description: 'path to your app.way file')
        subject.reload!
      end

      it 'defines debug' do
        param.should_receive('define').with(:debug,
                                            flag: 'd',
                                            description: 'print debug info to stdout',
                                            default: false)
        subject.reload!
      end

      it 'defines version' do
        param.should_receive('define').with(:version,
                                            flag: 'v',
                                            description: 'print version info')
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

    it 'print_help!' do
      param.should_receive('[]=').with(:help, true)
      param.should_receive('resolve!')
      subject.print_help!
    end
  end

  context 'custom XPLOY_CONFIG' do
    let('xploy_config') { File.join(Dir.pwd, 'spec/assets/custom.xploy') }
    before { ENV.stub('[]').and_return(xploy_config) }

    its('global_config') { should eq(xploy_config) }
    its('local_config') { should eq(File.join(Dir.pwd, '.xploy')) }
  end
end
