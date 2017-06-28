# ruby-crowi

A ruby client for [Crowi](http://site.crowi.wiki/) API.

ruby-crowi supports up to [v1.6.2](https://github.com/crowi/crowi/releases/tag/v1.6.2).

**Crowi API is experimental.**

## Installation

```ruby
gem 'crowi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crowi

## Usage

```ruby
require "crowi"

client = Crowi::Client.new(base_url: "<your_crowi_url>", access_token: "<access_token>")

# Pages API
client.page(page_id)
client.pages(path, user, offset)
client.create_page(path, body)
client.update_page(page_id, body)

# Comments API
client.comments(page_id)
client.add_comment(page_id, comment, revision_id)

# Attachments API
client.attachments(page_id)
client.add_attachment(page_id, filepath, content_type)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/h-kishi/ruby-crowi.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

