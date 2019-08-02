# frozen_string_literal: true

require "rails_helper"

describe Api::Response::VideoSearchResponse do
  VideoSearchRepository = Api::Repository::VideoSearchRepository
  VideoSearchResponse = Api::Response::VideoSearchResponse
  VideoEntity = Api::Entity::VideoEntity

  let(:response) { VideoSearchRepository.all }
  let(:videos) { response.result }

  describe "#result" do
    it "return Array of VideoEntity" do
      VCR.use_cassette "api/response/video_search_repository/result", record: :new_episodes do
        expect(response.result.class).to eq Array
        expect(videos.first.class).to eq VideoEntity
      end
    end
  end

  describe "#next" do
    let(:response) { VideoSearchRepository.all.next }

    it "return next page" do
      VCR.use_cassette "api/response/video_search_repository/next", record: :new_episodes do
        expect(response.class).to eq VideoSearchResponse
        expect(response.params[:page_token]).not_to eq nil
        expect(videos.first.class).to eq VideoEntity
      end
    end
  end
end
