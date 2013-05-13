module Xway
  class Cli
    def initialize api=Api.new, out=STDOUT
      @api = api
      @out = out
    end

    def start
      commands = Xway.parameter.rest
      if Xway.parameter[:version]
        @out.puts "xway #{VERSION}"
      elsif commands.empty?
        Xway.parameter.print_help!
      else
        @out.puts @api.request(*commands)
      end
    rescue MissingParameter => e
      @out.puts e.message
    end
  end
end
