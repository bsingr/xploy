require 'spec_helper'
require 'xway/error'
require 'xway/api/endpoints'
require 'xway/api/request'

describe Xway::Api::Endpoints do
  subject('endpoints') { described_class.new }

  specify 'list doesnt require_options' do
    expect{ subject.list }.not_to raise_error(Xway::MissingParameter)
  end
  specify 'create doesnt require_options' do
    expect{ subject.create }.not_to raise_error(Xway::MissingParameter)
  end
  specify 'find does require_options' do
    expect{ subject.find }.to raise_error(Xway::MissingParameter)
  end
  specify 'update does require_options' do
    expect{ subject.update }.to raise_error(Xway::MissingParameter)
  end
  specify 'delete does require_options' do
    expect{ subject.delete }.to raise_error(Xway::MissingParameter)
  end
  specify 'log does require_options' do
    expect{ subject.log }.to raise_error(Xway::MissingParameter)
  end
  specify 'start does require_options' do
    expect{ subject.start }.to raise_error(Xway::MissingParameter)
  end
  specify 'stop does require_options' do
    expect{ subject.stop }.to raise_error(Xway::MissingParameter)
  end
  specify 'restart does require_options' do
    expect{ subject.restart }.to raise_error(Xway::MissingParameter)
  end
  specify 'redeploy does require_options' do
    expect{ subject.redeploy }.to raise_error(Xway::MissingParameter)
  end

  context 'mock require_options' do
    before { endpoints.stub('require_options') }

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
end
