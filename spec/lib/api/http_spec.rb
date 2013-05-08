require 'spec_helper'
require 'xway/api/http'

describe Xway::Api::Http do
  it 'calls net httt' do
    Net::HTTP.should_receive('get').with(URI('http://foo'))
    subject.request 'GET http://foo'
  end
end
