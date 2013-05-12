require 'xway/api/request'
require 'xway/api/endpoints'
require 'xway/api/http'

module Xway
  class Api
    def request method_name, *args, &block
      http = Http.new
      request = build_request method_name
      parameter[:servers].map do |server|
        http.request server, request, parameter[:debug]
      end
    end

  private

    def parameter
      Xway.parameter
    end

    def build_request method_name
      Endpoints.new.send(method_name, parameter[:app] || {})
    end
  end
end
