require 'spec_helper'
require 'xploy/template'

describe Xploy::Template do
  its('to_s') { should eq File.read(File.join(ASSETS_PATH, 'template.json'))}
end