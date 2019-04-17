# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::ApplicationRepository do
  ApplicationRepository = Api::Repository::ApplicationRepository

  describe "client" do
    it "return youtube client object" do
      expect(ApplicationRepository.client.class).to eq Google::Apis::YoutubeV3::YouTubeService
    end

    it "has api key" do
      expect(ApplicationRepository.client.key.class).to eq String
    end
  end
end
