require 'xway/api/endpoints'
require 'xway/api/http'

module Xway
  class Api
    def method_missing method_name, *args, &block
      endpoint = Endpoints.new.send(method_name, *args)
      ::Settings[:servers].map do |server|
        Http.new.request server, endpoint
      end
    end
  end
end
