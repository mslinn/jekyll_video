require 'jekyll_plugin_support'
require_relative 'jekyll_video/version.rb'

# This Jekyll tag plugin is a minimal example.
#
# See https://www.mslinn.com/jekyll/10200-jekyll-plugin-background.html
# See https://www.mslinn.com/jekyll/10400-jekyll-plugin-template-collection.html
#
# @example Heading for this example
#   {% video param1='value1' %}
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

    # Put your plugin logic here.
    # The following variables are predefined:
    #   @argument_string, @config, @envs, @helper, @layout, @logger, @mode, @page, @paginator, @site, @tag_name and @theme
    #
    # @param tag_name [String] is the name of the tag, which we already know.
    # @param argument_string [String] the arguments from the web page.
    # @param tokens [Liquid::ParseContext] tokenized command line
    # @return [void]
    def render_impl
      
      <<~END_OUTPUT
        <pre class="example">
          
          Remaining markup: '#{@helper.remaining_markup}'.
        </pre>
      END_OUTPUT
    end

    JekyllPluginHelper.register(self, PLUGIN_NAME)
  end
end
