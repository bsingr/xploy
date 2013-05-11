require 'httparty'

module Xway
  class Api
    class Http
      def request server, endpoint, app_name=nil
        method, path = endpoint.split(' ')
        HTTParty.send(method.downcase,
                      File.join(server, path),
                      options(app_name))
      rescue => e
        raise Error, ["#{server} appears offline", e]
      end

      def options app_name=nil
        headers = default_headers
        headers['X-App'] = app_name if app_name
        {headers: headers}
      end

      def default_headers
        {'X-App' => 'appway'}
      end
    end
  end
end
