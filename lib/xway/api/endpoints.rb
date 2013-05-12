module Xway
  class Api
    class Endpoints
      def list
        Request.new 'get', '/applications'
      end

      def create
        Request.new 'post', '/applications'
      end

      def find name=":name"
        Request.new 'get', "/applications/#{name}"
      end

      def update name=":name"
        Request.new 'put', "/applications/#{name}"
      end

      def delete name=":name"
        Request.new 'delete', "/applications/#{name}"
      end

      def log name=":name"
        Request.new 'get', "/applications/#{name}/log"
      end

      def start name=":name"
        Request.new 'post', "/applications/#{name}/start"
      end

      def stop name=":name"
        Request.new 'post', "/applications/#{name}/stop"
      end

      def restart name=":name"
        Request.new 'post', "/applications/#{name}/restart"
      end

      def redeploy name=":name"
        Request.new 'post', "/applications/#{name}/redeploy"
      end
    end
  end
end
