# frozen_string_literal: true

require "rails_helper"

describe Api::Response::ChannelResponse do
  let(:response) { Api::Repository::ChannelRepository.all }

  describe "#result" do
    it "return Array of ChannelEntity" do
      VCR.use_cassette "api/response/channel_repository/result", record: :new_episodes do
        expect(response.result.class).to eq Array
        expect(response.result.first.class).to eq Api::Entity::ChannelEntity
      end
    end
  end

  describe "#next" do
    before {
      VCR.use_cassette "api/response/channel_repository/next", record: :new_episodes do
        response.next
      end
    }

    it "get next page" do
      VCR.use_cassette "api/response/channel_repository/next", record: :new_episodes do
        expect(response.class).to eq Api::Response::ChannelResponse
      end
    end

    it "has page token" do
      VCR.use_cassette "api/response/channel_repository/next", record: :new_episodes do
        expect(response.page_token).not_to be nil
      end
    end
  end
end
