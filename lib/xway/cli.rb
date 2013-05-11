module Xway
  class Cli
    def initialize api=Api.new, out=STDOUT
      @api = api
      @out = out
    end

    def start
      commands = Xway.settings.rest
      if commands.empty?
        execute ['version']
      else
        execute commands
      end
    end

    def execute commands
      command = commands.first
      if command == 'version'
        @out.puts "xway #{VERSION}"
      else
        @out.puts @api.send(*commands)
      end
    end
  end
end
