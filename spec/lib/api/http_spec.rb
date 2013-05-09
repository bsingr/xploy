require 'spec_helper'
require 'xway/api/http'

describe Xway::Api::Http do
  it 'calls HTTParty' do
    HTTParty.should_receive('get').with('http://foo')
    subject.request 'GET http://foo'
  end
end
