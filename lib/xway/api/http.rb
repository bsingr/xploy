require 'httparty'

module Xway
  class Api
    class Http
      def request str
        method, uri_str = str.split(' ')
        HTTParty.send(method.downcase, uri_str)
      end
    end
  end
end
