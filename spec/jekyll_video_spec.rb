require_relative '../lib/jekyll_video'

RSpec.describe JekyllVideo::JekyllVideo do
  let(:logger) do
    PluginMetaLogger.instance.new_logger(self, PluginMetaLogger.instance.config)
  end

  let(:parse_context) { TestParseContext.new }

  it 'has a test' do
    expect(true).to be_true
  end
end
