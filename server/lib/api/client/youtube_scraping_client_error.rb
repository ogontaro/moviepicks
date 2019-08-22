# frozen_string_literal: true

module Api
  module Client
    class YoutubeScrapingClientError < StandardError
      attr_reader :response
      def initialize(response)
        @response = response
      end

      def status
        response.status
      end
    end
  end
end
