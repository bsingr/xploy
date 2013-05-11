require 'configliere'

module Xway
  class Settings
    def reload!
      @settings = Configliere::Param.new
      @settings.read global_config if File.exists? global_config
      @settings.read local_config if File.exists? local_config
      @settings.use(:commandline)
      @settings.resolve!
      self
    end

    def [] key
      if @settings
        @settings[key]
      else
        nil
      end
    end

    def rest
      if @settings
        @settings.rest
      else
        []
      end
    end

    def to_hash
      if @settings
        @settings.to_hash
      else
        {}
      end
    end

    def global_config
      ENV['XWAY_CONFIG'] || File.join(ENV['HOME'], '.xway')
    end

    def local_config
      File.join(Dir.pwd, '.xway')
    end
  end
end
