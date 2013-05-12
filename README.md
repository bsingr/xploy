# xway

[appway](http://github.com/threez/appway) client written in ruby

[![Gem Version](https://badge.fury.io/rb/xway.png)](https://rubygems.org/gems/xway)
[![Travis-CI Build Status](https://secure.travis-ci.org/dpree/xway.png)](https://travis-ci.org/dpree/xway)
[![Coverage Status](https://coveralls.io/repos/dpree/xway/badge.png)](https://coveralls.io/r/dpree/xway)
[![Dependency Status](https://gemnasium.com/dpree/xway.png)](https://gemnasium.com/dpree/xway)
[![Code Climate](https://codeclimate.com/github/dpree/xway.png)](https://codeclimate.com/github/dpree/xway)

## Installation

Add this line to your application's Gemfile:

    gem 'xway'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xway

## Usage

    $ xway

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Development

To run the binary from the repository use the following command with ruby libray path:

    RUBYLIB=lib bin/xway

### Coding guide

* Using global methods like `Xway.parameter`
  * is allowed for classes / modules defined on the same or a higher level to the `Xway` namespace
  * is allowed for classes / modules defined excactly one level below the `Xway` namespace
    * e.g. `Xway::Api`
  * is not allowed for classes / modules defined more than one level below the `Xway` namespace
    * e.g. `Xway::Api::Request`
    * these classes should use dependency injection instead

# License

Copyright (c) 2013 Jens Bissinger. See [LICENSE.txt](LICENSE.txt)
