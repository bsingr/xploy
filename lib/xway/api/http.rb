require 'httparty'

module Xway
  class Api
    class Http
      def request server, request
        options = {headers: request.headers}.tap do |options|
          options[:body] = request.body if request.body
        end
        uri = File.join(server, request.path)
        HTTParty.send(request.method, uri, options)
      rescue => e
        raise Error, ["#{server} appears offline", e]
      end
    end
  end
end
