require 'spec_helper'
require 'xway/api/http'
require 'xway/error'

describe Xway::Api::Http do
  let('headers') { {'X-App' => 'appway'} }
  let('request') do
    double('Xway::Api::Request').tap do |mock|
      mock.stub('method_name').and_return('get')
      mock.stub('path').and_return('/bar')
      mock.stub('http_options').and_return(headers: headers)
    end
  end

  it 'wraps errors' do
    HTTParty.stub('get') { raise StandardError, 'foo' }
    expect { subject.request 'http://foo', request }.to\
      raise_error(Xway::ConnectionError)
  end

  describe 'calls HTTParty' do
    it do
      HTTParty.should_receive('get').with('http://foo/bar',
                                          headers: headers)
      subject.request 'http://foo', request
    end

    it 'includes debug flag' do
      HTTParty.should_receive('get').with('http://foo/bar',
                                          headers: headers,
                                          debug_output: STDOUT)
      subject.request 'http://foo', request, true
    end
  end
end
