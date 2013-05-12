require 'xway/api/request'
require 'xway/api/endpoints'
require 'xway/api/http'

module Xway
  class Api
    def method_missing method_name, *args, &block
      request = Endpoints.new.send(method_name, *args)
      Xway.settings[:servers].map do |server|
        Http.new.request server, request
      end
    end
  end
end
