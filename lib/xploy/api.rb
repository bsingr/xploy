require 'xploy/api/request'
require 'xploy/api/endpoints'
require 'xploy/api/http'

module Xploy
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
      Xploy.parameter
    end

    def build_request method_name
      Endpoints.new.send(method_name, parameter[:app] || {})
    end
  end
end
