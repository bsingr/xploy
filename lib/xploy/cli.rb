module Xploy
  class Cli
    def initialize api, out, template_class
      @api = api
      @out = out
      @template_class = template_class
    end

    def start
      parameter = Xploy.parameter
      commands = parameter.rest
      if parameter[:version]
        @out.puts "xploy #{VERSION}"
      elsif commands.empty?
        parameter.print_help!
      elsif commands.first == 'new'
        template_data = @template_class.new.to_s
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
