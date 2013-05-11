require 'httparty'

module Xway
  class Api
    class Http
      def request server, endpoint
        method, path = endpoint.split(' ')
        HTTParty.send(method.downcase, File.join(server, path))
      rescue => e
        raise Error, ["#{server} appears offline", e]
      end
    end
  end
end
