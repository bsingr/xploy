require 'xway/api/request'
require 'xway/api/endpoints'
require 'xway/api/http'

module Xway
  class Api
    def method_missing method_name, *args, &block
      options = {}.tap do |options|
        app = Xway.parameter[:app]
        options[:app] = app if app
      end
      request = Endpoints.new.send(method_name, options)
      Xway.parameter[:servers].map do |server|
        Http.new.request server, request
      end
    end
  end
end
