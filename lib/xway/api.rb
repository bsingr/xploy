module Xway
  class Api < String
    def initialize str=nil
      super str || ''
    end

    def applications
      chain 'GET /applications'
    end

    def create
      chain 'POST /applications'
    end

    def find
      chain 'GET /applications/:name'
    end

    def update
      chain 'PUT /applications/:name'
    end

    def delete
      chain 'DELETE /applications/:name'
    end

    def log
      chain 'GET /applications/:name/log'
    end

    def start
      chain 'POST /applications/:name/start'
    end

    def stop
      chain 'POST /applications/:name/stop'
    end

    def restart
      chain 'POST /applications/:name/restart'
    end

    def redeploy
      chain 'POST /applications/:name/redeploy'
    end

  private

    def chain str
      self.class.new str
    end
  end
end
