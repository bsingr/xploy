module Xploy
  class Template
    def to_s
      File.read(__FILE__).split("__END__\n").last
    end
  end
end

__END__
{
  "name": "example",
  "repo": {
    "url": "git://github.com/threez/appway-example.git",
    "branch": "master"
  },
  "packages": {},
  "install": [
    "npm install"
  ]
}
