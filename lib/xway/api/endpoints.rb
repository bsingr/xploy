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
        Request.new 'get', "/applications/#{name}", app_name: name
      end

      def update name=":name"
        Request.new 'put', "/applications/#{name}", app_name: name
      end

      def delete name=":name"
        Request.new 'delete', "/applications/#{name}", app_name: name
      end

      def log name=":name"
        Request.new 'get', "/applications/#{name}/log", app_name: name
      end

      def start name=":name"
        Request.new 'post', "/applications/#{name}/start", app_name: name
      end

      def stop name=":name"
        Request.new 'post', "/applications/#{name}/stop", app_name: name
      end

      def restart name=":name"
        Request.new 'post', "/applications/#{name}/restart", app_name: name
      end

      def redeploy name=":name"
        Request.new 'post', "/applications/#{name}/redeploy", app_name: name
      end
    end
  end
end
