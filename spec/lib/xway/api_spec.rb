require 'spec_helper'
require 'xway/api'

describe Xway::Api do
  context 'mock http' do
    let('http') do
      double('Http').tap do |mock|
        mock.stub('request') do |server, request|
          [server, request.method, request.path]
        end
      end
    end
    before { Xway::Api::Http.stub('new').and_return(http) }
    before do
      settings = double('Xway::Settings')
      settings.stub('[]').with(:servers).and_return(['http://foo'])
      Xway.stub('settings').and_return(settings)
    end

    its('list')     { should eq [['http://foo', 'get',    '/applications']] }
    its('create')   { should eq [['http://foo', 'post',   '/applications']] }
    its('find')     { should eq [['http://foo', 'get',    '/applications/:name']] }
    its('update')   { should eq [['http://foo', 'put',    '/applications/:name']] }
    its('delete')   { should eq [['http://foo', 'delete', '/applications/:name']] }
    its('log')      { should eq [['http://foo', 'get',    '/applications/:name/log']] }
    its('start')    { should eq [['http://foo', 'post',   '/applications/:name/start']] }
    its('stop')     { should eq [['http://foo', 'post',   '/applications/:name/stop']] }
    its('restart')  { should eq [['http://foo', 'post',   '/applications/:name/restart']] }
    its('redeploy') { should eq [['http://foo', 'post',   '/applications/:name/redeploy']] }
  end
end
