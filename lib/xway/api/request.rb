require 'xway/api/request/body'

module Xway
  class Api
    class Request
      attr_reader :method, :path, :headers, :body

      def initialize method, path, options={}
        @method = method
        @path = path
        @options = options
        @body = build_body
        @headers = build_headers
      end

      def build_headers
        {'X-App' => 'appway'}.tap do |headers|
          headers['Content-Type'] = body.mime_type if body
        end
      end

      def build_body
        if path = @options[:manifest]
          @body = Body.new path
        else
          @body = nil
        end
      end

      def http_options
        http_options = {headers: headers}.tap do |http_options|
          http_options[:body] = body.read if body
        end
      end
    end
  end
end
