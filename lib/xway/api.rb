module Xway
  class Api < String
    def initialize str=nil
      super str || ""
    end

    def applications
      chain "GET /applications"
    end

    def create
      chain "POST /applications"
    end

    def find name=":name"
      chain "GET /applications/#{name}"
    end

    def update name=":name"
      chain "PUT /applications/#{name}"
    end

    def delete name=":name"
      chain "DELETE /applications/#{name}"
    end

    def log name=":name"
      chain "GET /applications/#{name}/log"
    end

    def start name=":name"
      chain "POST /applications/#{name}/start"
    end

    def stop name=":name"
      chain "POST /applications/#{name}/stop"
    end

    def restart name=":name"
      chain "POST /applications/#{name}/restart"
    end

    def redeploy name=":name"
      chain "POST /applications/#{name}/redeploy"
    end

  private

    def chain str
      self.class.new str
    end
  end
end
