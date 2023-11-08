require_relative 'lib/jekyll_video/version'

Gem::Specification.new do |spec|
  host = 'https://github.com/mslinn/jekyll_video'

  spec.authors               = ['Mike Slinn']
  spec.description           = <<~END_DESC
    Embed an HTML video into a web page.
  END_DESC
  spec.email                 = ['mslinn@mslinn.com']
  spec.files                 = Dir['.rubocop.yml', 'LICENSE.*', 'Rakefile', '{lib,spec}/**/*', '*.gemspec', '*.md']
  spec.homepage              = 'https://github.com/mslinn/jekyll_video'
  spec.license               = 'MIT'
  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org',
    'bug_tracker_uri'   => "#{host}/issues",
    'changelog_uri'     => "#{host}/CHANGELOG.md",
    'homepage_uri'      => spec.homepage,
    'source_code_uri'   => host,
  }
  spec.name                 = 'jekyll_video'
  spec.post_install_message = <<~END_MESSAGE

    Thanks for installing #{spec.name}!

  END_MESSAGE
  spec.require_paths         = ['lib']
  spec.required_ruby_version = '>= 2.6.0'
  spec.summary               = 'Embed an HTML video into a web page.'
  spec.version               = JekyllVideo::VERSION
  spec.add_dependency 'jekyll', '>= 3.5.0'
  spec.add_dependency 'jekyll_plugin_support', '>= 0.7.0'
end
