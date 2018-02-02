# Maestro Website

Website for Maestro, hosted via GitHub pages

## Getting started

Start by ensuring you have ruby on your system. You **must** install [rbenv](https://github.com/rbenv/rbenv) to keep your ruby versions under control. Refer to rbenv's [installation guide](https://github.com/rbenv/rbenv#installation) on how to do so.

Ensure you have installed ruby version 2.3.1:

```bash
$ rbenv install 2.3.1
$ rbenv rehash
```

Then, install [bundler](http://bundler.io) to sort out your ruby dependencies:

```bash
$ gem install bundler
$ bundle install
```

#### El Capitan and OpenSSL issues

If you are using OS X El Capitan, install OpenSSL using `brew` and set the bundle
config to point to this install:

```bash
$ brew install openssl
$ bundle config build.eventmachine --with-cppflags="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"
```

## Developing

Develop using:

```bash
$ bundle exec middleman
```

Your website will be watched and hosted locally at **[http://localhost:4567/](http://localhost:4567/)**.

## Bootstrap

We currently rely on a [Ruby Bootstrap gem](https://github.com/twbs/bootstrap-rubygem/tree/v4.0.0.alpha4) compiled with Bootstrap 4.0.0-alpha4.
Relevant SASS files can be found [here](https://github.com/twbs/bootstrap-rubygem/tree/v4.0.0.alpha4/assets/stylesheets).

## Publishing

Publish using:

```bash
$ rake publish
```

If this fails, try rebuilding the build folder from scratch then redeploy:

```bash
$ rm -rf build
$ rake deploy
```

## License

Coming soon
