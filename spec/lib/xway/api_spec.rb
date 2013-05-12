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
      subject { api.list }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'get' }
      its('first.request.path')    { should eq '/applications' }
      its('first.request.headers') { should eq('X-App' => 'appway') }
    end

    describe 'create' do
      subject { api.create }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'post' }
      its('first.request.path')    { should eq '/applications' }
      its('first.request.headers') { should eq('X-App' => 'appway') }
    end

    describe 'find' do
      subject { api.find 'foo' }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'get' }
      its('first.request.path')    { should eq '/applications/foo' }
      its('first.request.headers') { should eq('X-App' => 'foo') }
    end

    describe 'update' do
      subject { api.update 'foo' }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'put' }
      its('first.request.path')    { should eq '/applications/foo' }
      its('first.request.headers') { should eq('X-App' => 'foo') }
    end

    describe 'delete' do
      subject { api.delete 'foo' }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'delete' }
      its('first.request.path')    { should eq '/applications/foo' }
      its('first.request.headers') { should eq('X-App' => 'foo') }
    end

    describe 'log' do
      subject { api.log 'foo' }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'get' }
      its('first.request.path')    { should eq '/applications/foo/log' }
      its('first.request.headers') { should eq('X-App' => 'foo') }
    end

    describe 'start' do
      subject { api.start 'foo' }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'post' }
      its('first.request.path')    { should eq '/applications/foo/start' }
      its('first.request.headers') { should eq('X-App' => 'foo') }
    end

    describe 'stop' do
      subject { api.stop 'foo' }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'post' }
      its('first.request.path')    { should eq '/applications/foo/stop' }
      its('first.request.headers') { should eq('X-App' => 'foo') }
    end

    describe 'restart' do
      subject { api.restart 'foo' }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'post' }
      its('first.request.path')    { should eq '/applications/foo/restart' }
      its('first.request.headers') { should eq('X-App' => 'foo') }
    end

    describe 'redeploy' do
      subject { api.redeploy 'foo' }
      its('first.server')          { should eq 'http://foo' }
      its('first.request.method')  { should eq 'post' }
      its('first.request.path')    { should eq '/applications/foo/redeploy' }
      its('first.request.headers') { should eq('X-App' => 'foo') }
    end
  end
end
