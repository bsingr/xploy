require 'spec_helper'
require 'xway/api/http'
require 'xway/error'

describe Xway::Api::Http do
  it 'calls HTTParty' do
    HTTParty.should_receive('get').with('http://foo/bar')
    subject.request 'http://foo', 'GET /bar'
  end

  it 'wraps errors' do
    HTTParty.stub('get') { raise StandardError, 'bar' }
    expect { subject.request 'http://bar', 'GET foo' }.to\
      raise_error(Xway::Error)
  end
end
