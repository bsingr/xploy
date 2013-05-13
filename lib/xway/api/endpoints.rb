module Xway
  class Api
    class Endpoints
      def list options={}
        Request.new 'get', '/applications'
      end

      def create options={}
        Request.new 'post', '/applications', options
      end

      def find options={name: ':name'}
        Request.new 'get', "/applications/#{options[:name]}"
      end

      def update options={name: ':name'}
        Request.new 'put', "/applications/#{options[:name]}"
      end

      def delete options={name: ':name'}
        Request.new 'delete', "/applications/#{options[:name]}"
      end

      def log options={name: ':name'}
        Request.new 'get', "/applications/#{options[:name]}/log"
      end

      def start options={name: ':name'}
        Request.new 'post', "/applications/#{options[:name]}/start"
      end

      def stop options={name: ':name'}
        Request.new 'post', "/applications/#{options[:name]}/stop"
      end

      def restart options={name: ':name'}
        Request.new 'post', "/applications/#{options[:name]}/restart"
      end

      def redeploy options={name: ':name'}
        Request.new 'post', "/applications/#{options[:name]}/redeploy"
      end
    end
  end
end
