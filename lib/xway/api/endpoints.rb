module Xway
  class Api
    class Endpoints
      def list options={}
        Request.new 'get', '/applications'
      end

      def create options={}
        Request.new 'post', '/applications', options
      end

      def find options={}
        require_options options, :name
        options[:name] ||= ':name'
        Request.new 'get', "/applications/#{options[:name]}"
      end

      def update options={}
        require_options options, :name
        options[:name] ||= ':name'
        Request.new 'put', "/applications/#{options[:name]}"
      end

      def delete options={}
        require_options options, :name
        options[:name] ||= ':name'
        Request.new 'delete', "/applications/#{options[:name]}"
      end

      def log options={}
        require_options options, :name
        options[:name] ||= ':name'
        Request.new 'get', "/applications/#{options[:name]}/log"
      end

      def start options={}
        require_options options, :name
        options[:name] ||= ':name'
        Request.new 'post', "/applications/#{options[:name]}/start"
      end

      def stop options={}
        require_options options, :name
        options[:name] ||= ':name'
        Request.new 'post', "/applications/#{options[:name]}/stop"
      end

      def restart options={}
        require_options options, :name
        options[:name] ||= ':name'
        Request.new 'post', "/applications/#{options[:name]}/restart"
      end

      def redeploy options={}
        require_options options, :name
        options[:name] ||= ':name'
        Request.new 'post', "/applications/#{options[:name]}/redeploy"
      end

    private

      def require_options options, *keys
        missing_keys = []
        keys.each do |key|
          if !options || options[key] == nil || options[key] == ''
            missing_keys << key
          end
        end
        unless missing_keys.empty?
          raise MissingParameter, "Missing app parameter(s): "\
                                  "#{missing_keys.map(&:to_s).join(', ')}"
        end
      end
    end
  end
end
