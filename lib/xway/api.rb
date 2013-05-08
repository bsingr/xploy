require 'xway/api/endpoints'
require 'xway/api/http'

module Xway
  class Api
    def method_missing method_name, *args, &block
      uri_str = Endpoints.new.send(method_name, *args)
      Http.new.request uri_str
    end
  end
end
