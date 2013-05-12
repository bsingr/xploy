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
          headers['X-App'] = @options[:app_name] if @options[:app_name]
        end
      end
    end
  end
end
