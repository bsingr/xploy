require 'xway/version'
require 'xway/error'
require 'xway/settings'
require 'xway/api'
require 'xway/cli'

module Xway
  def self.settings
    @settings ||= Settings.new.reload!
  end
end
