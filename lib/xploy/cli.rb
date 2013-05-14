module Xploy
  class Cli
    def initialize api=Api.new, out=STDOUT
      @api = api
      @out = out
    end

    def start
      parameter = Xploy.parameter
      commands = parameter.rest
      if parameter[:version]
        @out.puts "xploy #{VERSION}"
      elsif commands.empty?
        parameter.print_help!
      else
        @out.puts @api.request(*commands)
      end
    rescue MissingParameter => e
      @out.puts e.message
    end
  end
end
