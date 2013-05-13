module Xway
  # global error class
  class Error < StandardError; end

  class ManifestFileNotFound < Error; end
  class ManifestFileTypeUnsupported < Error; end

  class MissingParameter < Error; end

  class ConnectionError < Error; end
end
