# frozen_string_literal: true

module Api
  module Repository
    class ChannelRepository < ApplicationRepository
      class << self
        def all(part: "id,snippet", order: "date", page_token: nil)
          channels = client.list_searches(part, type: "channel", max_results: 50, order: order, region_code: "JP", page_token: page_token)
          Api::Response::ChannelResponse.new(channels, part, order, page_token)
        end
      end
    end
  end
end
