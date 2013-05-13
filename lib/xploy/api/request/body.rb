module Xploy
  class Api
    class Request
      class Body
        attr_reader :path

        def initialize path
          @path = path
        end

        def read
          check_type do |extname|
            if File.exists?(path)
              File.read(path)
            else
              raise ManifestFileNotFound, "could not find file #{path}"
            end
          end
        end

        def mime_type
          check_type do |extname|
            'application/json'
          end
        end

      private

        def check_type
          extname = File.extname(path)
          if extname == '.json'
            yield extname
          else
            raise ManifestFileTypeUnsupported, \
              "unsupported extension #{extname} for #{path}"
          end
        end
      end
    end
  end
end
