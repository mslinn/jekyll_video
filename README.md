# `Jekyll_video` [![Gem Version](https://badge.fury.io/rb/jekyll_video.svg)](https://badge.fury.io/rb/jekyll_video)

Embeds a video HTML tag into a Jekyll web page.


## Installation

Add the following to your Jekyll website's `Gemfile`:

```ruby
group :jekyll_plugins do
  gem 'jekyll_video'
end
```

And then execute:

```shell
$ bundle
```

Add the following CSS:

```css
.rounded {
  border: 1px solid;
  border-radius: 7px;
}

.shadow {
  border: thin gray solid;
  box-shadow: 5px 5px 6px #999;
}
```

## Usage

See the [`demo/`](demo/index.html) directory for usage examples.


## Development

After checking out this git repository, install dependencies by typing:

```shell
$ bin/setup
```

You should do the above before opening the project with Visual Studio Code.


### Run the Tests

```shell
$ bundle exec rake test
```


### Interactive Session

The following will allow you to experiment:

```shell
$ bin/console
```


### Local Installation

To install this gem onto your local machine, type:

```shell
$ bundle exec rake install
```


### To Release A New Version

To create a git tag for the new version, push git commits and tags,
and push the new version of the gem to https://rubygems.org, type:

```shell
$ bundle exec rake release
```


## Contributing

Bug reports and pull requests are welcome at https://github.com/mslinn/jekyll_video.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
