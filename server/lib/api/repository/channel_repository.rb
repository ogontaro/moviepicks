# frozen_string_literal: true

module Api
  module Repository
    class ChannelRepository < ApplicationRepository
      class << self
        def all
          channels = client.list_searches("snippet", type: "channel", max_results: 50)
          Api::Response::ChannelResponse.new(channels)
        end
      end
    end
  end
end
