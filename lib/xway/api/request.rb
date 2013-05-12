module Xway
  class Api
    class Request
      attr_reader :method, :path

      def initialize method, path, options={}
        @method = method
        @path = path
        @options = options
      end

      def headers
        {'X-App' => 'appway'}
      end
    end
  end
end
