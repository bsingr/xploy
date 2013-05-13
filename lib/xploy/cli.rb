module Xploy
  class Cli
    def initialize api=Api.new, out=STDOUT
      @api = api
      @out = out
    end

    def start
      commands = Xploy.parameter.rest
      if Xploy.parameter[:version]
        @out.puts "xploy #{VERSION}"
      elsif commands.empty?
        Xploy.parameter.print_help!
      else
        @out.puts @api.request(*commands)
      end
    rescue MissingParameter => e
      @out.puts e.message
    end
  end
end
