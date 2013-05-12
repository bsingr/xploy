require 'spec_helper'
require 'xway/error'
require 'xway/api/request/body'

describe Xway::Api::Request::Body do
  context 'unknown file type' do
    let('path') { 'foo/bar' }
    before do
      File.stub('exists?').with(path).and_return(true)
    end
    subject { described_class.new path }
    
    its('path') { should eq path }
    it { expect{subject.mime_type}.to raise_error(Xway::Error) }
    it { expect{subject.read}.to raise_error(Xway::Error) }
  end

  context 'known file type but not existent' do
    let('path') { 'foo/bar.json' }
    before do
      File.stub('exists?').with(path).and_return(false)
    end
    subject { described_class.new path }
    
    its('path') { should eq path }
    its('mime_type') { should eq 'application/json' }
    it { expect{subject.read}.to raise_error(Xway::Error) }
  end

  context 'correct file' do
    let('path') { 'foo/bar.json' }
    before do
      File.stub('exists?').with(path).and_return(true)
      File.stub('read').with(path).and_return('example data')
    end
    subject { described_class.new path }
    
    its('path') { should eq path }
    its('mime_type') { should eq 'application/json' }
    its('read') { should eq 'example data' }
  end
end
