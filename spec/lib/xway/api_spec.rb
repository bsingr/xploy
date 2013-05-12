require 'spec_helper'
require 'xway/api'

describe Xway::Api do
  subject('api') { described_class.new }
  context 'mock http' do
    let('http') do
      double('Http').tap do |mock|
        mock.stub('request') do |server, request|
          Struct.new(:server, :request).new(server, request)
        end
      end
    end
    before { Xway::Api::Http.stub('new').and_return(http) }
    before do
      settings = double('Xway::Settings')
      settings.stub('[]').with(:servers).and_return(['http://foo'])
      Xway.stub('settings').and_return(settings)
    end

    describe 'list' do
      subject              { api.list }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end

    describe 'create' do
      subject              { api.create body: 'bar' }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end

    describe 'find' do
      subject              { api.find 'foo' }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end

    describe 'update' do
      subject              { api.update 'foo' }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end

    describe 'delete' do
      subject              { api.delete 'foo' }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end

    describe 'log' do
      subject              { api.log 'foo' }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end

    describe 'start' do
      subject              { api.start 'foo' }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end

    describe 'stop' do
      subject              { api.stop 'foo' }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end

    describe 'restart' do
      subject              { api.restart 'foo' }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end

    describe 'redeploy' do
      subject              { api.redeploy 'foo' }
      its('first.server')  { should eq 'http://foo' }
      its('first.request') { should be_kind_of(Xway::Api::Request) }
    end
  end
end
