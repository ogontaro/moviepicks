# frozen_string_literal: true

require "rails_helper"

describe Api::Response::ChannelResponse do
  ChannelRepository = Api::Repository::ChannelRepository
  ChannelResponse = Api::Response::ChannelResponse
  ChannelEntity = Api::Entity::ChannelEntity

  let(:dummy_channel) { Api::Repository::ChannelSearchRepository.all(order: "viewcount").result.first.to_model }
  let(:response) { ChannelRepository.find(dummy_channel.channel_id) }

  describe "#result" do
    it "return Array of ChannelEntity" do
      VCR.use_cassette "api/response/channel_repository/result", record: :new_episodes do
        expect(response.result.class).to eq Array
        expect(response.result.first.class).to eq ChannelEntity
      end
    end
  end
end
