require 'httparty'

module Xway
  class Api
    class Http
      def request server, request
        HTTParty.send(request.method,
                      File.join(server, request.path),
                      {headers: request.headers})
      rescue => e
        raise Error, ["#{server} appears offline", e]
      end
    end
  end
end
