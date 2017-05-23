# CodeLabs

A web scraper and CLI browser for all the Courses that google offers at https://codelabs.developers.google.com/

RubyGems link -> https://rubygems.org/gems/code_labs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'code_labs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install code_labs

## Usage

### Command Line Interface

`code-labs` should work just fine. Sadly I am on windows with Secure Boot and WSL limits Ruby to 1.9 without hacks. Please report an issue if this command does not work 
    
### Internal Modules

There are 3 objects in the `CodeLabs::` namespace
1. Lab <- Stores data about the individual CodeLab
2. Tech <- A specific technology referenced in the lab. Contains two way links to all labs it applies to
3. Scraper <- This object is given a URL (defaults to https://codelabs.developers.google.com/) in case it changes. Call scrape to load the Tech and Lab Objects into memory

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PCGeekBrain/codelabs-cli-app.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
