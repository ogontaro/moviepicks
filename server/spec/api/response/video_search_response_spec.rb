# frozen_string_literal: true

require "rails_helper"

describe Api::Response::VideoSearchResponse do
  VideoSearchRepository = Api::Repository::VideoSearchRepository
  VideoSearchResponse = Api::Response::VideoSearchResponse
  VideoEntity = Api::Entity::VideoEntity

  let(:response) { VideoSearchRepository.all }

  describe "#result" do
    it "return Array of VideoEntity" do
      VCR.use_cassette "api/response/video_search_repository/result", record: :new_episodes do
        expect(response.result.class).to eq Array
        expect(response.result.first.class).to eq VideoEntity
      end
    end
  end

  describe "#next" do
    before {
      VCR.use_cassette "api/response/video_search_repository/next", record: :new_episodes do
        response.next
      end
    }

    it "get next page" do
      VCR.use_cassette "api/response/video_search_repository/next", record: :new_episodes do
        expect(response.class).to eq VideoSearchResponse
      end
    end

    it "has page token" do
      VCR.use_cassette "api/response/video_search_repository/next", record: :new_episodes do
        expect(response.page_token).not_to be nil
      end
    end
  end
end
