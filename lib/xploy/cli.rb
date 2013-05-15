module Xploy
  class Cli
    def initialize api, out, template_class
      @api = api
      @out = out
      @template_class = template_class
    end

    def start
      if parameter[:version]
        @out.puts "xploy #{VERSION}"
      elsif commands.empty?
        parameter.print_help!
      elsif commands.first == 'new'
        render_template
      else
        @out.puts @api.request(*commands)
      end
    rescue MissingParameter => e
      @out.puts e.message
    end

  private

    def parameter
      Xploy.parameter
    end

    def commands
      parameter.rest
    end

    def render_template
      template_data = @template_class.new.to_s
      if path = commands[1]
        File.open(path, 'w') { |f| f.write template_data }
      else
        @out.puts template_data
      end
    end
  end
end
