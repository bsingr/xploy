require 'spec_helper'
require 'xploy/error'
require 'xploy/api/request/body'

describe Xploy::Api::Request::Body do
  context 'unknown file type' do
    let('path') { 'foo/bar' }
    before do
      File.stub('exists?').with(path).and_return(true)
    end
    subject { described_class.new path }
    
    its('path') { should eq path }
    it { expect{subject.mime_type}.to raise_error(Xploy::ManifestFileTypeUnsupported) }
    it { expect{subject.read}.to raise_error(Xploy::ManifestFileTypeUnsupported) }
  end

  context 'known file type but not existent' do
    let('path') { 'foo/bar.json' }
    before do
      File.stub('exists?').with(path).and_return(false)
    end
    subject { described_class.new path }
    
    its('path') { should eq path }
    its('mime_type') { should eq 'application/json' }
    it { expect{subject.read}.to raise_error(Xploy::ManifestFileNotFound) }
  end

  shared_examples_for 'correct_file' do |extname|
    let('path') { 'foo/bar'+extname }
    before do
      File.stub('exists?').with(path).and_return(true)
      File.stub('read').with(path).and_return('example data')
    end
    subject { described_class.new path }
    
    its('path') { should eq path }
    its('mime_type') { should eq 'application/json' }
    its('read') { should eq 'example data' }
  end

  context 'correct file .json' do
    it_behaves_like 'correct_file', '.json'
  end

  context 'correct file .xploy' do
    it_behaves_like 'correct_file', '.xploy'
  end
end
