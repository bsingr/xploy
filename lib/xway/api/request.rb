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
        {'X-App' => 'appway'}.tap do |headers|
          headers.merge! @options[:headers] if @options[:headers].is_a? Hash
        end
      end

      def body
        if @options[:body]
          @options[:body]
        else
          nil
        end
      end

      def http_options
        http_options = {headers: headers}.tap do |http_options|
          http_options[:debug_output] = STDOUT if @options[:debug]
          http_options[:body] = body if body
        end
      end
    end
  end
end
