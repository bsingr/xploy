module Xway
  class Cli
    def start commands=[]
      if commands.empty?
        execute ['version']
      else
        execute commands
      end
    end

    def execute commands
      command = commands.first
      if command == 'version'
        out.puts "xway #{VERSION}"
      else
        out.puts api.send(commands.first)
      end
    end

  private

    def out
      STDOUT
    end

    def api
      Api.new
    end

  end
end
