require 'httparty'

module Xway
  class Api
    class Http
      def request server, endpoint
        method, path = endpoint.split(' ')
        HTTParty.send(method.downcase, File.join(server, path), options)
      rescue => e
        raise Error, ["#{server} appears offline", e]
      end

      def options
        {headers: default_headers}
      end

      def default_headers
        {'X-App' => 'appway'}
      end
    end
  end
end
