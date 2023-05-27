require "logstash/devutils/rspec/spec_helper"
require 'logstash/outputs/circonus'

describe LogStash::Outputs::Circonus do

  let(:plugin) { described_class.new(config) }

  describe "debugging `api_token`" do
    let(:config) {{ "app_name" => "my-app-name", "api_token" => "$ecre&-key" }}

    it "should not show origin value" do
      expect(plugin.logger).to receive(:debug).with('<password>')

      plugin.register
      plugin.logger.send(:debug, plugin.api_token.to_s)
    end
  end

end