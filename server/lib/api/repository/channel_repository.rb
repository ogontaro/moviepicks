# frozen_string_literal: true

module Api
  module Repository
    class ChannelRepository < ApplicationRepository
      class << self
        def find(part: "id,snippet", order: "date", page_token: nil, published_after: nil, published_before: nil)
          channels = client.channel(part, type: "channel")
          Api::Response::ChannelResponse.new(channels)
        end
      end
    end
  end
end
