require 'xway/version'
require 'xway/error'
require 'xway/parameter'
require 'xway/api'
require 'xway/cli'

module Xway
  def self.parameter
    @parameter ||= Parameter.new.reload!
  end
end
