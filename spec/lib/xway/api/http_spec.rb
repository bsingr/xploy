require 'spec_helper'
require 'xway/api/http'
require 'xway/error'

describe Xway::Api::Http do
  let('default_headers') { {'X-App' => 'appway'} }
  it 'calls HTTParty' do
    HTTParty.should_receive('get').with('http://foo/bar',
                                        headers: default_headers)
    subject.request 'http://foo', 'GET /bar'
  end

  it 'wraps errors' do
    HTTParty.stub('get') { raise StandardError, 'bar' }
    expect { subject.request 'http://bar', 'GET foo' }.to\
      raise_error(Xway::Error)
  end

  its('options') { should eq(headers: default_headers)}
  its('default_headers') { should eq(default_headers) }

  it 'merges X-App' do
    subject.options('foo').should eq(headers: {'X-App' => 'foo'})
  end
end
