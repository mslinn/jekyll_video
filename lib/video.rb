require 'jekyll_plugin_support'
require_relative 'jekyll_video/version'

# This Jekyll tag plugin is a minimal example.
#
# See https://www.mslinn.com/jekyll/10200-jekyll-plugin-background.html
# See https://www.mslinn.com/jekyll/10400-jekyll-plugin-template-collection.html
#
# @example Embed a video
#   {% video 'https://asdf.com/myvideo.mp4' %}
#
# The Jekyll log level defaults to :info, which means all the Jekyll.logger statements below will not generate output.
# You can control the log level when you start Jekyll.
# To set the log level to :debug, write an entry into _config.yml, like this:
# plugin_loggers:
#   Video: debug
module JekyllVideo
  # This class implements the Jekyll video functionality
  class Video < JekyllSupport::JekyllTag
    PLUGIN_NAME = 'video'.freeze
    VERSION = JekyllVideo::VERSION

    # @return [void]
    def render_impl
      classes   = @helper.parameter_specified?('classes') || 'shadow rounded'
      src       = @helper.parameter_specified?('src')     || @argument_string
      style     = @helper.parameter_specified?('style')   || ''
      width     = @helper.parameter_specified?('width')   || '100%'

      <<~END_OUTPUT
        <video class="jekyll_video #{classes}" controls width="#{width}" style="#{style}">
          <source src="#{src}">
        </video>
      END_OUTPUT
    end

    JekyllPluginHelper.register(self, PLUGIN_NAME)
  end
end
