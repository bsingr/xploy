require 'spec_helper'
require 'xway/api/endpoints'
require 'xway/api/request'

describe Xway::Api::Endpoints do
  subject('endpoints') { described_class.new }

  its('list.method')        { should eq 'get' }
  its('list.path')          { should eq '/applications' }
  its('create.method')      { should eq 'post' }
  its('create.path')        { should eq '/applications' }
  its('find.method')        { should eq 'get' }
  its('find.path')          { should eq '/applications/:name' }
  its('update.method')      { should eq 'put' }
  its('update.path')        { should eq '/applications/:name' }
  its('delete.method')      { should eq 'delete' }
  its('delete.path')        { should eq '/applications/:name' }
  its('log.method')         { should eq 'get' }
  its('log.path')           { should eq '/applications/:name/log'}
  its('start.method')       { should eq 'post' }
  its('start.path')         { should eq '/applications/:name/start'}
  its('stop.method')        { should eq 'post' }
  its('stop.path')          { should eq '/applications/:name/stop'}
  its('restart.method')     { should eq 'post' }
  its('restart.path')       { should eq '/applications/:name/restart'}
  its('redeploy.method')    { should eq 'post' }
  its('redeploy.path')      { should eq '/applications/:name/redeploy'}

  %w[ find    
      update
      delete
      log
      start
      stop
      restart
      redeploy ].each do |method_name|
    describe "#{method_name}" do
      subject { endpoints.send(method_name, 'foo') }
      
      its('path') { should include('/applications/foo') }
    end
  end
end
