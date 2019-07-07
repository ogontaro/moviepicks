# frozen_string_literal: true

require "rails_helper"

describe Api::Repository::VideoRepository do
  VideoRepository = Api::Repository::VideoRepository

  describe "all" do
    let(:videos) { VideoRepository.all }

    it "return response" do
      VCR.use_cassette "api/repository/video_repository/all", record: :new_episodes  do
        expect(videos.class).to eq Api::Response::VideoResponse
      end
    end

    context "when use id part" do
      let(:videos) { VideoRepository.all(part: "id") }

      it "return response" do
        VCR.use_cassette "api/repository/video_repository/all", record: :new_episodes do
          expect(videos.class).to eq Api::Response::VideoResponse
        end
      end
    end

    context "when use id page_token" do
      let(:before_videos) { VideoRepository.all(part: "id") }
      let(:videos) { VideoRepository.all(part: "id", page_token: before_videos.next.page_token) }

      it "return response" do
        VCR.use_cassette "api/repository/video_repository/all", record: :new_episodes do
          expect(videos.class).to eq Api::Response::VideoResponse
        end
      end
    end

    context "when use published_after" do
      let(:videos) { VideoRepository.all(published_after: Date.today.days_ago(10).to_datetime.rfc3339) }
      it "return response" do
        VCR.use_cassette "api/repository/video_repository/all", record: :new_episodes do
          expect(videos.class).to eq Api::Response::VideoResponse
        end
      end
    end

    context "when use published_before" do
      let(:videos) { VideoRepository.all(published_before: Date.today.days_ago(10).to_datetime.rfc3339) }
      it "return response" do
        VCR.use_cassette "api/repository/video_repository/all", record: :new_episodes do
          expect(videos.class).to eq Api::Response::VideoResponse
        end
      end
    end

    context "when use published_before and after" do
      let(:videos) { VideoRepository.all(published_after: Date.today.days_ago(10).to_datetime.rfc3339, published_before: Date.today.days_ago(5).to_datetime.rfc3339) }
      it "return response" do
        VCR.use_cassette "api/repository/video_repository/all", record: :new_episodes do
          expect(videos.class).to eq Api::Response::VideoResponse
        end
      end
    end
  end
end
