require 'httparty'

module Xway
  class Api
    class Http
      def request server, request
        uri = File.join(server, request.path)
        HTTParty.send(request.method, uri, request.http_options)
      rescue => e
        raise Error, ["#{server} appears offline", e]
      end
    end
  end
end
