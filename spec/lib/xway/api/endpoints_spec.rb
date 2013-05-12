require 'spec_helper'
require 'xway/api/endpoints'
require 'xway/api/request'

describe Xway::Api::Endpoints do
  subject('endpoints') { described_class.new }

  describe 'list' do
    subject        { endpoints.list }
    its('method')  { should eq 'get' }
    its('path')    { should eq '/applications' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq(nil) }
  end

  describe 'create' do
    subject        { endpoints.create body: 'bar' }
    its('method')  { should eq 'post' }
    its('path')    { should eq '/applications' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq('bar') }
  end

  describe 'find' do
    subject        { endpoints.find 'foo' }
    its('method')  { should eq 'get' }
    its('path')    { should eq '/applications/foo' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq(nil) }
  end

  describe 'update' do
    subject        { endpoints.update 'foo' }
    its('method')  { should eq 'put' }
    its('path')    { should eq '/applications/foo' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq(nil) }
  end

  describe 'delete' do
    subject        { endpoints.delete 'foo' }
    its('method')  { should eq 'delete' }
    its('path')    { should eq '/applications/foo' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq(nil) }
  end

  describe 'log' do
    subject        { endpoints.log 'foo' }
    its('method')  { should eq 'get' }
    its('path')    { should eq '/applications/foo/log' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq(nil) }
  end

  describe 'start' do
    subject        { endpoints.start 'foo' }
    its('method')  { should eq 'post' }
    its('path')    { should eq '/applications/foo/start' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq(nil) }
  end

  describe 'stop' do
    subject        { endpoints.stop 'foo' }
    its('method')  { should eq 'post' }
    its('path')    { should eq '/applications/foo/stop' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq(nil) }
  end

  describe 'restart' do
    subject        { endpoints.restart 'foo' }
    its('method')  { should eq 'post' }
    its('path')    { should eq '/applications/foo/restart' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq(nil) }
  end

  describe 'redeploy' do
    subject        { endpoints.redeploy 'foo' }
    its('method')  { should eq 'post' }
    its('path')    { should eq '/applications/foo/redeploy' }
    its('headers') { should eq('X-App' => 'appway') }
    its('body')    { should eq(nil) }
  end
end
