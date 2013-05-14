require 'xploy/version'
require 'xploy/error'
require 'xploy/parameter'
require 'xploy/api'
require 'xploy/cli'

module Xploy
  def self.parameter
    @parameter ||= Parameter.new.reload!
  end

  def self.build_cli
    Cli.new Api.new, STDOUT
  end
end
