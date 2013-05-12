require 'xway/api/request'
require 'xway/api/endpoints'
require 'xway/api/http'

module Xway
  class Api
    def request method_name, *args, &block
      parameter = Xway.parameter
      request = Endpoints.new.send(method_name, parameter[:app] || {})
      http_options = request.http_options.merge(:debug => parameter[:debug])
      parameter[:servers].map do |server|
        Http.new.request server, http_options
      end
    end
  end
end
