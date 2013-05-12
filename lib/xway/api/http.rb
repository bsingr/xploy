require 'httparty'

module Xway
  class Api
    class Http
      def request server, request, debug=false
        uri = File.join(server, request.path)
        http_options = request.http_options.tap do |http_options|
          http_options[:debug_output] = STDOUT if debug
        end
        HTTParty.send(request.method_name, uri, http_options)
      rescue => e
        raise Error, ["#{server} appears offline", e]
      end
    end
  end
end
