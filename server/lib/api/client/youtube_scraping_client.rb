# frozen_string_literal: true

module Api
  module Client
    class YoutubeScrapingClient
      def initialize
      end

      def channel_about(channel_id)
        request_with_error_handle { Faraday.get("https://www.youtube.com/channel/#{channel_id}/about") }
      end

      def channel_video(channel_id)
        request_with_error_handle { Faraday.get("https://www.youtube.com/channel/#{channel_id}/video&playnext=1&index=1") }
      end

      def search(query)
        request_with_error_handle { Faraday.get("https://www.youtube.com/results?search_query=#{CGI.escape(query)}") }
      end

      private

      def request_with_error_handle(&faraday_request)
        response = faraday_request.call
        raise YoutubeScrapingClientError.new(response) unless response.success?
        response
      end
    end
  end
end
