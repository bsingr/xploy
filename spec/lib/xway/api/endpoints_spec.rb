require 'spec_helper'
require 'xway/api/endpoints'
require 'xway/api/request'

describe Xway::Api::Endpoints do
  subject('endpoints') { described_class.new }

  describe 'list' do
    subject            { endpoints.list({}) }
    its('method_name') { should eq 'get' }
    its('path')        { should eq '/applications' }
    its('headers')     { should eq('X-App' => 'appway') }
    its('body')        { should eq(nil) }
  end

  describe 'create' do
    let('manifest')    { File.join(ASSETS_PATH, 'appway-example.json') }
    subject            { endpoints.create manifest: manifest }
    its('method_name') { should eq 'post' }
    its('path')        { should eq '/applications' }
    its('headers')     { should eq('X-App' => 'appway',
                                   'Content-Type' => 'application/json') }
    its('body')        { should be_kind_of(Xway::Api::Request::Body) }
  end

  describe 'find' do
    subject            { endpoints.find name: 'foo' }
    its('method_name') { should eq 'get' }
    its('path')        { should eq '/applications/foo' }
    its('headers')     { should eq('X-App' => 'appway') }
    its('body')        { should eq(nil) }
  end

  describe 'update' do
    subject            { endpoints.update name: 'foo' }
    its('method_name') { should eq 'put' }
    its('path')        { should eq '/applications/foo' }
    its('headers')     { should eq('X-App' => 'appway') }
    its('body')        { should eq(nil) }
  end

  describe 'delete' do
    subject            { endpoints.delete name: 'foo' }
    its('method_name') { should eq 'delete' }
    its('path')        { should eq '/applications/foo' }
    its('headers')     { should eq('X-App' => 'appway') }
    its('body')        { should eq(nil) }
  end

  describe 'log' do
    subject            { endpoints.log name: 'foo' }
    its('method_name') { should eq 'get' }
    its('path')        { should eq '/applications/foo/log' }
    its('headers')     { should eq('X-App' => 'appway') }
    its('body')        { should eq(nil) }
  end

  describe 'start' do
    subject            { endpoints.start name: 'foo' }
    its('method_name') { should eq 'post' }
    its('path')        { should eq '/applications/foo/start' }
    its('headers')     { should eq('X-App' => 'appway') }
    its('body')        { should eq(nil) }
  end

  describe 'stop' do
    subject            { endpoints.stop name: 'foo' }
    its('method_name') { should eq 'post' }
    its('path')        { should eq '/applications/foo/stop' }
    its('headers')     { should eq('X-App' => 'appway') }
    its('body')        { should eq(nil) }
  end

  describe 'restart' do
    subject            { endpoints.restart name: 'foo' }
    its('method_name') { should eq 'post' }
    its('path')        { should eq '/applications/foo/restart' }
    its('headers')     { should eq('X-App' => 'appway') }
    its('body')        { should eq(nil) }
  end

  describe 'redeploy' do
    subject            { endpoints.redeploy name: 'foo' }
    its('method_name') { should eq 'post' }
    its('path')        { should eq '/applications/foo/redeploy' }
    its('headers')     { should eq('X-App' => 'appway') }
    its('body')        { should eq(nil) }
  end
end
