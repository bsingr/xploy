require 'xway/api/request'
require 'xway/api/endpoints'
require 'xway/api/http'

module Xway
  class Api
    def method_missing method_name, *args, &block
      options = {}.tap do |options|
        options[:debug] = Xway.parameter[:debug]
        if app = Xway.parameter[:app]
          options[:app] = app[:name] if app[:name]
          if manifest = app[:manifest]
            if File.exists?(manifest) && File.extname(manifest) == '.json'
              options[:body] = File.read(manifest) 
              options[:headers] ||= {}
              options[:headers]['Content-Type'] = 'application/json'
            end
          end
        end
      end
      request = Endpoints.new.send(method_name, options)
      Xway.parameter[:servers].map do |server|
        Http.new.request server, request.http_options
      end
    end
  end
end
