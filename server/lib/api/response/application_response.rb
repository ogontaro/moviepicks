# frozen_string_literal: true

module Api
  module Response
    class ApplicationResponse
      attr_reader :params

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
