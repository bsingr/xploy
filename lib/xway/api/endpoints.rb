module Xway
  class Api
    class Endpoints
      def list
        Request.new 'get', '/applications'
      end

      def create options={}
        Request.new 'post', '/applications', options
      end

      def find options={app: ':name'}
        Request.new 'get', "/applications/#{options[:app]}"
      end

      def update options={app: ':name'}
        Request.new 'put', "/applications/#{options[:app]}"
      end

      def delete options={app: ':name'}
        Request.new 'delete', "/applications/#{options[:app]}"
      end

      def log options={app: ':name'}
        Request.new 'get', "/applications/#{options[:app]}/log"
      end

      def start options={app: ':name'}
        Request.new 'post', "/applications/#{options[:app]}/start"
      end

      def stop options={app: ':name'}
        Request.new 'post', "/applications/#{options[:app]}/stop"
      end

      def restart options={app: ':name'}
        Request.new 'post', "/applications/#{options[:app]}/restart"
      end

      def redeploy options={app: ':name'}
        Request.new 'post', "/applications/#{options[:app]}/redeploy"
      end
    end
  end
end
