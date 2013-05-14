module Xploy
  class Api
    class Endpoints
      def list options={}
        Request.new 'get', '/applications'
      end

      def create options={}
        Request.new 'post', '/applications', options
      end

      def find options={}
        Request.new 'get', "/applications/#{extract(options, :name)}"
      end

      def update options={}
        Request.new 'put', "/applications/#{extract(options, :name)}"
      end

      def delete options={}
        Request.new 'delete', "/applications/#{extract(options, :name)}"
      end

      def log options={}
        Request.new 'get', "/applications/#{extract(options, :name)}/log"
      end

      def start options={}
        Request.new 'post', "/applications/#{extract(options, :name)}/start"
      end

      def stop options={}
        Request.new 'post', "/applications/#{extract(options, :name)}/stop"
      end

      def restart options={}
        Request.new 'post', "/applications/#{extract(options, :name)}/restart"
      end

      def redeploy options={}
        Request.new 'post', "/applications/#{extract(options, :name)}/redeploy"
      end

    private

      def extract options, key
        if !options.is_a?(Hash) || options[key] == nil || options[key] == ''
          raise MissingParameter, "Missing app parameter '#{key}'"
        else
          options[key]
        end
      end
    end
  end
end
