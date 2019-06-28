# frozen_string_literal: true

module Api
  module Repository
    class ChannelRepository < ApplicationRepository
      class << self
        def all(part: 'id,snippet', order: "date")
          channels = client.list_searches(part, type: "channel", max_results: 50, order: order, region_code: "JP")
          Api::Response::ChannelResponse.new(channels, part, order)
        end
      end
    end
  end
end
