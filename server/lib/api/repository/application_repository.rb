# frozen_string_literal: true

require "google/apis/youtube_v3"

module Api
  module Repository
    class ApplicationRepository
      class << self
        def client
          Google::Apis::YoutubeV3::YouTubeService.new.tap do |youtube|
            youtube.key = ENV["GOOGLE_API_KEY"]
          end
        end
      end
    end
  end
end
