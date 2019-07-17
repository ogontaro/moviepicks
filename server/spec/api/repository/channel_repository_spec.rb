# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::ChannelRepository do
  ChannelRepository = Api::Repository::ChannelRepository
  ChannelResponse = Api::Response::ChannelResponse

  describe "all" do
    let(:channels) { ChannelRepository.all }

    it "return response" do
      VCR.use_cassette "api/repository/channel_repository/all", record: :new_episodes  do
        expect(channels.class).to eq ChannelResponse
      end
    end

    context "when use id part" do
      let(:channels) { ChannelRepository.all(part: "id") }

      it "return response" do
        VCR.use_cassette "api/repository/channel_repository/all", record: :new_episodes do
          expect(channels.class).to eq ChannelResponse
        end
      end
    end
  end
end
