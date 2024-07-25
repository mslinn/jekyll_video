require 'jekyll_plugin_support'
require 'helper/jekyll_plugin_helper'
require 'pry'
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
  VideoError = JekyllSupport.define_error

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

      remote_video = src.start_with?('http')
      local_video_exists = !remote_video && File.exist?(src)
      raise VideoError, "Video file at #{src} referenced by  #{@page['path']} does not exist." unless remote_video || local_video_exists

      <<~END_OUTPUT
        <video class="jekyll_video #{classes}" controls width="#{width}" style="#{style}">
          <source src="#{src}">

          Your browser does not support HTML video.
          Here is a <a href="#{src}">link to the video</a>.
        </video>
      END_OUTPUT
    rescue VideoError => e # jekyll_plugin_support handles StandardError
      e.shorten_backtrace
      msg = format_error_message e.message
      @logger.error { "#{e.class} raised #{msg}" }
      binding.pry if @pry_on_video_error # rubocop:disable Lint/Debugger
      raise e if @die_on_video_error

      "<div class='jekyll_video_error'>#{e.class} raised in #{@tag_name} tag\n#{msg}</div>"
    end

    JekyllSupport::JekyllPluginHelper.register(self, PLUGIN_NAME)
  end
end
