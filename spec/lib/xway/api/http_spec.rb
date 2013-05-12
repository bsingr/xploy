require 'spec_helper'
require 'xway/api/http'
require 'xway/api/request'
require 'xway/error'

describe Xway::Api::Http do
  let('request') { Xway::Api::Request.new('get', '/bar') }
  let('default_headers') { {'X-App' => 'appway'} }

  it 'wraps errors' do
    HTTParty.stub('get') { raise StandardError, 'foo' }
    expect { subject.request 'http://foo', request }.to\
      raise_error(Xway::Error)
  end

  describe 'calls HTTParty' do
    it do
      HTTParty.should_receive('get').with('http://foo/bar',
                                          headers: default_headers)
      subject.request 'http://foo', request
    end

    it 'includes body' do
      request.stub('body').and_return('bar')
      HTTParty.should_receive('get').with('http://foo/bar',
                                          headers: default_headers,
                                          body: 'bar')
      subject.request 'http://foo', request
    end
  end
end
