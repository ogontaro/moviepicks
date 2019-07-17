# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::ChannelRepository do
  ChannelRepository = Api::Repository::ChannelRepository
  ChannelResponse = Api::Response::ChannelResponse

  describe "all" do
    let(:dummy_channel) { Api::Repository::ChannelSearchRepository.all(order: "viewcount").result.first.to_model }
    let(:channels) { ChannelRepository.find(dummy_channel.channel_id) }

    it "return response" do
      VCR.use_cassette "api/repository/channel_repository/all", record: :new_episodes  do
        expect(channels.class).to eq ChannelResponse
      end
    end
  end
end
