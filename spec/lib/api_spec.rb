require 'spec_helper'
require 'xway/api'

describe Xway::Api do
  its('list')     { should ==     'GET /applications' }
  its('create')   { should ==    'POST /applications' }
  its('find')     { should ==     'GET /applications/:name' }
  its('update')   { should ==     'PUT /applications/:name' }
  its('delete')   { should ==  'DELETE /applications/:name' }
  its('log')      { should ==     'GET /applications/:name/log'}
  its('start')    { should ==    'POST /applications/:name/start'}
  its('stop')     { should ==    'POST /applications/:name/stop'}
  its('restart')  { should ==    'POST /applications/:name/restart'}
  its('redeploy') { should ==    'POST /applications/:name/redeploy'}

  %w[ find    
      update
      delete
      log
      start
      stop
      restart
      redeploy ].each do |method_name|
    specify "#{method_name} accepts :name" do
      subject.send(method_name, 'foo123').should include('/applications/foo123')
    end
  end
end
