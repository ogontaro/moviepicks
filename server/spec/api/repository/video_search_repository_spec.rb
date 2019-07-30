# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::VideoSearchRepository do
  VideoSearchRepository = Api::Repository::VideoSearchRepository
  VideoSearchResponse = Api::Response::VideoSearchResponse

  describe "all" do
    let(:response) { VideoSearchRepository.all }
    let(:videos) { response.result }

    it "return response" do
      VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes  do
        expect(response.class).to eq VideoSearchResponse
        expect(videos.class).to eq Array
      end
    end

    context "when use id part" do
      let(:response) { VideoSearchRepository.all(part: "id") }

      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(response.class).to eq VideoSearchResponse
          expect(videos.class).to eq Array
        end
      end
    end

    context "when use id page_token" do
      let(:before_videos) { VideoSearchRepository.all(part: "id") }
      let(:response) { VideoSearchRepository.all(part: "id", page_token: before_videos.next.page_token) }

      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(response.class).to eq VideoSearchResponse
          expect(videos.class).to eq Array
        end
      end
    end

    context "when use published_after" do
      let(:response) { VideoSearchRepository.all(published_after: Date.today.days_ago(10).to_datetime.rfc3339) }

      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(response.class).to eq VideoSearchResponse
          expect(videos.class).to eq Array
        end
      end
    end

    context "when use published_before" do
      let(:response) { VideoSearchRepository.all(published_before: Date.today.days_ago(10).to_datetime.rfc3339) }

      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(response.class).to eq VideoSearchResponse
          expect(videos.class).to eq Array
        end
      end
    end

    context "when use published_before and after" do
      let(:response) { VideoSearchRepository.all(published_after: Date.today.days_ago(10).to_datetime.rfc3339, published_before: Date.today.days_ago(5).to_datetime.rfc3339) }

      it "return response" do
        VCR.use_cassette "api/repository/video_search_repository/all", record: :new_episodes do
          expect(response.class).to eq VideoSearchResponse
          expect(videos.class).to eq Array
        end
      end
    end
  end
end
