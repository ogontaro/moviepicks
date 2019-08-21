# frozen_string_literal: true

module Api
  module Response
    module YoutubeScraping
      class BaseResponse
        attr_reader :params

        def initialize(**params)
          @params = params
        end

        class << self
          def client
            Api::Client::YoutubeScrapingClient.new
          end
        end
      end
    end
  end
end
