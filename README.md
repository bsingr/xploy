# xploy

[appway](http://github.com/threez/appway) client written in ruby

[![Gem Version](https://badge.fury.io/rb/xploy.png)](https://rubygems.org/gems/xploy)
[![Travis-CI Build Status](https://secure.travis-ci.org/dpree/xploy.png)](https://travis-ci.org/dpree/xploy)
[![Coverage Status](https://coveralls.io/repos/dpree/xploy/badge.png)](https://coveralls.io/r/dpree/xploy)
[![Dependency Status](https://gemnasium.com/dpree/xploy.png)](https://gemnasium.com/dpree/xploy)
[![Code Climate](https://codeclimate.com/github/dpree/xploy.png)](https://codeclimate.com/github/dpree/xploy)

## Installation

Add this line to your application's Gemfile:

    gem 'xploy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xploy

## Usage

    $ xploy

### Recommended config settings

You can store default parameters like `app.name` and `app.manifest` in a file named `.xploy` located in your current working dir.

For an example just have a look at the `appway-example` folder.

    $ cd appway-example

Here you can just redeploy the preconfigured app like so:

    $ xploy redeploy

## Development

To run the binary from the repository use the following command with ruby libray path:

    RUBYLIB=lib bin/xploy

### Coding guide

* Using global methods like `Xploy.parameter`
  * is allowed for classes / modules defined on the same or a higher level to the `Xploy` namespace
  * is allowed for classes / modules defined excactly one level below the `Xploy` namespace
    * e.g. `Xploy::Api`
  * is not allowed for classes / modules defined more than one level below the `Xploy` namespace
    * e.g. `Xploy::Api::Request`
    * these classes should use dependency injection instead

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# License

Copyright (c) 2013 Jens Bissinger. See [LICENSE.txt](LICENSE.txt)
