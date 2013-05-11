require 'spec_helper'
require 'xway/api'

describe Xway::Api do
  context 'mock http' do
    let('http') do
      double('Http').tap do |mock|
        mock.stub('request') do |server, endpoint|
          ['$', server, endpoint]
        end
      end
    end
    before { Xway::Api::Http.stub('new').and_return(http) }
    before do
      settings = double('Xway::Settings')
      settings.stub('[]').with(:servers).and_return(['http://foo'])
      Xway.stub('settings').and_return(settings)
    end

    its('list')     { should == [['$', 'http://foo',    'GET /applications']] }
    its('create')   { should == [['$', 'http://foo',   'POST /applications']] }
    its('find')     { should == [['$', 'http://foo',    'GET /applications/:name']] }
    its('update')   { should == [['$', 'http://foo',    'PUT /applications/:name']] }
    its('delete')   { should == [['$', 'http://foo', 'DELETE /applications/:name']] }
    its('log')      { should == [['$', 'http://foo',    'GET /applications/:name/log']] }
    its('start')    { should == [['$', 'http://foo',   'POST /applications/:name/start']] }
    its('stop')     { should == [['$', 'http://foo',   'POST /applications/:name/stop']] }
    its('restart')  { should == [['$', 'http://foo',   'POST /applications/:name/restart']] }
    its('redeploy') { should == [['$', 'http://foo',   'POST /applications/:name/redeploy']] }
  end
end
