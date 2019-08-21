# frozen_string_literal: true

require "rails_helper"

describe Api::Response::ChannelSearchResponse do
  let(:response) { Api::Repository::ChannelSearchRepository.all }
  let(:channels) { response.result }

  describe "#result" do
    it "return Array of ChannelEntity" do
      VCR.use_cassette "api/response/channel_search_repository/result", record: :new_episodes do
        expect(response.result.class).to eq Array
        expect(channels.first.class).to eq Api::Entity::ChannelSearchEntity
      end
    end
  end

  describe "#next" do
    let(:response) { Api::Repository::ChannelSearchRepository.all.next }

    it "return next page response" do
      VCR.use_cassette "api/response/channel_search_repository/next", record: :new_episodes do
        expect(response.class).to eq Api::Response::ChannelSearchResponse
        expect(response.params[:page_token]).not_to eq nil
        expect(channels.first.class).to eq Api::Entity::ChannelSearchEntity
      end
    end
  end
end
