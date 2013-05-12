require 'spec_helper'
require 'xway/api'

describe Xway::Api do
  subject('api') { described_class.new }
  context 'mock http + request' do
    before do
      Xway::Api::Request.stub('new').and_return do |method_name, path, options|
        double('Request').tap do |mock|
          mock.stub('method').and_return(method_name)
          mock.stub('path').and_return(path)
          mock.stub('http_options') do
            {}.tap do |http_options|
              http_options[:debug_info] = options[:debug] if options[:debug]
              app = options[:app]
              http_options[:headers] = {'X-App' => 'appway'}.tap do |headers|
                headers.merge! options[:headers] if options[:headers]
              end
              http_options[:body] = options[:body] if options[:body]
            end
          end
        end
      end
    end
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
        mock.stub('foo') do |options|
          Xway::Api::Request.new 'get', '/foo', options
        end
        Xway::Api::Endpoints.stub('new').and_return(mock)
      end
    end

    context 'apps' do
      before do
        manifest = File.join(ASSETS_PATH, 'appway-example.json')
        File.stub('read').with(manifest).and_return('appway-example.json.data')
        parameter = double('Xway::Parameter')
        parameter.stub('[]').with(:servers).and_return(['http://foo',
                                                        'http://bar'])
        parameter.stub('[]').with(:app).and_return(nil)
        parameter.stub('[]').with(:debug).and_return(false)
        Xway.stub('parameter').and_return(parameter)
      end

      describe 'builds request for each server' do
        subject { api.request 'foo' }

        its('first.server')  { should eq('http://foo') }
        its('first.request') { should eq(:headers => {"X-App" => "appway"}) }
        its('last.server')   { should eq('http://bar') }
        its('last.request')  { should eq(:headers => {"X-App" => "appway"}) }
      end
    end

    context 'app name + manifest' do
      before do
        manifest = File.join(ASSETS_PATH, 'appway-example.json')
        File.stub('exists?').with(manifest).and_return(true)
        File.stub('read').with(manifest).and_return('appway-example.json.data')
        parameter = double('Xway::Parameter')
        parameter.stub('[]').with(:servers).and_return(['http://foo',
                                                        'http://bar'])
        parameter.stub('[]').with(:app).and_return(name: 'appway-example',
                                                   manifest: manifest)
        parameter.stub('[]').with(:debug).and_return(false)
        Xway.stub('parameter').and_return(parameter)
      end

      describe 'builds request for each server' do
        subject { api.request 'foo' }

        its('first.server')  { should eq('http://foo') }
        its('first.request') { should eq(:headers => {
                                            "X-App" => "appway",
                                            "Content-Type" => "application/json"},
                                         :body => "appway-example.json.data") }
        its('last.server')   { should eq('http://bar') }
        its('last.request')  { should eq(:headers => {
                                            "X-App" => "appway",
                                            "Content-Type" => "application/json"},
                                         :body => "appway-example.json.data") }
      end
    end
  end
end
