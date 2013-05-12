require 'spec_helper'
require 'xway/api'

describe Xway::Api do
  subject('api') { described_class.new }
  context 'mock http + request' do
    let!('http') do
      double('Http').tap do |mock|
        mock.stub('request') do |server, request|
          Struct.new(:server, :request).new(server, request)
        end
        Xway::Api::Http.stub('new').and_return(mock)
      end
    end
    let!('endpoints') do
      double('Endpoints').tap do |mock|
        mock.stub('request_foo') do |body|
          ['get', '/foo', body: body]
        end
        Xway::Api::Endpoints.stub('new').and_return(mock)
      end
    end
    before do
      settings = double('Xway::Settings')
      settings.stub('[]').with(:servers).and_return(['http://foo',
                                                     'http://bar'])
      Xway.stub('settings').and_return(settings)
    end

    describe 'builds request for each server' do
      subject { api.request_foo 'my body' }

      its('first.server')  { should eq('http://foo') }
      its('first.request') { should eq(['get', '/foo', body: 'my body']) }
      its('last.server')   { should eq('http://bar') }
      its('last.request')  { should eq(['get', '/foo', body: 'my body']) }
    end
  end
end
