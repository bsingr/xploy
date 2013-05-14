module Xploy
  class Cli
    def initialize api, out
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
      elsif commands.first == 'new'
        template_data = 'see appway-example.json'
        if file = parameter[:template]
          File.open(file, 'w') { |f| f.write template_data }
        else
          @out.puts template_data
        end
      else
        @out.puts @api.request(*commands)
      end
    rescue MissingParameter => e
      @out.puts e.message
    end
  end
end
