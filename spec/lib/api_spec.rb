require 'spec_helper'
require 'xway/api'

describe Xway::Api do
  context 'mock http' do
    let('http') do
      double('Http').tap do |mock|
        mock.stub('request').and_return { |uri_str| ['response', "#{uri_str}"] }
      end
    end
    before { Xway::Api::Http.stub('new').and_return(http) }

    its('list')     { should == ['response',    'GET /applications'] }
    its('create')   { should == ['response',   'POST /applications'] }
    its('find')     { should == ['response',    'GET /applications/:name'] }
    its('update')   { should == ['response',    'PUT /applications/:name'] }
    its('delete')   { should == ['response', 'DELETE /applications/:name'] }
    its('log')      { should == ['response',    'GET /applications/:name/log'] }
    its('start')    { should == ['response',   'POST /applications/:name/start'] }
    its('stop')     { should == ['response',   'POST /applications/:name/stop'] }
    its('restart')  { should == ['response',   'POST /applications/:name/restart'] }
    its('redeploy') { should == ['response',   'POST /applications/:name/redeploy'] }
  end
end
