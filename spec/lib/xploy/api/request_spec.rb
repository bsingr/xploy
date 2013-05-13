require 'spec_helper'
require 'xploy/api/request'

describe Xploy::Api::Request do
  subject { described_class.new 'get', '/foo' }

  its('method_name') { should eq 'get' }
  its('path')        { should eq '/foo' }
  its('headers')     { should eq('X-App' => 'appway') }
  its('body')        { should eq nil } 

  context 'with manifest' do
    let('manifest') { File.join(ASSETS_PATH, 'appway-example.json') }
    subject { described_class.new 'get', '/foo', manifest: manifest }

    its('method_name') { should eq 'get' }
    its('path')        { should eq '/foo' }
    its('headers')     { should eq('X-App' => 'appway',
                                 'Content-Type' => 'application/json') }
    its('body.read')   { should include('github.com/threez/appway-example') } 
  end
end
