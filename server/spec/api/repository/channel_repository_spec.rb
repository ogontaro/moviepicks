# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::Repository::ChannelRepository do
  ChannelRepository = Api::Repository::ChannelRepository

  describe "all" do
    let(:channels) { ChannelRepository.all }

    xit "return channel list" do
      pp channels
      expect(channels.class).to eq Google::Apis::YoutubeV3::SearchListsResponse
    end
  end
end
