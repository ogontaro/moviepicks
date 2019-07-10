# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::VideoSearchRepository do
  VideoSearchRepository = Api::Repository::VideoSearchRepository
  VideoSearchResponse = Api::Response::VideoSearchResponse

  describe "all" do
    let(:videos) { Api::Repository::VideoSearchRepository.all }

    it "return response" do
      VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes  do
        expect(videos.class).to eq VideoSearchResponse
      end
    end

    context "when use id part" do
      let(:videos) { VideoSearchRepository.all(part: "id") }

      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(videos.class).to eq VideoSearchResponse
        end
      end
    end

    context "when use id page_token" do
      let(:before_videos) { VideoSearchRepository.all(part: "id") }
      let(:videos) { VideoSearchRepository.all(part: "id", page_token: before_videos.next.page_token) }

      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(videos.class).to eq VideoSearchResponse
        end
      end
    end

    context "when use published_after" do
      let(:videos) { VideoSearchRepository.all(published_after: Date.today.days_ago(10).to_datetime.rfc3339) }
      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(videos.class).to eq VideoSearchResponse
        end
      end
    end

    context "when use published_before" do
      let(:videos) { VideoSearchRepository.all(published_before: Date.today.days_ago(10).to_datetime.rfc3339) }
      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(videos.class).to eq VideoSearchResponse
        end
      end
    end

    context "when use published_before and after" do
      let(:videos) { VideoSearchRepository.all(published_after: Date.today.days_ago(10).to_datetime.rfc3339, published_before: Date.today.days_ago(5).to_datetime.rfc3339) }
      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(videos.class).to eq VideoSearchResponse
        end
      end
    end
  end
end
