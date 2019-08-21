# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::YoutubeScraping::ChannelRepository do
  describe "find" do
    let(:response) { Api::Repository::YoutubeScraping::ChannelRepository.find("UC2GuoutVyegg6PUK88lLpjw") }
    let(:channel) { response.result }

    it "return response" do
      VCR.use_cassette "api/repository/youtube_scraping/channel_repository/find", record: :new_episodes  do
        expect(response.class).to eq Api::Response::YoutubeScraping::ChannelFindResponse
        expect(channel.class).to eq Api::Entity::YoutubeScraping::ChannelEntity
      end
    end
  end
end
