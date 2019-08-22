# frozen_string_literal: true

module Api
  module Client
    class YoutubeScrapingClient
      def initialize
      end

      def channel_about(channel_id)
        request_with_error_handle { youtube_connection.get("/channel/#{channel_id}/about") }
      end

      def channel_video(channel_id)
        request_with_error_handle { youtube_connection.get("/channel/#{channel_id}/video&playnext=1&index=1") }
      end

      def search(query)
        request_with_error_handle { youtube_connection.get("/results?search_query=#{CGI.escape(query)}") }
      end

      private
        def request_with_error_handle(&faraday_request)
          response = faraday_request.call
          raise YoutubeScrapingClientError.new(response) unless response.success?
          response
        end

        def youtube_connection
          connection = Faraday.new("https://www.youtube.com")
          connection.headers = {
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3",
            # "Accept-Encoding": "gzip, deflate, br",
            # "Accept-Language": "ja-JP,ja;q=0.9,en-US;q=0.8,en;q=0.7",
            "Cache-Control": "max-age=0",
            "Sec-Fetch-Mode": "navigate",
            "Sec-Fetch-Site": "none",
            "Sec-Fetch-User": "?1",
            "Upgrade-Insecure-Requests": "1",
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36"
          }
          connection
        end
    end
  end
end
