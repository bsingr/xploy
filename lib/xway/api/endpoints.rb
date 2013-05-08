module Xway
  class Api
    class Endpoints
      def list
        "GET /applications"
      end

      def create
        "POST /applications"
      end

      def find name=":name"
        "GET /applications/#{name}"
      end

      def update name=":name"
        "PUT /applications/#{name}"
      end

      def delete name=":name"
        "DELETE /applications/#{name}"
      end

      def log name=":name"
        "GET /applications/#{name}/log"
      end

      def start name=":name"
        "POST /applications/#{name}/start"
      end

      def stop name=":name"
        "POST /applications/#{name}/stop"
      end

      def restart name=":name"
        "POST /applications/#{name}/restart"
      end

      def redeploy name=":name"
        "POST /applications/#{name}/redeploy"
      end
    end
  end
end
