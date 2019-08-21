# frozen_string_literal: true

module Api
  module Client
    class YoutubeScrapingClient
      def initialize
      end

      def channel_about(channel_id)
        Faraday.get("https://www.youtube.com/channel/#{channel_id}/about")
      end

      def channel_video(channel_id)
        Faraday.get("https://www.youtube.com/channel/#{channel_id}/video&playnext=1&index=1")
      end

      def search(query)
        Faraday.get("https://www.youtube.com/results?search_query=#{CGI.escape(query)}")
      end
    end
  end
end
