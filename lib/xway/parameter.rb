require 'configliere'

module Xway
  class Parameter
    def reload!
      @param = Configliere::Param.new
      @param.define :servers,       type: Array,
                                    description: "all appway servers",
                                    default: ['http://localhost:8000']
      @param.define 'app.name',     type: String,
                                    description: 'name of your app'
      @param.define 'app.manifest', type: String,
                                    description: 'path to your app.way file'
      @param.define :debug,         description: 'print debug info to stdout',
                                    default: false
      @param.define :version,       flag: 'v',
                                    description: 'print version info'
      @param.read global_config if File.exists? global_config
      @param.read local_config if File.exists? local_config
      @param.use(:commandline)
      @param.resolve!
      self
    end

    def print_help!
      reload!
      @param[:help] = true
      @param.resolve!
      self
    end

    def [] key
      if @param
        @param[key]
      else
        nil
      end
    end

    def rest
      if @param
        @param.rest
      else
        []
      end
    end

    def to_hash
      if @param
        @param.to_hash
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
