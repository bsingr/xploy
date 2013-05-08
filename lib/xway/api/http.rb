require 'net/http'

module Xway
  class Api
    class Http
      def request str
        method, uri_str = str.split(' ')
        Net::HTTP.send(method.downcase, URI(uri_str))
      end
    end
  end
end
