require 'configliere'

module Xway
  module Settings
    class << self
      def load!
        ::Settings.read global_config
        ::Settings.read local_config
        ::Settings.use(:commandline)
        ::Settings.resolve!
      end

      def global_config
        ENV['XWAY_CONFIG'] || File.join(ENV['HOME'], '.xway')
      end

      def local_config
        File.join(Dir.pwd, '.xway')
      end
    end
  end
end
