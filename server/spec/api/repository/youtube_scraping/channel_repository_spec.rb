# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::YoutubeScraping::ChannelRepository do
  ChannelRepository = Api::Repository::YoutubeScraping::ChannelRepository
  ChannelFindResponse = Api::Response::YoutubeScraping::ChannelFindResponse
  ChannelEntity = Api::Entity::YoutubeScraping::ChannelEntity

  describe "find" do

    let(:response) { ChannelRepository.find("UC2GuoutVyegg6PUK88lLpjw") }
    let(:channel) { response.result }

    it "return response" do
      VCR.use_cassette "api/repository/youtube_scraping/channel_repository/find", record: :new_episodes  do
        expect(response.class).to eq ChannelFindResponse
        expect(channel.class).to eq ChannelEntity
      end
    end
  end
end
